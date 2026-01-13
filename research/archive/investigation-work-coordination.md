# Investigation: Work Coordination and Actor Assignment

**Status**: ✓ Formalised — see `concepts/concept_work-coordination.md`
**Archived**: 12 January 2026
**Purpose**: Design mechanisms for coordinating work between actors (human and AI), including work item definition, assignment, messaging, and queue-based distribution
**Related**: Item 6 in planning-future-work.md (now completed)

> **Note**: This investigation has been formalised into the concept document. This file is archived for reference. The concept document contains the authoritative schemas and framework integration; this document retains implementation-level detail (queue patterns, messaging protocols, tooling options, architecture diagrams) that may be useful for Phase D executable framework work.

---

## 1. Problem Statement

The framework defines:
- **What** work should be done (capability flows, process specifications)
- **Who** should do it (actor patterns, collaboration patterns)

But not:
- **How** work is coordinated between actors
- **How** assignments are made and tracked
- **How** actors communicate during execution
- **How** work items flow through the system

This investigation addresses the coordination gap—the mechanisms through which work is assigned to actors, tracked, and completed.

### 1.1 Core Challenges

| Challenge | Description |
|-----------|-------------|
| **Heterogeneous actors** | Humans and AI have different availability patterns, response times, and interaction modes |
| **Mixed coordination modes** | Some work requires synchronous dialogue; other work suits asynchronous queuing |
| **Context preservation** | Work items must carry sufficient context for actors to proceed without extensive re-discovery |
| **Assignment matching** | Work must be routed to actors with appropriate capabilities and availability |
| **State visibility** | All actors need visibility into work state to coordinate effectively |
| **Handoff integrity** | Information must not be lost when work transfers between actors |

---

## 2. Coordination Paradigms

### 2.1 Interactive (Synchronous) Coordination

Real-time dialogue between actors with immediate response expectation.

**Characteristics**:
- Low latency between messages
- Shared conversational context
- Immediate feedback and clarification
- Natural for Human-Led and Partnership patterns

**Examples**:
- Human and AI collaborating on code review in real-time
- Pair programming with AI assistant
- Interactive requirements elicitation session

**Strengths**:
- Rich context preservation through conversation state
- Immediate clarification of ambiguity
- Natural escalation (just ask)
- Supports theory-building through dialogue

**Limitations**:
- Requires simultaneous availability
- Doesn't scale to many actors
- Context lost when session ends (unless preserved)
- Human cognitive load during extended sessions

### 2.2 Queue-Based (Asynchronous) Coordination

Work items posted to queues, claimed by available actors, completed independently.

**Characteristics**:
- Decoupled producer/consumer
- Explicit context packaging in work items
- Actors operate on their own schedules
- Natural for AI-Led and parallelisable work

**Examples**:
- Code review requests awaiting human review
- Test execution queued for CI system
- Documentation generation tasks for AI
- Bug triage awaiting assignment

**Strengths**:
- Scales to many actors and work items
- Actors work when available
- Explicit work state tracking
- Auditable work history

**Limitations**:
- Context must be explicitly packaged (risk of loss)
- Clarification requires round-trips
- Longer cycle times
- Queue management overhead

### 2.3 Hybrid Coordination

Most real work uses both paradigms:

```
Queue-based assignment → Interactive execution → Queue-based handoff
```

**Example flow**:
1. PR review task appears in queue (async)
2. Human claims task
3. Human and AI collaborate interactively on review (sync)
4. Review complete; handoff to next queue (async)

The framework must support seamless transitions between modes.

---

## 3. Work Item Schema

### 3.1 Core Work Item Definition

A work item is a unit of work that can be assigned to and completed by an actor.

