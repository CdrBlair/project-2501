# Key Reference Concept: Work Coordination and Actor Assignment

## Definition

Work coordination addresses the operational gap between framework concepts and execution: **how** work is assigned to actors, tracked through completion, and handed off between participants. The framework defines *what* work should be done (capability flows) and *who* should do it (actor patterns), but work coordination defines *how* that assignment and tracking happens.

The coordination challenge is compounded by heterogeneous actors—humans and AI have different availability patterns, response times, and interaction modes. Effective coordination must support both synchronous dialogue (for Partnership and Human-Led patterns) and asynchronous queuing (for AI-Led and parallelisable work).

## Core Challenges

| Challenge | Description |
|-----------|-------------|
| **Heterogeneous actors** | Humans and AI have different availability patterns, response times, and interaction modes |
| **Mixed coordination modes** | Some work requires synchronous dialogue; other work suits asynchronous queuing |
| **Context preservation** | tasks must carry sufficient context for actors to proceed without extensive re-discovery |
| **Assignment matching** | Work must be routed to actors with appropriate capabilities and availability |
| **State visibility** | All actors need visibility into work state to coordinate effectively |
| **Handoff integrity** | Information must not be lost when work transfers between actors |

---

## Coordination Paradigms

### Interactive (Synchronous) Coordination

Real-time dialogue between actors with immediate response expectation.

**Characteristics**:
- Low latency between messages
- Shared conversational context
- Immediate feedback and clarification
- Natural for Human-Led and Partnership patterns

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

### Queue-Based (Asynchronous) Coordination

tasks posted to queues, claimed by available actors, completed independently.

**Characteristics**:
- Decoupled producer/consumer
- Explicit context packaging in tasks
- Actors operate on their own schedules
- Natural for AI-Led and parallelisable work

**Strengths**:
- Scales to many actors and tasks
- Actors work when available
- Explicit work state tracking
- Auditable work history

**Limitations**:
- Context must be explicitly packaged (risk of loss)
- Clarification requires round-trips
- Longer cycle times
- Queue management overhead

### Hybrid Coordination

Most real work uses both paradigms:

```
Queue-based assignment → Interactive execution → Queue-based handoff
```

**Example flow**:
1. PR review task appears in queue (async)
2. Human claims task
3. Human and AI collaborate interactively on review (sync)
4. Review complete; handoff to next queue (async)

---

## task Schema

A task is a unit of work that can be assigned to and completed by an actor.

### Core Schema

```
WorkItem {
    id: UUID                           # Unique identifier
    created_at: ISO8601                # When task was created
    updated_at: ISO8601                # Last modification time

    # Classification
    work_type: enum {
        CAPABILITY_INSTANCE,           # Single capability execution
        PROCESS_STEP,                  # Step within a process
        ESCALATION,                    # Escalated from AI to human
        REVIEW,                        # Review of prior work
        DECISION_REQUEST,              # Request for decision
        INFORMATION_REQUEST,           # Request for information/clarification
        DEFERRED_CONTINUATION          # Suspended process awaiting async completion
    }

    # Context
    process_id: string?                # PROC-X.Y if part of process
    step_id: string?                   # X.Y.Z if capability instance
    phase: enum { 1..7 }               # SDLC phase
    capability: enum?                  # Which of the eight capabilities

    # Content
    title: string                      # Brief description
    description: string                # Full work description
    objective: string                  # What success looks like

    # Context package (for async handoff)
    context: WorkContext {
        background: string             # Why this work exists
        prior_work: Reference[]        # Links to relevant prior work
        decisions: DecisionRef[]       # Relevant decisions
        observations: ObservationRef[] # Relevant observations
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
    status: WorkStatus                 # Current state
    assigned_to: ActorRef?             # Currently assigned actor
    assignment_history: Assignment[]   # History of assignments

    # Completion
    acceptance_criteria: string[]      # What must be true for completion
    deliverables: DeliverableSpec[]    # Expected outputs

    # Dependencies
    blocked_by: UUID[]                 # tasks that must complete first
    blocks: UUID[]                     # tasks waiting on this

    # Urgency and scheduling
    priority: enum { CRITICAL, HIGH, MEDIUM, LOW }
    due_date: ISO8601?                 # When work should complete
    estimated_effort: Duration?        # Expected time to complete

    # Escalation source (if work_type = ESCALATION)
    escalation: EscalationContext? {
        source_work_item: UUID         # Original task
        source_actor: ActorRef         # Who escalated
        trigger: string                # What triggered escalation
        ai_assessment: string?         # AI's analysis before escalation
        ai_recommendation: string?     # AI's suggested resolution
        confidence: float?             # AI's confidence level
    }

    # Deferred continuation (if work_type = DEFERRED_CONTINUATION)
    deferred: DeferredContext? {
        source_process_id: string      # PROC-X.Y that was suspended
        source_step_id: string         # Step where DEFER triggered
        suspended_state: bytes         # Serialised process state
        resume_trigger: ResumeTrigger {
            type: enum { HUMAN_APPROVAL, EXTERNAL_EVENT, TIMEOUT, MANUAL }
            condition: string          # What must happen to resume
            timeout: Duration?         # For TIMEOUT type: auto-resume after
            event_source: string?      # For EXTERNAL_EVENT: where event comes from
        }
        suspended_at: ISO8601          # When process was suspended
        resume_actors: ActorRef[]      # Who can trigger resumption
    }
}
```

