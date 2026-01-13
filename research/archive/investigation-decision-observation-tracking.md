# Investigation: Decision and Observation Tracking

**Status**: ✓ Formalised — see `concepts/concept_decision-observation-tracking.md`
**Archived**: 12 January 2026
**Purpose**: Design mechanisms for recording observations (factual states) and decisions (judgements) throughout the SDLC, supporting traceability, accountability, and reversion analysis
**Related**: Item 5 in planning-future-work.md (now completed)

> **Note**: This investigation has been formalised into the concept document. This file is archived for reference. The concept document contains the authoritative schemas and framework integration; this document retains implementation-level detail (tooling options, storage technology assessment, integration architecture) that may be useful for Phase D executable framework work.

---

## 1. Core Distinctions

### 1.1 Observations vs Decisions

| Aspect | Observations | Decisions |
|--------|--------------|-----------|
| **Nature** | Factual states, measurements, outcomes | Judgements, choices, commitments |
| **Examples** | Build passed/failed; test coverage 78%; response time 42ms | "Ready to merge"; "Quality sufficient for release"; "Use microservices pattern" |
| **Temporal character** | Events — they happened in sequence | Commitments — they create constraints on future decisions |
| **Storage model** | Linear log (append-only, chronological) | Tree structure (hierarchical, with dependencies) |
| **Relationship** | Independent (each stands alone) | Dependent (references prior decisions and informing observations) |

### 1.2 Decision Scope

Decisions span multiple granularities:

1. **Strategic decisions** — Project-level choices affecting overall direction
   - "This project will use microservices architecture"
   - "We will target Python 3.11+"
   - Typically Human-Only or Human-Led

2. **Design decisions** — Architectural and technical choices
   - "Authentication will use JWT with refresh tokens"
   - "The API will follow RESTful conventions"
   - Typically Human-Led or Partnership

3. **Operational decisions** — Completion and progression judgements
   - "This PR is ready to merge"
   - "Test coverage is sufficient"
   - "This changeset can proceed to staging"
   - May legitimately be AI-Led or autonomous under defined policies

4. **Tactical decisions** — Implementation choices
   - "Use a hash map for this lookup"
   - "Extract this logic into a helper function"
   - Often AI-Led with human review

The same structural elements apply regardless of scope, with appropriate weight given the decision's impact and reversibility.

---

## 2. Data Model Specification

### 2.1 Observation Log Schema

Observations are recorded as append-only entries in a linear log.

```
Observation {
    id: UUID                          # Unique identifier
    timestamp: ISO8601                 # When the observation was recorded

    # Classification
    observation_type: enum {
        MEASUREMENT,                   # Quantitative data (metrics, timings)
        STATE,                         # System state (build status, test result)
        EVENT,                         # Occurrence (commit, deployment)
        DURATION                       # Activity span (start/end/elapsed)
    }

    # Context
    activity_id: UUID?                 # Optional link to activity being observed
    phase: enum { 1..7 }               # SDLC phase (per concept_seven-phase-sdlc.md)
    capability: enum { Elicit, Analyse, Synthesise, Transform, Validate, Decide, Generate, Preserve }?

    # Actor information
    observer_type: enum { HUMAN, AI, SYSTEM }
    observer_id: string                # Who/what made the observation

    # Content
    subject: string                    # What is being observed
    value: any                         # The observed value (typed by observation_type)
    unit: string?                      # Unit of measurement if applicable

    # Duration-specific fields (when observation_type = DURATION)
    started_at: ISO8601?
    ended_at: ISO8601?
    elapsed_ms: integer?

    # Provenance
    source: string                     # Where the observation came from
    confidence: float?                 # 0.0-1.0 if applicable

    # Metadata
    tags: string[]                     # Freeform classification
    raw_data: json?                    # Original unprocessed data if relevant
}
```

**Design rationale**:
- Flat structure supports efficient time-range queries
- No relationships to other observations (independence preserved)
- Observer information enables audit trails
- Duration type supports activity tracking (start/end/elapsed)
- Capability field connects to framework's eight-capability model

### 2.2 Decision Tree Schema

Decisions are recorded in a tree structure with explicit parent-child relationships.

