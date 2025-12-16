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

**ISO 12207 Processes**: 6.4.6 Implementation, 6.4.7 Integration

**Information Composition**: 75% Formal / 20% Tacit / 5% Emergent

**Primary Question**: BUILD—code creation, integration, working software

**The Formalisation Paradox**: Code is highly formal—it executes precisely as written. Yet the understanding behind code (why this approach, what alternatives were considered, how it connects to requirements) remains largely tacit. AI can generate syntactically correct code without understanding; humans can understand without being able to articulate.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 5 |
|---------------|--------|----------|-------------------|
| Coding Standards | REF | Standing | Style, conventions, patterns to follow |
| Security Guidelines | REF | Standing | Secure coding practices |
| Code Review Checklist | REF | Standing | What reviewers should check |
| CI/CD Pipeline Standards | OPS | Standing | Build, test, deploy requirements |
| Testing Standards | VAL | Standing | Coverage requirements, test types |
| Documentation Standards | REF | Standing | What code documentation is required |
| Approved Libraries/Frameworks | REF | Dynamic | What dependencies are permitted |
| Logging/Observability Standards | OPS | Standing | What to log, how to instrument |

**AI should ask**: "Are there coding standards, security guidelines, or approved libraries I should follow? What CI/CD and testing requirements apply?"

**Project Inputs** (Scope: Project — from Phase 3 & 4):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| System Requirements (SPC-002) | SPC | Standing | Phase 3 |
| Architecture Description (DES-001) | DES | Standing | Phase 4 |
| Component Design (DES-002) | DES | Standing | Phase 4 |
| Interface Specifications | DES | Standing | Phase 4 |
| Data Architecture (DES-003) | DES | Standing | Phase 4 |
| ADRs | STR | Standing | Phase 4 |
| Technical Debt Register | STR | Dynamic | Phase 4 |
| Prioritised Backlog (SPC-005) | SPC | Dynamic | Phase 3 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Source Code (IMP-001) | IMP | Dynamic | Testing, Operations |
| API Documentation | IMP | Dynamic | Testing, Integration, Operations |
| Build Configuration | IMP | Standing | CI/CD, Operations |
| Database Scripts/Migrations | IMP | Dynamic | Operations |
| Unit Tests | VAL | Dynamic | CI/CD, Testing |
| Integration Points | IMP | Dynamic | Testing, Operations |
| Technical Debt Items | STR | Dynamic | Future Implementation |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Code Review Comments | WRK | Review feedback, decisions | Code improvements, knowledge transfer |
| Spike/Prototype Notes | WRK | Exploratory findings | Implementation approach |
| Debug Session Notes | WRK | Problem investigation | Bug fixes, knowledge |
| Pairing Session Notes | WRK | Shared problem-solving | Code, team knowledge |

**Process Validation**: Code reviews must capture *why* changes were requested, not just *what*. AI should flag reviews with only "fix this" comments lacking rationale.

#### Collaboration Modes in Implementation

Implementation is where AI-led work becomes most viable—but with important caveats:

| Mode | Description | When Appropriate |
|------|-------------|------------------|
| **Human-only** (Mode 1) | Human writes code; no AI involvement | Cryptographic implementations, regulated code (medical/aviation), IP-sensitive code |
| **Human-led** (Mode 2) | Human writes code; AI assists with research, completion, review | Novel algorithms, critical security code, complex business logic |
| **Collaborative** (Mode 3) | Human and AI pair; AI generates, human reviews and refines | Most implementation work; established patterns with variation |
| **AI-led** (Mode 4) | AI generates complete implementations; human validates | Boilerplate, CRUD operations, well-defined transformations, tests from specs |
| **Fully autonomous** (Mode 5) | AI executes without human in loop | CI/CD builds, automated formatting, dependency updates, code generation pipelines |

**Mode transitions during implementation:**
- AI-led coding → comprehension check fails → Human-led rewrite (Mode 4 → Mode 2)
- Collaborative coding → security concern detected → Human-only review (Mode 3 → Mode 1)
- Autonomous pipeline → build failure → Collaborative investigation (Mode 5 → Mode 3)

**Governance for Mode 5 (Autonomous):**
- Defined scope: only pre-approved automation (builds, formatting, dependency updates)
- Automatic escalation: build failures, security scan alerts, test failures
- Human approval required before merge regardless of autonomous checks

**Critical consideration**: AI-led implementation risks creating code that works but that no human understands. This creates maintenance debt even when there's no technical debt.

#### AI Active Validation Process for Implementation

```
┌─────────────────────────────────────────────────────────────────────┐
│           AI ACTIVE VALIDATION IN IMPLEMENTATION                    │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. ELICIT ────────────────────────────────────────────────────     │
│     Clarify implementation intent:                                  │
│     "What should happen when [edge case]?"                          │
│     "How should this handle [error condition]?"                     │
│     "What's the expected performance for this operation?"           │
│                                                                     │
│  2. ANALYSE ───────────────────────────────────────────────────     │
│     Review code and context for:                                    │
│     • Requirement coverage (does code implement the requirement?)   │
│     • Design compliance (does it follow architecture?)              │
│     • Standards compliance (coding standards, security)             │
│     • Test coverage (are edge cases tested?)                        │
│     • Integration compatibility (will it work with other parts?)    │
│                                                                     │
│  3. SYNTHESISE ────────────────────────────────────────────────     │
│     Integrate implementation elements:                              │
│     • Combine components into working system                        │
│     • Ensure consistent patterns across codebase                    │
│     • Maintain traceability to requirements                         │
│                                                                     │
│  4. VALIDATE ──────────────────────────────────────────────────     │
│     Verify implementation understanding:                            │
│     "This code assumes [X]—is that correct?"                        │
│     "This will fail if [condition]—is that acceptable?"             │
│     "This trades off [A] for [B]—is that the right choice?"         │
│                                                                     │
│  5. TRANSFORM ─────────────────────────────────────────────────     │
│     Convert between representations:                                │
│     • Requirements → Code                                           │
│     • Design → Implementation                                       │
│     • Code → Tests                                                  │
│     • Code → Documentation                                          │
│                                                                     │
│  6. DECIDE (surface for human) ────────────────────────────────     │
│     AI presents implementation choices:                             │
│     "There are two ways to implement this—[A] or [B]..."            │
│     "This requires a dependency—[X] or [Y]—which is preferred?"     │
│     "This could be optimised for [speed] or [memory]—which?"        │
│                                                                     │
│  7. GENERATE ──────────────────────────────────────────────────     │
│     Produce implementation artifacts:                               │
│     • Source code                                                   │
│     • Unit tests                                                    │
│     • API documentation                                             │
│     • Database migrations                                           │
│                                                                     │
│  8. PRESERVE ──────────────────────────────────────────────────     │
│     Capture implementation knowledge:                               │
│     • Code comments explaining *why* (not just *what*)              │
│     • Commit messages with context                                  │
│     • Technical debt items with rationale                           │
│     • ADR updates for significant decisions                         │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### AI Challenge Questions for Implementation

**For Requirement Traceability:**
- "Which requirement does this code implement?"
- "How would you verify this satisfies the acceptance criteria?"
- "Are there requirements this doesn't fully address?"

**For Design Compliance:**
- "Does this follow the architecture in DES-001?"
- "Is this consistent with similar components in the codebase?"
- "Are you deviating from the design? If so, why?"

**For Edge Cases:**
- "What happens if [input] is null/empty/invalid?"
- "How does this behave under [high load/low memory/network failure]?"
- "What's the worst case scenario for this code?"

**For Maintainability:**
- "Could another developer understand this in six months?"
- "What would make this easier to change later?"
- "Is this the simplest solution that works?"

**For Technical Debt:**
- "Is this a shortcut? What's the proper solution?"
- "What would you do differently with more time?"
- "What assumptions might not hold in the future?"

**For Integration:**
- "How does this interact with [other component]?"
- "What happens if [dependency] changes its interface?"
- "Are you making assumptions about [external system] behaviour?"

#### Escalation Framework for Implementation

| Escalation Type | Trigger | AI Action | Who Decides | Action Required |
|-----------------|---------|-----------|-------------|-----------------|
| **Requirement ambiguity** | Implementation choice depends on unclear requirement | Surface ambiguity; request clarification | **PO + Developer** | Clarify intent or update requirement |
| **Design deviation** | Implementation doesn't match design | Flag deviation; request justification | **Architect** | Approve deviation or adjust implementation |
| **Standards violation** | Code violates org standards | Flag specific violation | **Tech Lead** | Fix or request exception |
| **Security concern** | Potential vulnerability | Flag with severity; suggest fix | **Security + Tech Lead** | Review and remediate |
| **Performance concern** | Implementation may not meet NFRs | Flag with analysis | **Architect + PO** | Accept, optimise, or adjust requirements |
| **Test gap** | Functionality not adequately tested | Identify gap; suggest tests | **Developer + Tester** | Add tests or accept risk |
| **Technical debt creation** | Shortcut being taken | Document debt item with rationale | **Tech Lead** | Approve or invest time to do properly |
| **Integration risk** | Implementation makes integration assumptions | Surface assumptions | **Architect** | Validate with other teams |
| **Dependency addition** | New library/framework needed | Check approved list; flag licensing/security | **Tech Lead + Security** | Approve or reject dependency |
| **Comprehension failure** | Human cannot explain AI-generated code | Flag for rewrite or pairing | **Tech Lead** | Rewrite with understanding or accept risk |
| **Backward event needed** | Implementation reveals upstream issue | Identify likely source (req/design) | **Tech Lead + PO** | Escalate to appropriate phase |

#### Backward Events from Implementation

Implementation often reveals issues requiring return to earlier phases:

| Backward Event | Trigger | Information Debt Created | AI Detection |
|----------------|---------|-------------------------|--------------|
| **Implementation → Design** | Implementation reveals design is infeasible | Design rework + re-implementation | Pattern: "can't work as designed"; repeated workarounds |
| **Implementation → Requirements** | Requirement is ambiguous, contradictory, or impossible | Requirements clarification + cascade | Pattern: frequent "what should happen?" questions |
| **Implementation → Planning** | Implementation taking much longer than estimated | Schedule revision | Pattern: velocity << estimate; scope larger than planned |
| **Implementation → Architecture** | Integration reveals architectural assumptions wrong | Architecture revision | Pattern: integration failures; interface mismatches |

**AI should ask when patterns emerge:**
- "These workarounds suggest a design issue—should we revisit Design?"
- "This requirement appears contradictory—should we escalate to Requirements?"
- "Implementation is taking 3x longer than planned—should we revisit the schedule?"

#### The Implementation Dialogue Loop

```
┌─────────────────────────────────────────────────────────────────────┐
│                 PHASE 5: IMPLEMENTATION/CONSTRUCTION                │
│                    The Implementation Loop                          │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  REQUIREMENTS                  IMPLEMENTATION CYCLE                 │
│  & DESIGN                      ────────────────────                 │
│  ───────────                                                        │
│  Requirements ───┐             ┌──────────────────┐                 │
│  Architecture ───┤             │  HUMAN/AI        │                 │
│  Component ──────┼────────────►│  SELECTS task    │                 │
│  design          │             │  from backlog    │                 │
│  Standards ──────┘             └────────┬─────────┘                 │
│                                         │                           │
│                    ┌────────────────────┼────────────────────┐      │
│                    │                    ▼                    │      │
│                    │           ┌──────────────────┐          │      │
│                    │           │  AI GENERATES    │          │      │
│                    │           │  initial code,   │          │      │
│                    │           │  or assists      │          │      │
│                    │           │  human coding    │          │      │
│                    │           └────────┬─────────┘          │      │
│                    │                    │                    │      │
│                    │                    ▼                    │      │
│                    │           ┌──────────────────┐          │      │
│          ITERATE   │           │  AI VALIDATES    │          │      │
│          UNTIL     │           │  against reqs,   │          │      │
│          COMPLETE  │           │  design,         │          │      │
│                    │           │  standards       │          │      │
│                    │           └────────┬─────────┘          │      │
│                    │                    │                    │      │
│                    │                    ▼                    │      │
│                    │           ┌──────────────────┐          │      │
│                    │           │  AI CHALLENGES   │          │      │
│                    │           │  edge cases,     │          │      │
│                    │           │  assumptions,    │          │      │
│                    │           │  maintainability │          │      │
│                    │           └────────┬─────────┘          │      │
│                    │                    │                    │      │
│                    │                    ▼                    │      │
│                    │           ┌──────────────────┐          │      │
│                    │           │  HUMAN REVIEWS   │          │      │
│                    │           │  understands,    │◄──┐      │      │
│                    │           │  approves,       │   │      │      │
│                    │           │  or refines      ├───┘      │      │
│                    │           └────────┬─────────┘          │      │
│                    │                    │                    │      │
│                    └────────────────────┼────────────────────┘      │
│                                         │                           │
│                         ┌───────────────┴───────────────┐           │
│                         │                               │           │
│                         ▼                               ▼           │
│                ┌──────────────────┐            ┌──────────────────┐ │
│                │  AI GENERATES    │            │  AI PRESERVES    │ │
│                │  tests, docs,    │            │  commit message, │ │
│                │  migrations      │            │  code comments,  │ │
│                │                  │            │  tech debt items │ │
│                └──────────────────┘            └──────────────────┘ │
│                                                                     │
│  OUTPUTS: Working code, tests, documentation, technical debt log    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Code generation** | Generate code from specs; complete partial implementations | Validate correctness; ensure understanding; review edge cases |
| **Code review** | Check standards, patterns, common errors | Judge design quality; assess maintainability; knowledge transfer |
| **Test generation** | Generate unit tests from code/specs; identify edge cases | Validate test quality; ensure meaningful coverage |
| **Documentation** | Generate API docs, code comments from implementation | Ensure accuracy; add context that code doesn't capture |
| **Refactoring** | Identify refactoring opportunities; execute safe refactors | Decide what to refactor; validate behaviour preserved |
| **Debug assistance** | Analyse errors; suggest causes; propose fixes | Judge root cause; validate fixes don't introduce new issues |
| **Integration** | Generate integration code; identify incompatibilities | Resolve complex integration issues; validate end-to-end behaviour |