### Work Status State Machine

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
           │        │ IN_PROGRESS │───────────────────┐
           │        └──────┬──────┘                   │
           │               │                          │ (escalate)
           │      ┌────────┼────────┬────────┐       │
           │      │        │        │        │       ▼
           │      ▼        ▼        ▼        ▼  ┌─────────────┐
           │ ┌────────┐ ┌──────┐ ┌─────┐ ┌──────────┐ │  ESCALATED  │
           │ │BLOCKED │ │PAUSED│ │DONE │ │SUSPENDED │ └──────┬──────┘
           │ └───┬────┘ └──┬───┘ └──┬──┘ └────┬─────┘       │
           │     │         │        │         │              │
           │     └────┬────┘        │         │ (resume)     │
           │          │             │         │              │
           └──────────┘             │         ▼              │
                                    │   ┌─────────────┐      │
                                    │   │ IN_PROGRESS │      │
                                    │   └──────┬──────┘      │
                                    │          │             │
                                    ▼          ▼             │
                             ┌─────────────────────────┐     │
                             │       COMPLETED         │◀────┘
                             └──────────┬──────────────┘ (after resolution)
                                        │
                          ┌─────────────┼─────────────┐
                          ▼             ▼             ▼
                   ┌──────────┐ ┌───────────┐ ┌───────────┐
                   │ ACCEPTED │ │ REJECTED  │ │ CANCELLED │
                   └──────────┘ └───────────┘ └───────────┘
