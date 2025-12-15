# The Dialogue Framework: Evolution

## Incremental AI Adoption from Current Practice

---

## Overview

**Evolution** is the first of two meta-processes defined by The Dialogue Framework. It provides guidance for organisations adopting AI-augmented development incrementally—adding AI capabilities to existing workflows while preserving team knowledge, organisational structures, and established practices.

### When to Use Evolution

- Existing development practices are effective and well-understood
- Team tacit knowledge and transactive memory systems are valuable assets
- Organisational risk tolerance favours gradual change
- AI integration should enhance rather than disrupt current workflows

---

## Principles

*To be developed*

1. **Preserve what works**: Existing practices embody accumulated learning
2. **Augment, don't replace**: AI assists human capabilities
3. **Maintain knowledge continuity**: Protect tacit knowledge and transactive memory systems
4. **Incremental validation**: Each step validated before proceeding

---

## Evolution Across SDLC Phases

### Phase 1: Initiation/Conception

**ISO 12207 Process**: 6.4.1 Business or Mission Analysis

**Information Composition**: 5% Formal / 75% Tacit / 20% Emergent

**Primary Question**: WHY—strategic rationale, opportunity framing

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 1 |
|---------------|--------|----------|-------------------|
| Strategic Plan | STR | Standing | Alignment check—does opportunity fit strategy? |
| Investment Criteria | STR | Standing | Thresholds for go/no-go decisions |
| Portfolio Register | STR | Dynamic | Context—what else is in flight? |
| Regulatory Constraints | REF | Standing | Boundaries that apply to all initiatives |
| Organisational Glossary | REF | Standing | Consistent terminology from start |

**AI should ask**: "Are there organisational strategy documents, investment criteria, or portfolio views I should reference?"

**Project Inputs** (Scope: Project — from triggering event):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| Opportunity Statement | STR | Ephemeral | Triggering event; may be informal |
| Initial Data/Evidence | WRK | Ephemeral | Whatever triggered the initiative |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Business Case (STR-001) | STR | Standing | Planning, Requirements, all phases |
| Project Charter (STR-002) | STR | Standing | Planning, governance |
| Stakeholder Map | STR | Dynamic | All phases |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Stakeholder Interview Notes | WRK | Initial conversations | Business Case, Stakeholder Map |
| Market Analysis Notes | WRK | Research findings | Business Case |
| Feasibility Assessment Notes | WRK | Technical/resource evaluation | Business Case |

**Process Validation**: Working documents must capture rationale at creation time (capture window). AI should flag if rationale is missing before synthesis.

#### Data Sources Taxonomy

| Category | Sources | Information Type |
|----------|---------|------------------|
| **Physical** | Sensors, IoT devices, hardware telemetry, environmental monitors | Formal |
| **Virtual/System** | Application logs, database metrics, API telemetry, infrastructure monitoring | Formal |
| **Human-Generated** | Support tickets, feedback forms, survey responses, interview transcripts | Formal (captured) / Tacit (uncaptured) |
| **Observational** | User behaviour analytics, session recordings, A/B test results | Formal |
| **Documentary** | Existing reports, previous analyses, strategy documents, post-mortems | Formal |
| **External/Market** | Competitor intelligence, market research, regulatory updates, industry benchmarks | Formal |
| **Social/Conversational** | Stakeholder discussions, hallway conversations, meeting insights | Tacit / Emergent |

#### Qualitative Information Types

| Type | Definition | Why It Matters |
|------|------------|----------------|
| **Vision** | Aspirational future state—what success looks like | Guides direction; aligns stakeholders |
| **Mission** | Purpose—why this initiative exists | Provides meaning; enables prioritisation |
| **Objectives** | Specific, measurable outcomes sought | Enables tracking; defines success |
| **Values** | Principles guiding decisions and trade-offs | Shapes choices when objectives conflict |
| **Constraints** | Boundaries that must be respected (regulatory, ethical, resource, political) | Defines solution space |
| **Success Criteria** | How we'll know if we've succeeded | Enables validation; prevents scope creep |
| **Stakeholder Expectations** | What different parties need/want from this | Manages alignment; surfaces conflicts |

#### AI Elicitation Questions

**For Vision:**
- "What would the world look like if this initiative succeeds completely?"
- "If you could describe the ideal outcome in one sentence, what would it be?"
- "What will users/customers be able to do that they can't do today?"
- "How will you know this has made a real difference?"

**For Mission/Purpose:**
- "Why is this problem worth solving *now*?"
- "What happens if we don't do this?"
- "Who suffers most from the current situation?"
- "What alternatives were considered, and why is this the right approach?"

**For Objectives:**
- "What specific, measurable change do you expect to see?"
- "In six months, what will be different?"
- "What metrics would indicate we're on track?"
- "What's the minimum outcome that would make this worthwhile?"

**For Constraints:**
- "What must we absolutely *not* do?"
- "What resources (time, budget, people) are fixed vs. flexible?"
- "What regulatory or compliance requirements apply?"
- "What political realities must we work within?"

**For Stakeholder Expectations:**
- "Who will be most affected by this initiative?"
- "What does success look like from [stakeholder X]'s perspective?"
- "Where might different stakeholders have conflicting needs?"
- "Who needs to be consulted before decisions are made?"

**For Success Criteria:**
- "How will we know when we're done?"
- "What would make you say 'this was a success' vs 'this failed'?"
- "What's the difference between 'good enough' and 'excellent'?"

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Data synthesis** | Aggregate across sources; surface anomalies; identify correlations | Determine which patterns are meaningful |
| **Pattern matching** | Compare to similar past initiatives; identify analogues | Judge relevance of analogues to current context |
| **Hypothesis generation** | Generate candidate problem framings | Select framing; test against stakeholder understanding |
| **Stakeholder analysis** | Map stakeholder landscape from organisational data | Assess political dynamics; build relationships |
| **Feasibility assessment** | Enumerate technical constraints; estimate effort ranges | Assess organisational capacity; political feasibility |

#### The Evolution Model for Phase 1