#### Information Debt Risk

Implementation is where information debt becomes **technical debt**:
- Code that works but isn't understood creates maintenance burden
- "AI wrote it" code that no team member can explain
- Missing tests for edge cases that "seemed obvious"
- Implicit assumptions not documented in code or comments

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests Later | Detection Mechanism |
|--------------|----------------|------------------------|---------------------|
| Undocumented code | Why this approach; what alternatives | Maintenance difficulty; repeated mistakes | Comment-to-code ratio; "why" comment audit |
| Missing tests | Edge case coverage | Production bugs; regression fear | Mutation testing; coverage gap analysis |
| Implicit assumptions | What must be true for code to work | Failures when assumptions violated | Static analysis; assumption documentation audit |
| Copy-paste code | Understanding of copied code | Bugs from inappropriate reuse | Clone detection; similarity analysis |
| AI-generated black box | Human understanding of generated code | Unable to debug or modify | Comprehension checks (Process 5.1) |
| Integration assumptions | How components actually interact | Integration failures; cascading bugs | Contract testing; interface documentation |
| Dependency sprawl | Why dependencies added; alternatives | Upgrade nightmares; security vulnerabilities | Dependency audit; license/security scanning |
| Architectural erosion | Why deviations from design | Architecture becomes meaningless | Architecture compliance monitoring (Process 5.2) |
| Concurrency bugs | Thread safety reasoning | Intermittent production failures | Static analysis for race conditions |
| Security vulnerabilities | Security reasoning | Breaches; compliance failures | Security scanning; code review checklist |

#### Detection and Monitoring

AI should continuously track and report:

| Metric | What It Indicates | Action Threshold |
|--------|-------------------|------------------|
| **AI-assistance ratio** | Reliance on AI for code generation | >80% may indicate skill atrophy risk |
| **Comprehension check pass rate** | Team understanding of codebase | <90% indicates knowledge gaps |
| **Technical debt count/trend** | Debt accumulation rate | Exceeding ceiling triggers remediation |
| **Architecture deviation count** | Design compliance | Rising trend indicates erosion |
| **Dependency growth rate** | Dependency sprawl | Review if >N new dependencies per sprint |
| **Code review depth** | Quality of human review | Declining comment quality indicates rubber-stamping |
| **Clone detection hits** | Copy-paste coding | New clones should trigger review |

**AI should surface these patterns proactively**, not just when asked.

#### What Must Be Preserved

- Human understanding of code (not just working code)
- Knowledge of why this approach, not alternatives
- Team capability to maintain and extend
- Understanding of edge cases and failure modes
- Context that code comments don't capture
- **Developer skills**: Ability to code without AI assistance
- **Debugging intuition**: Human ability to diagnose issues
- **Architectural reasoning**: Understanding of design decisions

**Skill preservation mechanisms:**
- Require periodic human-only coding (Mode 1) for each developer
- Track AI-assistance ratios; flag when >80%
- Rotate developers through different code areas
- Comprehension checks for AI-generated code (Process 5.1)
- Substantive code review requirements (not just approval)

#### Defensive Processes for Implementation

These processes run during implementation to detect and remediate problems:

**Process 5.1: Comprehension Assurance**

*Problem defended against*: AI-generated code nobody understands; knowledge silos

*Trigger*: AI-led (Mode 4) code generation completed; before merge

*Actor Model*: Collaborative (Mode 3) — AI facilitates, human demonstrates understanding

| Step | AI Action | Human Action |
|------|-----------|--------------|
| **Elicit** | Ask human to explain code: "Walk me through what this does", "Why does this approach work?", "What would break if X changed?" | Explain code in own words |
| **Analyse** | Evaluate response for completeness, accuracy, depth | — |
| **Validate** | Challenge gaps: "You didn't mention how [edge case] is handled" | Clarify or acknowledge gap |
| **Decide** | Assess comprehension: Sufficient / Partial / Insufficient | Accept assessment or dispute |
| **Preserve** | Record: who understands this code, documented explanation, gaps accepted | Approve transactive memory update |

*Outcomes*:
- SUFFICIENT: Proceed with merge
- PARTIAL: Document gaps; proceed with risk acceptance
- INSUFFICIENT: Block merge; rewrite with pairing or human-led approach

---

**Process 5.2: Architectural Integrity Monitor**

*Problem defended against*: Architectural erosion; design drift

*Trigger*: Continuous (each commit); periodic (weekly architecture review)

*Actor Model*: AI-led (Mode 4) monitoring → Human-led (Mode 2) when deviation detected

**Continuous Monitoring (Mode 5 - Autonomous):**

AI analyses each change for:
- Dependency direction violations
- Layer boundary crossings
- Component coupling increases
- Pattern deviations from DES-001
- New dependencies not in approved list

**When Deviation Detected:**

| Severity | Criteria | Response |
|----------|----------|----------|
| MINOR | Style deviation, easily reversed | Document; allow with note |
| MODERATE | Pattern deviation | Architect approval required |
| MAJOR | Architectural principle violation | Block merge; requires ADR + architect approval |

**Periodic Review (Weekly - Mode 2):**

