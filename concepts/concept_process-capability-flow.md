# Key Reference Concept 16: Process and Capability Flow Specification Framework

## Definition

The Process and Capability Flow Specification Framework provides a structured schema for defining SDLC processes at capability-instance granularity. By establishing consistent templates for process definitions and capability instance specifications, the framework enables precise human-AI collaboration with explicit handoff points, escalation triggers, and quality gates.

This framework defines *how* to specify processes. Specific process specifications are created by applying this framework to particular SDLC phases.

## Framework Levels

Process specifications operate at two levels of granularity:

### Level 1: Process Definition

A **process** is a named sequence of work that transforms inputs into outputs within a single SDLC phase. Processes are the primary unit of work planning and progress tracking.

### Level 2: Capability Instance

A **capability instance** is a single application of one of the eight capabilities (from Concept 3) within a process. Capability instances are the unit of human-AI collaboration—each instance has a defined actor pattern, inputs, outputs, and escalation triggers.

The relationship:
```
Phase
└── Process (multiple per phase)
    └── Capability Instance (multiple per process)
```

---

## Process Definition Schema

Each process is defined using this schema:

```
Process Definition:
├── Identity
│   ├── Process ID: PROC-[Phase].[Sequence]
│   └── Name: [Descriptive process name]
│
├── Context
│   ├── Phase: [Phase number and name]
│   ├── Purpose: [What the process accomplishes]
│   └── Information composition: [Approximate formal/tacit/emergent split]
│
├── Interfaces
│   ├── Input documents: [Document type IDs from registry]
│   ├── Output documents: [Document type IDs produced]
│   ├── Other inputs: [Non-document information sources]
│   └── Other outputs: [Non-document information produced]
│
├── Capability flow
│   └── Steps: [Ordered list of capability instance IDs]
│
├── Quality
│   ├── Entry criteria: [What must be true to begin]
│   ├── Exit criteria: [What must be true to complete]
│   └── Quality gates: [Intermediate checkpoints]
│
├── Control Flow
│   └── Retry policy:
│       ├── On validation failure:
│       │   ├── Return to: [Step ID to retry from]
│       │   └── Max iterations: [Maximum retry count, default 3]
│       └── On escalation timeout:
│           └── Action: [BLOCK | ESCALATE_HIGHER | PROCEED_WITH_RISK]
│
└── Standards Alignment
    └── ISO 12207 reference: [Related process from standard]
```

### Process ID Convention

Process IDs follow the pattern: `PROC-[Phase].[Sequence]`
- Phase: Single digit (1-7) corresponding to SDLC phase
- Sequence: Single digit for ordering within phase (1-9); use two digits if >9 processes in a phase
- Example: `PROC-3.1` (first process in Phase 3)

---

## Capability Instance Specification Schema

Each capability instance within a process is specified using this schema:

```
Capability Instance Specification:
├── Identity
│   ├── Step ID: [Process].[Step sequence]
│   ├── Name: [Descriptive step name]
│   └── Capability: [One of the eight: Elicit, Analyse, Synthesise, 
│                    Transform, Validate, Decide, Generate, Preserve]
│
├── Information Flow
│   ├── Input
│   │   ├── Documents: [Document type IDs with specific content requirements]
│   │   └── Other: [Non-document information sources]
│   │
│   └── Output
│       ├── Documents: [Document type IDs produced or updated]
│       └── Other: [Non-document information produced]
│
├── Actor Specification
│   ├── Pattern: [Human-Only | Human-Led | Partnership | AI-Led | AI-Only]
│   │
│   ├── Human role:
│   │   └── [Specific human contributions for this instance]
│   │
│   └── AI role:
│       └── [Specific AI contributions for this instance]
│
├── Control Flow
│   ├── Escalation triggers:
│   │   └── [Condition]:
│   │       ├── Action: [ESCALATE | RETURN | BLOCK]
│   │       ├── Target: [Role if ESCALATE; Step ID if RETURN]
│   │       └── Context: [Information to carry forward]
│   │
│   ├── Completion criteria:
│   │   └── [How to determine this step is complete]
│   │
│   └── Validation:
│       └── [What must be verified before proceeding to next step]
│
└── Notes
    └── [Additional guidance, edge cases, or clarifications]
```

### Step ID Convention

