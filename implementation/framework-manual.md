# AI-Augmented SDLC Framework: AI Manual

**Version**: 1.0
**Purpose**: Compact reference for AI agents implementing and using the framework.
**Audience**: AI systems (Claude Code agents, custom agents, orchestrators)

---

## Quick Reference

### Seven Phases

| Phase | Focus | Information Composition |
|-------|-------|------------------------|
| **1. Initiation** | Why: business case, stakeholder alignment | 5% formal, 75% tacit, 20% emergent |
| **2. Planning** | How: resource allocation, governance | 35% formal, 55% tacit, 10% emergent |
| **3. Requirements** | What: stakeholder needs to specs | 40% formal, 50% tacit, 10% emergent |
| **4. Design** | Structure: architecture decisions | 50% formal, 40% tacit, 10% emergent |
| **5. Implementation** | Build: code and components | 55% formal, 35% tacit, 10% emergent |
| **6. Testing** | Correctness: verification | 60% formal, 30% tacit, 10% emergent |
| **7. Operations** | Value: deploy, operate, maintain | 60% formal, 30% tacit, 10% emergent |

### Eight Capabilities

| Capability | Description |
|------------|-------------|
| **Elicit** | Extract information from sources |
| **Analyse** | Decompose, classify, identify patterns |
| **Synthesise** | Combine into coherent understanding |
| **Transform** | Convert between representations |
| **Validate** | Confirm correctness and fitness |
| **Decide** | Select among alternatives |
| **Generate** | Produce artifacts |
| **Preserve** | Capture for future retrieval |

### Five Collaboration Patterns

| Pattern | Human Role | AI Role | When to Use |
|---------|------------|---------|-------------|
| **Human-Only** | All activities | None | AI cannot contribute |
| **Human-Led** | Drives, decides | Supports, prepares | Human could complete alone; AI accelerates |
| **Partnership** | Unique judgement | Unique capability | Neither could complete alone |
| **AI-Led** | Reviews, validates | Drives execution | AI could complete; human ensures correctness |
| **AI-Only** | None | All activities | Human review adds no value |

---

## Core Constraints

### Pattern-Role Consistency (C1-C4)

These constraints are **mandatory**. Specifications violating them are invalid.

| ID | Rule |
|----|------|
| **C1** | Human-Only → AI Role = "None" |
| **C2** | AI-Only → Human Role = "None" |
| **C3** | AI Role ≠ "None" → Pattern ≠ Human-Only |
| **C4** | Human Role ≠ "None" → Pattern ≠ AI-Only |

### Pattern Selection Decision Tree

```
Does AI perform ANY activity?
├─ No → Human-Only
└─ Yes → Does Human perform ANY activity?
          ├─ No → AI-Only
          └─ Yes → Who drives?
                   ├─ Human drives → Human-Led
                   ├─ Both essential → Partnership
                   └─ AI drives → AI-Led
```

---

## Escalation Actions

Four action types for escalation triggers:

| Action | Target | Use When |
|--------|--------|----------|
| **ESCALATE** | Role (human, governance) | Decision exceeds AI competence; immediate attention expected |
| **RETURN** | Step ID | Validation failed; correction needed; loop back |
| **BLOCK** | None | Critical failure; halt process; manual intervention required |
| **DEFER** | Work queue | Requires extended offline review; async completion |

### DEFER Semantics

When DEFER triggers:
1. Process state serialised
2. Work item type `DEFERRED_CONTINUATION` created
3. Process enters `SUSPENDED` state
4. Resume trigger defines when to continue

**Resume trigger types**: `HUMAN_APPROVAL`, `EXTERNAL_EVENT`, `TIMEOUT`, `MANUAL`

### RETURN Semantics

When RETURN triggers:
1. Flow returns to specified step
2. Context passed to target step
3. Fix step executes if defined
4. Iteration counter increments
5. If max iterations exceeded → BLOCK

---

## Process Specification Schema

### Process Definition

```yaml
Process Definition:
  Identity:
    Process ID: PROC-[Phase].[Sequence]
    Name: <descriptive name>
  Context:
    Phase: <phase number and name>
    Purpose: <what process accomplishes>
    Information composition: <formal/tacit/emergent %>
  Interfaces:
    Input documents: [document type IDs]
    Output documents: [document type IDs]
  Capability flow:
    Steps: [step IDs in order]
  Control Flow:
    Retry policy:
      On validation failure:
        Return to: <step ID>
        Max iterations: <count, default 3>
  Quality:
    Entry criteria: [conditions]
    Exit criteria: [conditions]
```

### Capability Instance Specification

```yaml
Step <ID>: <Name>
  Capability: <one of eight>
  Pattern: <one of five>
  Human role: <specific activities or "None">
  AI role: <specific activities or "None">
  Escalation triggers:
    - <condition>:
        Action: <ESCALATE|RETURN|BLOCK|DEFER>
        Target: <role or step ID>
        Context: <information to pass>
  Completion criteria: <testable condition>
  Validation: <what to verify>
```