AI synthesises architecture health report:
- Deviation count and trend
- Coupling metrics vs baseline
- Dependency graph changes
- ADRs created this period

Architect decides if deviations are acceptable evolution, architecture needs updating, code needs refactoring, or backward event to Design needed.

---

**Process 5.3: Technical Debt Governance**

*Problem defended against*: Invisible debt accumulation; unbounded shortcuts

*Trigger*: Each shortcut decision; periodic review

*Actor Model*: Collaborative (Mode 3) at creation; Human-led (Mode 2) at review

**At Debt Creation:**

AI detects (or human declares) potential debt: TODO/FIXME/HACK comments, known shortcuts, deferred decisions.

| Step | AI Elicits | Captures |
|------|------------|----------|
| Proper solution | "What's the right way to do this?" | Alternative approach |
| Rationale | "Why not do it properly now?" | Time/resource constraint |
| Risk | "What's the risk if never fixed?" | Potential consequences |
| Trigger | "What would make this urgent?" | Conditions requiring action |

**Debt Register Entry:**
- Description + proper solution
- Interest rate (ongoing cost)
- Principal (cost to fix)
- Risk level
- Approver
- Repayment plan

**Debt Ceiling:**
- Define maximum acceptable debt load
- If ceiling breached: block new feature work until debt reduced
- Escalate to PO for scope/schedule decision

---

**Process 5.4: Developer Skill Preservation**

*Problem defended against*: Skill atrophy; over-reliance on AI

*Trigger*: Periodic (per sprint); continuous tracking

*Actor Model*: Human-led (Mode 2) execution; AI supports tracking

**AI Tracks Per Developer:**
- Ratio of AI-assisted vs independent code
- Types of work done with/without AI
- Comprehension check pass rate
- Code review depth (substantive vs rubber-stamp)

**Skill Rotation Requirements:**
- Each developer must periodically: complete tasks without AI (Mode 1), explain AI-generated code, review others' code substantively, debug without AI assistance

**Atrophy Warning Triggers:**
- Developer >90% AI-assisted for 4+ weeks
- Code review comments declining in substance
- Only one person understands a module
- Comprehension check failures increasing

**Response:** Assign independent work; pair programming for knowledge transfer; training time allocation

#### Transition Readiness: Implementation → Testing

Sufficiency for `CODE_COMPLETE` is context-dependent. AI can help surface readiness through:

- "What functionality is not yet implemented?"
- "What tests are missing? What's the coverage?"
- "Are there known issues or TODOs that should be resolved?"
- "Is the code documented sufficiently for testing?"
- "Are there integration points not yet validated?"
- "What technical debt was created? Is it documented?"
- "Can the team explain how this code works?"

#### Evolution Risk

| Risk | Mitigation | Detection |
|------|------------|-----------|
| AI generates working code that no human understands | Comprehension checks (Process 5.1); block merge if insufficient | Comprehension check failure rate |
| High velocity implementation masks lack of comprehension | Track velocity vs comprehension; don't celebrate velocity alone | Comprehension failures despite high velocity |
| Test coverage looks good but misses critical scenarios | Mutation testing; human review of test intent | Mutation score; test-to-defect correlation |
| "Ship it" pressure overrides quality validation | Quality gates that cannot be bypassed; visible debt tracking | Debt ceiling breaches; skipped checks |
| Team skills atrophy as AI does more implementation | Skill preservation process (5.4); rotation requirements | AI-assistance ratio >80%; declining independent work |
| Technical debt accumulates invisibly | Debt governance (Process 5.3); debt ceiling | Debt count/trend; ceiling breaches |
| Code review becomes rubber-stamping | Review depth tracking; substantive comment requirements | Declining comment quality; approval without comments |
| Architectural erosion | Architecture monitoring (Process 5.2); periodic review | Deviation count trend; coupling metrics |
| Dependency sprawl | Dependency governance; approved list enforcement | New dependency rate; license/security issues |

---

### Phase 6: Testing/Validation

**ISO 12207 Processes**: 6.4.8 Verification, 6.4.9 Validation

**Information Composition**: 70% Formal / 20% Tacit / 10% Emergent

**Primary Question**: CONFIRM—verification (built it right) and validation (built the right thing)

**The Coverage Illusion**: Test results are highly formal—pass/fail is unambiguous. But what to test, how to test it meaningfully, and whether tests actually prove fitness-for-purpose requires deep tacit knowledge. 100% code coverage does not mean 100% confidence.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 6 |
|---------------|--------|----------|-------------------|
| Testing Standards | VAL | Standing | Test types required, coverage thresholds |
| Test Environment Standards | OPS | Standing | Environment requirements, data handling |
| Security Testing Requirements | VAL | Standing | Penetration testing, vulnerability scanning |
| Performance Testing Standards | VAL | Standing | Load testing approaches, benchmarks |
| Accessibility Standards | VAL | Standing | WCAG compliance, assistive technology testing |
| Regulatory Testing Requirements | VAL | Standing | Compliance verification requirements |
| Defect Management Process | REF | Standing | How defects are logged, triaged, resolved |
| Release Criteria | STR | Standing | What must pass before release |

**AI should ask**: "Are there testing standards, coverage requirements, or release criteria I should follow? What security and performance testing is required?"

**Project Inputs** (Scope: Project — from Phase 3-5):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| System Requirements (SPC-002) | SPC | Standing | Phase 3 |
| Acceptance Criteria | SPC | Standing | Phase 3 |
| Architecture Description (DES-001) | DES | Standing | Phase 4 |
| Source Code (IMP-001) | IMP | Dynamic | Phase 5 |
| Unit Tests | VAL | Dynamic | Phase 5 |
| Risk Register (STR-004) | STR | Dynamic | Phase 2 |
| Traceability Matrix (SPC-004) | SPC | Dynamic | Phase 3 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Test Plan (VAL-001) | VAL | Standing | Test execution, governance |
| Test Cases (VAL-002) | VAL | Dynamic | Test execution |
| Test Results (VAL-003) | VAL | Dynamic | Release decisions |
| Defect Log | VAL | Dynamic | Implementation (fixes), governance |
| Test Coverage Report | VAL | Dynamic | Release decisions |
| Performance Test Results | VAL | Dynamic | Release decisions, Operations |
| Security Test Results | VAL | Dynamic | Release decisions, Operations |
| User Acceptance Test Results | VAL | Standing | Release decisions |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Exploratory Test Notes | WRK | Ad-hoc testing observations | Defect Log, Test Cases |
| Test Session Notes | WRK | Testing context, observations | Test Results |
| Defect Investigation Notes | WRK | Root cause analysis | Defect Log, knowledge |

**Process Validation**: Exploratory test notes must capture reasoning about what was tested and why. AI should flag test reports that only show pass/fail without context.

#### Verification vs. Validation

| Aspect | Verification | Validation |
|--------|--------------|------------|
| **Question** | Did we build it right? | Did we build the right thing? |
| **Focus** | Conformance to specification | Fitness for purpose |
| **Methods** | Unit tests, integration tests, code review | UAT, beta testing, stakeholder review |
| **AI Role** | Strong—can verify against formal specs | Limited—requires human judgement of value |
| **Automation** | Highly automatable | Partially automatable; human judgement required |

**Key insight**: AI excels at verification (checking against formal criteria) but validation requires human judgement about whether the system actually solves the problem.

#### Collaboration Modes in Testing

| Mode | Description | When Appropriate |
|------|-------------|------------------|
| **Human-only** (Mode 1) | Human designs and executes tests; no AI involvement | External security audits, regulatory compliance testing, certain accessibility testing |
| **Human-led** (Mode 2) | Human designs tests; AI assists with execution, data generation | Exploratory testing, UAT, novel scenarios |
| **Collaborative** (Mode 3) | Human and AI together design and execute tests | Most functional testing; AI generates, human validates coverage |
| **AI-led** (Mode 4) | AI generates and executes tests; human reviews results | Functional regression testing, generated unit tests |
| **Fully autonomous** (Mode 5) | AI executes tests with no human in loop | CI/CD pipeline tests, continuous regression, smoke tests |

**Mode transitions during testing:**
- AI-led test execution → failure → Human-led investigation (Mode 4 → Mode 2)
- Autonomous CI/CD test → unexpected failure pattern → Collaborative analysis (Mode 5 → Mode 3)
- Human exploratory testing → discovers pattern → AI generates systematic tests (Mode 2 → Mode 4)

**Governance for Mode 5 (Autonomous):**
- Defined scope: only pre-approved test suites
- Automatic escalation triggers: new failure patterns, coverage drops, flaky test thresholds
- Human review required before release decisions regardless of autonomous test results

**Critical consideration**: AI can achieve high coverage metrics while missing critical scenarios that require domain understanding to identify.

#### AI Active Validation Process for Testing

