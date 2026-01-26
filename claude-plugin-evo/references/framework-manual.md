# AI-Augmented SDLC Framework: Operational Manual

**Version**: 1.2
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

**Phase Dynamics**: Phases overlap and cycle—not strictly sequential:
- **Common loops**: Requirements↔Design (mutual refinement), Implementation↔Testing (TDD), Testing→Requirements (acceptance mismatch)
- **Loop cost**: Shorter loops (adjacent phases) = low cost, expected; longer loops (e.g., Testing→Initiation) = high cost, indicates information debt
- **Backward events are valid**: Discoveries that invalidate earlier understanding trigger legitimate returns to earlier work

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
2. task type `DEFERRED_CONTINUATION` created
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

### task Types

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
| `dialogue-create-adr` | Create Architecture Decision Records | "create ADR", "record architecture decision" |
| `dialogue-resolve-reference` | Resolve reference IDs to content | "resolve reference", "look up THY-001" |
| `dialogue-structured-elicit` | Gather context through questions | "gather requirements", "elicit context" |
| `dialogue-verify-logging-compliance` | Validate logging occurred | "verify logging", "check compliance" |
| `build-only-validate-capability-flow` | Validate spec against constraints | "validate capability flow" |

### Skill Usage

**Log a decision**:
```bash
${CLAUDE_PLUGIN_ROOT}/skills/dialogue-log-decision/scripts/log-decision.sh \
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
${CLAUDE_PLUGIN_ROOT}/skills/dialogue-log-observation/scripts/log-observation.sh \
  <MEASUREMENT|STATE|EVENT> \
  "<ai:claude|human:id>" \
  "<subject>" \
  "<value>" \
  "[context]" \
  "[tags]"
```

**Verify logging compliance**:
```bash
${CLAUDE_PLUGIN_ROOT}/skills/dialogue-verify-logging-compliance/scripts/verify-logging.sh \
  "<process-identifier>" \
  <min-decisions> \
  <min-observations>
```

**Create an ADR**:
```bash
${CLAUDE_PLUGIN_ROOT}/skills/dialogue-create-adr/scripts/create-adr.sh \
  "<human:id|ai:id>" \
  "<title>" \
  "<context>" \
  "<decision>" \
  "<alternatives>" \
  "<consequences>" \
  "<rationale>"
```

**Resolve a reference**:
```bash
${CLAUDE_PLUGIN_ROOT}/skills/dialogue-resolve-reference/scripts/resolve-reference.sh \
  <id> \
  [full|metadata|path]
```

Supported reference types: `THY-NNN`, `REF-NNN`, `STR-NNN`, `ADR-NNN`, `DEC-*`, `OBS-*`, `SH-NNN`, `FW-NNN`, `human:<id>`, `ai:<id>`

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

## Information Architecture

The framework's information architecture consists of three interconnected schemas for ID formats, retrieval contracts, and knowledge graph structures.

### Context Graph Overview

The Context Graph externalises Transactive Memory—making "who knows what" queryable.

**Node Types**:
| Type | Description |
|------|-------------|
| `ARTIFACT` | Documents, decisions, observations, tasks |
| `ACTOR_HUMAN` | Human participants with expertise |
| `ACTOR_AI` | AI actors with capability profiles |
| `SYSTEM` | External systems and services |

**TMS Operations**:
| Operation | TMS Function | Description |
|-----------|--------------|-------------|
| `locate(query)` | Directory | Find who/what knows about a topic |
| `route(new_info)` | Allocation | Where should new information go? |
| `retrieve(node_id)` | Retrieval | Fetch content (delegates to resolver) |
| `refresh(node_id)` | Maintenance | Update stale information |
| `discover(actor, domain)` | Learning | What does actor know about domain? |
| `invalidate(node_id)` | Staleness | Mark as potentially outdated |

---

## Log Locations

```
.dialogue/
├── logs/
│   ├── decisions/       # Decision records (per-file)
│   └── observations/    # Observation records (per-file)
├── tasks/               # Task records (per-file)
└── README.md
```

---

## Team Modes

The framework adapts behaviour based on team context (FW-040). This right-sizes overhead for solo developers while providing full collaboration features for teams.

