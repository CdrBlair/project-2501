# Key Reference Concept: Decision and Observation Tracking

## Definition

Software development produces two fundamentally different types of records: **observations** (factual states, measurements, events) and **decisions** (judgements, commitments, choices). The Decision and Observation Tracking system provides a principled approach to recording both throughout the SDLC, supporting traceability, accountability, and impact analysis.

The critical distinction: **observations are independent events**; **decisions create dependency structures**. This distinction determines storage model, query patterns, and integration with human-AI collaboration.

## Core Distinctions

### Observations vs Decisions

| Aspect | Observations | Decisions |
|--------|--------------|-----------|
| **Nature** | Factual states, measurements, outcomes | Judgements, choices, commitments |
| **Temporal character** | Events that happened in sequence | Commitments that constrain future decisions |
| **Storage model** | Linear log (append-only, chronological) | Tree structure (hierarchical, with dependencies) |
| **Relationship** | Independent (each stands alone) | Dependent (references prior decisions and informing observations) |
| **Examples** | Build passed/failed; test coverage 78%; response time 42ms | "Ready to merge"; "Quality sufficient for release"; "Use microservices pattern" |

**Key insight**: Only the **Decide** capability (from the [Eight-Capability Taxonomy](./concept_capability-model.md)) produces Decision records. All other capabilities produce Observation records. The **Preserve** capability operates on both—it is the mechanism through which observations and decisions are recorded.

### Decision Scope

Decisions span multiple granularities, each with characteristic collaboration patterns:

| Scope | Description | Examples | Typical Pattern |
|-------|-------------|----------|-----------------|
| **Strategic** | Project-level choices affecting overall direction | "Use microservices architecture"; "Target Python 3.11+" | Human-Only, Human-Led |
| **Design** | Architectural and technical choices | "Authentication will use JWT"; "API follows RESTful conventions" | Human-Led, Partnership |
| **Operational** | Completion and progression judgements | "PR ready to merge"; "Test coverage sufficient" | Partnership, AI-Led |
| **Tactical** | Implementation choices | "Use hash map for lookup"; "Extract to helper function" | AI-Led with review |

The same structural elements apply regardless of scope, with appropriate weight given the decision's impact and reversibility.

---

## Observation Log Schema

Observations are recorded as append-only entries in a linear log. The flat structure supports efficient time-range queries while preserving observation independence.

### Schema Definition

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
    phase: enum { 1..7 }               # SDLC phase
    capability: enum?                  # Which capability produced this observation

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

### Design Rationale

- **Flat structure**: Supports efficient time-range queries
- **No relationships**: Observations maintain independence from each other
- **Observer information**: Enables audit trails and provenance tracking
- **Duration type**: Supports activity tracking with explicit start/end/elapsed
- **Capability field**: Connects to framework's eight-capability model

---

## Decision Tree Schema

Decisions are recorded in a tree structure with explicit parent-child relationships and dependency tracking. This structure enables impact analysis and reversion reasoning.

### Schema Definition

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

    # Actor pattern (per Concept 7)
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
    alternatives_considered: string[]? # Other options evaluated

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
    role: string                       # Role in decision (proposer, reviewer, approver)
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

### Design Rationale

- **Tree structure** (`parent_decision_id`): Captures refinement hierarchy
- **Dependency tracking** (`depends_on`): Captures non-hierarchical dependencies
- **Supersession** (`supersedes`): Supports decision versioning/replacement
- **Actor pattern classification**: Ties to collaboration patterns
- **Policy references**: Enables governance validation
- **Accountability separation**: `accountable_party` distinct from `participants`—accountability cannot be delegated to AI

---

## Relationship Between Observations and Decisions

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

Decisions reference observations via `informed_by`, but observations remain in their linear log—they are not duplicated into the tree. This preserves:
- **Observation independence**: No entanglement with decision structure
- **Efficient time-series queries**: On observations
- **Clear audit trail**: What information was available when decisions were made

---

## Query Patterns

### Observation Queries

| Query | Purpose | Example |
|-------|---------|---------|
| **Time range** | Find observations in a period | "All observations from last sprint" |
| **By activity** | Find observations for specific activity | "All test results for PR #123" |
| **By capability** | Find observations from specific capability | "All Validate observations in Phase 6" |
| **By observer** | Find observations by actor | "All observations by CI system" |
| **Duration analysis** | Analyse activity timings | "Average build duration this week" |
| **Aggregation** | Compute statistics | "Test pass rate by phase" |

### Decision Queries