Step IDs follow the pattern: `[ProcessID].[StepSequence]`
- ProcessID: The containing process ID without PROC- prefix (e.g., `3.1`)
- StepSequence: Single digit for step ordering within process (1-9)
- Example: `3.1.4` (fourth step in process PROC-3.1)

---

## Actor Pattern Guidance

Actor pattern selection for capability instances follows guidance from Concept 7 (Collaboration Patterns). The pattern depends on:

1. **Knowledge type** being operated upon (formal → AI-suited; tacit → human-suited)
2. **Source/target** of information (systems → AI; people → human)
3. **Consequence severity** of errors (high stakes → more human involvement)
4. **Formalisation completeness** (complete criteria → AI can apply; incomplete → human judgement)

### Pattern Definitions

| Pattern | Human Role | AI Role | When to Use |
|---------|------------|---------|-------------|
| **Human-Only** | All activities | **None whatsoever** | AI literally cannot contribute—e.g., confidential negotiation, legally privileged discussion |
| **Human-Led** | Drives decisions, performs core work | Supports: prepares, drafts, tracks, formats | Human could complete alone (slower); AI accelerates but doesn't decide |
| **Partnership** | Contributes unique judgement | Contributes unique capability | Neither could complete alone; both essential to quality outcome |
| **AI-Led** | Reviews, validates, handles exceptions | Drives execution, performs core work | AI could complete alone (lower quality); human ensures correctness |
| **AI-Only** | **None whatsoever** | All activities | Human review adds no value—e.g., deterministic formatting, automated archival |

### Schema Constraints

The Actor Pattern and Role specifications must be internally consistent:

| Constraint | Rule | Implication |
|------------|------|-------------|
| **C1** | If Pattern = Human-Only → AI Role = "None" | Cannot list AI activities for Human-Only steps |
| **C2** | If Pattern = AI-Only → Human Role = "None" | Cannot list Human activities for AI-Only steps |
| **C3** | If AI Role ≠ "None" → Pattern ≠ Human-Only | Any AI activity requires at minimum Human-Led |
| **C4** | If Human Role ≠ "None" → Pattern ≠ AI-Only | Any Human activity requires at minimum AI-Led |

These constraints are **mandatory**. A specification violating these constraints is invalid.

### Pattern Selection Flowchart

Use this decision process to select the correct actor pattern:

```
Does AI perform ANY activity in this step?
│
├─ No ──► Does Human perform any activity?
│         ├─ Yes ──► Human-Only
│         └─ No ───► Invalid (no actor defined)
│
└─ Yes ─► Does Human perform ANY activity?
          │
          ├─ No ──► AI-Only
          │
          └─ Yes ─► Who drives the core work?
                    │
                    ├─ Human drives; AI supports/assists
                    │  └──► Human-Led
                    │
                    ├─ Both essential; neither sufficient alone
                    │  └──► Partnership
                    │
                    └─ AI drives; Human reviews/validates
                       └──► AI-Led
```

### Pattern Selection Heuristics by Capability

| Capability | Typical Pattern Range | Key Determinants |
|------------|----------------------|------------------|
| **Elicit** | Human-Led to AI-Led | Source: people (Human-Led) vs. systems (AI-Led) |
| **Analyse** | Partnership to AI-Led | Tacit interpretation (Partnership) vs. formal pattern matching (AI-Led) |
| **Synthesise** | Human-Led to Partnership | Almost always requires human theory-building |
| **Transform** | Partnership to AI-Led | Semantic preservation needs (Partnership) vs. mechanical conversion (AI-Led) |
| **Validate** | Human-Led to AI-Only | Stakeholder validation (Human-Led) vs. automated verification (AI-Only) |
| **Decide** | Human-Led to AI-Led | Value trade-offs (Human-Led) vs. rule application with escalation (AI-Led) |
| **Generate** | Partnership to AI-Led | Novel creation (Partnership) vs. template instantiation (AI-Led) |
| **Preserve** | Partnership to AI-Led | Rationale capture (Partnership) vs. formatting/archival (AI-Led) |

**Note**: Human-Only is rare in practice when AI tooling is available. Most activities previously considered Human-Only benefit from AI support in preparation, documentation, or tracking—making them Human-Led. Reserve Human-Only for situations where AI involvement is impossible or prohibited (confidentiality, legal privilege, no connectivity).

---