```
WorkItem {
    id: UUID                           # Unique identifier
    created_at: ISO8601                # When work item was created
    updated_at: ISO8601                # Last modification time

    # Classification
    work_type: enum {
        CAPABILITY_INSTANCE,           # Single capability execution
        PROCESS_STEP,                  # Step within a process
        ESCALATION,                    # Escalated from AI to human
        REVIEW,                        # Review of prior work
        DECISION_REQUEST,              # Request for decision
        INFORMATION_REQUEST            # Request for information/clarification
    }

    # Context
    process_id: string?                # PROC-X.Y if part of process
    step_id: string?                   # X.Y.Z if capability instance
    phase: enum { 1..7 }               # SDLC phase
    capability: enum { Elicit, Analyse, Synthesise, Transform,
                      Validate, Decide, Generate, Preserve }?

    # Content
    title: string                      # Brief description
    description: string                # Full work description
    objective: string                  # What success looks like

    # Context package (for async handoff)
    context: WorkContext {
        background: string             # Why this work exists
        prior_work: Reference[]        # Links to relevant prior work
        decisions: DecisionRef[]       # Relevant decisions (from decision tree)
        observations: ObservationRef[] # Relevant observations (from observation log)
        documents: DocumentRef[]       # Required input documents
        constraints: string[]          # Boundaries and limitations
        assumptions: string[]          # Working assumptions
    }

    # Actor specification
    required_pattern: enum { HUMAN_ONLY, HUMAN_LED, PARTNERSHIP,
                            AI_LED, AI_ONLY }
    required_capabilities: string[]    # Capabilities actor must have
    preferred_actor: string?           # Specific actor if preferred

    # Assignment
    status: WorkStatus                 # Current state (see below)
    assigned_to: ActorRef?             # Currently assigned actor
    assignment_history: Assignment[]   # History of assignments

    # Completion
    acceptance_criteria: string[]      # What must be true for completion
    deliverables: DeliverableSpec[]    # Expected outputs

    # Dependencies
    blocked_by: UUID[]                 # Work items that must complete first
    blocks: UUID[]                     # Work items waiting on this

    # Urgency and scheduling
    priority: enum { CRITICAL, HIGH, MEDIUM, LOW }
    due_date: ISO8601?                 # When work should complete
    estimated_effort: Duration?        # Expected time to complete

    # Escalation source (if work_type = ESCALATION)
    escalation: EscalationContext? {
        source_work_item: UUID         # Original work item
        source_actor: ActorRef         # Who escalated
        trigger: string                # What triggered escalation
        ai_assessment: string?         # AI's analysis before escalation
        ai_recommendation: string?     # AI's suggested resolution
        confidence: float?             # AI's confidence level
    }
}
```

### 3.2 Work Status State Machine

```
                    ┌─────────────┐
                    │   CREATED   │
                    └──────┬──────┘
                           │ (enters queue)
                           ▼
                    ┌─────────────┐
           ┌───────▶│   QUEUED    │◀───────┐
           │        └──────┬──────┘        │
           │               │ (claimed)     │ (unassigned)
           │               ▼               │
           │        ┌─────────────┐        │
           │        │  ASSIGNED   │────────┘
           │        └──────┬──────┘
           │               │ (work started)
           │               ▼
           │        ┌─────────────┐
           │        │ IN_PROGRESS │──────────────┐
           │        └──────┬──────┘              │
           │               │                      │ (escalate)
           │      ┌────────┼────────┐            │
           │      │        │        │            ▼
           │      ▼        ▼        ▼     ┌─────────────┐
           │ ┌────────┐ ┌──────┐ ┌─────┐  │  ESCALATED  │
           │ │BLOCKED │ │PAUSED│ │DONE │  └──────┬──────┘
           │ └───┬────┘ └──┬───┘ └──┬──┘         │
           │     │         │        │            │
           │     └────┬────┘        │            │
           │          │             │            │
           └──────────┘             │            │
                                    ▼            │
                             ┌─────────────┐     │
                             │  COMPLETED  │◀────┘
                             └──────┬──────┘ (after escalation resolution)
                                    │
                      ┌─────────────┼─────────────┐
                      ▼             ▼             ▼
               ┌──────────┐ ┌───────────┐ ┌───────────┐
               │ ACCEPTED │ │ REJECTED  │ │ CANCELLED │
               └──────────┘ └───────────┘ └───────────┘
```

### 3.3 Assignment Record

```
Assignment {
    id: UUID
    work_item_id: UUID

    # Assignment details
    assigned_to: ActorRef
    assigned_by: ActorRef              # Who made assignment (human, system, self)
    assigned_at: ISO8601
    assignment_type: enum {
        DIRECT,                        # Explicitly assigned by another actor
        CLAIMED,                       # Actor claimed from queue
        AUTO_ROUTED,                   # System auto-assigned based on rules
        ESCALATED                      # Assigned due to escalation
    }

    # Resolution
    resolved_at: ISO8601?
    resolution: enum { COMPLETED, UNASSIGNED, ESCALATED, TRANSFERRED }?
    resolution_reason: string?

    # Work performed
    time_spent: Duration?
    notes: string?
}
```