### Fix Step Template

Fix steps use suffix `a` appended to triggering step:

```yaml
Step <Parent>a: Fix <Issue>
  Capability: Transform (typically)
  Trigger: RETURN from Step <X>
  Pattern: AI-Led or Partnership
  Human role: Review proposed corrections
  AI role: Analyse failure; propose corrections; apply fixes
```

---

## ID Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Process | `PROC-[Phase].[Sequence]` | PROC-3.1 |
| Step | `[Process].[StepSequence]` | 3.1.4 |
| Fix Step | `[Step]a` | 3.1.8a |
| Decision | `DEC-YYYYMMDD-HHMMSS` | DEC-20260113-143215 |
| Observation | `OBS-YYYYMMDD-HHMMSS` | OBS-20260113-143000 |

---

## Work Coordination

### Work Item Types

| Type | Description |
|------|-------------|
| `CAPABILITY_INSTANCE` | Single capability execution |
| `PROCESS_STEP` | Step within a process |
| `ESCALATION` | Escalated from AI to human |
| `REVIEW` | Review of prior work |
| `DECISION_REQUEST` | Request for decision |
| `INFORMATION_REQUEST` | Request for clarification |
| `DEFERRED_CONTINUATION` | Suspended process awaiting async completion |

### Work Status States

```
CREATED → QUEUED → ASSIGNED → IN_PROGRESS
                                  ↓
                    ┌─────────────┼─────────────┐
                    ↓             ↓             ↓
                BLOCKED       PAUSED      SUSPENDED
                    ↓             ↓             ↓
                    └─────────────┼─────────────┘
                                  ↓
                              COMPLETED
                                  ↓
                    ┌─────────────┼─────────────┐
                    ↓             ↓             ↓
                ACCEPTED     REJECTED     CANCELLED
```

**State distinctions**:
- **PAUSED**: Temporary interruption; actor manually resumes
- **BLOCKED**: Dependency or failure; blocker must resolve
- **SUSPENDED**: Awaiting async completion; resume trigger fires

---

## Decision and Observation Tracking

### When to Record

| Capability Output | Record Type |
|-------------------|-------------|
| Elicit, Analyse, Synthesise, Transform, Validate, Generate | **Observation** |
| **Decide** | **Decision** |
| Preserve | Operates on both |

### Decision Record (Required Fields)

```yaml
Decision:
  id: UUID
  decision_type: STRATEGIC|DESIGN|OPERATIONAL|TACTICAL
  actor_pattern: <collaboration pattern>
  accountable_party: <human always>
  subject: <what decision is about>
  outcome: <what was decided>
  rationale: <why this choice>
  informed_by: [observation references]
```

### Observation Record (Required Fields)

```yaml
Observation:
  id: UUID
  observation_type: MEASUREMENT|STATE|EVENT|DURATION
  observer: human:<id> | ai:claude
  subject: <what was observed>
  value: <observed data>
```

---

## Executable Framework Components

### Skills

| Skill | Purpose | Triggers |
|-------|---------|----------|
| `dialogue-log-decision` | Record decisions with rationale | "log decision", "record decision" |
| `dialogue-log-observation` | Record observations | "log observation", "note finding" |
| `dialogue-structured-elicit` | Gather context through questions | "gather requirements", "elicit context" |
| `dialogue-verify-logging-compliance` | Validate logging occurred | "verify logging", "check compliance" |
| `build-only-validate-capability-flow` | Validate spec against constraints | "validate capability flow" |

### Skill Usage

**Log a decision**:
```bash
.claude/skills/dialogue-log-decision/scripts/log-decision.sh \
  <OPERATIONAL|TACTICAL> \
  "<ai:claude|human:id>" \
  "<subject>" \
  "<outcome>" \
  "<rationale>" \
  "[context]" \
  "[tags]"
```

**Log an observation**:
```bash
.claude/skills/dialogue-log-observation/scripts/log-observation.sh \
  <MEASUREMENT|STATE|EVENT> \
  "<ai:claude|human:id>" \
  "<subject>" \
  "<value>" \
  "[context]" \
  "[tags]"
```

**Verify logging compliance**:
```bash
.claude/skills/dialogue-verify-logging-compliance/scripts/verify-logging.sh \
  "<process-identifier>" \
  <min-decisions> \
  <min-observations>
```

### Decision Granularity Rule

**One decision per distinct choice**. Do not batch multiple decisions into a single entry.

Correct:
```bash
# Separate entries
log-decision.sh OPERATIONAL "ai:claude" "PA-1 pattern" "Partnership" "Both essential"
log-decision.sh OPERATIONAL "ai:claude" "PA-2 pattern" "AI-Only" "Document review is mechanical"
```