```
┌─────────────────────────────────────────────────────────────────────┐
│                    PHASE 1: INITIATION/CONCEPTION                   │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  DATA SOURCES                      QUALITATIVE DISCOVERY            │
│  ────────────                      ─────────────────────            │
│  Physical ─────┐                                                    │
│  Virtual ──────┤                   ┌──────────────────┐             │
│  Human ────────┼──► AI ANALYSES ──►│  AI ELICITS via  │             │
│  Documentary ──┤    patterns,      │  targeted        │             │
│  External ─────┘    anomalies      │  questions       │             │
│                                    └────────┬─────────┘             │
│                                             │                       │
│                                             ▼                       │
│                                    ┌──────────────────┐             │
│                                    │  HUMAN RESPONDS  │             │
│                                    │  - Vision        │             │
│                                    │  - Mission       │             │
│                                    │  - Objectives    │             │
│                                    │  - Constraints   │             │
│                                    │  - Success       │             │
│                                    └────────┬─────────┘             │
│                                             │                       │
│                                             ▼                       │
│                                    ┌──────────────────┐             │
│                                    │  AI SYNTHESISES  │             │
│                                    │  draft artifacts │◄──┐         │
│                                    └────────┬─────────┘   │         │
│                                             │             │         │
│                                             ▼             │         │
│                                    ┌──────────────────┐   │         │
│                                    │  HUMAN VALIDATES │   │         │
│                                    │  refines, adds   ├───┘         │
│                                    │  tacit context   │  ITERATE    │
│                                    └──────────────────┘             │
│                                                                     │
│  OUTPUTS: Business case, stakeholder map, project charter          │
│           (with documented vision, mission, objectives, criteria)  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### What Must Be Preserved

- Human theory-building about the problem space
- Stakeholder relationships and trust
- Strategic judgement (which opportunities to pursue)
- Organisational/political context understanding

#### Transition Readiness: Initiation → Planning

Sufficiency for `OPPORTUNITY_VALIDATED` is context-dependent. AI can help surface readiness through:

- "What would make you confident enough to commit resources to planning?"
- "Are stakeholders sufficiently aligned, or are there unresolved conflicts?"
- "Is the business case strong enough to justify the investment?"
- "What's the cost of starting planning now vs. waiting for more clarity?"
- "If you proceed and the opportunity framing is wrong, what's the rework cost?"

#### Evolution Risk

- AI surfaces pattern → team treats as "the problem" → actual problem is something data doesn't capture
- Polished AI-generated business case masks lack of genuine stakeholder alignment
- Stakeholders disengaged because "the AI did the analysis"

---

### Phase 2: Planning

**ISO 12207 Processes**: 6.3.1 Project Planning, 6.3.3 Decision Management, 6.3.4 Risk Management

**Information Composition**: 35% Formal / 55% Tacit / 10% Emergent

**Primary Question**: HOW (to organise)—project organisation, resource allocation, governance

**Key Insight**: Planning spans most of the project. Initial Planning operates with high uncertainty; it refines iteratively as Requirements and Design provide detail. The composition shifts from more tacit (early) to more formal (later) within the phase.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 2 |
|---------------|--------|----------|-------------------|
| Resource Pool / Skills Inventory | OPS | Dynamic | Who's available; what skills exist |
| Estimation Guidelines | REF | Standing | Standard approaches, historical benchmarks |
| Risk Taxonomy | REF | Standing | Categories of risks to consider |
| Governance Framework | STR | Standing | Decision rights, escalation paths, approvals |
| Project Management Standards | REF | Standing | Required deliverables, templates, processes |
| Lessons Learned Repository | HST | Standing | What went wrong/right on past projects |

**AI should ask**: "Are there organisational estimation guidelines, risk taxonomies, or lessons learned I should reference?"

**Project Inputs** (Scope: Project — from Phase 1):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| Business Case (STR-001) | STR | Standing | Phase 1 |
| Project Charter (STR-002) | STR | Standing | Phase 1 |
| Stakeholder Map | STR | Dynamic | Phase 1 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Project Plan | STR | Dynamic | All phases; updated throughout |
| Scope Statement (STR-003) | STR | Standing | Requirements, Design, all phases |
| Risk Register (STR-004) | STR | Dynamic | All phases; continuously updated |
| Resource Plan | STR | Dynamic | Implementation, Operations |
| Communication Plan | STR | Standing | All stakeholder interactions |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Estimation Workshop Notes | WRK | Team estimates, assumptions, confidence | Project Plan |
| Risk Assessment Notes | WRK | Risk brainstorming, analysis | Risk Register |
| Dependency Analysis Notes | WRK | External dependency assessment | Project Plan, Risk Register |

**Process Validation**: Estimation assumptions and risk assessment rationale must be captured at workshop time. AI should flag missing rationale before incorporating into standing documents.

#### Information Flow

**Inputs from Phase 1 (Initiation):**

| From Phase 1 | Type | How It Informs Planning |
|--------------|------|-------------------------|
| Business case | Formal | Scope boundaries, investment justification |
| Vision/Mission/Objectives | Formal (captured) | Success criteria, alignment checks |
| Constraints | Formal + Tacit | Fixed boundaries (budget, deadline, regulatory) |
| Stakeholder map | Formal | Governance structure, communication needs |
| Success criteria | Formal | Definition of done, acceptance thresholds |

**New Data Sources for Phase 2:**

| Category | Sources | Type |
|----------|---------|------|
| **Historical project data** | Past estimates vs actuals, velocity trends, similar project outcomes | Formal |
| **Resource data** | Team capacity, skills inventory, availability, cost rates | Formal |
| **Organisational data** | Budget cycles, competing priorities, approval processes | Formal + Tacit |
| **Dependency data** | Other projects, systems, vendors, external timelines | Formal |
| **Risk repositories** | Lessons learned, risk registers, incident histories | Formal (if captured) |
| **Team knowledge** | Who works well together, realistic capacity, hidden constraints | Tacit |

#### Qualitative Information Types

| Type | Definition | Why It Matters |
|------|------------|----------------|
| **Governance model** | How decisions are made, escalated, approved | Defines authority and accountability |
| **Risk appetite** | How much uncertainty is acceptable | Shapes contingency, buffer sizing, go/no-go thresholds |
| **Team norms** | How the team works together, communication patterns | Affects realistic scheduling, collaboration assumptions |
| **Dependency map** | What this project depends on; what depends on it | Critical path identification, external risk exposure |
| **Resource flexibility** | What's fixed vs. negotiable | Constraint vs. variable in optimisation |
| **Estimation confidence** | How certain are we about these numbers? | Informs contingency, communication of uncertainty |

#### AI Elicitation Questions

**For Governance:**
- "Who has authority to approve scope changes?"
- "What decisions require escalation, and to whom?"
- "How are disagreements between stakeholders resolved?"
- "What reporting cadence and format do stakeholders expect?"

**For Risk Appetite:**
- "What level of schedule risk is acceptable to stakeholders?"
- "Are there immovable deadlines, or is the date negotiable if scope changes?"
- "How much contingency buffer is typical for projects like this?"
- "What would cause stakeholders to cancel the project?"

**For Estimation:**
- "What similar projects have we done, and how accurate were our estimates?"
- "Where are we most uncertain in these estimates?"
- "What assumptions are we making that could invalidate the plan?"
- "If this estimate is wrong, which direction is it likely wrong?"

**For Dependencies:**
- "What external teams/systems must deliver for us to proceed?"
- "What happens to our plan if [dependency X] is late?"
- "Who else is depending on our deliverables?"
- "What's our fallback if a key dependency fails?"

**For Team Capacity:**
- "What's the realistic availability of key people (not just allocated time)?"
- "What other commitments compete for this team's attention?"
- "Who are the bottleneck resources, and what's our plan if they're unavailable?"
- "What skills gaps exist, and how will we address them?"

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Effort estimation** | Analyse historical data; generate estimate ranges with confidence intervals | Calibrate to team context; judge applicability of historical analogues |
| **Risk identification** | Pattern match to similar project risks; enumerate from risk taxonomies | Assess organisational/political risks; judge likelihood and impact |
| **Schedule generation** | Generate candidate schedules; identify critical path; flag conflicts | Validate against team knowledge; adjust for unstated constraints |
| **Resource allocation** | Match skills to tasks; identify gaps; optimise utilisation | Assess team dynamics; navigate allocation politics |
| **Dependency mapping** | Extract dependencies from documentation; visualise network | Identify tacit dependencies; assess reliability of external commitments |
| **Contingency planning** | Generate scenarios; calculate impact of risks materialising | Judge which risks warrant contingency; decide acceptable exposure |

#### Information Debt Risk

Planning is particularly vulnerable to **proceeding at risk** because:
- Pressure to start "real work" (Implementation) creates urgency to complete planning
- Uncertainty is inherent—waiting for "sufficient information" can feel like paralysis
- Estimates are always uncertain; there's no clear "sufficient" threshold

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests Later |
|--------------|----------------|------------------------|
| Optimistic estimates | Tacit knowledge of actual complexity | Schedule slips, overtime, scope cuts |
| Undocumented assumptions | Explicit statement of what must be true | Surprises when assumptions fail |
| Ignored dependencies | Assessment of external reliability | Blocked work, critical path changes |
| Paper governance | Real decision authority understanding | Delays awaiting approvals nobody knew were needed |

#### What Must Be Preserved

- Human judgement on estimation (AI can inform, not decide)
- Organisational/political context understanding
- Stakeholder relationship management
- Risk appetite calibration to organisational culture

#### Transition Readiness: Planning → Requirements

Sufficiency for `SCOPE_BOUNDED` is context-dependent. AI can help surface readiness through:

- "What would you need to know before committing resources to detailed requirements work?"
- "What level of estimate confidence is acceptable to proceed?"
- "What risks are you comfortable carrying forward vs. resolving now?"
- "If you proceed now and the plan is wrong, what's the cost of rework?"
- "Who needs to approve before requirements work begins, and are they ready?"

#### Evolution Risk

- AI-generated schedules that look precise but encode unrealistic assumptions
- Over-reliance on historical data that doesn't match current context
- Plans that satisfy formal criteria but miss tacit organisational constraints

---

### Phase 3: Analysis/Requirements

**ISO 12207 Processes**: 6.4.2 Stakeholder Needs and Requirements Definition, 6.4.3 System/Software Requirements Definition

**Information Composition**: 55% Formal / 30% Tacit / 15% Emergent

**Primary Question**: WHAT—stakeholder needs, formal specifications

**The Formalisation Challenge**: Requirements sits at the critical point where tacit understanding must become formal specification. This is where "what we all know" must become "what is explicitly documented"—and where the gap between these often causes project failure.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*
*Detailed registry: [Example Document Type Registry (Phase 3)](./concepts/example_document-type-registry.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 3 |
|---------------|--------|----------|-------------------|
| Enterprise Domain Model | REF | Standing | Consistent entity definitions across projects |
| Organisational Glossary | REF | Standing | Standard terminology |
| Requirements Standards | REF | Standing | Templates, quality criteria, traceability requirements |
| Regulatory Requirements | SPC | Standing | Compliance constraints that apply |
| UI/UX Guidelines | REF | Standing | User experience standards |
| Integration Standards | REF | Standing | How systems connect; API conventions |

**AI should ask**: "Are there organisational domain models, glossaries, or requirements standards I should follow? What regulatory or compliance requirements apply?"

**Project Inputs** (Scope: Project — from Phase 1 & 2):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| Business Case (STR-001) | STR | Standing | Phase 1 |
| Project Charter (STR-002) | STR | Standing | Phase 1 |
| Scope Statement (STR-003) | STR | Standing | Phase 2 |
| Risk Register (STR-004) | STR | Dynamic | Phase 2 |
| Stakeholder Map | STR | Dynamic | Phase 1 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Stakeholder Requirements (SPC-001) | SPC | Standing | Design, Testing |
| System Requirements (SPC-002) | SPC | Standing | Design, Implementation, Testing |
| Business Rules Catalogue (SPC-003) | SPC | Standing | Design, Implementation, Testing |
| Traceability Matrix (SPC-004) | SPC | Dynamic | All phases |
| Prioritised Backlog (SPC-005) | SPC | Dynamic | Design, Implementation |
| Domain Model (REF-001) | REF | Standing | Design, Implementation |
| Glossary (REF-002) | REF | Standing | All phases |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Interview Notes (WRK-001) | WRK | Stakeholder conversations | SPC-001 |
| Workshop Output (WRK-002) | WRK | Group elicitation sessions | SPC-001, REF-001 |
| Analysis Notes (WRK-003) | WRK | Analytical reasoning | SPC-002, SPC-003 |
| Legacy Code Analysis (WRK-004) | WRK | Reverse-engineered understanding | SPC-003, REF-001 |

**Historical Documents** (Scope: Project — negative knowledge):

| Document Type | Domain | Purpose |
|---------------|--------|---------|
| Discarded Alternative (HST-001) | HST | Requirements approaches rejected with rationale |

**Process Validation**: Interview notes and workshop outputs must capture rationale at creation time (capture window). AI should validate rationale is present before synthesis into standing documents.

#### Information Flow

**Inputs from Phase 1 & 2:**

| From Prior Phases | Type | How It Informs Requirements |
|-------------------|------|----------------------------|
| Vision/Mission | Formal (captured) | Alignment check—do requirements serve the vision? |
| Objectives | Formal | Traceability anchor—requirements must connect to objectives |
| Constraints | Formal + Tacit | Boundary conditions—what must be respected |
| Success criteria | Formal | Acceptance thresholds—how requirements will be validated |
| Stakeholder map | Formal | Who to elicit from; whose needs matter |
| Risk assessment | Formal | What could invalidate requirements |
| Project plan | Formal | Timeline and resource constraints on requirements scope |

**New Data Sources for Phase 3:**

| Category | Sources | Type |
|----------|---------|------|
| **Domain documentation** | Process documentation, business rules, policies, regulations | Formal |
| **Existing systems** | Current system behaviour, data schemas, interfaces, APIs | Formal |
| **User research** | Interviews, observations, journey maps, personas | Formal (captured) / Tacit (uncaptured) |
| **Analytics** | Usage data, error logs, support tickets, performance metrics | Formal |
| **Comparable systems** | Competitor analysis, industry standards, similar implementations | Formal |
| **Stakeholder dialogue** | Requirements workshops, reviews, clarification conversations | Tacit / Emergent |

#### Qualitative Information Types

| Type | Definition | Why It Matters |
|------|------------|----------------|
| **User mental models** | How users think about the domain and their tasks | Requirements that violate mental models fail in practice |
| **Business rules** | Policies, calculations, constraints governing behaviour | Often unstated until contradicted |
| **Exception handling** | What happens when things go wrong | Often discovered late; causes rework |
| **Priority framework** | Which requirements matter most and why | Enables trade-offs when constraints bite |
| **Acceptance criteria** | How we'll know a requirement is satisfied | Prevents "I'll know it when I see it" |
| **Rationale** | Why each requirement exists | Enables intelligent change decisions |

#### AI Active Validation Process (Eight Capabilities)

AI doesn't passively record—it actively validates, challenges, and escalates using all eight capabilities:

```
┌─────────────────────────────────────────────────────────────────────┐
│           AI ACTIVE VALIDATION IN REQUIREMENTS                      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. ELICIT ────────────────────────────────────────────────────     │
│     Ask structured questions to surface tacit understanding         │
│     "Walk me through what happens when..."                          │
│     "What if [edge case] occurs?"                                   │
│                                                                     │
│  2. ANALYSE ───────────────────────────────────────────────────     │
│     Examine captured information for:                               │
│     • Internal consistency (contradicts earlier statement?)         │
│     • External consistency (conflicts with other requirements?)     │
│     • Completeness (missing edge cases? unstated assumptions?)      │
│     • Ambiguity (terms with multiple interpretations?)              │
│     • Traceability (connects to objectives? has rationale?)         │
│                                                                     │
│  3. SYNTHESISE ────────────────────────────────────────────────     │
│     Combine inputs into coherent picture:                           │
│     • Aggregate requirements from multiple stakeholders             │
│     • Propose unified view for validation                           │
│     • Identify patterns across requirements                         │
│                                                                     │
│  4. VALIDATE ──────────────────────────────────────────────────     │
│     Present understanding back for checking:                        │
│     "Here's what I understood—is this correct?"                     │
│     "This seems to conflict with X—which is right?"                 │
│     "I notice you didn't mention Y—is that intentional?"            │
│                                                                     │
│  5. TRANSFORM ─────────────────────────────────────────────────     │
│     Convert validated requirements between formats:                 │
│     • Narrative → User stories → Acceptance criteria                │
│     • Human reviews for semantic preservation                       │
│                                                                     │
│  6. DECIDE (surface for human) ────────────────────────────────     │
│     AI cannot decide, but surfaces decision points:                 │
│     • Present options with trade-offs                               │
│     • Highlight implications of each choice                         │
│     • Flag where human judgement is required                        │
│                                                                     │
│  7. GENERATE ──────────────────────────────────────────────────     │
│     Produce draft artifacts for validation:                         │
│     • Requirements specifications                                   │
│     • Acceptance criteria                                           │
│     • Test scenarios                                                │
│                                                                     │
│  8. PRESERVE ──────────────────────────────────────────────────     │
│     Store with full context:                                        │
│     • Requirement + Rationale + Source + Decisions + Assumptions    │
│     • Links to objectives, stakeholders, constraints                │
│     • Record of what was escalated and how resolved                 │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### AI Challenge Questions (Active Validation)