### 3.4 Actor Reference

```
ActorRef {
    actor_type: enum { HUMAN, AI, SYSTEM }
    actor_id: string                   # Unique identifier

    # For humans
    user_id: string?                   # User account identifier

    # For AI
    ai_system: string?                 # e.g., "claude-code", "copilot"
    ai_model: string?                  # e.g., "claude-3-opus"
    ai_session: string?                # Session identifier if applicable

    # For systems
    system_name: string?               # e.g., "ci-pipeline", "auto-router"
}
```

---

## 4. Interactive Messaging

### 4.1 Message Schema

For synchronous coordination, actors exchange messages within a conversation.

```
Message {
    id: UUID
    conversation_id: UUID              # Groups related messages
    timestamp: ISO8601

    # Participants
    sender: ActorRef
    recipients: ActorRef[]             # Who should receive/respond

    # Content
    content_type: enum {
        TEXT,                          # Natural language
        CODE,                          # Code block
        STRUCTURED_DATA,               # JSON/YAML
        REFERENCE,                     # Link to artifact
        DECISION_REQUEST,              # Asking for decision
        CLARIFICATION_REQUEST,         # Asking for clarification
        PROPOSAL,                      # Proposing action
        ACKNOWLEDGEMENT,               # Confirming receipt
        COMPLETION                     # Signaling work complete
    }
    content: string                    # Message body

    # Attachments
    attachments: Attachment[]

    # Threading
    reply_to: UUID?                    # Parent message if threaded

    # State
    requires_response: boolean
    response_deadline: ISO8601?

    # Metadata
    relates_to_work_item: UUID?        # Associated work item
    tags: string[]
}

Conversation {
    id: UUID
    created_at: ISO8601

    # Context
    work_item_id: UUID?                # If conversation is about specific work
    topic: string                      # Conversation subject

    # Participants
    participants: ActorRef[]

    # State
    status: enum { ACTIVE, PAUSED, COMPLETED, ARCHIVED }

    # Messages
    message_count: integer
    last_message_at: ISO8601
}
```

### 4.2 Conversation Patterns

#### Pattern: Clarification Loop

```
Human: "Review this PR for security issues"
    │
    ▼
AI: "I'll review PR #123. Before I start, could you clarify:
     1. Should I focus on OWASP Top 10 specifically?
     2. Are there particular areas of concern?"
    │
    ▼
Human: "Yes, OWASP Top 10, and pay attention to the auth module"
    │
    ▼
AI: "Understood. Reviewing with OWASP focus on auth module..."
    │
    ▼
AI: [Provides review findings]
```

#### Pattern: Proposal and Refinement

```
Human: "Design the data model for user permissions"
    │
    ▼
AI: "Here's my proposed schema: [schema]
     Key design decisions:
     - Role-based with inheritance
     - Denormalised for query performance
     Should I proceed with this approach?"
    │
    ▼
Human: "Good direction, but use flat permissions instead of inheritance"
    │
    ▼
AI: "Revised to flat permissions: [updated schema]
     This simplifies queries but increases storage. Acceptable?"
    │
    ▼
Human: "Yes, proceed"
```

#### Pattern: Escalation in Conversation

```
AI: "I'm analysing the test failures..."
    │
    ▼
AI: "I've identified a pattern but I'm uncertain about the root cause.
     Two possibilities:
     1. Race condition in async handler (60% confidence)
     2. Memory pressure causing GC pauses (30% confidence)

     I recommend investigating option 1 first, but this requires
     domain knowledge I don't have. Can you confirm?"
    │
    ▼
Human: "Given our deployment environment, option 2 is more likely.
        We've seen GC issues before in this service."
    │
    ▼
AI: "Thank you. Proceeding with GC analysis..."
```

### 4.3 Conversation Preservation

Conversations generate tacit knowledge that should be preserved:

```
ConversationSummary {
    conversation_id: UUID
    generated_at: ISO8601

    # Extracted information
    decisions_made: DecisionRef[]      # Decisions from conversation
    key_insights: string[]             # Important learnings
    open_questions: string[]           # Unresolved questions
    action_items: WorkItem[]           # Follow-up work generated

    # Context for future reference
    summary: string                    # Natural language summary
    rationale_captured: string[]       # Reasoning preserved
}
```