### Configuration

In `.dialogue/config.yaml`:

```yaml
# Options: auto | solo | team
team_mode: auto
```

| Mode | Detection | Use Case |
|------|-----------|----------|
| **auto** | 2+ users active within 30 days → team | Default; self-adjusting |
| **solo** | Forced | Solo developer; minimal overhead |
| **team** | Forced | Team project; full collaboration |

### Feature Differences

| Feature | Solo Mode | Team Mode |
|---------|-----------|-----------|
| Git sync reminders | Disabled | After task/decision changes |
| Pull check on session start | Skip | Warn if behind remote |
| User registration files | Skip | Create `.dialogue/users/{user}.yaml` |
| Session memo naming | `.dialogue/session-memo.yaml` | `.dialogue/session-memo-{user}.yaml` |
| Session start verbosity | Minimal collaboration hints | Full collaboration guidance |

### Unaffected Features

These work identically in both modes:
- Decision and observation logging
- Task management
- Per-file artifact structure
- Context graph operations

### Detection Logic

Auto-detection counts users in `.dialogue/users/` with `last_seen` timestamps within 30 days. If 2+ users are active, team mode activates.

**Detection script**: `claude-plugin-evo/hooks/scripts/detect-team-mode.sh`

### Git Sync Status

In team mode, session start checks git sync status:

| Status | Meaning | Action |
|--------|---------|--------|
| synced | Local matches remote | No warning |
| ahead | Local has unpushed commits | No warning (push when ready) |
| behind | Remote has new commits | Warning: pull recommended |
| diverged | Both have new commits | Warning: merge/rebase needed |

**Sync check script**: `claude-plugin-evo/hooks/scripts/check-git-sync.sh`

### Migration

Existing projects without `team_mode` in config default to `auto`. No action required.

---

## Dialogue Protocol

Apply this loop to substantive work:

```
1. ELICIT    — Before generating, ensure you understand the request
               Ask clarifying questions if intent is ambiguous
               Probe for unstated assumptions and constraints

2. ANALYSE   — Examine relevant existing content
               Identify connections to other framework concepts
               Surface potential inconsistencies or gaps

3. SYNTHESISE — Integrate understanding into coherent output
                Connect new content to theoretical foundations
                Maintain consistency with existing framework elements

4. VALIDATE  — Present drafts explicitly as drafts
               Invite human review and correction
               Do not proceed to dependent work until validated

5. PRESERVE  — Capture rationale, not just decisions
               Document why, not just what
               Flag tacit knowledge that should be made explicit
```

---

## Tacit Knowledge Elicitation

Much knowledge exists in human minds but not in documents. Actively elicit:

**Questions to ask:**
- "What is the rationale behind this structure?"
- "How does this connect to [related concept]?"
- "Are there constraints or considerations I should know about?"
- "What alternatives were considered and why were they rejected?"
- "Is there historical context that informs this decision?"

**Capture requirements:**
- When humans provide rationale verbally, offer to capture it in appropriate documents
- Flag when decisions are made without documented rationale
- Suggest where tacit knowledge should be formalised

---

## Skill Preservation

AI assistance must support, not replace, human theory-building:

**Do:**
- Explain reasoning so humans can evaluate and learn
- Present options with trade-offs rather than single recommendations
- Ask questions that deepen human understanding
- Support humans in developing their own synthesis

**Don't:**
- Generate large volumes of content without human engagement
- Make decisions silently embedded in generated text
- Proceed through multiple steps without checkpoints
- Create dependency on AI for routine tasks

---

## Backward Event Detection

Monitor for signals that earlier work needs revisiting:

| Signal | Indicates | Response |
|--------|-----------|----------|
| New content contradicts existing concept | Conceptual inconsistency | Surface conflict; do not paper over |
| Definition has shifted from original | Concept drift | Flag for explicit decision |
| Evidence cited doesn't support claim | Evidential gap | Note the gap; suggest correction |
| Cross-reference target has changed | Broken dependencies | Identify all affected documents |
| New insight invalidates prior decision | Theory evolution | Surface for re-evaluation |

**Response protocol**: When detecting a backward event, stop forward progress and surface the issue. Do not resolve inconsistencies silently.