```
Decision {
    id: UUID                           # Unique identifier
    timestamp: ISO8601                 # When the decision was made

    # Classification
    decision_type: enum {
        STRATEGIC,                     # Project-level direction
        DESIGN,                        # Architectural/technical choice
        OPERATIONAL,                   # Completion/progression judgement
        TACTICAL                       # Implementation choice
    }
    scope: enum {
        PROJECT,
        PHASE,
        ACTIVITY,
        ARTIFACT
    }
    reversibility: enum {
        IRREVERSIBLE,                  # Cannot be undone (e.g., public API release)
        DIFFICULT,                     # High cost to reverse
        MODERATE,                      # Reversible with effort
        EASY                           # Trivially reversible
    }

    # Actor pattern (per concept_collaboration-patterns.md)
    actor_pattern: enum {
        HUMAN_ONLY,
        HUMAN_LED,
        PARTNERSHIP,
        AI_LED,
        AI_ONLY
    }

    # Accountability
    accountable_party: string          # Who is accountable for this decision
    participants: Participant[]        # All actors who contributed

    # Content
    subject: string                    # What the decision is about
    outcome: string                    # The decision made
    rationale: string                  # Why this decision was made
    alternatives_considered: string[]? # Other options that were evaluated

    # Dependencies
    parent_decision_id: UUID?          # The decision this refines/implements
    depends_on: UUID[]                 # Other decisions this depends upon
    supersedes: UUID?                  # Decision this replaces (if any)

    # Informing observations
    informed_by: ObservationRef[]      # References to observations that informed this

    # Policy context
    policy_refs: PolicyRef[]           # Policies this decision was made under
    escalation_trigger: string?        # If escalated, what triggered it

    # Validation
    validated: boolean                 # Has this decision been validated?
    validated_at: ISO8601?
    validated_by: string?

    # Metadata
    tags: string[]
    confidence: float?                 # 0.0-1.0 decision confidence
}

Participant {
    actor_type: enum { HUMAN, AI }
    actor_id: string
    role: string                       # Role in decision (e.g., "proposer", "reviewer", "approver")
    contribution: string?              # Brief description of contribution
}

ObservationRef {
    observation_id: UUID
    relevance: string                  # How this observation informed the decision
}

PolicyRef {
    policy_id: string
    policy_version: string
    constraint_type: enum { REQUIRED, RECOMMENDED, PERMITTED, PROHIBITED }
}
```

**Design rationale**:
- Tree structure (parent_decision_id) captures refinement hierarchy
- depends_on captures non-hierarchical dependencies
- supersedes supports decision versioning/replacement
- Actor pattern classification ties to collaboration patterns
- Policy references enable governance validation
- Separation of accountable_party from participants reflects that accountability cannot be delegated to AI

### 2.3 Relationship Between Logs and Trees

```
┌─────────────────────────────────────────────────────────────────┐
│                      Decision Tree                               │
│  ┌──────────┐                                                    │
│  │ D1       │ Strategic: "Use microservices"                     │
│  └────┬─────┘                                                    │
│       │                                                          │
│  ┌────┴─────┐                                                    │
│  │ D2       │ Design: "Service boundaries = domain contexts"     │
│  └────┬─────┘                                                    │
│       │                                                          │
│  ┌────┴─────┬──────────┐                                         │
│  │ D3       │ D4       │                                         │
│  │ Design   │ Design   │                                         │
│  └──────────┴──────────┘                                         │
│       │                                                          │
│       │ informed_by                                              │
│       ▼                                                          │
└───────┼─────────────────────────────────────────────────────────┘
        │
        ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Observation Log                               │
│  ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐ ┌──────┐          │
│  │ O1   │ │ O2   │ │ O3   │ │ O4   │ │ O5   │ │ O6   │ ...      │
│  │ t=1  │ │ t=2  │ │ t=3  │ │ t=4  │ │ t=5  │ │ t=6  │          │
│  └──────┘ └──────┘ └──────┘ └──────┘ └──────┘ └──────┘          │
│                                                                  │
│  Linear, append-only, chronological                              │
└─────────────────────────────────────────────────────────────────┘
```

Decisions reference observations (via `informed_by`), but observations remain in their linear log — they are not duplicated into the tree. This preserves:
- Observation independence (no entanglement with decision structure)
- Efficient time-series queries on observations
- Clear audit trail for what information was available when decisions were made

---

## 3. Query Patterns

### 3.1 Required Query Capabilities

#### Observation Log Queries

| Query | Purpose | Example |
|-------|---------|---------|
| **Time range** | Find all observations in a period | "All observations from last sprint" |
| **By activity** | Find observations for specific activity | "All test results for PR #123" |
| **By capability** | Find observations from specific capability | "All Validate observations in Phase 6" |
| **By observer** | Find observations by actor | "All observations by CI system" |
| **By type** | Find observations of specific type | "All DURATION observations" |
| **Duration analysis** | Analyse activity timings | "Average build duration this week" |
| **Aggregation** | Compute statistics | "Test pass rate by phase" |

