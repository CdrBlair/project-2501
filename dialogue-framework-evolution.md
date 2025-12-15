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
3. **Maintain knowledge continuity**: Protect tacit knowledge and TMS
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

#### Evolution Risk

- AI surfaces pattern → team treats as "the problem" → actual problem is something data doesn't capture
- Polished AI-generated business case masks lack of genuine stakeholder alignment
- Stakeholders disengaged because "the AI did the analysis"

---

### Phase 2: Planning

*To be developed*

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
| 0.2 | December 2025 | Added detailed Phase 1 (Initiation/Conception); corrected phase names |
| 0.1 | December 2025 | Initial placeholder |

---

*Evolution: Enhancing what works through dialogue.*