## Escalation Specification

Escalation is the structured handoff from AI to human (or to governance) when conditions exceed the AI's competence envelope. Every capability instance with AI participation must specify escalation triggers.

### Escalation Trigger Categories

| Category | Description | Examples |
|----------|-------------|----------|
| **Novel pattern** | Input falls outside known patterns | Unfamiliar architecture; unprecedented requirement |
| **Conflicting signals** | Multiple criteria point different directions | Tests pass but metrics breach threshold |
| **Low confidence** | AI uncertainty exceeds threshold | Ambiguous interpretation; multiple valid options |
| **Policy gap** | Situation not covered by existing rules | No precedent for this case |
| **High consequence** | Error cost exceeds acceptable threshold | Security-critical decision; regulatory implication |
| **Completeness failure** | Required information missing | Rationale not provided; validation incomplete |

### Escalation Context Requirements

When escalation occurs, the specification should define what context to provide:
- What was the AI attempting to do?
- What triggered the escalation?
- What information is available?
- What options were considered (if any)?
- What recommendation does the AI have (if applicable)?

### Escalation Action Types

Escalation triggers now support four action types:

| Action | Description | Target | Use When |
|--------|-------------|--------|----------|
| **ESCALATE** | Hand off to human or governance | Role (e.g., "human", "governance") | Decision exceeds AI competence |
| **RETURN** | Loop back to earlier step | Step ID (e.g., "PA-4") | Validation failed; correction needed |
| **BLOCK** | Halt process; cannot proceed | None | Critical failure; manual intervention required |
| **DEFER** | Suspend process; await async completion | Work queue or item type | Decision requires extended offline review |

#### DEFER Action Semantics

DEFER is used when a step requires asynchronous completion—the human (or external system) needs time to review, deliberate, or gather input before the process can continue.

When a DEFER action triggers:
1. Process state is serialised (current step, all context, partial outputs)
2. A task of type `DEFERRED_CONTINUATION` is created
3. Process enters `SUSPENDED` state (distinct from BLOCKED or PAUSED)
4. The task specifies a **resume trigger** that signals when work can continue
5. When resume trigger fires, process continues from the suspended step

**Key difference from ESCALATE**: ESCALATE expects immediate human attention within the current interaction; DEFER expects the human to return later (minutes, hours, or days).

Example specification:
```
Escalation triggers:
  - Extended review requested:
      Action: DEFER
      Target: "approval-queue"
      Resume trigger: { type: HUMAN_APPROVAL, condition: "User approves or rejects specification" }
      Context: "Specification snapshot, design rationale, open questions"
```

**Resume trigger types**:
| Type | Description | Example |
|------|-------------|---------|
| `HUMAN_APPROVAL` | Human explicitly signals completion | User clicks approve/reject |
| `EXTERNAL_EVENT` | External system signals completion | CI pipeline completes |
| `TIMEOUT` | Auto-resume after duration | Continue after 24 hours |
| `MANUAL` | Explicit manual resumption | User runs resume command |

#### RETURN Action Semantics

When a RETURN action triggers:
1. The process flow returns to the specified step
2. Context from the triggering step is passed to the target step
3. A fix step (if defined) executes before re-entering the target step
4. An iteration counter increments
5. If max iterations exceeded, escalate to BLOCK

Example specification:
```
Escalation triggers:
  - Constraint violation detected:
      Action: RETURN
      Target: PA-4
      Context: "Violation details: {C1|C2|C3|C4}, affected step: {step_id}"
```

---

## Fix Step Pattern

When validation failures trigger RETURN actions, a **fix step** provides explicit work to address the failure before re-entering the flow.

### Fix Step Template

```
Step [Process].[Sequence]a: Fix [Issue Type]
├── Identity
│   ├── Step ID: [Parent step ID]a (e.g., PA-8a)
│   ├── Name: Fix [description of what's being fixed]
│   └── Capability: Transform (typically)
│
├── Trigger
│   └── Activated by: RETURN from Step [X]
│
├── Actor Specification
│   ├── Pattern: AI-Led or Partnership
│   ├── Human role: Review proposed corrections; approve changes
│   └── AI role: Analyse failure; propose corrections; apply fixes
│
├── Control Flow
│   ├── Escalation triggers:
│   │   └── Cannot determine fix:
│   │       ├── Action: ESCALATE
│   │       ├── Target: human
│   │       └── Context: "Failure details and attempted fixes"
│   ├── Completion criteria: Issue resolved; specification updated
│   └── Validation: Fix addresses the specific failure that triggered return
│
└── Notes
    └── Fix steps are conditional—they only execute when triggered by RETURN
```