Incorrect:
```bash
# Batched (DON'T DO THIS)
log-decision.sh OPERATIONAL "ai:claude" "PA-1 through PA-5" "Various patterns" "Various rationales"
```

---

## Process Architect Workflow

The Process Architect agent follows this workflow for designing capability flows:

### 1. Understand Context (Mandatory Elicitation)

Before decomposition, gather all mandatory areas:

| Area | Required |
|------|----------|
| Phase | Yes |
| Purpose | Yes |
| Inputs | Yes |
| Outputs | Yes |
| Actors | Contextual |
| Constraints | Contextual |

**Do not proceed to decomposition until all mandatory areas have answers.**

### 2. Decompose into Capability Instances

Each step uses exactly ONE capability.

### 3. Assign Actor Patterns

Use the decision tree. Log each pattern selection as a decision.

### 4. Define Escalation

For each step with AI participation:
- What triggers escalation?
- What context accompanies it?
- What action type (ESCALATE/RETURN/BLOCK/DEFER)?

### 5. Establish Validation

For each step:
- Completion criteria (testable)
- What must be verified before proceeding

### 6. Define Control Flow

For the process:
- Retry policy (return-to step, max iterations)
- Fix steps (if needed)

### 7. Validate Schema

Before presenting for approval:
1. Check all C1-C4 constraints
2. Verify each step uses exactly one capability
3. Confirm escalation triggers defined for AI-participating steps

### 8. Verify Logging Compliance

Before approval gate:
```bash
verify-logging.sh "<process-context>" <expected-decisions> <expected-observations>
```

### 9. Present for Approval

Ask where to save specification (if approved).

---

## Actor Suitability Quick Reference

### By Knowledge Type

| Knowledge Type | Actor Suitability |
|----------------|-------------------|
| Formal | AI can process directly |
| Tacit | Human required; AI through dialogue |
| Emergent | Arises through interaction |

### By Source Type

| Source | Typically |
|--------|-----------|
| Systems/APIs | AI-suited |
| Documents | AI-suited |
| Stakeholders (tacit) | Human-required |

### Capability Pattern Heuristics

| Capability | Typical Range | Key Determinant |
|------------|---------------|-----------------|
| Elicit | Human-Led to AI-Led | Source type |
| Analyse | Partnership to AI-Led | Tacit interpretation needed? |
| Synthesise | Human-Led to Partnership | Theory-building required? |
| Transform | Partnership to AI-Led | Semantic preservation needed? |
| Validate | Human-Led to AI-Only | Formal vs. purpose judgement |
| Decide | Human-Led to AI-Led | Value trade-offs vs. rule application |
| Generate | Partnership to AI-Led | Novel creation vs. template |
| Preserve | Partnership to AI-Led | Rationale capture vs. archival |

---

## Information Types

### Three Types

| Type | Definition | AI Relationship |
|------|------------|-----------------|
| **Formal** | Explicit, machine-processable | Direct access |
| **Tacit** | Experiential, resists articulation | Mediated through dialogue |
| **Emergent** | Arises from interaction | Participatory |

### Tacit Subtypes

| Subtype | Capture Method | Capture Fidelity |
|---------|---------------|-----------------|
| **Documentable** | Standard documentation | ~90% |
| **Elicitable** | Structured dialogue | ~50-70% |
| **Embedded** | Apprenticeship only | ~10-20% |

---

## Validation Checklist

Before finalising any capability flow specification:

```
□ Each step uses exactly one capability
□ Each pattern is one of the five valid patterns
□ C1: Human-Only steps have AI Role = "None"
□ C2: AI-Only steps have Human Role = "None"
□ C3: Steps with AI activity are not Human-Only
□ C4: Steps with Human activity are not AI-Only
□ Escalation triggers defined for all AI-participating steps
□ Completion criteria are testable
□ Control flow (retry policy) defined
□ All mandatory context elicited (Phase, Purpose, Inputs, Outputs)
□ Decisions logged (one per distinct choice)
□ Logging compliance verified
```

---

## Key Principles

1. **Capability instance granularity**: Actor patterns are assigned at the instance level, not capability category level

2. **Human accountability always**: Even in AI-Only patterns, a human is accountable for the automation design

3. **Escalation by design**: Escalation is a planned component, not an exception handler

4. **Theory preservation**: Activities central to theory-building warrant human engagement even when AI could technically perform them

5. **Context packaging**: Async handoffs must carry sufficient context for actors to proceed

6. **One capability per step**: If a step seems to require multiple capabilities, decompose it

7. **Testable criteria**: All completion criteria must be verifiable

---

## Log Locations

```
.dialogue/
├── logs/
│   ├── decisions.yaml   # Decision records
│   └── observations.yaml # Observation records
└── README.md
```

---

*AI-Augmented SDLC Framework v1.0*