---

## 5. Queue-Based Coordination

### 5.1 Queue Schema

```
WorkQueue {
    id: UUID
    name: string                       # e.g., "code-review", "security-audit"

    # Configuration
    queue_type: enum {
        FIFO,                          # First in, first out
        PRIORITY,                      # Ordered by priority
        FAIR,                          # Round-robin among actors
        CAPABILITY_MATCHED             # Route by capability requirements
    }

    # Actor eligibility
    eligible_actor_types: enum[]       # HUMAN, AI, SYSTEM
    required_capabilities: string[]    # Capabilities actors must have

    # Policies
    max_concurrent_per_actor: integer? # Limit per actor
    assignment_timeout: Duration?      # Auto-unassign if not started
    completion_timeout: Duration?      # Escalate if not completed

    # State
    item_count: integer
    oldest_item_age: Duration

    # Metrics
    avg_wait_time: Duration
    avg_completion_time: Duration
    escalation_rate: float
}

QueueEntry {
    id: UUID
    queue_id: UUID
    work_item_id: UUID

    # Ordering
    enqueued_at: ISO8601
    priority_score: float              # For priority queues

    # State
    status: enum { WAITING, CLAIMED, COMPLETED, EXPIRED, ESCALATED }
    claimed_by: ActorRef?
    claimed_at: ISO8601?
}
```

### 5.2 Queue Patterns

#### Pattern: Simple Work Distribution

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  Work Producer  │────▶│   Work Queue     │────▶│  Work Consumer  │
│  (any actor)    │     │   (FIFO/Priority)│     │  (eligible)     │
└─────────────────┘     └──────────────────┘     └─────────────────┘
```

**Use case**: Bug triage, documentation tasks, test execution

#### Pattern: Capability-Routed Distribution

```
                              ┌──────────────────┐
                         ┌───▶│ Security Review  │───▶ [Security Expert]
┌─────────────┐          │    │ Queue            │
│ Work Item   │──[Route]─┤    └──────────────────┘
│ Generator   │          │    ┌──────────────────┐
└─────────────┘          ├───▶│ Code Review      │───▶ [Any Reviewer]
                         │    │ Queue            │
                         │    └──────────────────┘
                         │    ┌──────────────────┐
                         └───▶│ Documentation    │───▶ [AI Writer]
                              │ Queue            │
                              └──────────────────┘
```

**Use case**: Differentiated routing by work type or required expertise

#### Pattern: Human-AI Pipeline

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│ AI Triage    │────▶│ Human Review │────▶│ AI Execute   │
│ Queue        │     │ Queue        │     │ Queue        │
└──────────────┘     └──────────────┘     └──────────────┘
       │                    │                    │
       ▼                    ▼                    ▼
   AI claims           Human claims          AI claims
   and triages         and decides           and executes
```

**Use case**: PR review (AI pre-review → Human decision → AI fix generation)

#### Pattern: Escalation Queue

```
┌──────────────────┐     ┌──────────────────┐
│ AI Execution     │     │ Escalation Queue │
│ Queue            │────▶│ (Human-Only)     │
└──────────────────┘     └──────────────────┘
         │ (confident)            │
         ▼                        ▼
    AI completes             Human handles
                             escalated items
```

**Use case**: AI-Led patterns with escalation fallback

### 5.3 Queue Policies

#### Assignment Policies

| Policy | Description | When to Use |
|--------|-------------|-------------|
| **Claim** | Actors pull from queue | When actors know their capacity |
| **Push** | System assigns to actors | When load balancing needed |
| **Preference** | Route to preferred actor if available | When continuity matters |
| **Least-loaded** | Route to actor with fewest items | For fair distribution |
| **Capability-match** | Route to actor with best capability fit | For specialised work |

#### Timeout Policies

| Policy | Description | Effect |
|--------|-------------|--------|
| **Claim timeout** | Auto-release if not started within X | Returns to queue |
| **Completion timeout** | Escalate if not completed within X | Creates escalation work item |
| **Staleness timeout** | Escalate if in queue too long | Creates escalation work item |

---

## 6. Actor Capability and Availability