```
┌─────────────────────────────────────────────────────────────────────┐
│              AI ACTIVE VALIDATION IN TESTING                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. ELICIT ────────────────────────────────────────────────────     │
│     Surface testing intent and coverage:                            │
│     "What scenarios are most important to test?"                    │
│     "What could go wrong that would be catastrophic?"               │
│     "What edge cases are users likely to encounter?"                │
│                                                                     │
│  2. ANALYSE ───────────────────────────────────────────────────     │
│     Examine test coverage and results:                              │
│     • Requirement coverage (is every requirement tested?)           │
│     • Code coverage (what code paths are untested?)                 │
│     • Risk coverage (are high-risk areas thoroughly tested?)        │
│     • Edge case coverage (are boundaries tested?)                   │
│     • Result patterns (are failures clustered? trends?)             │
│                                                                     │
│  3. SYNTHESISE ────────────────────────────────────────────────     │
│     Integrate testing insights:                                     │
│     • Aggregate results across test types                           │
│     • Identify patterns in failures                                 │
│     • Build confidence assessment                                   │
│                                                                     │
│  4. VALIDATE ──────────────────────────────────────────────────     │
│     Confirm test adequacy:                                          │
│     "These tests assume [X]—is that valid?"                         │
│     "This scenario isn't tested—is that acceptable?"                │
│     "The tests pass, but do they test the right thing?"             │
│                                                                     │
│  5. TRANSFORM ─────────────────────────────────────────────────     │
│     Convert between representations:                                │
│     • Requirements → Test cases                                     │
│     • Acceptance criteria → Automated tests                         │
│     • Defects → Regression tests                                    │
│     • Test results → Release readiness report                       │
│                                                                     │
│  6. DECIDE (surface for human) ────────────────────────────────     │
│     AI presents testing decisions:                                  │
│     "Coverage is 80%—is that sufficient for release?"               │
│     "These 3 defects are open—release or fix first?"                │
│     "Performance is 10% below target—acceptable?"                   │
│                                                                     │
│  7. GENERATE ──────────────────────────────────────────────────     │
│     Produce testing artifacts:                                      │
│     • Test cases from requirements                                  │
│     • Test data sets                                                │
│     • Automated test scripts                                        │
│     • Test reports                                                  │
│                                                                     │
│  8. PRESERVE ──────────────────────────────────────────────────     │
│     Capture testing knowledge:                                      │
│     • Why tests were designed this way                              │
│     • What scenarios were considered but not tested                 │
│     • Defect patterns and root causes                               │
│     • Test environment configurations                               │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### AI Challenge Questions for Testing

**For Test Coverage:**
- "What requirements have no tests? Is that intentional?"
- "What code paths are never executed by tests?"
- "What happens if [critical component] fails—is that tested?"
- "Are the riskiest parts of the system tested most thoroughly?"

**For Test Quality:**
- "Do these tests actually verify the requirement, or just exercise code?"
- "Could this test pass even if the feature is broken?"
- "What would a failing test tell you? Is that useful information?"
- "Are you testing implementation details that might change?"

**For Edge Cases:**
- "What happens at the boundaries of valid input?"
- "What if the user does something unexpected?"
- "What if external systems behave unexpectedly?"
- "What's the worst thing that could happen? Is it tested?"

**For Confidence:**
- "If all tests pass, how confident are you it works correctly?"
- "What could still be wrong even if tests pass?"
- "What would make you more confident?"
- "What are you worried about that isn't tested?"

**For Validation:**
- "Have actual users tried this? What did they think?"
- "Does this solve the original problem?"
- "Would stakeholders consider this acceptable?"

#### Escalation Framework for Testing

| Escalation Type | Trigger | AI Action | Who Decides | Action Required |
|-----------------|---------|-----------|-------------|-----------------|
| **Coverage gap** | Requirement without test | Flag gap; suggest test approach | **Tester + PO** | Accept gap or add tests |
| **Test failure** | Test doesn't pass | Report failure with context | **Developer** | Investigate: defect or test issue? |
| **Flaky test** | Test passes/fails inconsistently | Flag pattern; suggest investigation | **Developer** | Determine root cause |
| **Performance concern** | Results below threshold | Report with analysis | **Architect + PO** | Accept, optimise, or adjust target |
| **Security finding** | Vulnerability detected | Report with severity | **Security + Release Mgr** | Remediate or accept risk |
| **Defect triage** | New defect found | Categorise; suggest priority | **PO + Dev Lead** | Decide fix priority |
| **Release decision** | Testing complete | Present summary with recommendation | **Release Manager** | Decide go/no-go |
| **Confidence concern** | Tests pass but coverage seems inadequate | Surface concern; suggest additional tests | **Tester + PO** | Add tests or accept risk |
| **Backward event needed** | Defect reveals upstream issue | Identify likely source (req/design/plan) | **Tech Lead + PO** | Escalate to appropriate phase |

**Stopping Criteria**: AI should help elicit sufficiency through dialogue:
- "What would make you confident enough to release?"
- "What's the worst case if we release now? Is that acceptable?"
- "What additional testing would meaningfully increase confidence vs. delay?"

#### Backward Events from Testing

Testing often reveals issues that require returning to earlier phases:

| Backward Event | Trigger | Information Debt Created | AI Detection |
|----------------|---------|-------------------------|--------------|
| **Testing → Implementation** | Defect found in code | Defect + investigation + fix cost | Direct: test failure |
| **Testing → Design** | Test reveals design flaw or integration issue | Design rework + downstream changes | Pattern: multiple related failures; "this can't work as designed" |
| **Testing → Requirements** | Test reveals requirement ambiguity, gap, or conflict | Requirements rework + cascade to design/impl | Pattern: "spec says X but users expect Y"; untestable requirements |
| **Testing → Planning** | Testing reveals estimate was wildly wrong | Schedule/resource replanning | Pattern: test execution time >> estimated; scope larger than planned |

**AI should ask when patterns emerge:**
- "These failures suggest a design issue rather than implementation bugs—should we escalate to Design?"
- "This requirement appears untestable as written—should we clarify with Requirements?"
- "Testing is taking 3x longer than planned—should we revisit the schedule?"

#### The Testing Dialogue Loop

```
┌─────────────────────────────────────────────────────────────────────┐
│                    PHASE 6: TESTING/VALIDATION                      │
│                       The Testing Loop                              │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  REQUIREMENTS                    TEST PLANNING                      │
│  & CODE                          ────────────                       │
│  ────────────                                                       │
│  Requirements ───┐               ┌──────────────────┐               │
│  Acceptance ─────┤               │  AI GENERATES    │               │
│  criteria        ├──────────────►│  test cases from │               │
│  Source code ────┤               │  requirements    │               │
│  Risk register ──┘               └────────┬─────────┘               │
│                                           │                         │
│                                           ▼                         │
│                                  ┌──────────────────┐               │
│                                  │  HUMAN REVIEWS   │               │
│                                  │  adds scenarios, │               │
│                                  │  edge cases,     │               │
│                                  │  domain insight  │               │
│                                  └────────┬─────────┘               │
│                                           │                         │
│                    ┌──────────────────────┼──────────────────────┐  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │  AI EXECUTES     │            │  │
│                    │             │  tests; reports  │            │  │
│                    │             │  results         │            │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│          ITERATE   │             │  AI ANALYSES     │            │  │
│          UNTIL     │             │  coverage, gaps, │            │  │
│          SUFFICIENT│             │  failure patterns│            │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │  AI CHALLENGES   │            │  │
│                    │             │  "Is this enough?│            │  │
│                    │             │   What's missing?"│           │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    │                      ▼                      │  │
│                    │             ┌──────────────────┐            │  │
│                    │             │  HUMAN VALIDATES │            │  │
│                    │             │  adds tests,     │◄──┐        │  │
│                    │             │  accepts gaps,   │   │        │  │
│                    │             │  investigates    ├───┘        │  │
│                    │             └────────┬─────────┘            │  │
│                    │                      │                      │  │
│                    └──────────────────────┼──────────────────────┘  │
│                                           │                         │
│                         ┌─────────────────┴─────────────────┐       │
│                         │                                   │       │
│                         ▼                                   ▼       │
│                ┌──────────────────┐              ┌──────────────────┐
│                │  VALIDATION      │              │  AI PRESERVES    │
│                │  (Human-led)     │              │  test knowledge, │
│                │  UAT, stakeholder│              │  defect patterns,│
│                │  acceptance      │              │  coverage rationale
│                └──────────────────┘              └──────────────────┘
│                                                                     │
│  OUTPUTS: Test results, coverage reports, defect log,               │
│           release recommendation                                    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Test case generation** | Generate tests from requirements/code; identify edge cases | Validate test quality; add domain-specific scenarios |
| **Test execution** | Execute automated tests; report results | Interpret results; decide if failures matter |
| **Coverage analysis** | Calculate coverage metrics; identify gaps | Judge if coverage is meaningful |
| **Defect analysis** | Categorise defects; identify patterns; suggest root causes | Investigate complex issues; determine fix approach |
| **Regression testing** | Execute regression suite; flag new failures | Decide if new failures are real issues |
| **Performance testing** | Execute load tests; analyse results | Judge if performance is acceptable |
| **Test data generation** | Generate test data sets; anonymise production data | Validate data is realistic and complete |
| **UAT facilitation** | Track UAT progress; capture feedback | Conduct actual user testing; interpret feedback |

#### Information Debt Risk

Testing is where **false confidence** is most dangerous:
- Tests pass but don't test the right things
- Coverage metrics look good but miss critical paths
- Automated tests verify implementation, not requirements
- "All tests pass" becomes a ritual rather than evidence

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests Later | Detection Mechanism |
|--------------|----------------|------------------------|---------------------|
| Coverage theatre | Tests that exercise code but don't verify behaviour | Production bugs in "tested" code | Mutation testing; defect escape rate |
| Missing edge cases | Tests for happy path only | Production failures on edge conditions | Boundary analysis review; chaos testing |
| Brittle tests | Tests tied to implementation details | Tests break on valid changes; get disabled | Track test failure-to-fix ratio; test churn rate |
| Untested integration | Unit tests only; no integration testing | Integration failures in production | Integration test coverage metrics; contract testing |
| Assumption blindness | Tests share code's assumptions | Bugs where assumptions don't hold | Independent test design; external review |
| UAT lip service | Stakeholder sign-off without genuine validation | User complaints post-release | Track stakeholder engagement time; post-release feedback correlation |
| Requirements drift | Tests validate outdated requirements | System works as tested but not as needed | Requirements-to-test traceability review; requirement change audit |
| Regression rot | Old tests become meaningless as system evolves | False security from passing tests | Periodic regression test review; test-to-defect correlation |
| AI confirmation bias | AI generates tests that confirm, not challenge | Systematic blind spots | Adversarial test review; diverse test generation |
| Test data staleness | Test data doesn't reflect production patterns | Edge cases in production not tested | Production data sampling comparison |