| Query | Purpose | Example |
|-------|---------|---------|
| **Ancestry traversal** | Trace decision chain upward | "What strategic decisions led to this?" |
| **Descendant traversal** | Trace decision chain downward | "What depends on this architecture decision?" |
| **Dependency graph** | Find all decisions a decision depends on | "What must hold for this to be valid?" |
| **Impact analysis** | Find decisions affected by reverting one | "If we reverse D3, what else must change?" |
| **Policy compliance** | Find decisions under specific policy | "Decisions governed by security policy v2" |
| **Actor pattern distribution** | Analyse decision-making patterns | "What % of operational decisions are AI-Led?" |
| **Unvalidated decisions** | Find decisions pending validation | "Decisions made but not yet validated" |

### Causal Traceability

**Question**: "Why is the system in this state?"

```
Algorithm: TraceCausality(current_state)
1. Identify decisions that produced current_state
2. For each decision:
   a. Retrieve informing observations
   b. Retrieve parent decisions
   c. Retrieve depends_on decisions
3. Recursively trace until reaching root decisions or observations
4. Return: Directed graph explaining state
```

### Impact Analysis (Reversion)

**Question**: "What would change if we reversed decision D?"

```
Algorithm: AnalyseReversionImpact(decision_id)
1. Find all descendants (decisions with parent = decision_id)
2. Find all decisions where depends_on includes decision_id
3. For each affected decision:
   a. Assess if decision remains valid without decision_id
   b. Classify impact: INVALIDATED | AFFECTED | UNAFFECTED
4. Return: Set of affected decisions with impact classification
```

---

## Actor Pattern Classification

### Classification at Decision Time

When a decision is recorded, its actor pattern must be classified:

| Pattern | Characteristics | Recording Requirements |
|---------|-----------------|------------------------|
| **Human-Only** | Human made decision; AI not involved | accountable_party = human; participants = [human] |
| **Human-Led** | Human made decision with AI support | accountable_party = human; participants = [human, AI]; AI contribution noted |
| **Partnership** | Both contributed substantively | accountable_party = human; participants = [human, AI]; contributions balanced |
| **AI-Led** | AI executed with human oversight | accountable_party = human; participants = [AI, human]; escalation_trigger if used |
| **AI-Only** | AI autonomous execution | accountable_party = policy owner; participants = [AI]; policy_refs required |

**Critical constraint**: For AI-Led and AI-Only patterns, a human remains accountable even when AI executes. The `accountable_party` field captures who bears responsibility; `participants` captures who contributed.

### Classification Decision Process

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

### Escalation Recording

When AI-Led patterns escalate to human:

```
Decision {
    actor_pattern: AI_LED,
    escalation_trigger: "Confidence below threshold (0.65 < 0.80)",
    participants: [
        { actor_type: AI, role: "initial_assessor",
          contribution: "Identified options, flagged uncertainty" },
        { actor_type: HUMAN, role: "escalation_handler",
          contribution: "Made final determination" }
    ]
}
```

---

## Policy Framework

Policies define the governance context under which decisions are made.

### Policy Schema

```
Policy {
    id: string                         # Unique identifier
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

### Example Policies

**Security Review Policy**:
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

**AI Autonomy Boundary**:
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

## Integration with Eight Capabilities

### Capability-to-Record Mapping

| Capability | Primary Output Type | Recording Pattern |
|------------|--------------------|--------------------|
| **Elicit** | Information gathered | Observation (what was learned) |
| **Analyse** | Patterns identified | Observation (patterns found) |
| **Synthesise** | Integrated understanding | Observation (synthesis produced) |
| **Transform** | Converted artefacts | Observation (transformation complete) |
| **Validate** | Correctness assessment | Observation (validation result) |
| **Decide** | Commitment made | **Decision** (choice recorded) |
| **Generate** | Artefact produced | Observation (artefact created) |
| **Preserve** | Information stored | *Meta*: operates on both observations and decisions |

### Decision Points in Capability Flows

Using requirements elicitation as example:

```
Elicit (from stakeholders) → [Observations: stakeholder inputs]
    ↓
Analyse (classify and structure) → [Observations: patterns identified]
    ↓
Synthesise (coherent requirements) → [Observations: synthesis produced]
    ↓
Transform (into formal specs) → [Observations: specs created]
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

## Connection to Provenance Tracking