### Fix Step Naming Convention

Fix steps use the suffix `a` appended to the validation step that triggered them:
- PA-8 (Validate) fails → PA-8a (Fix) executes → Flow returns to PA-4

### When to Define Fix Steps

Define explicit fix steps when:
- The failure mode is predictable (e.g., constraint violations)
- The fix can be partially automated
- Audit trail of fixes is important

Omit fix steps when:
- Failures are rare or unpredictable
- Human must determine the fix approach
- The return target step inherently handles correction

---

## Validation Specification

Validation ensures critical information is captured before process flow continues. This is the primary mechanism for enforcing capture windows on ephemeral information.

### Validation Types

| Type | Purpose | Example |
|------|---------|---------|
| **Completeness** | Required fields populated | Requirement has ID, statement, rationale |
| **Consistency** | No contradictions | Terminology matches glossary |
| **Traceability** | Links established | All requirements traced to source |
| **Approval** | Human sign-off recorded | Stakeholder validation documented |
| **Quality threshold** | Metric meets standard | Coverage exceeds minimum |

### Validation Failure Handling

When validation fails, the process must not proceed silently. Options:
1. **Block**: Cannot proceed until validation passes
2. **Escalate**: Human decides whether to proceed despite failure
3. **Document exception**: Proceed with explicit record of deviation

The appropriate response depends on the validation type and process context.

---

## Process Flow Patterns

Common patterns in capability instance sequencing:

### Linear Flow
```
Step 1 → Step 2 → Step 3 → Step 4
```
Simple sequential execution.

### Iterative Loop
```
Step 1 → Step 2 → Step 3 ──┐
              ↑            │
              └────────────┘ (until criteria met)
```
Repeat until completion criteria satisfied.

### Conditional Branch
```
Step 1 → [Condition] ─→ Step 2a (if true)
                   └─→ Step 2b (if false)
```
Different paths based on results.

### Parallel Execution
```
        ┌→ Step 2a ─┐
Step 1 ─┤          ├→ Step 3
        └→ Step 2b ─┘
```
Independent work streams that converge.

### Escalation Branch
```
Step 1 → [AI Assessment] ─→ Step 2 (confident)
                      └─→ Human Review → Step 2 (uncertain)
```
AI proceeds when confident; escalates otherwise.

---

## Document Reference Conventions

When specifying document inputs and outputs:

### Required vs Optional
```
Input:
  Documents:
    - SPC-001 [required: statement, rationale fields]
    - STR-004 [optional: risk context]
```

### Specific Content Requirements
```
Input:
  Documents:
    - WRK-001 [required: rationale field populated]
```
Specifies not just the document type but what content must be present.

### Output Status
```
Output:
  Documents:
    - SPC-002 [status: DRAFT]
    - SPC-002 [status: CURRENT, version incremented]
```
Indicates the expected status of output documents.

---

## Application Guidance

### Creating Process Specifications

To specify processes for an SDLC phase:

1. **Identify processes** — What distinct work sequences exist in this phase?
2. **Define process interfaces** — What documents/information flow in and out?
3. **Decompose into capability instances** — What capability is applied at each step?
4. **Specify actor patterns** — Who (human/AI) performs each instance?
5. **Define escalation triggers** — When does AI hand off to human?
6. **Establish validation criteria** — What must be verified at each step?
7. **Map process flow** — What sequence, with what branches/loops?

### Granularity Decisions

Capability instance granularity should be:
- **Fine enough** to have clear actor patterns and escalation points
- **Coarse enough** to represent meaningful work units
- **Consistent** across similar processes for comparability

Rule of thumb: If a step has mixed actor patterns (some parts Human-Led, others AI-Led), it should probably be decomposed.

### Process Boundary Decisions

Process boundaries should be drawn where:
- Different roles typically engage
- Natural handoff points exist
- Document baselines are established
- Quality gates apply

---

## Metrics and Measurement

Process specifications enable measurement:

### Process-Level Metrics
- **Cycle time**: Duration from entry to exit criteria
- **Throughput**: Instances completed per time period
- **Quality rate**: Percentage passing exit criteria first time

### Capability Instance Metrics
- **Escalation rate**: Percentage of instances requiring escalation
- **Validation failure rate**: Percentage failing validation
- **Rework rate**: Percentage requiring iteration

### Actor Pattern Metrics
- **AI participation rate**: Percentage of instances with AI involvement
- **Human bottleneck rate**: Time waiting for human input
- **Escalation resolution time**: Duration of escalated decisions

---

## Specification Validation

Before finalising any capability flow specification, validate internal consistency using this checklist.

### Actor Pattern Consistency Checklist

```
□ Schema Constraint Validation
  □ For each step marked Human-Only:
    □ AI Role = "None" (no AI activities listed)
    □ If AI activities are listed → Change pattern to Human-Led
    
  □ For each step marked AI-Only:
    □ Human Role = "None" (no Human activities listed)
    □ If Human activities are listed → Change pattern to AI-Led
    
  □ For each step with both roles populated:
    □ Pattern is one of: Human-Led, Partnership, AI-Led
    □ Pattern matches role balance (who drives vs. supports)

□ Pattern Selection Validation
  □ Each pattern selection follows the decision flowchart
  □ Human-Only used only when AI involvement is impossible/prohibited
  □ AI-Only used only when human review adds no value
  □ Human-Led vs Partnership vs AI-Led correctly reflects who drives
  
□ Capability Constraint Validation
  □ Each step specifies exactly one capability (not "X + Y")
  □ If step seems to require multiple capabilities → Decompose into separate steps
```

### Common Errors to Check

| Error | Symptom | Correction |
|-------|---------|------------|
| **Overstated Human-Only** | AI Role lists activities | Change to Human-Led |
| **Overstated AI-Only** | Human Role lists activities | Change to AI-Led |
| **Multiple capabilities** | Capability field contains "+" | Decompose step |
| **Pattern mismatch** | Human drives but marked AI-Led | Correct pattern |
| **Missing escalation** | AI-Led step has no escalation triggers | Add triggers |

---

## Integration with Other Concepts

- [**Eight-Capability Taxonomy**](./concept_capability-model.md): Capability instances use exactly one capability from the eight-capability taxonomy
- [**Seven-Phase SDLC Model**](./concept_seven-phase-sdlc.md): Processes are organised by phase
- [**Actor Model**](./concept_actor-model.md): Human and AI roles derive from actor characteristics
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): Actor patterns and escalation follow collaboration pattern guidance
- [**Information Loss at Transitions**](./concept_transitions-info-loss.md): Validation criteria address transition losses
- [**Document Type Classification Framework**](./concept_document-type-classification.md): Document references use registered type IDs
- [**Decision and Observation Tracking**](./concept_decision-observation-tracking.md): Capability instances that involve Decide produce Decision records with full traceability. Observations captured during process execution inform decisions and provide audit trails.
- [**Work Coordination**](./concept_work-coordination.md): Process execution requires coordinating capability instances across actors. tasks flow through queues and assignments according to the coordination mechanisms defined in work coordination.

---

## Evidence Base

**Process decomposition** aligns with ISO/IEC/IEEE 12207:2017 process definitions and activity structures.

**Capability-based specification** extends activity-based process models with explicit human-AI collaboration semantics.

**Escalation patterns** derive from automation research on human-machine teaming and exception handling.

**Validation approaches** reflect quality assurance practices and agile definition-of-done concepts.

---

## Validation Status

- ✓ **Schema structure**: Comprehensive coverage of specification needs
- ✓ **Actor pattern guidance**: Aligned with Concept 7; includes constraints, flowchart, and validation checklist
- ✓ **Schema constraints**: Enforce consistency between pattern and role specifications
- ✓ **Escalation categories**: Cover common handoff scenarios
- ⚠ **Granularity guidance**: Heuristic; may need refinement through application
- ⚠ **Metrics definitions**: Initial set; measurement validity requires empirical study
- ⚠ **Flow pattern coverage**: Common patterns included; complex workflows may need extension

---

*The Process and Capability Flow Specification Framework provides the schema for defining executable process specifications. By establishing consistent templates for processes and capability instances, the framework enables systematic human-AI collaboration with clear responsibilities, handoff points, and quality gates.*