#### Detection and Monitoring

AI should track and report:

| Metric | What It Indicates | Action Threshold |
|--------|-------------------|------------------|
| **Defect escape rate** | Defects found in production vs testing | Rising trend indicates test strategy gap |
| **Test-to-defect correlation** | Which tests actually find defects? | Tests that never fail may be coverage theatre |
| **Coverage vs defect location** | Are we testing where bugs are? | Defects in "covered" code indicates test quality issue |
| **Time-to-detect trends** | Are we finding issues earlier or later? | Later detection indicates process degradation |
| **Flaky test percentage** | Test suite reliability | >5% flaky tests indicates maintenance debt |
| **Test execution time trends** | Test suite health | Growing execution time may indicate bloat |

**AI should surface these patterns proactively**, not just when asked.

#### What Must Be Preserved

- Human judgement about test adequacy
- Domain knowledge of what scenarios matter
- Understanding of user behaviour and expectations
- Ability to recognise when tests aren't testing the right things
- Stakeholder relationships for genuine validation
- **Tester skills**: Ability to design tests without AI assistance
- **Exploratory intuition**: Human ability to "sense" where bugs hide
- **Adversarial thinking**: Ability to challenge, not just confirm

**Skill preservation mechanisms:**
- Require humans to design *some* tests without AI assistance (rotate responsibility)
- Track who can explain test strategy without AI prompting
- Periodically conduct human-only exploratory testing sessions
- Review AI-generated tests for quality, not just coverage

#### Defensive Processes for Testing

These processes run during testing to detect and remediate problems:

**Process 6.1: Test Quality Assurance**

*Problem defended against*: Coverage theatre; tests that don't verify behaviour

*Trigger*: Continuous (with test creation); periodic review

*Actor Model*: AI-led (Mode 4) analysis; Human-led (Mode 2) remediation

**Continuous Analysis (Mode 4):**

For each new/modified test, AI analyses:

| Analysis | Questions | Indicators |
|----------|-----------|------------|
| **Assertion quality** | Does test have meaningful assertions? Testing behaviour or implementation? Could it pass with broken code? | No assertions; mocking everything; testing private methods |
| **Mutation testing** | What % of mutations caught? Which survive? | Low mutation score indicates weak tests |
| **Assumption analysis** | What assumptions shared with code? Boundaries tested? Error paths tested? | Same boundary checks as code; no negative tests |
| **Requirement traceability** | Which requirement verified? Does test verify requirement intent? | No requirement link; tests implementation detail |

**Quality Issues Detected:**

AI flags: "This test has no assertions", "This test would pass even if [behavior] was broken", "Mutation at line X survives", "Test traces to requirement but doesn't verify key aspect"

Human reviews; decides: Improve test / Accept gap with rationale / Flag for exploratory testing

**Periodic Review (Weekly):**

AI synthesises test health report:
- Mutation score trend
- Tests with no assertions count
- Tests never failed count (may indicate coverage theatre)
- Test-to-defect correlation (which tests find defects?)

---

**Process 6.2: Defect Feedback Loop**

*Problem defended against*: Same defect types recurring; no learning from production

*Trigger*: Each defect found (testing or production); periodic analysis

*Actor Model*: AI-led (Mode 4) analysis; Collaborative (Mode 3) remediation

**For Each Defect, AI Analyses:**

| Analysis | Output |
|----------|--------|
| **Root cause classification** | Requirements gap / Design flaw / Implementation error / Test gap / Environment issue |
| **Escape analysis** (production defects) | Why didn't testing catch this? Was scenario tested? Did tests pass despite bug? |
| **Pattern matching** | Similar to previous defects? Common root cause? Same code area? |

**Learning Actions (Mode 3 - Collaborative):**

AI proposes; Human approves:
- **Regression test**: Generate test for this specific defect
- **Test strategy update**: Adjust what we test based on pattern
- **Backward event**: Escalate to Requirements/Design if root cause upstream
- **Process improvement**: Update standards if process gap
- **Knowledge capture**: Document for future (HST document)

**Periodic Defect Review (Sprint/Release):**

AI synthesises defect patterns:
- Defect clustering by area/type
- Escape rate trend
- Test strategy gaps indicated by escapes
- Recurring patterns not being addressed

Team reviews; decides test strategy adjustments, areas for focused attention, process changes.

---

**Process 6.3: Validation Integrity**

*Problem defended against*: UAT lip service; validation without genuine stakeholder engagement

*Trigger*: UAT phase; release decision point

*Actor Model*: Human-led (Mode 2) — AI supports but cannot replace human validation

**Key principle**: AI CANNOT validate fitness-for-purpose. AI CAN support validation process integrity.

**UAT Engagement Tracking:**

AI monitors:
- Time stakeholders spend with system (not just sign-off time)
- Breadth of features actually exercised
- Depth of exploration (happy path only vs edge cases)
- Feedback quality (substantive vs "looks fine")

**Low Engagement Warning:**

AI flags:
- "Stakeholder X spent 10 minutes on UAT for 50 features"
- "Only 3 of 12 user journeys were exercised"
- "No negative feedback recorded—is engagement genuine?"
- "Sign-off requested without completion of test scenarios"

**Validation Dialogue (AI supports human-led):**

AI elicits from stakeholders:
- "Does this solve the problem you described in Phase 1?"
- "What would prevent you from using this in production?"
- "What's missing that you expected?"
- "On a scale of 1-10, how confident are you this meets needs?"
- "What's the worst thing that could happen if we release this?"

**AI Preserves validation evidence:**
- Stakeholder feedback (verbatim)
- Engagement metrics
- Confidence levels with rationale
- Outstanding concerns and how addressed

**Release Decision Gate:**

AI presents validation summary:
- Engagement level: Sufficient / Concerning / Insufficient
- Stakeholder confidence: High / Medium / Low
- Outstanding concerns: List with severity
- Recommendation: Release / Release with caveats / Do not release

Human (Release Manager + PO) decides. Decision preserved with rationale.

---

**Process 6.4: Tester Skill Preservation**

*Problem defended against*: Testers become script executors; lose exploratory skills

*Trigger*: Periodic (per sprint); continuous tracking

*Actor Model*: Human-led (Mode 2) execution; AI supports tracking

**AI Tracks Per Tester:**
- Ratio of AI-generated vs human-designed tests
- Exploratory testing sessions conducted
- Defects found through exploration vs scripted tests
- Test strategy contributions

**Skill Rotation Requirements:**
- Each tester must periodically: design tests without AI (Mode 1), conduct exploratory sessions, review AI-generated test quality, explain test strategy to others

**Atrophy Warning Triggers:**
- Tester >90% executing AI-generated tests for 4+ weeks
- No exploratory testing sessions conducted
- Defects only found through automated tests
- Cannot explain test strategy without AI

**Response:** Assign independent test design; exploratory testing time allocation; pair testing for knowledge transfer

#### Transition Readiness: Testing → Deployment

Sufficiency for `RELEASE_APPROVED` is context-dependent. AI can help surface readiness through:

- "What defects are open? Are any blockers?"
- "What requirements have no test coverage? Is that acceptable?"
- "What test types haven't been executed? (performance, security, accessibility)"
- "Have stakeholders validated this meets their needs?"
- "What scenarios haven't been tested? What's the risk?"
- "If we release and something is wrong, what's the worst case?"
- "What would increase your confidence before release?"

#### Evolution Risk

| Risk | Mitigation |
|------|------------|
| AI-generated tests achieve coverage without verifying behaviour | Mutation testing; require human review of test *intent* |
| False confidence from high coverage metrics | Track defect escape rate; don't rely on coverage alone |
| Test suite maintenance becomes burden; tests get disabled | Track disabled test count; require justification for disabling |
| Validation reduced to checkbox exercise | Require substantive stakeholder engagement; track engagement time |
| "Tests pass" becomes proxy for "it works" | Emphasise defect escape rate over pass rate |
| Testers become test script executors, losing exploratory skills | Rotate human-only testing; track who can design tests independently |
| Stakeholder validation bypassed because "testing is done" | Validation gate requires human-led UAT with documented feedback |
| Production feedback not incorporated | Track production defects → test strategy improvements |
| AI confirms rather than challenges | Adversarial test generation; independent test review |

---

### Phase 7: Deployment/Operations

**ISO 12207 Processes**: 6.4.10 Transition, 6.4.11 Validation (operational), 6.4.12 Operation, 6.4.13 Maintenance

**Information Composition**: 60% Formal / 30% Tacit / 10% Emergent

**Primary Question**: DELIVER—release, operate, maintain, evolve

**The Knowledge Transfer Challenge**: This phase requires transferring understanding from those who built the system to those who operate it. Operational knowledge ("how to keep it running at 3am") is often deeply tacit—learned through experience, never fully documented. AI can monitor and alert, but incident response requires human judgement about complex, novel situations.

#### Document Types

*Classification per [Document Type Classification Framework](./concepts/concept_document-type-classification.md)*

**Organisational Inputs** (Scope: Organisational — exist before project):