#### Decision Tree Queries

| Query | Purpose | Example |
|-------|---------|---------|
| **Ancestry traversal** | Trace decision chain upward | "What strategic decisions led to this implementation choice?" |
| **Descendant traversal** | Trace decision chain downward | "What decisions depend on this architecture decision?" |
| **Dependency graph** | Find all decisions a decision depends on | "What must hold for this decision to be valid?" |
| **Impact analysis** | Find decisions affected by reverting one | "If we reverse D3, what else must change?" |
| **Policy compliance** | Find decisions made under specific policy | "All decisions governed by security policy v2" |
| **Actor pattern distribution** | Analyse decision-making patterns | "What % of operational decisions are AI-Led?" |
| **Unvalidated decisions** | Find decisions pending validation | "Decisions made but not yet validated" |
| **Supersession history** | Track decision evolution | "What decisions did D5 supersede?" |

### 3.2 Causal Traceability

**Question**: "Why is the system in this state?"

```
Algorithm: TraceCausality(current_state)
1. Identify decisions that produced current_state
2. For each decision:
   a. Retrieve informing observations
   b. Retrieve parent decisions
   c. Retrieve depends_on decisions
3. Recursively trace until reaching root decisions or observations
4. Return: Directed graph of decisions + observations explaining state
```

### 3.3 Impact Analysis (Reversion)

**Question**: "What would change if we reversed decision D?"

```
Algorithm: AnalyseReversionImpact(decision_id)
1. Find all descendants of decision_id (decisions with parent = decision_id)
2. Find all decisions where depends_on includes decision_id
3. For each affected decision:
   a. Assess if decision remains valid without decision_id
   b. Classify impact: INVALIDATED | AFFECTED | UNAFFECTED
4. Return: Set of affected decisions with impact classification
```

---

## 4. Integration with Eight Capabilities

### 4.1 Capability-to-Record Mapping

| Capability | Primary Output Type | Recording Pattern |
|------------|--------------------|--------------------|
| **Elicit** | Information gathered | Observation (what was learned) |
| **Analyse** | Patterns identified | Observation (patterns found) |
| **Synthesise** | Integrated understanding | Observation (synthesis produced) |
| **Transform** | Converted artefacts | Observation (transformation complete) |
| **Validate** | Correctness assessment | Observation (validation result) |
| **Decide** | Commitment made | **Decision** (choice recorded) |
| **Generate** | Artefact produced | Observation (artefact created) |
| **Preserve** | Information stored | *Meta*: This capability operates on both observations and decisions |

**Key insight**: Only the **Decide** capability produces Decision records. All other capabilities produce Observation records. The **Preserve** capability is responsible for recording both.

### 4.2 Preserve Capability Role

The Preserve capability has special significance:
- It is the mechanism through which observations and decisions are recorded
- It determines what information survives for future use
- Poor preservation leads to information loss at transitions

```
Preserve(input) → {
    if input.type == DECISION:
        store in Decision Tree
        link to informing observations
        link to parent/dependent decisions
    else:
        store in Observation Log
        tag with capability, phase, actor
}
```

### 4.3 Decision Points in Capability Flows

Using the example from `concept_capability-model.md` — Requirements elicitation:

```
Elicit (from stakeholders) → [Observations: stakeholder inputs]
    ↓
Analyse (classify and structure) → [Observations: patterns identified]
    ↓
Synthesise (coherent requirements set) → [Observations: synthesis produced]
    ↓
Transform (into formal specifications) → [Observations: specs created]
    ↓
Validate (with stakeholders) → [Observations: validation results]
    ↓
Decide (priorities) → [DECISION: prioritisation choices]
    ↓
Generate (documentation) → [Observations: docs generated]
    ↓
Preserve (for design) → [Both observations and decisions stored]
```

---

## 5. Actor Pattern Classification

### 5.1 Decision-Time Actor Pattern

When a decision is recorded, its actor pattern must be classified:

| Pattern | Characteristics | Recording Requirements |
|---------|-----------------|------------------------|
| **Human-Only** | Human made decision; AI not involved | accountable_party = human; participants = [human] |
| **Human-Led** | Human made decision with AI support | accountable_party = human; participants = [human, AI]; AI contribution noted |
| **Partnership** | Both contributed substantively | accountable_party = human; participants = [human, AI]; contributions balanced |
| **AI-Led** | AI executed with human oversight | accountable_party = human; participants = [AI, human]; escalation_trigger if used |
| **AI-Only** | AI autonomous execution | accountable_party = policy owner; participants = [AI]; policy_refs required |