### 6.1 Actor Profile Schema

```
ActorProfile {
    actor_ref: ActorRef

    # Capabilities
    capabilities: ActorCapability[]

    # Availability (for humans)
    availability: Availability? {
        schedule: Schedule?            # Working hours
        current_status: enum { AVAILABLE, BUSY, AWAY, DO_NOT_DISTURB }
        current_load: integer          # Active work items
        max_concurrent: integer        # Capacity limit
    }

    # For AI actors
    ai_constraints: AIConstraints? {
        context_limit: integer         # Token/context limit
        rate_limit: RateLimit?         # Requests per period
        capabilities: string[]         # What this AI can do
        model_version: string          # Current model
    }

    # Performance history
    metrics: ActorMetrics {
        work_items_completed: integer
        avg_completion_time: Duration
        quality_score: float?          # If measured
        escalation_rate: float         # % of work escalated
    }

    # Preferences
    preferred_work_types: string[]
    avoided_work_types: string[]
}

ActorCapability {
    capability: enum { Elicit, Analyse, Synthesise, Transform,
                      Validate, Decide, Generate, Preserve }
    proficiency: enum { NOVICE, COMPETENT, PROFICIENT, EXPERT }
    domains: string[]                  # Domain-specific competence
    patterns_supported: enum[]         # Which collaboration patterns
}
```

### 6.2 Capability Matching Algorithm

When assigning work to actors:

```
MatchActorToWork(work_item, available_actors[]) → ActorRef? {

    # Filter by hard requirements
    eligible = available_actors.filter(actor =>
        actor.supports(work_item.required_pattern) AND
        actor.has_capabilities(work_item.required_capabilities) AND
        actor.is_available()
    )

    if eligible.empty():
        return None  # No eligible actor; escalate or queue

    # Score remaining candidates
    scored = eligible.map(actor => {
        score = 0

        # Capability fit
        score += capability_match_score(actor, work_item)

        # Domain expertise
        score += domain_match_score(actor, work_item.context)

        # Load balancing
        score -= actor.current_load * LOAD_PENALTY

        # Continuity bonus (if actor has context)
        if actor.has_prior_context(work_item):
            score += CONTINUITY_BONUS

        # Preference match
        if work_item.work_type in actor.preferred_work_types:
            score += PREFERENCE_BONUS

        return { actor, score }
    })

    return scored.max_by(score).actor
}
```

### 6.3 Human vs AI Routing Considerations

| Factor | Favour Human | Favour AI |
|--------|--------------|-----------|
| **Knowledge type** | Tacit-heavy | Formal-heavy |
| **Time sensitivity** | Can wait | Needs immediate response |
| **Scale** | Small volume | High volume |
| **Consistency** | Variation acceptable | Consistency critical |
| **Accountability** | Decision has consequences | Mechanical execution |
| **Novelty** | Novel situation | Routine pattern |
| **Escalation history** | Previously escalated | No prior escalation |

---

## 7. Coordination Patterns by Collaboration Pattern

### 7.1 Human-Only

**Coordination mode**: Usually interactive (synchronous)

```
No AI involvement in coordination layer.
Standard human-to-human coordination:
- Direct messages
- Meetings
- Shared task boards
```

### 7.2 Human-Led

**Coordination mode**: Interactive primary; queue for AI preparation

```
┌──────────────────────────────────────────────────────────────┐
│                      Human-Led Flow                          │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  1. Human initiates work                                     │
│  2. AI prepares (async): gathers context, drafts, analyses   │
│  3. Human and AI collaborate (sync): refine, decide          │
│  4. Human directs completion                                 │
│                                                              │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐                  │
│  │  HUMAN  │◀──▶│   AI    │    │  HUMAN  │                  │
│  │ Initiate│    │ Prepare │    │Complete │                  │
│  └────┬────┘    └────┬────┘    └────▲────┘                  │
│       │              │              │                        │
│       └──────────────┴──────────────┘                        │
│            Interactive dialogue                              │
└──────────────────────────────────────────────────────────────┘
```

### 7.3 Partnership

**Coordination mode**: Interactive (synchronous) essential