| Document Type | Domain | Temporal | Purpose in Phase 7 |
|---------------|--------|----------|-------------------|
| Deployment Standards | OPS | Standing | Release processes, approval gates |
| Infrastructure Standards | OPS | Standing | Platform requirements, security baselines |
| Monitoring Standards | OPS | Standing | What to monitor, alerting thresholds |
| Incident Management Process | OPS | Standing | How incidents are handled, escalation paths |
| Change Management Process | OPS | Standing | How changes are approved and tracked |
| SLA/SLO Definitions | OPS | Standing | Service level requirements |
| On-Call Procedures | OPS | Standing | Rotation, escalation, communication |
| Disaster Recovery Standards | OPS | Standing | Backup, recovery, continuity requirements |

**AI should ask**: "Are there deployment standards, SLA requirements, or incident management processes I should follow? What monitoring and alerting standards apply?"

**Project Inputs** (Scope: Project — from Phase 3-6):

| Document Type | Domain | Temporal | Source |
|---------------|--------|----------|--------|
| Source Code (IMP-001) | IMP | Dynamic | Phase 5 |
| Architecture Description (DES-001) | DES | Standing | Phase 4 |
| Test Results (VAL-003) | VAL | Dynamic | Phase 6 |
| API Documentation | IMP | Dynamic | Phase 5 |
| Database Scripts/Migrations | IMP | Dynamic | Phase 5 |
| Non-Functional Requirements | SPC | Standing | Phase 3 |
| Risk Register (STR-004) | STR | Dynamic | Phase 2 |
| Technical Debt Register | STR | Dynamic | Phase 5 |

**Project Outputs** (Scope: Project — produced by this phase):

| Document Type | Domain | Temporal | Downstream Consumer |
|---------------|--------|----------|---------------------|
| Deployment Runbook (OPS-001) | OPS | Standing | Operations, on-call |
| Operational Runbook (OPS-002) | OPS | Standing | Operations, on-call |
| Monitoring Configuration | OPS | Dynamic | Operations |
| Incident Playbooks | OPS | Standing | On-call, incident response |
| Post-Incident Reports | OPS | Standing | Learning, future incidents |
| Operational Metrics Baseline | OPS | Dynamic | SLA tracking |
| Release Notes | OPS | Dynamic | Users, support |
| Known Issues Log | OPS | Dynamic | Support, maintenance |

**Working Documents** (Scope: Task — ephemeral, contribute to outputs):

| Document Type | Domain | Captures | Contributes To |
|---------------|--------|----------|----------------|
| Incident Timeline | WRK | Real-time incident details | Post-Incident Report |
| Investigation Notes | WRK | Diagnostic reasoning | Post-Incident Report, Playbooks |
| Change Request Notes | WRK | Change rationale, risk assessment | Change log |
| Deployment Notes | WRK | Deployment observations | Runbook improvements |

**Process Validation**: Post-incident reports must capture *why* the incident occurred and *why* it wasn't prevented, not just *what* happened. AI should flag reports missing root cause analysis.

#### Collaboration Modes in Deployment/Operations

| Mode | Description | When Appropriate |
|------|-------------|------------------|
| **Human-only** (Mode 1) | Human executes; no AI involvement | Emergency response requiring judgement; security-sensitive operations |
| **Human-led** (Mode 2) | Human leads; AI assists with information gathering | Complex incidents; novel situations; critical deployments |
| **Collaborative** (Mode 3) | Human and AI work together | Routine operations; monitoring review; capacity planning |
| **AI-led** (Mode 4) | AI executes; human validates/approves | Routine deployments; automated scaling; standard alerts |
| **Fully autonomous** (Mode 5) | AI executes without human in loop | Continuous deployment pipelines; auto-scaling; auto-remediation |

**Mode transitions during operations:**
- Autonomous monitoring → anomaly detected → AI-led triage (Mode 5 → Mode 4)
- AI-led triage → complex issue → Human-led investigation (Mode 4 → Mode 2)
- Human-led investigation → production emergency → Human-only crisis response (Mode 2 → Mode 1)
- Routine deployment → unexpected failure → Collaborative rollback (Mode 4 → Mode 3)

**Governance for Mode 5 (Autonomous):**
- Defined scope: only pre-approved automations (scaling, standard alerts, health checks)
- Automatic escalation: novel patterns, threshold breaches, cascading failures
- Human approval required for: production changes, data modifications, security actions
- "Break glass" procedures for emergency human override

#### AI Active Validation Process for Deployment/Operations

```
┌─────────────────────────────────────────────────────────────────────┐
│        AI ACTIVE VALIDATION IN DEPLOYMENT/OPERATIONS                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. ELICIT ────────────────────────────────────────────────────     │
│     Surface operational knowledge:                                  │
│     "What should I monitor to know this is healthy?"                │
│     "What does 'normal' look like for this system?"                 │
│     "What are the early warning signs of problems?"                 │
│     "What would you do if [scenario] happened?"                     │
│                                                                     │
│  2. ANALYSE ───────────────────────────────────────────────────     │
│     Examine operational state:                                      │
│     • Health metrics vs baselines                                   │
│     • Anomaly detection (deviation from normal)                     │
│     • Trend analysis (approaching limits?)                          │
│     • Correlation (related issues across components?)               │
│     • SLA/SLO compliance                                            │
│                                                                     │
│  3. SYNTHESISE ────────────────────────────────────────────────     │
│     Build operational picture:                                      │
│     • System health dashboard                                       │
│     • Incident timeline reconstruction                              │
│     • Impact assessment                                             │
│     • Root cause hypothesis                                         │
│                                                                     │
│  4. VALIDATE ──────────────────────────────────────────────────     │
│     Confirm operational understanding:                              │
│     "Is this behavior expected given [context]?"                    │
│     "Does this metric indicate a problem or normal variation?"      │
│     "Is this incident related to [recent change]?"                  │
│                                                                     │
│  5. TRANSFORM ─────────────────────────────────────────────────     │
│     Convert between representations:                                │
│     • Logs → Incident summary                                       │
│     • Metrics → Health report                                       │
│     • Incident → Post-mortem                                        │
│     • Experience → Runbook/Playbook                                 │
│                                                                     │
│  6. DECIDE (surface for human) ────────────────────────────────     │
│     AI presents operational decisions:                              │
│     "Alert threshold breached—investigate or acknowledge?"          │
│     "Deployment ready—proceed or hold?"                             │
│     "Incident appears resolved—close or continue monitoring?"       │
│                                                                     │
│  7. GENERATE ──────────────────────────────────────────────────     │
│     Produce operational artifacts:                                  │
│     • Runbook drafts from tribal knowledge                          │
│     • Playbook updates from incidents                               │
│     • Release notes from changes                                    │
│     • Post-incident reports                                         │
│                                                                     │
│  8. PRESERVE ──────────────────────────────────────────────────     │
│     Capture operational knowledge:                                  │
│     • Incident learnings                                            │
│     • Operational patterns ("this always happens when...")          │
│     • Tribal knowledge surfaced through incidents                   │
│     • Feedback to earlier phases                                    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### AI Challenge Questions for Deployment/Operations

**For Deployment Readiness:**
- "Are all prerequisites for deployment met?"
- "What's the rollback plan if this fails?"
- "Who needs to be notified? Who's on-call?"
- "What could go wrong? How would we detect it?"
- "Is this the right time to deploy? What's the risk?"

**For Operational Health:**
- "Is this metric within normal range?"
- "Is this trend concerning or expected?"
- "Are these issues related or coincidental?"
- "What changed recently that could explain this?"

**For Incident Response:**
- "What's the impact? Who/what is affected?"
- "What's the most likely cause? What evidence supports that?"
- "What's the fastest path to mitigation vs. root cause fix?"
- "Who else needs to know? What's the communication plan?"
- "Is this a symptom of a larger problem?"

**For Knowledge Capture:**
- "What did we learn from this incident?"
- "Why didn't we detect this sooner?"
- "Why didn't we prevent this?"
- "What should we change to prevent recurrence?"
- "Who else needs to know this?"

#### Escalation Framework for Deployment/Operations

| Escalation Type | Trigger | AI Action | Who Decides | Action Required |
|-----------------|---------|-----------|-------------|-----------------|
| **Deployment decision** | Release ready | Present readiness summary | **Release Manager** | Approve/defer deployment |
| **Deployment failure** | Deployment doesn't succeed | Report status; suggest rollback | **On-call + Release Mgr** | Rollback or fix-forward |
| **Alert triggered** | Monitoring threshold breached | Present context; suggest triage | **On-call** | Investigate or acknowledge |
| **Incident declared** | Service degradation confirmed | Initiate incident process | **Incident Commander** | Coordinate response |
| **Escalation needed** | On-call cannot resolve | Identify next escalation tier | **On-call** | Engage additional help |
| **Customer impact** | Users affected | Assess impact; draft communication | **Incident Commander + Comms** | External communication |
| **Change request** | Modification needed | Risk assessment; approval routing | **Change Manager** | Approve/reject change |
| **Capacity concern** | Approaching resource limits | Forecast and options | **Ops Lead + Architect** | Scale or optimize |
| **Security incident** | Security event detected | Isolate and assess | **Security + Incident Cmd** | Security response protocol |
| **Backward event needed** | Incident reveals upstream issue | Identify source phase | **Tech Lead + PO** | Escalate to appropriate phase |

#### Backward Events from Operations

Production often reveals issues that require returning to earlier phases:

| Backward Event | Trigger | Information Debt Created | AI Detection |
|----------------|---------|-------------------------|--------------|
| **Operations → Testing** | Production issue not caught by testing | Test strategy gap | Pattern: production bugs in "tested" functionality |
| **Operations → Implementation** | Bug in production code | Fix required | Direct: production errors in code |
| **Operations → Design** | Architectural limitation in production | Design revision needed | Pattern: scaling limits, integration issues, performance walls |
| **Operations → Requirements** | Users using system differently than specified | Requirements gap | Pattern: feature requests, unexpected usage patterns |
| **Operations → Planning** | Operational cost much higher than planned | Capacity/cost replanning | Pattern: resource consumption >> estimates |

**AI should ask when patterns emerge:**
- "This production issue suggests a test gap—should we improve test coverage?"
- "This keeps happening—is there a design issue we should address?"
- "Users are consistently requesting [X]—should we revisit requirements?"
- "Operational costs are 3x estimates—should we revisit planning assumptions?"

#### The Operations Dialogue Loop

```
┌─────────────────────────────────────────────────────────────────────┐
│                 PHASE 7: DEPLOYMENT/OPERATIONS                      │
│                   The Operations Loop                               │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  DEPLOYMENT                          OPERATIONS                     │
│  ──────────                          ──────────                     │
│                                                                     │
│  ┌──────────────────┐               ┌──────────────────┐            │
│  │  AI VALIDATES    │               │  AI MONITORS     │            │
│  │  deployment      │               │  continuously    │            │
│  │  readiness       │               │  (Mode 5)        │            │
│  └────────┬─────────┘               └────────┬─────────┘            │
│           │                                  │                      │
│           ▼                                  ▼                      │
│  ┌──────────────────┐               ┌──────────────────┐            │
│  │  HUMAN APPROVES  │               │  AI DETECTS      │            │
│  │  deployment      │               │  anomaly or      │            │
│  │  (Release Mgr)   │               │  threshold       │            │
│  └────────┬─────────┘               └────────┬─────────┘            │
│           │                                  │                      │
│           ▼                                  ▼                      │
│  ┌──────────────────┐               ┌──────────────────┐            │
│  │  AI EXECUTES     │               │  AI TRIAGES      │            │
│  │  deployment      │               │  presents        │            │
│  │  (Mode 4/5)      │               │  context         │            │
│  └────────┬─────────┘               └────────┬─────────┘            │
│           │                                  │                      │
│           ▼                                  ▼                      │
│  ┌──────────────────┐               ┌──────────────────┐            │
│  │  AI MONITORS     │               │  HUMAN           │            │
│  │  deployment      │               │  INVESTIGATES    │            │
│  │  health          │               │  (Mode 2/3)      │            │
│  └────────┬─────────┘               └────────┬─────────┘            │
│           │                                  │                      │
│           ▼                                  ▼                      │
│  ┌──────────────────┐               ┌──────────────────┐            │
│  │  SUCCESS:        │               │  AI ASSISTS      │            │
│  │  → Operations    │               │  diagnosis,      │            │
│  │  FAILURE:        │               │  suggests        │            │
│  │  → Rollback      │               │  remediation     │            │
│  └──────────────────┘               └────────┬─────────┘            │
│                                              │                      │
│                                              ▼                      │
│                                     ┌──────────────────┐            │
│                                     │  HUMAN DECIDES   │            │
│                                     │  remediation     │            │
│                                     │  approach        │            │
│                                     └────────┬─────────┘            │
│                                              │                      │
│                    ┌─────────────────────────┼─────────────────┐    │
│                    │                         │                 │    │
│                    ▼                         ▼                 ▼    │
│           ┌──────────────┐          ┌──────────────┐  ┌───────────┐ │
│           │ AI PRESERVES │          │ BACKWARD     │  │ CONTINUE  │ │
│           │ learnings,   │          │ EVENT to     │  │ MONITORING│ │
│           │ updates      │          │ earlier      │  │           │ │
│           │ playbooks    │          │ phase        │  │           │ │
│           └──────────────┘          └──────────────┘  └───────────┘ │
│                                                                     │
│  OUTPUTS: Deployed system, operational metrics, incident reports,   │
│           updated runbooks/playbooks, feedback to earlier phases    │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