**For Consistency:**
- "You mentioned [X] earlier, but now you're saying [Y]—which is correct?"
- "This requirement conflicts with [other requirement]—how should we resolve this?"
- "Stakeholder A wants [X], Stakeholder B wants [Y]—who has priority?"

**For Completeness:**
- "What happens if [input] is missing or invalid?"
- "You've described the success path—what are the failure modes?"
- "Who handles exceptions to this rule?"
- "What's the maximum/minimum acceptable for this value?"

**For Ambiguity:**
- "When you say '[term]', do you mean [interpretation A] or [interpretation B]?"
- "How would you define 'quickly' in measurable terms?"
- "What exactly counts as a '[category]' for this rule?"

**For Assumptions:**
- "You seem to be assuming [X]—is that always true?"
- "This depends on [external system]—what if it's unavailable?"
- "Is [constraint] actually fixed, or could it change?"

**For Rationale:**
- "Why is this requirement important? What problem does it solve?"
- "If we didn't include this, what would happen?"
- "How does this connect to the business objectives we discussed?"

**For Prioritisation:**
- "If we can only deliver two of these three requirements, which two?"
- "Is this a must-have or a nice-to-have? What's the impact if we defer it?"
- "What's more important: [feature A] or [feature B]?"

#### Escalation Framework