**Critical constraint**: For AI-Led and AI-Only patterns, a human remains accountable even when AI executes. The `accountable_party` field captures who bears responsibility; `participants` captures who contributed.

### 5.2 Classification Decision Tree

```
Is AI involved at all?
├── No → HUMAN_ONLY
└── Yes → Did AI provide information/analysis only?
    ├── Yes → HUMAN_LED
    └── No → Who drove the decision process?
        ├── Both equally → PARTNERSHIP
        └── One primarily → Who?
            ├── Human → HUMAN_LED
            └── AI → Was human oversight present?
                ├── Yes (review/approval) → AI_LED
                └── No (autonomous per policy) → AI_ONLY
```

### 5.3 Escalation Recording

When AI-Led patterns escalate to human:

```
Decision {
    actor_pattern: AI_LED,
    escalation_trigger: "Confidence below threshold (0.65 < 0.80)",
    participants: [
        { actor_type: AI, role: "initial_assessor", contribution: "Identified options, flagged uncertainty" },
        { actor_type: HUMAN, role: "escalation_handler", contribution: "Made final determination" }
    ]
}
```

---

## 6. Policy Representation

### 6.1 Policy Schema

Policies define the governance context under which decisions are made.

```
Policy {
    id: string                         # Unique identifier (e.g., "security-policy-v2")
    version: string                    # Semantic version
    effective_from: ISO8601
    effective_until: ISO8601?          # null = currently active

    # Scope
    applies_to: PolicyScope {
        phases: enum[]?                # Which SDLC phases
        decision_types: enum[]?        # Which decision types
        actor_patterns: enum[]?        # Which patterns
        artifacts: string[]?           # Which artifact types
    }

    # Constraints
    constraints: PolicyConstraint[]

    # Metadata
    owner: string                      # Who owns this policy
    rationale: string                  # Why this policy exists
    supersedes: string?                # Previous policy version
}

PolicyConstraint {
    type: enum { REQUIRED, RECOMMENDED, PERMITTED, PROHIBITED }
    condition: string                  # When this constraint applies
    requirement: string                # What must/must not happen
    validation_method: string          # How compliance is verified
    escalation_required: boolean       # Must escalate if violated?
}
```

### 6.2 Policy Validation

When a decision is made, policy compliance can be validated:

```
ValidateDecisionAgainstPolicy(decision, policies[]) → {
    applicable_policies = policies.filter(p => p.applies_to.matches(decision))

    for each policy in applicable_policies:
        for each constraint in policy.constraints:
            if constraint.condition.matches(decision):
                compliance = evaluate(decision, constraint.requirement)
                if not compliance and constraint.type == REQUIRED:
                    if constraint.escalation_required:
                        trigger_escalation(decision, constraint)
                    else:
                        flag_non_compliance(decision, constraint)

    return compliance_report
}
```

### 6.3 Example Policies

**Example 1: Security Review Policy**
```yaml
id: security-review-policy-v1
applies_to:
  phases: [5, 6]  # Implementation, Testing
  decision_types: [OPERATIONAL]
  artifacts: ["deployment", "release"]
constraints:
  - type: REQUIRED
    condition: "artifact.sensitivity >= HIGH"
    requirement: "decision.actor_pattern in [HUMAN_ONLY, HUMAN_LED]"
    validation_method: "Check actor_pattern field"
    escalation_required: true
```

**Example 2: AI Autonomy Boundary**
```yaml
id: ai-autonomy-boundary-v1
applies_to:
  actor_patterns: [AI_LED, AI_ONLY]
constraints:
  - type: REQUIRED
    condition: "decision.reversibility in [IRREVERSIBLE, DIFFICULT]"
    requirement: "decision.actor_pattern != AI_ONLY"
    validation_method: "Check reversibility vs actor_pattern"
    escalation_required: true
```

---

## 7. Tooling Implications

### 7.1 Storage Technology Assessment

| Model | Characteristics | Suitable Technologies |
|-------|-----------------|----------------------|
| **Observation Log** | Append-only, time-series, high volume | Time-series DB (InfluxDB, TimescaleDB), Event stores (EventStoreDB), Append-only logs (Kafka topics) |
| **Decision Tree** | Graph structure, complex traversals, versioned | Graph DB (Neo4j, Amazon Neptune), Relational with recursive CTEs (PostgreSQL), Document DB with references (MongoDB) |
| **Combined** | Both patterns needed | Polyglot persistence: Time-series for observations + Graph/Relational for decisions |

### 7.2 Technology Trade-offs

**Option A: Polyglot Persistence**
- Observations → TimescaleDB (time-series optimised)
- Decisions → PostgreSQL with ltree or recursive CTEs
- Pros: Optimised for each access pattern
- Cons: Operational complexity, cross-store queries difficult