#### Evolution Interventions

| Activity | AI Augmentation | Human Retains |
|----------|-----------------|---------------|
| **Deployment execution** | Automate deployment steps; validate prerequisites; monitor rollout | Approve deployment; decide rollback; handle exceptions |
| **Monitoring** | Continuous metric analysis; anomaly detection; trend alerting | Interpret alerts; judge severity; decide response |
| **Incident triage** | Gather context; correlate events; suggest likely causes | Diagnose complex issues; decide remediation approach |
| **Incident response** | Execute runbook steps; gather diagnostics; draft communications | Make judgement calls; coordinate teams; communicate externally |
| **Post-incident review** | Generate timeline; identify contributing factors; draft report | Determine root cause; decide preventive actions; approve findings |
| **Runbook maintenance** | Capture operational knowledge; suggest updates; identify gaps | Validate accuracy; add tacit knowledge; approve changes |
| **Capacity planning** | Forecast based on trends; model scenarios | Decide capacity investments; balance cost vs risk |
| **Change management** | Risk assessment; impact analysis; approval routing | Approve changes; judge risk acceptability |

#### Information Debt Risk

Operations is where **all upstream information debt manifests**:
- Poor requirements → users unhappy with working system
- Poor design → operational nightmares, scaling limits
- Poor implementation → bugs, performance issues, security vulnerabilities
- Poor testing → production incidents for "tested" features
- Poor documentation → on-call cannot resolve issues

**Common information debt patterns:**

| Debt Pattern | What's Missing | How It Manifests | Detection Mechanism |
|--------------|----------------|------------------|---------------------|
| Undocumented operations | How to run/troubleshoot system | On-call incidents take longer; knowledge silos | Time-to-resolve trends; escalation rate |
| Missing playbooks | Incident response procedures | Ad-hoc response; inconsistent outcomes | Incident recurrence; response time variance |
| Tribal knowledge | Operational understanding not captured | Bus factor issues; slow onboarding | Single-point-of-failure in on-call |
| Monitoring gaps | What to watch and why | Incidents not detected until user reports | Detection source analysis (monitoring vs user report) |
| Alert fatigue | Too many/noisy alerts | Real issues missed; on-call burnout | Alert-to-incident ratio; alert acknowledgment time |
| Runbook rot | Outdated procedures | Wrong actions taken; delays | Runbook accuracy audit; procedure failure rate |
| Missing feedback loops | Learnings not reaching earlier phases | Same issues recur | Incident recurrence rate; defect patterns |

#### Detection and Monitoring

AI should track and report:

| Metric | What It Indicates | Action Threshold |
|--------|-------------------|------------------|
| **Mean time to detect (MTTD)** | Monitoring effectiveness | Rising trend indicates gaps |
| **Mean time to resolve (MTTR)** | Operational capability | Rising trend indicates knowledge gaps |
| **Incident recurrence rate** | Learning effectiveness | >20% recurrence indicates systemic issues |
| **Alert-to-incident ratio** | Alert quality | High ratio indicates alert fatigue risk |
| **Escalation rate** | First-responder capability | Rising rate indicates training/documentation needs |
| **Change failure rate** | Deployment quality | >15% indicates process issues |
| **On-call burden** | Operational sustainability | Excessive pages indicate systemic issues |
| **Customer-reported incidents** | Detection gaps | Should be near zero |

**AI should surface these patterns proactively**, not just when asked.

#### What Must Be Preserved

- Human judgement in crisis situations
- Ability to respond to novel incidents (not just follow playbooks)
- Understanding of system behavior (not just monitoring outputs)
- Relationships with stakeholders for incident communication
- Operational intuition ("something feels wrong")
- **On-call skills**: Ability to diagnose without AI assistance
- **Crisis management**: Human leadership in emergencies
- **Customer empathy**: Understanding user impact

**Skill preservation mechanisms:**
- Require periodic human-led incident response (even for routine issues)
- Track AI-assistance ratio in incident resolution
- Conduct incident response exercises without AI
- Rotate on-call to maintain broad operational knowledge
- Review AI-suggested remediations rather than auto-applying

#### Defensive Processes for Deployment/Operations

**Process 7.1: Deployment Readiness Validation**

*Problem defended against*: Deployments that fail or cause incidents

*Trigger*: Before each deployment

*Actor Model*: AI-led (Mode 4) validation; Human-led (Mode 2) approval

**AI Validates:**
- All tests passed (including integration, performance, security)
- No blocking defects open
- Runbooks/playbooks updated for new functionality
- Monitoring configured for new features
- Rollback plan documented and tested
- On-call briefed on changes
- Change approval obtained

**AI Presents:**
- Readiness checklist status
- Risk assessment
- Deployment window suitability
- Recommendation: Ready / Ready with caveats / Not ready

**Human (Release Manager) Decides:**
- Proceed / Defer / Require additional work

---

**Process 7.2: Operational Knowledge Capture**

*Problem defended against*: Tribal knowledge loss; single points of failure

*Trigger*: After each incident; periodic review

*Actor Model*: Collaborative (Mode 3) — AI elicits, human contributes knowledge

**After Each Incident:**

AI elicits operational knowledge:
- "What did you check first? Why?"
- "How did you know [X] was the cause?"
- "What would have helped you resolve this faster?"
- "What should the next person know about this?"

AI generates:
- Playbook entry (or update)
- Runbook improvement suggestions
- Monitoring recommendations

Human reviews and approves.

**Periodic Knowledge Audit:**

AI analyses:
- Modules with no runbook coverage
- Incident types without playbooks
- Single-person knowledge areas (bus factor = 1)
- Outdated documentation (runbook vs actual)

AI recommends knowledge capture sessions.

---

**Process 7.3: Incident Learning Loop**

*Problem defended against*: Same incidents recurring; no improvement

*Trigger*: After each significant incident; periodic review

*Actor Model*: AI-led (Mode 4) analysis; Human-led (Mode 2) action decisions