---

## Three-Layer Guidance Architecture

The framework occupies Layer 2 in a three-layer model:

| Layer | Stability | Content |
|-------|-----------|---------|
| **1. Process Abstractions** | Decadal | ISO/IEC/IEEE standards |
| **2. Application Framework** | Annual | This framework |
| **3. Implementation Patterns** | Continuous | Tool-specific practices |

---

## Evidential Standards

### Evidence Tiers

| Tier | Type | Causal Inference |
|------|------|------------------|
| T1 | Experimental/Quasi-experimental | Can support causation |
| T2 | Longitudinal/Panel | Establishes temporal precedence only |
| T3 | Cross-sectional with controls | Correlation only |
| T4 | Descriptive/Case study | Association only |

### Evidential Language

```
✓ "Research indicates..." (for peer-reviewed findings)
✓ "Synthesis of evidence suggests..." (for derived conclusions)
✓ "Estimated at approximately..." (for reasoned approximations)
✓ "For illustrative purposes..." (for worked examples)

✗ Avoid presenting derived figures as directly measured
✗ Avoid absolute statements about AI capabilities without temporal qualification
```

### Key Statistics

| Metric | Value | Source | Tier |
|--------|-------|--------|------|
| STS mirroring support | 69% of 142 studies | Colfer & Baldwin 2016 | Meta |
| Coordination congruence | 32% improvement | Cataldo et al. 2008 | T3 |
| Developer thriving → productivity | r=0.43 | Hicks et al. 2024, N=1,282 | T3 |
| TTKM → team effectiveness | r=0.35 | Ryan & O'Connor 2013, N=48 | T3 |
| Good day prevalence | 60.6% | Meyer et al. 2019, N=5,971 | T3 |

---

## Document Type Classification

### Content Domain Codes

| Code | Domain | Description |
|------|--------|-------------|
| STR | Strategy | Rationale, decisions, business justification |
| SPC | Specification | Requirements, acceptance criteria, constraints |
| DES | Design | Architecture, component structure, interfaces |
| IMP | Implementation | Code documentation, APIs, build configuration |
| VAL | Validation | Test plans, results, verification evidence |
| OPS | Operational | Runbooks, incident records, maintenance logs |
| REF | Reference | Conceptual models, explainers, glossaries |
| THY | Theory | Integrated understanding, the "why" that connects |
| WRK | Working | Transient process artefacts, analysis notes |
| HST | Historical | Preserved negative knowledge, rejected alternatives |

### Temporal Class

| Class | Update Frequency | Typical Lifespan | Retention |
|-------|------------------|------------------|-----------|
| **Standing** | Quarterly or less | Years | Long-term archive |
| **Dynamic** | Weekly or more | Project duration | Project archive |
| **Ephemeral** | Single use | Days to weeks | Discretionary |

### Scope Hierarchy

**Organisational** > **Project** > **Task**

---

## Common Pitfalls

1. **Overgeneralising actor suitability** — Determine at capability *instance* level, not broad categories
2. **Treating phase percentages as measured** — They are derived estimates for guidance
3. **Making absolute AI capability claims** — Always temporally qualify (as of 2024-2025)
4. **Optimising early phases for speed** — Understanding-heavy phases shouldn't prioritise velocity
5. **Conflating correlation with causation** — Most evidence is correlational (T3)
6. **Ignoring joint optimisation** — Human-AI systems require socio-technical design
7. **One capability per step** — If a step seems to require multiple capabilities, decompose it

---

## Phase-Specific Guidance: Phase 1 (Initiation)

### Information Composition

| Type | Percentage | Implication |
|------|------------|-------------|
| **Tacit** | 75% | Most knowledge exists in stakeholder minds; AI cannot lead |
| **Emergent** | 20% | Problem framing evolves through exploration |
| **Formal** | 5% | Very little is formally specifiable |

### Collaboration Pattern Constraints

- **AI cannot lead Phase 1 work** — The tacit knowledge required (strategic context, stakeholder dynamics, organisational politics) is not accessible to AI
- **Human-Only**: Strategic decisions, stakeholder politics, opportunity framing
- **Human-Led**: Market research synthesis, financial modelling, document drafting