```
┌──────────────────────────────────────────────────────────────┐
│                     Partnership Flow                         │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  Neither actor can complete alone; tight collaboration       │
│                                                              │
│  ┌─────────┐         ┌─────────┐                            │
│  │  HUMAN  │◀───────▶│   AI    │                            │
│  │ Insight │         │ Pattern │                            │
│  └────┬────┘         └────┬────┘                            │
│       │                   │                                  │
│       └─────────┬─────────┘                                  │
│                 │                                            │
│            ┌────▼────┐                                       │
│            │ Outcome │                                       │
│            └─────────┘                                       │
│                                                              │
│  Continuous back-and-forth; shared conversation state        │
│  Context preserved throughout                                │
└──────────────────────────────────────────────────────────────┘
```

### 7.4 AI-Led

**Coordination mode**: Queue-based primary; interactive for escalation

```
┌──────────────────────────────────────────────────────────────┐
│                       AI-Led Flow                            │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐                  │
│  │ AI Work │    │   AI    │    │ Human   │                  │
│  │  Queue  │───▶│ Execute │───▶│ Review  │                  │
│  └─────────┘    └────┬────┘    └─────────┘                  │
│                      │                                       │
│               (if uncertain)                                 │
│                      │                                       │
│                      ▼                                       │
│               ┌─────────────┐                                │
│               │ Escalation  │                                │
│               │   Queue     │───▶ Human resolves (sync)     │
│               └─────────────┘                                │
│                                                              │
│  AI executes autonomously; human reviews results             │
│  Escalation creates interactive session                      │
└──────────────────────────────────────────────────────────────┘
```

### 7.5 AI-Only

**Coordination mode**: Queue-based; monitoring-based intervention

```
┌──────────────────────────────────────────────────────────────┐
│                      AI-Only Flow                            │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐                  │
│  │ AI Work │    │   AI    │    │ Auto    │                  │
│  │  Queue  │───▶│ Execute │───▶│ Archive │                  │
│  └─────────┘    └─────────┘    └─────────┘                  │
│                      │                                       │
│               (anomaly detected)                             │
│                      │                                       │
│                      ▼                                       │
│               ┌─────────────┐                                │
│               │ Alert Queue │───▶ Human investigates        │
│               └─────────────┘                                │
│                                                              │
│  Fully autonomous; monitoring for anomalies                  │
│  Human intervention only on alerts                           │
└──────────────────────────────────────────────────────────────┘
```

---

## 8. Integration with Decision/Observation Tracking

### 8.1 Work Items Generate Records

| Work Event | Record Type | Details |
|------------|-------------|---------|
| Work item created | Observation | EVENT: work created |
| Work item assigned | Observation | EVENT: assignment made |
| Work started | Observation | DURATION: started_at recorded |
| Work completed | Observation | DURATION: ended_at, elapsed |
| Work produces decision | Decision | Full decision record |
| Escalation triggered | Observation | EVENT: escalation |
| Escalation resolved | Decision | Resolution decision |

### 8.2 Decision Context from Work Items

Decisions reference work items as context:

```
Decision {
    ...
    context: {
        work_item_id: UUID,            # Which work item prompted decision
        conversation_id: UUID?,        # If decision emerged from dialogue
    }
}
```

### 8.3 Work Items Reference Decisions

Work items can depend on decisions:

```
WorkItem {
    ...
    blocked_by_decisions: DecisionRef[]  # Decisions that must be made first
    informed_by_decisions: DecisionRef[] # Decisions that provide context
}
```

---

## 9. Tooling and Protocol Options

### 9.1 Message/Event Infrastructure

| Option | Strengths | Limitations | Suitability |
|--------|-----------|-------------|-------------|
| **Apache Kafka** | High throughput, durability, replay | Operational complexity | High-volume, event-sourced systems |
| **RabbitMQ** | Flexible routing, mature | Lower throughput than Kafka | Traditional queue patterns |
| **Redis Streams** | Fast, simple | Less durable | Ephemeral queues, caching |
| **PostgreSQL LISTEN/NOTIFY** | Transactional consistency | Limited scale | Smaller systems, strong consistency |
| **AWS SQS/SNS** | Managed, scalable | Vendor lock-in | Cloud-native systems |

### 9.2 Conversation/Messaging

| Option | Strengths | Limitations | Suitability |
|--------|-----------|-------------|-------------|
| **Custom WebSocket** | Full control | Development effort | Bespoke requirements |
| **Matrix protocol** | Decentralised, E2E encryption | Complexity | Privacy-sensitive |
| **Slack/Teams integration** | Familiar UX | External dependency | Team-integrated workflows |
| **Direct API calls** | Simple | Synchronous | Low-volume, simple flows |