**For Each Incident:**

AI generates post-incident analysis:
- Timeline reconstruction
- Contributing factors identified
- Detection effectiveness (how discovered?)
- Response effectiveness (time to mitigate)
- Root cause hypothesis

AI identifies:
- Similar past incidents
- Patterns across incidents
- Upstream source (testing gap? design issue? requirements gap?)
- Recommended preventive actions

**Human Reviews:**
- Validates root cause
- Decides preventive actions
- Approves feedback to earlier phases (backward events)

**Periodic Incident Review:**

AI synthesises:
- Incident trends by type/cause/area
- MTTD/MTTR trends
- Recurrence analysis
- Upstream phase feedback needed

Team decides systemic improvements.

---

**Process 7.4: Operations Skill Preservation**

*Problem defended against*: On-call becomes AI-dependent; loses diagnostic skills

*Trigger*: Periodic (monthly); continuous tracking

*Actor Model*: Human-led (Mode 2) execution; AI supports tracking

**AI Tracks Per On-call:**
- AI-assisted vs independent incident resolution
- Time to diagnosis with/without AI
- Escalation rate
- Playbook reliance (following steps vs understanding system)

**Skill Rotation Requirements:**
- Each on-call must periodically: resolve incidents without AI assistance, update runbooks from experience, conduct incident response exercises, explain system behavior to others

**Atrophy Warning Triggers:**
- On-call >90% AI-assisted resolutions
- Escalation rate increasing
- Cannot explain system behavior without AI
- Runbooks not being updated from experience

**Response:** Supervised incident response; system deep-dives; documentation sessions; mentoring

#### Transition Readiness: Operations → Evolution

Unlike other phases, Operations doesn't transition—it continues. However, learnings should transition back to earlier phases:

| Learning Type | Target Phase | Mechanism |
|---------------|--------------|-----------|
| Feature requests / usage patterns | Requirements | Product backlog; requirements update |
| Performance / scaling limits | Design | Architecture review; design update |
| Bug patterns | Implementation | Defect backlog; code improvement |
| Test gaps (production incidents) | Testing | Test strategy update |
| Estimate accuracy | Planning | Estimation calibration |

**AI should continuously surface feedback:**
- "Users are consistently requesting [X]—should this go to Requirements?"
- "This architectural limit has caused 3 incidents—should we revisit Design?"
- "These defects follow a pattern—should Implementation review?"
- "These production issues weren't caught by testing—Test strategy gap?"

#### Evolution Risk

| Risk | Mitigation | Detection |
|------|------------|-----------|
| On-call becomes AI-dependent | Skill preservation (Process 7.4); periodic unassisted response | AI-assistance ratio; escalation trends |
| Tribal knowledge not captured | Knowledge capture (Process 7.2); incident learning (Process 7.3) | Bus factor analysis; runbook coverage |
| Alert fatigue masks real issues | Alert quality management; regular alert review | Alert-to-incident ratio; acknowledgment time |
| Incidents recur without learning | Incident learning loop (Process 7.3); recurrence tracking | Recurrence rate; pattern detection |
| Feedback doesn't reach earlier phases | Backward event detection; explicit feedback loops | Upstream phase action rate |
| Runbooks become stale | Periodic runbook audit; incident-driven updates | Procedure failure rate; last-update tracking |
| AI auto-remediation causes issues | Governance for Mode 5; human approval gates | Auto-remediation success rate; unintended consequences |

---

## Cross-Phase: Backward Event Detection

This process runs continuously across phases to detect when issues should trigger return to earlier phases, rather than being worked around in the current phase.

**Problem defended against**: Issues detected late that should have triggered earlier phase revisit; workarounds that create information debt

**Trigger**: Continuous pattern analysis across Implementation and Testing

**Actor Model**: AI-led (Mode 4) monitoring; Human-led (Mode 2) decision

### Signal Detection

AI continuously monitors for patterns indicating upstream issues:

**Operations → Earlier Phases Signals:**
| Signal | Pattern | AI Question | Target Phase |
|--------|---------|-------------|--------------|
| Production bugs in tested code | Test coverage gap | "This was tested but failed in production. Test strategy issue?" | Testing |
| Repeated similar defects | Implementation pattern issue | "This defect pattern keeps recurring. Code quality issue?" | Implementation |
| Scaling/performance limits | Architectural constraint | "We keep hitting this limit. Design issue?" | Design |
| Users doing unexpected things | Requirements gap | "Users consistently expect [X]. Requirements gap?" | Requirements |
| Operational cost >> estimates | Planning assumptions wrong | "Costs are 3x estimate. Planning assumptions valid?" | Planning |

**Implementation → Design Signals:**
| Signal | Pattern | AI Question |
|--------|---------|-------------|
| Design infeasibility | Multiple workarounds for same design constraint | "These workarounds suggest the design may be infeasible. Should we revisit Design?" |
| Integration mismatch | Components don't fit together as designed | "Integration is failing because [reason]. Is this a design issue?" |
| Performance limits | Design choices causing performance issues | "Performance issues stem from [design choice]. Should we reconsider?" |

**Implementation → Requirements Signals:**
| Signal | Pattern | AI Question |
|--------|---------|-------------|
| Requirement ambiguity | Frequent "what should happen when...?" | "This requirement has been interpreted multiple ways. Should we clarify?" |
| Requirement conflict | Implementing one requirement breaks another | "Requirements [X] and [Y] appear to conflict. Should we escalate?" |
| Untestable requirement | Cannot verify requirement is satisfied | "This requirement cannot be tested as written. Should we revise?" |

**Testing → Requirements Signals:**
| Signal | Pattern | AI Question |
|--------|---------|-------------|
| Requirement gaps | Tests reveal unspecified scenarios | "Testing revealed [scenario] is unspecified. Should we add requirements?" |
| User expectation mismatch | UAT feedback contradicts requirements | "Users expected [X] but requirements say [Y]. Which is correct?" |
| Acceptance criteria issues | Criteria unverifiable or ambiguous | "Cannot verify acceptance criterion [X]. Should we clarify?" |

**Testing → Design Signals:**
| Signal | Pattern | AI Question |
|--------|---------|-------------|
| Systematic integration failures | Multiple integration tests failing | "Integration failures suggest architectural issue, not bugs. Should we escalate?" |
| Performance test failures | System can't meet NFRs | "Performance limits appear architectural. Should we revisit Design?" |
| Security vulnerabilities | Design-level security issues | "Security issues stem from design choices. Should we escalate?" |

### Decision Framework

When backward event signals detected:

```
┌─────────────────────────────────────────────────────────────────────┐
│              BACKWARD EVENT DECISION FRAMEWORK                      │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. AI PRESENTS EVIDENCE                                            │
│     • Pattern detected                                              │
│     • Signals that triggered detection                              │
│     • Likely source phase                                           │
│     • Recommended action                                            │
│                                                                     │
│  2. HUMAN ASSESSES (Tech Lead + PO)                                 │
│     • Is this really an upstream issue?                             │
│     • What's the cost of continuing vs. revisiting?                 │
│     • What information debt is created by workaround?               │
│     • What's the risk if we defer?                                  │
│                                                                     │
│  3. DECIDE                                                          │
│     • BACKWARD EVENT: Return to source phase                        │
│     • PROCEED AT RISK: Document as information debt                 │
│     • WORKAROUND: Accept with documented rationale                  │
│                                                                     │
│  4. PRESERVE                                                        │
│     • Decision with rationale                                       │
│     • If proceeding at risk: debt register entry                    │
│     • If backward event: trigger conditions for source phase        │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Information Debt from Avoided Backward Events

When teams proceed at risk rather than triggering backward events:

| Avoided Event | Debt Created | Interest (ongoing cost) | Principal (cost to fix properly) |
|---------------|--------------|-------------------------|----------------------------------|
| Impl → Design | Workarounds accumulate; architecture erodes | Maintenance burden; fragility | Design rework + re-implementation |
| Impl → Requirements | Ambiguity resolved ad-hoc; inconsistent interpretation | User confusion; bug reports | Requirements clarification + cascade |
| Testing → Requirements | Gaps filled with assumptions | Production surprises | Requirements + impl + test rework |
| Testing → Design | Performance/security workarounds | Operational burden | Architecture revision + rebuild |

**AI tracks avoided backward events and surfaces accumulated debt.**

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
| 1.1 | December 2025 | Added detailed Phase 7 (Deployment/Operations) with knowledge transfer, incident learning, operational feedback loops |
| 1.0 | December 2025 | Added Defensive Processes for Phases 5 & 6; Cross-Phase Backward Event Detection; comprehensive detection mechanisms and mitigations |
| 0.9 | December 2025 | Enhanced Phase 6 with all actor modes (1-5), backward events, detection mechanisms, skill preservation |
| 0.8 | December 2025 | Added detailed Phase 6 (Testing/Validation) with verification vs validation, coverage illusion |
| 0.7 | December 2025 | Added detailed Phase 5 (Implementation/Construction) with collaboration modes, technical debt patterns |
| 0.6 | December 2025 | Added Document Types sections to all phases (Org/Project/Working); linked to classification framework |
| 0.5 | December 2025 | Added detailed Phase 4 (Design/Architecture) with collaboration modes, DDD as informing practice |
| 0.4 | December 2025 | Added detailed Phase 3 (Analysis/Requirements) with AI Active Validation Process |
| 0.3 | December 2025 | Added detailed Phase 2 (Planning); added transition readiness questions |
| 0.2 | December 2025 | Added detailed Phase 1 (Initiation/Conception); corrected phase names |
| 0.1 | December 2025 | Initial placeholder |

---

*Evolution: Enhancing what works through dialogue.*
