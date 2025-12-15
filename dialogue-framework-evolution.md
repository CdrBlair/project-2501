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

*To be developed*

---

### Phase 4: Design/Architecture

*To be developed*

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
| 0.3 | December 2025 | Added detailed Phase 2 (Planning); added transition readiness questions |
| 0.2 | December 2025 | Added detailed Phase 1 (Initiation/Conception); corrected phase names |
| 0.1 | December 2025 | Initial placeholder |

---

*Evolution: Enhancing what works through dialogue.*