The Decision and Observation Tracking system integrates with the [Provenance Tracking](./foundation_transactive-memory.md#provenance-tracking-granularity) framework:

| Provenance Field | Mapping |
|-----------------|---------|
| **Invocation ID** | Maps to observation.id or decision.id |
| **Actor** | Maps to observer_id / accountable_party |
| **Capability** | Maps to observation.capability / "Decide" for decisions |
| **Context State** | Captured in observation context fields / decision informed_by |
| **Collaboration Pattern** | Captured in decision.actor_pattern |

The Capability Invocation Level granularity recommended for provenance aligns with this system—each observation or decision represents a capability invocation that can be traced.

---

## Key Implications

**For accountability**: The decision tree provides the audit trail needed for meaningful human accountability. When outcomes are questioned, the tree reveals who decided what, based on what information, under what policies.

**For AI-led patterns**: AI-Led decisions require explicit escalation triggers and policy references. The system enforces that accountability remains human even when AI executes.

**For impact analysis**: Before reversing a decision, the dependency structure reveals what else must change. This prevents the common failure mode of reversing one decision without considering downstream effects.

**For process improvement**: Actor pattern distribution across decisions reveals whether collaboration patterns are being applied appropriately. If strategic decisions are AI-Led when they should be Human-Led, the metrics surface this.

**For knowledge preservation**: The `informed_by` relationship captures why decisions were made, not just what was decided. This preserves rationale that would otherwise be lost.

---

## Integration with Other Concepts

- [**Eight-Capability Taxonomy**](./concept_capability-model.md): Only Decide produces decisions; Preserve operates on both record types; other capabilities produce observations
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): Decisions are classified by actor pattern; policies can constrain which patterns are permitted
- [**Actor Model**](./concept_actor-model.md): Participant and accountability tracking uses actor references; AI actor differentiation enables more precise attribution
- [**Process and Capability Flow**](./concept_process-capability-flow.md): Process execution generates observations and decisions according to this schema
- [**Provenance Tracking**](./foundation_transactive-memory.md#provenance-tracking-granularity): Capability invocation level provenance aligns with observation/decision granularity
- [**Agent Context Model (3S2P)**](./concept_agent-context-model.md): Decision context captures the 3S2P state at decision time
- [**Information Composition Taxonomy**](./concept_information-taxonomy.md): Rationale capture preserves tacit knowledge that informed decisions

---

## Standards Alignment

### ISO/IEC/IEEE 12207:2017 Alignment

| 12207 Process | Alignment |
|---------------|-----------|
| **Decision Management (6.3.3)** | Direct alignment—decisions recorded per this schema |
| **Configuration Management (6.3.5)** | Decision tree provides configuration history |
| **Information Management (6.3.6)** | Observation log supports information management |
| **Measurement (6.3.7)** | Observations capture measurement data |
| **Quality Assurance (6.3.8)** | Decision validation supports QA |

### Extensions Beyond Standard

1. **Actor pattern classification**: 12207 does not address human-AI collaboration patterns
2. **Escalation tracking**: Framework-specific mechanism for AI-Led patterns
3. **Policy-decision binding**: Explicit linking of decisions to governance policies
4. **Observation-decision separation**: 12207 does not distinguish these explicitly

---

## Implementation Considerations

### Storage Technology Assessment

| Model | Characteristics | Suitable Technologies |
|-------|-----------------|----------------------|
| **Observation Log** | Append-only, time-series, high volume | Time-series DB, Event stores, Append-only logs |
| **Decision Tree** | Graph structure, complex traversals | Graph DB, Relational with recursive CTEs |
| **Combined** | Both patterns needed | Polyglot persistence or PostgreSQL |

**Recommendation**: PostgreSQL handles both patterns adequately for most uses:
- Observations: B-tree index on timestamp, partition by time if volume warrants
- Decisions: Recursive CTEs for tree traversal, JSONB for flexible attributes

### Open Questions

- **Granularity thresholds**: At what level should observations be recorded? Risk of information overload
- **Decision compaction**: Should old tactical decisions be archived? How to maintain traceability?
- **Cross-project decisions**: How to handle decisions affecting multiple projects?
- **Retroactive decisions**: How to handle discovering implicit decisions that weren't recorded?

---

## Validation Status

- ✓ **Core distinction**: Observation/decision distinction is conceptually clear and practitioner-recognised
- ✓ **Schema completeness**: Covers identified recording needs
- ✓ **Actor pattern integration**: Consistent with collaboration patterns framework
- ⚠ **Query pattern completeness**: Common queries identified; edge cases may emerge
- ⚠ **Policy schema**: Conceptual; DSL design may be needed for complex policies
- ⚠ **Implementation validation**: Schema design not yet validated through prototype
- ⚠ **Scale behaviour**: Performance at high observation volumes untested

---

*The Decision and Observation Tracking system provides the infrastructure for recording what happened (observations) and what was committed (decisions) throughout software development. By maintaining the fundamental distinction between independent events and dependent commitments, the system enables the traceability, accountability, and impact analysis that effective human-AI collaboration requires.*