```

**SUSPENDED vs PAUSED vs BLOCKED**:

| State | Meaning | Resume |
|-------|---------|--------|
| **PAUSED** | Temporarily interrupted (e.g., lunch break) | Actor manually resumes |
| **BLOCKED** | Cannot proceed; dependency or failure | Blocker must be resolved |
| **SUSPENDED** | Awaiting async completion; explicit resume trigger | Resume trigger fires |

SUSPENDED is specifically for DEFER actions—the work is waiting for an external signal (human approval, event, timeout) before continuing.

### Assignment Record

```
Assignment {
    id: UUID
    work_item_id: UUID

    # Assignment details
    assigned_to: ActorRef
    assigned_by: ActorRef              # Who made assignment
    assigned_at: ISO8601
    assignment_type: enum {
        DIRECT,                        # Explicitly assigned
        CLAIMED,                       # Actor claimed from queue
        AUTO_ROUTED,                   # System auto-assigned
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

### Actor Reference

```
ActorRef {
    actor_type: enum { HUMAN, AI, SYSTEM }
    actor_id: string                   # Unique identifier

    # For humans
    user_id: string?                   # User account identifier

    # For AI
    ai_system: string?                 # e.g., "claude-code"
    ai_model: string?                  # e.g., "claude-opus-4"
    ai_session: string?                # Session identifier

    # For systems
    system_name: string?               # e.g., "ci-pipeline"
}
```

---

## Interactive Messaging

For synchronous coordination, actors exchange messages within conversations.

### Message Schema

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
    attachments: Attachment[]

    # Threading
    reply_to: UUID?                    # Parent message if threaded

    # State
    requires_response: boolean
    response_deadline: ISO8601?

    # Metadata
    relates_to_work_item: UUID?        # Associated task
    tags: string[]
}

Conversation {
    id: UUID
    created_at: ISO8601

    # Context
    work_item_id: UUID?                # If about specific work
    topic: string                      # Conversation subject

    # Participants
    participants: ActorRef[]

    # State
    status: enum { ACTIVE, PAUSED, COMPLETED, ARCHIVED }
    message_count: integer
    last_message_at: ISO8601
}
```

### Conversation Patterns

**Clarification Loop**:
```
Human: "Review this PR for security issues"
    │
    ▼
AI: "I'll review PR #123. Could you clarify:
     1. Should I focus on OWASP Top 10?
     2. Are there particular areas of concern?"
    │
    ▼
Human: "Yes, OWASP Top 10, focus on auth module"
    │
    ▼
AI: "Understood. Reviewing with OWASP focus..."
```

**Escalation in Conversation**:
```
AI: "I've identified a pattern but I'm uncertain.
     Two possibilities:
     1. Race condition (60% confidence)
     2. Memory pressure (30% confidence)

     I recommend option 1, but this requires
     domain knowledge I don't have. Can you confirm?"
    │
    ▼
Human: "Given our environment, option 2 is more likely.
        We've seen GC issues before."
    │
    ▼
AI: "Thank you. Proceeding with GC analysis..."
```

### Conversation Preservation

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

## Queue-Based Coordination

### Queue Schema

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

    # Metrics
    avg_wait_time: Duration
    avg_completion_time: Duration
    escalation_rate: float
}
```

### Queue Patterns

**Simple Work Distribution**:
```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  Work Producer  │────▶│   Work Queue     │────▶│  Work Consumer  │
│  (any actor)    │     │   (FIFO/Priority)│     │  (eligible)     │
└─────────────────┘     └──────────────────┘     └─────────────────┘
```

**Capability-Routed Distribution**:
```
                              ┌──────────────────┐
                         ┌───▶│ Security Review  │───▶ [Security Expert]
┌─────────────┐          │    │ Queue            │
│ task   │──[Route]─┤    └──────────────────┘
│ Generator   │          │    ┌──────────────────┐
└─────────────┘          ├───▶│ Code Review      │───▶ [Any Reviewer]
                         │    │ Queue            │
                         │    └──────────────────┘
                         │    ┌──────────────────┐
                         └───▶│ Documentation    │───▶ [AI Writer]
                              │ Queue            │
                              └──────────────────┘
```

**Human-AI Pipeline**:
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

### Queue Policies

**Assignment Policies**:

| Policy | Description | When to Use |
|--------|-------------|-------------|
| **Claim** | Actors pull from queue | When actors know their capacity |
| **Push** | System assigns to actors | When load balancing needed |
| **Preference** | Route to preferred actor if available | When continuity matters |
| **Least-loaded** | Route to actor with fewest items | For fair distribution |
| **Capability-match** | Route to actor with best capability fit | For specialised work |

**Timeout Policies**:

| Policy | Description | Effect |
|--------|-------------|--------|
| **Claim timeout** | Auto-release if not started | Returns to queue |
| **Completion timeout** | Escalate if not completed | Creates escalation |
| **Staleness timeout** | Escalate if in queue too long | Creates escalation |

---

## Actor Profiles and Capability Matching

### Actor Profile Schema

```
ActorProfile {
    actor_ref: ActorRef

    # Capabilities (maps to eight-capability taxonomy)
    capabilities: ActorCapability[]

    # Availability (for humans)
    availability: Availability? {
        schedule: Schedule?            # Working hours
        current_status: enum { AVAILABLE, BUSY, AWAY, DO_NOT_DISTURB }
        current_load: integer          # Active tasks
        max_concurrent: integer        # Capacity limit
    }

    # For AI actors (maps to AI Actor Differentiation Model)
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

### Capability Matching Algorithm

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

### Human vs AI Routing Considerations

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

## Coordination Patterns by Collaboration Pattern

### Human-Only

**Mode**: Usually interactive (synchronous)

No AI involvement in coordination layer. Standard human-to-human coordination.

### Human-Led

**Mode**: Interactive primary; queue for AI preparation

```
1. Human initiates work
2. AI prepares (async): gathers context, drafts, analyses
3. Human and AI collaborate (sync): refine, decide
4. Human directs completion
```

### Partnership

**Mode**: Interactive (synchronous) essential

```
Neither actor can complete alone; tight collaboration required.

┌─────────┐         ┌─────────┐
│  HUMAN  │◀───────▶│   AI    │
│ Insight │         │ Pattern │
└────┬────┘         └────┬────┘
     │                   │
     └─────────┬─────────┘
               │
          ┌────▼────┐
          │ Outcome │
          └─────────┘

Continuous back-and-forth; shared conversation state.
```

### AI-Led

**Mode**: Queue-based primary; interactive for escalation

```
┌─────────┐    ┌─────────┐    ┌─────────┐
│ AI Work │    │   AI    │    │ Human   │
│  Queue  │───▶│ Execute │───▶│ Review  │
└─────────┘    └────┬────┘    └─────────┘
                    │
             (if uncertain)
                    │
                    ▼
             ┌─────────────┐
             │ Escalation  │───▶ Human resolves (sync)
             │   Queue     │
             └─────────────┘
```

### AI-Only

**Mode**: Queue-based; monitoring-based intervention

```
┌─────────┐    ┌─────────┐    ┌─────────┐
│ AI Work │    │   AI    │    │ Auto    │
│  Queue  │───▶│ Execute │───▶│ Archive │
└─────────┘    └─────────┘    └─────────┘
                    │
             (anomaly detected)
                    │
                    ▼
             ┌─────────────┐
             │ Alert Queue │───▶ Human investigates
             └─────────────┘
```

---

## Integration with Decision/Observation Tracking

Work coordination integrates with the [Decision and Observation Tracking](./concept_decision-observation-tracking.md) system:

### Work Events Generate Records

| Work Event | Record Type | Details |
|------------|-------------|---------|
| task created | Observation | EVENT: work created |
| task assigned | Observation | EVENT: assignment made |
| Work started | Observation | DURATION: started_at recorded |
| Work completed | Observation | DURATION: ended_at, elapsed |
| Work produces decision | Decision | Full decision record |
| Escalation triggered | Observation | EVENT: escalation |
| Escalation resolved | Decision | Resolution decision |

### Decision Context from tasks

Decisions reference tasks as context:

```
Decision {
    ...
    context: {
        work_item_id: UUID,            # Which task prompted decision
        conversation_id: UUID?,        # If decision emerged from dialogue
    }
}
```

### tasks Reference Decisions

tasks can depend on decisions:

```
WorkItem {
    ...
    blocked_by_decisions: DecisionRef[]  # Decisions that must be made first
    informed_by_decisions: DecisionRef[] # Decisions that provide context
}
```

---

## Key Implications

**For human-AI collaboration**: The hybrid coordination model supports the full spectrum of collaboration patterns—from synchronous dialogue for Partnership to asynchronous queuing for AI-Only.

**For context preservation**: tasks package sufficient context for async handoff, while conversations preserve the tacit knowledge that emerges from synchronous dialogue.

**For escalation design**: Escalation creates new tasks with full context, enabling clean handoff from AI to human without information loss.

**For accountability**: tasks and conversations create the audit trail needed to trace decisions back to their origins and understand who contributed what.

**For process execution**: Work coordination operationalises the capability flows defined in process specifications—each capability instance becomes a trackable task.

---

## Integration with Other Concepts

- [**Process and Capability Flow**](./concept_process-capability-flow.md): Capability instances in process specifications become tasks in the coordination system
- [**Decision and Observation Tracking**](./concept_decision-observation-tracking.md): Work events generate observations; work completion can generate decisions
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): task required_pattern drives coordination mode selection
- [**Actor Model**](./concept_actor-model.md): Actor profiles enable capability matching; AI actor differentiation enables more precise routing
- [**Eight-Capability Taxonomy**](./concept_capability-model.md): tasks typed by capability; actor capabilities map to the taxonomy
- [**Agent Context Model (3S2P)**](./concept_agent-context-model.md): Work context package provides 3S2P dimensions for actor context

---

## Standards Alignment

### ISO/IEC/IEEE 12207:2017 Alignment

| 12207 Process | Coordination Alignment |
|---------------|------------------------|
| **Project Planning (6.3.1)** | task creation and scheduling |
| **Project Assessment and Control (6.3.2)** | Work status tracking and metrics |
| **Decision Management (6.3.3)** | Decision requests and recording |
| **Information Management (6.3.6)** | Context preservation in tasks |
| **Configuration Management (6.3.5)** | task versioning and history |

### Extensions Beyond Standards

1. **Human-AI coordination**: Standards don't address AI as actor
2. **Capability-based routing**: Novel work distribution approach
3. **Conversation preservation**: Capturing tacit knowledge from dialogue
4. **Hybrid sync/async**: Seamless transition between modes

---

## Validation Status

- ✓ **Core schemas**: task, message, queue schemas cover identified needs
- ✓ **State machine**: Work status transitions are well-defined
- ✓ **Pattern integration**: Coordination modes align with collaboration patterns
- ⚠ **Capability matching**: Algorithm is conceptual; effectiveness untested
- ⚠ **Conversation state limits**: How long can interactive context be maintained?
- ⚠ **Context packaging quality**: How to measure whether tasks carry sufficient context?
- ⚠ **Multi-AI coordination**: Patterns for multiple AI actors on shared work need development
- ⚠ **Human attention management**: Avoiding notification overload requires design

---

*Work Coordination bridges the gap between framework concepts and operational execution. By defining how work is assigned, tracked, and handed off between human and AI actors, the system enables the collaboration patterns and capability flows the framework describes to become operational reality.*