### 9.3 Recommended Architecture

For initial implementation:

```
┌──────────────────────────────────────────────────────────────┐
│                    Application Layer                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐          │
│  │   Human     │  │     AI      │  │   System    │          │
│  │  Interface  │  │   Service   │  │   Service   │          │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘          │
└─────────┼────────────────┼────────────────┼──────────────────┘
          │                │                │
          ▼                ▼                ▼
┌──────────────────────────────────────────────────────────────┐
│                   Coordination Layer                         │
│  ┌─────────────────────────────────────────────────────┐    │
│  │              Work Coordination Service               │    │
│  │  - Work item management                             │    │
│  │  - Queue management                                  │    │
│  │  - Assignment routing                                │    │
│  │  - Conversation management                           │    │
│  └──────────────────────────┬──────────────────────────┘    │
└─────────────────────────────┼────────────────────────────────┘
                              │
                              ▼
┌──────────────────────────────────────────────────────────────┐
│                     Storage Layer                            │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐          │
│  │   Work DB   │  │ Message DB  │  │  Actor DB   │          │
│  │ (PostgreSQL)│  │ (PostgreSQL)│  │ (PostgreSQL)│          │
│  └─────────────┘  └─────────────┘  └─────────────┘          │
└──────────────────────────────────────────────────────────────┘
```

**Rationale**: PostgreSQL handles all storage initially (work items, messages, actor profiles) with potential to extract to specialised stores as scale demands.

---

## 10. Framework Alignment

### 10.1 ISO/IEC/IEEE 12207:2017 Alignment

| 12207 Process | Coordination Alignment |
|---------------|------------------------|
| **Project Planning (6.3.1)** | Work item creation and scheduling |
| **Project Assessment and Control (6.3.2)** | Work status tracking and metrics |
| **Decision Management (6.3.3)** | Decision requests and recording |
| **Information Management (6.3.6)** | Context preservation in work items |
| **Configuration Management (6.3.5)** | Work item versioning and history |

### 10.2 Framework Concept Integration

| Framework Concept | Coordination Integration |
|-------------------|--------------------------|
| **Eight Capabilities** | Work items typed by capability |
| **Actor Model** | Actor profiles and capability matching |
| **Collaboration Patterns** | Coordination mode selection |
| **Escalation** | Escalation work items and queues |
| **Process Specification** | Work items map to capability instances |
| **Decision/Observation Tracking** | Work events generate records |

### 10.3 Extensions Beyond Standards

1. **Human-AI coordination** — Standards don't address AI as actor
2. **Capability-based routing** — Novel work distribution approach
3. **Conversation preservation** — Capturing tacit knowledge from dialogue
4. **Hybrid sync/async** — Seamless transition between modes

---

## 11. Open Questions

### 11.1 Resolved

- ✓ How do sync and async coordination relate? → Hybrid model with transitions
- ✓ What triggers mode transitions? → Work phase and pattern determine mode
- ✓ How does coordination integrate with decision tracking? → Work events generate records

### 11.2 Requiring Further Investigation

1. **Conversation state limits** — How long can interactive context be maintained before degradation?

2. **Context packaging quality** — How to measure whether work items carry sufficient context for async handoff?

3. **Multi-AI coordination** — How do multiple AI actors coordinate on shared work?

4. **Human attention management** — How to avoid overwhelming humans with notifications and escalations?

5. **Conversation-to-work extraction** — Automated extraction of work items from natural conversation?

6. **Cross-team coordination** — How to coordinate when work spans team boundaries?

---

## 12. Next Steps

1. **Prototype work item service** — Implement core work item CRUD and state machine
2. **Queue implementation** — Build configurable work queues with routing
3. **Conversation service** — Implement messaging with conversation grouping
4. **Actor registry** — Build actor profile management and capability matching
5. **Integration hooks** — Connect to existing tools (git, CI/CD, chat)
6. **Metrics dashboard** — Visualise work flow and coordination health

---

*Document created: 10 January 2026*
*Purpose: Investigation toward executable framework manifestation*
*Status: Active investigation — schemas proposed, pending prototype validation*