| Escalation Type | Trigger | AI Action | Human Action Required |
|-----------------|---------|-----------|----------------------|
| **Conflict** | Stakeholders disagree | Present both positions; request resolution | Decide or facilitate negotiation |
| **Constraint violation** | Requirement exceeds bounds | Flag specific violation; present options | Adjust scope or negotiate constraint |
| **Ambiguity** | Multiple valid interpretations | List interpretations; request clarification | Specify intended meaning |
| **Missing rationale** | No "why" captured | Ask directly; flag if still missing | Provide justification or remove requirement |
| **Completeness gap** | Edge case unaddressed | Identify specific gap; propose scenarios | Specify handling or accept as out of scope |
| **Assumption risk** | Unstated dependency | Surface assumption; request validation | Confirm, reject, or document as risk |
| **Confidence low** | Stakeholder uncertain | Flag uncertainty; request validation source | Confirm, research, or document as risk |

#### The Dialogue Loop in Requirements

```
┌─────────────────────────────────────────────────────────────────────┐
│                PHASE 3: ANALYSIS/REQUIREMENTS                       │
│                    The Active Validation Loop                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  INPUTS                          CAPTURE & ANALYSE                  │
│  ──────                          ────────────────                   │
│  Domain docs ────┐                                                  │
│  Existing sys ───┤               ┌──────────────────┐               │
│  User research ──┼──► AI ───────►│   AI ANALYSES    │               │
│  Analytics ──────┤    CAPTURES   │   for issues:    │               │
│  Stakeholder ────┘               │   • Consistency  │               │
│  dialogue                        │   • Completeness │               │
│                                  │   • Ambiguity    │               │
│                                  │   • Assumptions  │               │
│                                  └────────┬─────────┘               │
│                                           │                         │
│                    ┌──────────────────────┼──────────────────────┐  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │  AI CHALLENGES   │            │  │
│                    │             │  "You said X,    │            │  │
│                    │             │   but also Y—    │            │  │
│                    │             │   which is it?"  │            │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │ HUMAN RESPONDS   │            │  │
│                    │             │ clarifies,       │            │  │
│          ITERATE   │             │ decides,         │            │  │
│          UNTIL     │             │ resolves         │            │  │
│          STABLE    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │ AI VALIDATES     │            │  │
│                    │             │ "So to confirm,  │            │  │
│                    │             │  you mean..."    │◄──┐        │  │
│                    │             └────────┬─────────┘   │        │  │
│                    │                      │             │        │  │
│                    │                      ▼             │        │  │
│                    │             ┌──────────────────┐   │        │  │
│                    │             │ HUMAN CONFIRMS   │   │        │  │
│                    │             │ or corrects      ├───┘        │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    └──────────────────────┼──────────────────────┘  │
│                                           │                         │
│                         ┌─────────────────┴─────────────────┐       │
│                         │                                   │       │
│                         ▼                                   ▼       │
│                ┌──────────────────┐              ┌──────────────┐   │
│                │  AI ESCALATES    │              │ AI GENERATES │   │
│                │  issues needing  │              │ requirements │   │
│                │  human decision  │              │ spec draft   │   │
│                └────────┬─────────┘              └──────┬───────┘   │
│                         │                               │           │
│                         ▼                               ▼           │
│                ┌──────────────────┐              ┌──────────────┐   │
│                │  HUMAN DECIDES   │              │ AI PRESERVES │   │
│                │  conflicts,      │              │ with full    │   │
│                │  trade-offs,     │              │ context and  │   │
│                │  priorities      │              │ rationale    │   │
│                └──────────────────┘              └──────────────┘   │
│                                                                     │
│  OUTPUTS: Validated requirements specification with rationale,      │
│           traceability, and documented decisions                    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Elicitation** | Generate probing questions; identify gaps; surface edge cases | Judge what questions to ask; read between the lines; build rapport |
| **Analysis** | Check consistency; identify conflicts; trace to objectives | Judge significance of conflicts; understand political context |
| **Specification** | Draft requirements in standard formats; generate acceptance criteria | Validate semantic accuracy; ensure tacit knowledge captured |
| **Validation** | Present synthesised understanding; challenge assumptions | Confirm accuracy; provide corrections; add tacit context |
| **Prioritisation** | Present trade-offs; model impact of choices | Make priority decisions; judge business value |
| **Change management** | Track requirement changes; assess impact | Approve changes; negotiate with stakeholders |

#### Information Debt Risk

Requirements is the phase where information debt is most dangerous because:
- Errors here propagate forward into design and implementation
- Tacit knowledge that isn't captured here is often lost forever
- "Obvious" requirements that everyone "knows" are never documented

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests Later |
|--------------|----------------|------------------------|
| Undocumented assumptions | Explicit statement of what must be true | Surprises when assumptions don't hold |
| Missing edge cases | Exception handling specifications | Bug reports for "obvious" scenarios |
| Ambiguous terms | Precise definitions | Different interpretations cause rework |
| Implicit business rules | Documented decision logic | "That's not how it works" late in testing |
| Missing rationale | Why requirements exist | Inability to make intelligent trade-offs |
| Stakeholder conflicts unresolved | Decision on conflicting needs | Rework when conflict surfaces later |

#### What Must Be Preserved

- Human understanding of stakeholder needs (beyond stated requirements)
- Domain expertise and business context
- Judgement on what's truly important vs. nice-to-have
- Stakeholder relationships and trust
- Ability to read between the lines, detect unstated concerns

#### Transition Readiness: Requirements → Design

Sufficiency for `REQUIREMENTS_BASELINED` is context-dependent. AI can help surface readiness through:

- "Are there unresolved stakeholder conflicts that should be decided before design begins?"
- "What requirements have low confidence? What would increase confidence?"
- "Which requirements have missing rationale? Is that acceptable?"
- "What assumptions are we carrying forward? Are stakeholders aware of them?"
- "If design reveals these requirements are infeasible, what's the rework cost?"
- "What's the risk of starting design now vs. waiting for more clarity on [uncertain area]?"

#### Evolution Risk

- AI surfaces conflicts → team avoids resolution → conflict re-emerges in testing
- Requirements look complete and precise but miss the tacit "obvious" knowledge
- Stakeholders defer to AI-generated requirements without genuine engagement
- Over-specified requirements constrain design unnecessarily
- Under-specified requirements seem "good enough" because the document looks polished

---

### Phase 4: Design/Architecture

**ISO 12207 Processes**: 6.4.4 Architecture Definition, 6.4.5 Design Definition

**Information Composition**: 65% Formal / 25% Tacit / 10% Emergent

**Primary Question**: HOW (to build)—solution structure, component design, technical decisions

**The Trade-off Challenge**: Design is inherently about choices. Every architectural decision involves trade-offs—performance vs. maintainability, flexibility vs. simplicity, build vs. buy. Multiple valid solutions exist; the "right" answer depends on context, constraints, and values that AI cannot fully assess.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 4 |
|---------------|--------|----------|-------------------|
| Reference Architecture | DES | Standing | Structural patterns to follow |
| Technology Standards | REF | Standing | Approved technologies, platforms |
| Architecture Principles | REF | Standing | Guiding principles for decisions |
| Integration Standards | REF | Standing | How systems connect; API conventions |
| Security Standards | REF | Standing | Security patterns, requirements |
| Coding Standards | REF | Standing | Implementation conventions |
| Build vs. Buy Policy | STR | Standing | Make/buy decision criteria |
| Architecture Review Process | REF | Standing | Approval gates, review criteria |

**AI should ask**: "Are there reference architectures, technology standards, or architecture principles I should follow? What integration and security standards apply?"

**Project Inputs** (Scope: Project — from Phase 1-3):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| System Requirements (SPC-002) | SPC | Standing | Phase 3 |
| Business Rules Catalogue (SPC-003) | SPC | Standing | Phase 3 |
| Domain Model (REF-001) | REF | Standing | Phase 3 |
| Glossary (REF-002) | REF | Standing | Phase 3 |
| Risk Register (STR-004) | STR | Dynamic | Phase 2 |
| Constraints | STR | Standing | Phase 1 & 2 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Architecture Description (DES-001) | DES | Standing | Implementation, Testing, Operations |
| Component Design (DES-002) | DES | Standing | Implementation |
| Data Architecture (DES-003) | DES | Standing | Implementation, Operations |
| Interface Specifications | DES | Standing | Implementation, Integration |
| Architecture Decision Records (ADRs) | STR | Standing | All phases; future maintenance |
| Technical Debt Register | STR | Dynamic | Implementation, Operations |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Design Spike Notes | WRK | Proof-of-concept findings | DES-001, ADRs |
| Trade-off Analysis Notes | WRK | Options evaluated, rationale | ADRs |
| Architecture Review Notes | WRK | Review feedback, decisions | DES-001, ADRs |

**Historical Documents** (Scope: Project — negative knowledge):

| Document Type | Domain | Purpose |
|---------------|--------|---------|
| Discarded Alternative (HST-001) | HST | Design approaches rejected with rationale |

**Process Validation**: Trade-off analysis must capture rationale for decisions. AI should flag ADRs missing "Consequences" or "Alternatives Considered" sections.

#### Collaboration Modes in Design

Design work may operate in different actor model modes depending on context:

| Mode | Description | When Appropriate |
|------|-------------|------------------|
| **Human-led** (Mode 2) | Human drives design; AI assists with research, options, documentation | Novel domains, high-stakes architecture, significant tacit knowledge required |
| **Collaborative** (Mode 3) | Human and AI work together iteratively; AI proposes, human evaluates and refines | Established patterns with team expertise; exploration of solution space |
| **AI-led** (Mode 4) | AI generates design; human validates and approves | Well-understood problems, strong existing patterns, implementation-level design |

Mode selection should consider:
- Team's domain expertise and design experience
- Novelty of the problem (novel → human-led; familiar → AI-led possible)
- Criticality and reversibility of decisions
- Availability of established patterns and precedents

#### Domain-Driven Design as Informing Practice

Where Domain-Driven Design (DDD) practices are in use, they provide rich informational context that enhances design:

- **Ubiquitous language** — shared vocabulary reduces ambiguity; AI should use and validate domain terms
- **Bounded contexts** — clear boundaries inform component decomposition
- **Domain events** — explicit events inform integration and data flow design
- **Aggregates and entities** — domain models inform data architecture

AI should ask: "Is there an established domain model or ubiquitous language I should use?"

*Note: DDD is a recommended practice where appropriate, not a mandatory framework element.*

#### Information Flow

**Inputs from Prior Phases:**

| From Prior Phases | Type | How It Informs Design |
|-------------------|------|----------------------|
| Requirements specification | Formal | What must be built; functional boundaries |
| Non-functional requirements | Formal + Tacit | Quality attributes that constrain solution space |
| Constraints | Formal | Technical, regulatory, resource boundaries |
| Risk assessment | Formal | What could go wrong; what needs mitigation |
| Rationale documentation | Formal | Why requirements exist; enables intelligent trade-offs |
| Stakeholder priorities | Formal + Tacit | What matters most when trade-offs required |
| Domain model (if DDD) | Formal | Bounded contexts, aggregates, ubiquitous language |

**New Data Sources for Phase 4:**

| Category | Sources | Type |
|----------|---------|------|
| **Organisational context** | Architecture standards, technology policies, design guidelines | Formal |
| **Technical landscape** | Existing architecture, technology stack, integration points | Formal |
| **Pattern libraries** | Architectural patterns, design patterns, anti-patterns | Formal |
| **Technology evaluation** | Vendor documentation, benchmarks, proof-of-concepts | Formal |
| **Team expertise** | What technologies the team knows; learning capacity | Tacit |
| **Operational context** | Deployment environment, operational constraints, SLAs | Formal + Tacit |
| **Prior designs** | Similar systems, lessons learned, post-mortems | Formal (if documented) / Tacit |
| **Industry standards** | Security standards, compliance frameworks, best practices | Formal |

#### Qualitative Information Types

| Type | Definition | Why It Matters |
|------|------------|----------------|
| **Architectural drivers** | The requirements that most influence structure | Focus attention on what shapes the solution |
| **Quality attribute trade-offs** | How competing qualities balance | Explicit trade-offs prevent implicit compromises |
| **Design rationale** | Why this approach, not alternatives | Enables future change; prevents re-litigation |
| **Technical debt acceptance** | What shortcuts are acceptable and why | Conscious debt vs. accidental debt |
| **Integration assumptions** | How components will interact | Interfaces fail when assumptions differ |
| **Operational model** | How this will run in production | Design for operations, not just development |

#### AI Active Validation Process for Design

Design validation requires AI to challenge architectural decisions, surface trade-offs, and ensure rationale is captured:

```
┌─────────────────────────────────────────────────────────────────────┐
│              AI ACTIVE VALIDATION IN DESIGN                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. ELICIT ────────────────────────────────────────────────────     │
│     Surface design thinking and rationale:                          │
│     "Why did you choose [approach X] over [approach Y]?"            │
│     "What happens to this design if [constraint] changes?"          │
│     "What trade-offs are you making with this approach?"            │
│                                                                     │
│  2. ANALYSE ───────────────────────────────────────────────────     │
│     Examine design for:                                             │
│     • Requirement coverage (does design address all requirements?)  │
│     • Constraint compliance (does design respect boundaries?)       │
│     • Consistency (do components make compatible assumptions?)      │
│     • Completeness (are failure modes, edge cases addressed?)       │
│     • Quality attributes (how does design affect -ilities?)         │
│     • Pattern compliance (does it follow organisational standards?) │
│                                                                     │
│  3. SYNTHESISE ────────────────────────────────────────────────     │
│     Integrate design elements:                                      │
│     • Aggregate component designs into system view                  │
│     • Identify emergent properties from component interactions      │
│     • Map design decisions to requirements traceability             │
│                                                                     │
│  4. VALIDATE ──────────────────────────────────────────────────     │
│     Present design understanding for confirmation:                  │
│     "This design assumes [X]—is that correct?"                      │
│     "Component A expects [interface], Component B provides [Y]—     │
│      are these compatible?"                                         │
│     "This approach prioritises [quality A] over [quality B]—        │
│      is that the intended trade-off?"                               │
│                                                                     │
│  5. TRANSFORM ─────────────────────────────────────────────────     │
│     Convert between design representations:                         │
│     • Conceptual → Logical → Physical architecture                  │
│     • Diagrams ↔ Specifications ↔ Code structures                   │
│     • Human validates semantic preservation                         │
│                                                                     │
│  6. DECIDE (surface for human) ────────────────────────────────     │
│     AI presents options, humans choose:                             │
│     "Here are three approaches to [problem], with trade-offs..."    │
│     "This decision will constrain future options—are you sure?"     │
│     "This conflicts with [earlier decision]—which takes priority?"  │
│                                                                     │
│  7. GENERATE ──────────────────────────────────────────────────     │
│     Produce design artifacts:                                       │
│     • Architecture diagrams, component specifications               │
│     • Interface definitions, data models                            │
│     • Draft implementation scaffolding                              │
│                                                                     │
│  8. PRESERVE ──────────────────────────────────────────────────     │
│     Store design with full context:                                 │
│     • Decision + Rationale + Alternatives considered                │
│     • Trade-offs made + Constraints respected                       │
│     • Assumptions + Dependencies + Risks                            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### AI Challenge Questions for Design