**Option B: Unified Relational**
- Both → PostgreSQL with appropriate indexing
- Pros: Simpler operations, transactional consistency, mature tooling
- Cons: Less optimised for pure time-series queries

**Option C: Event Sourcing**
- Both as events → EventStoreDB or Kafka + materialised views
- Pros: Complete audit trail, temporal queries natural
- Cons: Query complexity, eventual consistency challenges

**Recommendation**: Start with Option B (PostgreSQL) for simplicity. PostgreSQL handles both patterns adequately:
- Observations: B-tree index on timestamp, partition by time if volume warrants
- Decisions: Recursive CTEs for tree traversal, JSONB for flexible attributes

### 7.3 Integration Points

```
┌──────────────────────────────────────────────────────────────────┐
│                        AI Assistant                               │
│  (Claude Code, Copilot, etc.)                                    │
└─────────────────────────────┬────────────────────────────────────┘
                              │ Capability execution
                              ▼
┌──────────────────────────────────────────────────────────────────┐
│                    Recording Layer                                │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐               │
│  │ Observation │  │  Decision   │  │   Policy    │               │
│  │  Recorder   │  │  Recorder   │  │  Validator  │               │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘               │
└─────────┼────────────────┼────────────────┼──────────────────────┘
          │                │                │
          ▼                ▼                ▼
┌──────────────────────────────────────────────────────────────────┐
│                     Storage Layer                                 │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐   │
│  │ Observation Log │  │  Decision Tree  │  │ Policy Registry │   │
│  │   (time-series) │  │    (graph)      │  │   (versioned)   │   │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘   │
└──────────────────────────────────────────────────────────────────┘
```

---

## 8. Framework and Standards Alignment

### 8.1 ISO/IEC/IEEE 12207:2017 Alignment

The decision/observation model aligns with several 12207 processes:

| 12207 Process | Alignment |
|---------------|-----------|
| **Decision Management (6.3.3)** | Direct alignment — decisions recorded per this schema |
| **Configuration Management (6.3.5)** | Decision tree provides configuration history |
| **Information Management (6.3.6)** | Observation log supports information management |
| **Measurement (6.3.7)** | Observations capture measurement data |
| **Quality Assurance (6.3.8)** | Decision validation supports QA |

### 8.2 Extensions Beyond Standard

This model extends beyond ISO 12207 in several ways:

1. **Actor pattern classification** — 12207 does not address human-AI collaboration patterns
2. **Escalation tracking** — Framework-specific mechanism for AI-Led patterns
3. **Policy-decision binding** — Explicit linking of decisions to governance policies
4. **Observation-decision separation** — 12207 does not distinguish these explicitly

### 8.3 ISO/IEC 5338:2023 (AI Systems) Considerations

For AI systems, additional observation and decision types may be needed:

- **Model training decisions** — Hyperparameter choices, architecture selection
- **Data quality observations** — Drift detection, bias measurements
- **Continuous validation observations** — Production model performance
- **Retraining decisions** — When and how to retrain

---

## 9. Open Questions

### 9.1 Resolved

- ✓ How to connect observations to decisions? → Via `informed_by` references
- ✓ How to represent decision hierarchy? → Via `parent_decision_id` and `depends_on`
- ✓ Where does accountability reside for AI decisions? → Always with a human; AI-Only means policy owner is accountable

### 9.2 Requiring Further Investigation

1. **Granularity thresholds** — At what level should observations be recorded? Every test? Every commit? Risk of information overload.

2. **Decision compaction** — Should old tactical decisions be archived/compacted? How to maintain traceability while managing volume?

3. **Cross-project decisions** — How to handle decisions that affect multiple projects? Shared decision tree or federated?

4. **Retroactive decisions** — How to handle discovering that a decision was implicitly made but not recorded?

5. **Decision confidence decay** — Should decision confidence decrease over time as context changes?

6. **Observation sampling** — For high-volume observations, when is sampling acceptable vs. full capture?

---

## 10. Next Steps

1. **Prototype schema** — Implement in PostgreSQL; test query patterns
2. **Integration hooks** — Design hooks for common development tools (git, CI/CD)
3. **UI mockups** — Design interfaces for decision tree visualisation and impact analysis
4. **Policy DSL** — Consider domain-specific language for policy specification
5. **Migration path** — How to adopt incrementally in existing projects

---

*Document created: 10 January 2026*
*Purpose: Investigation toward executable framework manifestation*
*Status: Active investigation — schemas proposed, pending prototype validation*