### Functional Roles

Phase 1 high-value roles (per I-3 Naur-Wegner Integration):

| Role | Value in Phase 1 | Actor Suitability |
|------|------------------|-------------------|
| **Facilitator** | High | AI excels — structures dialogue without needing tacit knowledge |
| **Scribe** | High | AI excels — captures outputs as they occur (critical for capture windows) |
| **Synthesiser** | Medium | Human-led — integration requires tacit context |
| **Validator** | Medium | Human-led — validating tacit understanding requires tacit context |
| **Researcher** | Low | Limited value — most Phase 1 knowledge is internal, not external |

### Scaling: Minimal vs Full Phase 1

Phase 1 scales dramatically based on project context:

**Full Phase 1** (enterprise projects, significant investment, multiple stakeholders):
- All document types produced
- Formal governance gates
- Explicit stakeholder analysis and alignment

**Minimal Phase 1** (small projects, single stakeholder, low risk):
- Opportunity Statement may be implicit or verbal
- Stakeholder Analysis may be "obvious" (single requester)
- Business Case may be a paragraph, not a document

**Key insight**: A one-paragraph business case is still a business case. Process references trace lineage, not mandate ceremony.

### The Straw Man Pattern

In early-stage or exploratory work, Phase 1 documents often begin as placeholders:

| Document | Straw Man Version | Evolution |
|----------|-------------------|-----------|
| Stakeholder Analysis | "Stakeholders TBD—starting with requester" | Expanded as scope clarifies |
| Opportunity Statement | Initial problem framing (likely incomplete) | Reframed as understanding deepens |
| Business Case | Rough cost/benefit estimate | Refined with actual data |
| Feasibility | "Assumed feasible—will validate" | Updated with technical assessment |

**Straw man documents are valid** — they make assumptions explicit and trackable.

### Document Types

| Document | Required? | When to Create | Minimal Form |
|----------|-----------|----------------|--------------|
| **Opportunity Statement** | Always | Something triggered this work; capture it | Single sentence stating the problem |
| **Stakeholder Analysis** | Always | At minimum: who requested, who approves | List of names with roles |
| **Business Case** | Context-dependent | Formal in enterprises; may be verbal in startups | One paragraph with why and rough cost/benefit |
| **Project Charter** | Context-dependent | When authority must be explicit | Scope + authority statement |
| **Feasibility Assessment** | Context-dependent | When technical risk is non-trivial | Go/no-go with key risks |

### Capture Window Criticality

75% tacit composition means delayed documentation loses most value:

| Capture Requirement | Rationale |
|---------------------|-----------|
| **Real-time note-taking** during interviews/sessions | Tacit context lost immediately |
| **Same-day synthesis** of exploration activities | Reasoning chains decay rapidly |
| **Immediate documentation** of "aha moments" | Problem framing insights are highly perishable |

**Critical**: If an insight occurs and isn't captured immediately, it may be lost. Use Scribe role actively.

### Rationale-First Validation

Phase 1 validation emphasises *why* over *what*:

- ✗ Positions without rationale are **incomplete**
- ✗ Decisions without alternatives considered are **incomplete**
- ✗ Conclusions without reasoning chains are **incomplete**

**Validation checklist for Phase 1 outputs:**
```
□ Problem framing distinguishes problem from solution
□ Alternatives considered are documented
□ Rejection rationale is captured (negative knowledge)
□ Stakeholder positions include their reasoning
□ Assumptions are explicit, not embedded
```

### AI Configuration for Phase 1

When operating in Phase 1:

1. **Activate Facilitator role**: Structure dialogue to help humans articulate tacit knowledge
2. **Activate Scribe role**: Capture decisions and observations in real-time using skills:
   - `dialogue-log-decision` for choices made
   - `dialogue-log-observation` for findings
3. **Use `dialogue-structured-elicit`**: For systematic context gathering
4. **Do not lead**: Present options with trade-offs; let humans decide
5. **Probe for rationale**: When humans state conclusions, ask "why?" and "what alternatives did you consider?"

---

*AI-Augmented SDLC Framework v1.2 — Operational Manual*