**For Organisational Context:**
- "Are there architecture standards I should be following?"
- "What technology choices have already been made?"
- "Are there patterns from similar projects I should consider?"
- "What existing systems does this need to integrate with?"

**For Architectural Decisions:**
- "Why this architecture pattern and not [alternative]?"
- "What would cause you to reconsider this approach?"
- "How does this scale if [load/data/users] grows 10x?"
- "What happens when [component X] fails?"

**For Trade-offs:**
- "You're choosing [performance] over [maintainability]—is that intentional?"
- "This approach makes [future change] harder—is that acceptable?"
- "What are you giving up by choosing this approach?"
- "How will you know if this trade-off was the right one?"

**For Integration:**
- "Component A assumes [X], Component B assumes [Y]—are these compatible?"
- "What's the contract between these components? Is it documented?"
- "How will these components handle version differences?"
- "What happens if [dependency] behaves differently than expected?"

**For Operational Reality:**
- "How will you deploy changes to this component?"
- "How will you know if this is working correctly in production?"
- "What's the recovery path if this fails?"
- "Who will be woken up at 3am when this breaks, and what will they need?"

**For Technical Debt:**
- "Is this a shortcut you're taking consciously? What's the payback plan?"
- "What would the 'right' solution look like, and why aren't you doing it?"
- "What's the cost if this technical debt is never paid?"

#### Escalation Framework for Design

| Escalation Type | Trigger | AI Action | Human Action Required |
|-----------------|---------|-----------|----------------------|
| **Trade-off conflict** | Quality attributes in tension | Present trade-off analysis with implications | Decide which quality takes priority |
| **Constraint violation** | Design exceeds boundaries | Flag violation; present alternatives | Adjust design or negotiate constraint |
| **Standards deviation** | Design diverges from org patterns | Flag deviation; request justification | Approve exception or align to standard |
| **Assumption mismatch** | Components have incompatible assumptions | Surface conflict; propose resolution options | Decide authoritative assumption |
| **Missing rationale** | Decision without documented "why" | Ask directly; flag if still missing | Provide rationale or accept as risk |
| **Irreversible decision** | Choice that constrains future significantly | Highlight implications; request confirmation | Confirm with full understanding |
| **Experience gap** | Design uses unfamiliar technology | Flag risk; suggest mitigation options | Accept risk or adjust approach |
| **Operational concern** | Design creates operational burden | Surface concern; propose alternatives | Accept burden or redesign |

#### The Design Dialogue Loop

```
┌─────────────────────────────────────────────────────────────────────┐
│                    PHASE 4: DESIGN/ARCHITECTURE                     │
│                     The Design Validation Loop                      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  CONTEXT DISCOVERY                                                  │
│  ─────────────────                                                  │
│  ┌──────────────────────────────────────────────────────────────┐   │
│  │  AI ASKS: "What patterns, standards, policies apply?"        │   │
│  │           "What existing systems must this integrate with?"  │   │
│  │           "What domain model or language should I use?"      │   │
│  └──────────────────────────────────────────────────────────────┘   │
│                              │                                      │
│                              ▼                                      │
│  REQUIREMENTS              EXPLORE SOLUTION SPACE                   │
│  & CONSTRAINTS             ──────────────────────                   │
│  ─────────────                                                      │
│  Functional ─────┐         ┌──────────────────────┐                 │
│  Non-functional ─┤         │   AI EXPLORES        │                 │
│  Constraints ────┼────────►│   within org context,│                 │
│  Priorities ─────┤         │   generates options, │                 │
│  Org standards ──┘         │   analyses trade-offs│                 │
│                            └──────────┬───────────┘                 │
│                                       │                             │
│                    ┌──────────────────┼──────────────────┐          │
│                    │                  ▼                  │          │
│                    │         ┌──────────────────┐        │          │
│                    │         │  AI PRESENTS     │        │          │
│                    │         │  options with    │        │          │
│                    │         │  trade-offs      │        │          │
│                    │         └────────┬─────────┘        │          │
│                    │                  │                  │          │
│                    │                  ▼                  │          │
│                    │         ┌──────────────────┐        │          │
│                    │         │  HUMAN EVALUATES │        │          │
│                    │         │  adds context,   │        │          │
│          ITERATE   │         │  applies judgement│       │          │
│          UNTIL     │         └────────┬─────────┘        │          │
│          STABLE    │                  │                  │          │
│                    │                  ▼                  │          │
│                    │         ┌──────────────────┐        │          │
│                    │         │  AI CHALLENGES   │        │          │
│                    │         │  "Why this? What │        │          │
│                    │         │   if? Trade-off?"│        │          │
│                    │         └────────┬─────────┘        │          │
│                    │                  │                  │          │
│                    │                  ▼                  │          │
│                    │         ┌──────────────────┐        │          │
│                    │         │  HUMAN RESPONDS  │        │          │
│                    │         │  justifies,      │◄──┐    │          │
│                    │         │  reconsiders,    │   │    │          │
│                    │         │  decides         ├───┘    │          │
│                    │         └────────┬─────────┘        │          │
│                    │                  │                  │          │
│                    └──────────────────┼──────────────────┘          │
│                                       │                             │
│                         ┌─────────────┴─────────────┐               │
│                         │                           │               │
│                         ▼                           ▼               │
│                ┌──────────────────┐        ┌──────────────────┐     │
│                │  AI GENERATES    │        │  AI PRESERVES    │     │
│                │  design specs,   │        │  decisions with  │     │
│                │  diagrams,       │        │  rationale,      │     │
│                │  interfaces      │        │  trade-offs,     │     │
│                └──────────────────┘        │  alternatives    │     │
│                                            └──────────────────┘     │
│                                                                     │
│  OUTPUTS: Architecture documentation, component specifications,     │
│           interface definitions, design rationale records           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Context discovery** | Ask about standards, patterns, policies; incorporate into proposals | Provide organisational context; judge applicability |
| **Pattern identification** | Match requirements to known patterns; surface relevant examples | Judge applicability; adapt to context |
| **Trade-off analysis** | Enumerate quality attributes; model trade-off implications | Make trade-off decisions; judge what matters |
| **Option generation** | Generate alternative approaches within org constraints; compare systematically | Select approach; add tacit context |
| **Consistency checking** | Verify component compatibility; check assumption alignment | Resolve conflicts; make integration decisions |
| **Documentation** | Generate diagrams, specifications; maintain consistency | Validate accuracy; ensure rationale captured |
| **Risk identification** | Flag technical risks; surface experience gaps | Assess risk significance; decide mitigation |

#### Information Debt Risk

Design is where conscious trade-offs can become unconscious technical debt:
- Time pressure leads to "we'll fix it later" decisions that are never revisited
- Design rationale isn't captured, so future maintainers don't understand constraints
- Trade-offs are made implicitly without stakeholder awareness
- Organisational patterns are ignored, creating integration friction later

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests Later |
|--------------|----------------|------------------------|
| Undocumented trade-offs | Why this approach over alternatives | Future changes break unstated assumptions |
| Missing failure modes | How components fail and recover | Production incidents with no playbook |
| Implicit interfaces | Clear contracts between components | Integration failures, version conflicts |
| Assumed operational model | How this runs in production | Deployment surprises, operational burden |
| Hidden dependencies | What this really depends on | Upgrade/migration failures |
| Deferred decisions | Choices labelled "TBD" | Implementation blocks waiting for design |
| Standards deviation | Why org patterns weren't followed | Integration friction, maintenance burden |

#### What Must Be Preserved

- Human judgement on architectural trade-offs
- Deep understanding of operational reality
- Experience-based intuition about "what works"
- Stakeholder relationships for trade-off negotiations
- Team knowledge of technology capabilities and limitations
- Organisational context and political realities

#### Transition Readiness: Design → Implementation

Sufficiency for `ARCHITECTURE_APPROVED` is context-dependent. AI can help surface readiness through:

- "Are there significant design decisions still marked 'TBD'?"
- "What components have uncertain interfaces? What's the risk of starting implementation?"
- "Are there trade-offs that stakeholders haven't explicitly approved?"
- "What assumptions is this design making that haven't been validated?"
- "Does this design comply with organisational standards? Are deviations approved?"
- "If implementation reveals this design is flawed, what's the rework cost?"
- "What's the risk of starting implementation now vs. waiting for [uncertain area] to be resolved?"
- "Is the team confident they understand the design well enough to implement it?"

#### Evolution Risk

- AI-generated designs that look elegant but miss operational reality
- Trade-offs made by AI optimisation that don't reflect stakeholder values
- Over-engineering driven by AI pattern matching to "best practices"
- Under-documented designs because the diagrams "speak for themselves"
- Team disengagement because "the AI designed it"
- Ignoring organisational context because AI proposed "the right way"
- DDD cargo-culting without genuine domain understanding

---

### Phase 5: Implementation/Construction

*To be developed*

---

### Phase 6: Testing/Validation

*To be developed*

---

### Phase 7: Deployment/Operations

*To be developed*

---

## Collaboration Pattern Progression

*To be developed*

Guidance for progressively shifting collaboration patterns while maintaining team capability.

---

## Risk Mitigation

*To be developed*

- Knowledge preservation strategies
- Rollback mechanisms
- Competency maintenance

---

## Measurement

*To be developed*

How to measure successful evolution without disrupting productivity.

---

## Relationship to Revolution

Evolution and Revolution are not mutually exclusive. Organisations may:
- Start with Evolution, transition to Revolution when ready
- Apply Evolution to some phases, Revolution to others
- Use Evolution as fallback when Revolution encounters resistance

[→ See: `dialogue-framework-revolution.md`]

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 0.6 | December 2025 | Added Document Types sections to all phases (Org/Project/Working); linked to classification framework |
| 0.5 | December 2025 | Added detailed Phase 4 (Design/Architecture) with collaboration modes, DDD as informing practice |
| 0.4 | December 2025 | Added detailed Phase 3 (Analysis/Requirements) with AI Active Validation Process |
| 0.3 | December 2025 | Added detailed Phase 2 (Planning); added transition readiness questions |
| 0.2 | December 2025 | Added detailed Phase 1 (Initiation/Conception); corrected phase names |
| 0.1 | December 2025 | Initial placeholder |

---

*Evolution: Enhancing what works through dialogue.*
