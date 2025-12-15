# The Dialogue Framework

## An Evidence-Based Approach to AI-Augmented Software Development

---

## Introduction

**Dialogue** is a framework for understanding and designing AI-augmented software development, grounded in the recognition that software development is fundamentally a *conversation*—between humans and humans, humans and machines, and across time through artifacts.

The name reflects a core insight: software development succeeds or fails based on the quality of dialogue that transfers understanding between participants. Code is not the product; *shared understanding* is the product. Code is merely one artifact of that understanding.

### Why "Dialogue"?

Three converging research traditions inform this choice:

1. **Naur (1985)**: Programming is theory-building. The "theory" exists in developers' minds and cannot be fully documented. It transfers through *dialogue*—explanation, demonstration, collaborative work.

2. **Wegner (1986)**: Teams coordinate through transactive memory—knowing "who knows what." This meta-knowledge develops through *dialogue*—asking, telling, updating shared understanding of expertise distribution.

3. **Trist & Bamforth (1951), Cherns (1976)**: Socio-technical systems require joint optimisation of social and technical subsystems. The social subsystem operates through *dialogue*—communication, coordination, collective decision-making.

AI changes the participants in these dialogues but not the fundamental need for them.

---

## Theoretical Foundations

The Dialogue Framework rests on thirteen academic sources spanning 1951–2025 (nine peer-reviewed, four preprints or working papers), organised into four foundational pillars:

### Pillar 1: Socio-Technical Systems (System Design)

| Source | Contribution |
|--------|--------------|
| Trist & Bamforth (1951) | Joint optimisation principle—social and technical subsystems must be co-designed |
| Cherns (1976) | Nine actionable STS design principles |
| Baxter & Sommerville (2011) | Bridge to software engineering; STSE framework |

**Key insight**: Technical systems do not determine social arrangements. Alternative organisations exist for the same technology. Design is possible and necessary.

### Pillar 2: Individual and Team Cognition

| Source | Contribution |
|--------|--------------|
| Naur (1985) | Programming as theory-building; tacit knowledge central |
| Wegner (1986) | Transactive memory systems; "who knows what" |
| Ryan & O'Connor (2013) | Team Tacit Knowledge Measure (validated instrument) |

**Key insight**: Knowledge in software development is distributed, tacit, and transfers through social interaction—not documentation alone.

### Pillar 3: Developer Experience and Productivity

| Source | Contribution |
|--------|--------------|
| Meyer et al. (2019) | Good days research (N=5,971); progress, flow, social factors |
| Storey et al. (2022) | SPACE/TRUCE frameworks; multidimensional productivity |
| Obi et al. (2024) | Bad days research; vicious cycles, telemetry validation |
| Hicks et al. (2024) | Developer Thriving; four sociocognitive factors (N=1,282) |
| Hicks & Hevesi (2024) | Cumulative culture theory; social learning |

**Key insight**: Developer experience is multidimensional. Thriving requires agency, learning culture, support, and purpose—all sustained through dialogue.

### Pillar 4: AI Capabilities and Limitations

| Source | Contribution |
|--------|--------------|
| Hua et al. (2025) | Context Engineering 2.0; AI context management principles |
| Shojaee et al. (2025) | Illusion of Thinking; AI reasoning limits and collapse |

**Note**: These sources are preprints/corporate research, not yet peer-reviewed.

**Key insight**: AI has specific, measurable limitations (e.g., reasoning collapse at high complexity). Whether AI "builds theory" or "participates in TMS" is contested; what matters practically is designing effective human-AI dialogue.

---

## Core Concepts

The Dialogue Framework comprises interconnected concepts that together provide a complete model for AI-augmented software development:

### Concept 1: Information Composition Taxonomy

*How knowledge types shape what can be shared*

- **Formal knowledge**: Explicitly documented, machine-processable
- **Tacit knowledge**: Understood but not fully articulable; transfers through dialogue
- **Emergent knowledge**: Arises through interaction; exists only in dialogue

[→ Full concept: `concept_information-taxonomy.md`]

### Concept 2: Theory-Building Principle

*Why understanding matters more than artifacts*

- Programming creates theory in developers' minds
- Theory enables maintenance, modification, explanation
- Theory transfers through dialogue, not documentation alone
- AI can assist but cannot build or hold theory

[→ Full concept: `foundation_theory-building.md`]

### Concept 3: Transactive Memory Systems

*How teams coordinate distributed knowledge*

- Teams develop "who knows what" meta-knowledge
- Reduces individual cognitive load through specialisation
- Degrades with turnover, reorganisation, communication breakdown
- AI may support retrieval but cannot fully participate

[→ Full concept: `foundation_transactive-memory.md`]

### Concept 4: Eight-Capability Taxonomy

*What operations software development requires*

| Capability | Description |
|------------|-------------|
| **Elicit** | Extract information from sources |
| **Analyse** | Examine to understand properties |
| **Synthesise** | Combine elements into coherent wholes |
| **Transform** | Convert between representations |
| **Validate** | Confirm correctness or appropriateness |
| **Decide** | Select among alternatives |
| **Generate** | Produce new artifacts |
| **Preserve** | Store for future retrieval |

[→ Full concept: `concept_capability-model.md`]

### Concept 5: Seven-Phase SDLC Model

*When different work occurs*

| Phase | Primary Focus |
|-------|---------------|
| **Concept** | Problem understanding, opportunity identification |
| **Requirements** | Need articulation, constraint discovery |
| **Design** | Solution architecture, component specification |
| **Implementation** | Code creation, integration |
| **Verification** | Correctness confirmation |
| **Deployment** | Release, operational handover |
| **Operations** | Monitoring, maintenance, evolution |

[→ Full concept: `concept_seven-phase-sdlc.md`]

### Concept 6: Actor Model

*Who performs development activities*

| Actor Type | Characteristics |
|------------|-----------------|
| **Human** | Builds theory, participates in TMS, processes all knowledge types |
| **AI** | Pattern matching, retrieval at scale, processes formal knowledge only |
| **Human-AI** | Collaborative configurations with escalation mechanisms |

[→ Full concept: `concept_actor-model.md`]

### Concept 7: Five Collaboration Patterns

*How humans and AI work together*

| Pattern | Human Role | AI Role |
|---------|------------|---------|
| **Human-Only** | Full ownership | None |
| **Human-Led** | Direction and decision | Assistance and drafting |
| **Collaborative** | Shared contribution | Shared contribution |
| **AI-Led** | Review and override | Primary execution |
| **AI-Only** | Oversight only | Full execution |

[→ Full concept: `concept_collaboration-patterns.md`]

### Concept 8: Information Loss at Transitions

*Where understanding degrades*

- Phase transitions create information loss (35-55% typical)
- Tacit and emergent knowledge disproportionately lost
- Compounding effect across multiple transitions
- Mitigation requires deliberate dialogue and capture mechanisms

[→ Full concept: `concept_transitions-info-loss.md`]

### Concept 9: Joint Optimisation Principle

*How to design human-AI work systems*

- Social and technical subsystems must be co-designed
- Neither should constrain the other unnecessarily
- Design for human cognitive strengths + AI capabilities
- Apply Cherns' principles: minimal critical specification, variance control at source, boundary location

[→ Full concept: `foundation_socio-technical-systems.md`]

---

## The Dialogue Framework's Model

At its core, The Dialogue Framework models software development as a series of conversations:

```
┌─────────────────────────────────────────────────────────────────┐
│                THE DIALOGUE FRAMEWORK'S MODEL                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   STAKEHOLDERS ←──dialogue──→ DEVELOPERS                        │
│        │                           │                            │
│        │                           │                            │
│    dialogue                    dialogue                         │
│        │                           │                            │
│        ▼                           ▼                            │
│   REQUIREMENTS ←─────────→ UNDERSTANDING                        │
│        │                           │                            │
│        │                           │                            │
│    dialogue                    dialogue                         │
│   (with AI)                   (with AI)                         │
│        │                           │                            │
│        ▼                           ▼                            │
│    ARTIFACTS ←───────────→ THEORY (in minds)                    │
│        │                           │                            │
│        └───────── dialogue ────────┘                            │
│              (across time)                                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Dialogue Types

1. **Elicitation Dialogue**: Extracting understanding from stakeholders, systems, contexts
2. **Design Dialogue**: Exploring solution spaces, making trade-offs
3. **Implementation Dialogue**: Human-AI collaboration in code creation
4. **Review Dialogue**: Validating understanding, catching errors
5. **Knowledge Transfer Dialogue**: Onboarding, handover, documentation
6. **Maintenance Dialogue**: Understanding existing systems, planning changes

### AI's Role in Dialogue

AI participates in dialogue with asymmetric but complementary characteristics:

| Dialogue Aspect | Human | AI |
|-----------------|-------|-----|
| **Knowledge relationship** | Direct access to formal, tacit, emergent | Direct access to formal; mediated access to tacit/emergent through dialogue |
| **Theory-building** | Builds coherent explanatory models | Whether AI builds analogous understanding is contested |
| **Transactive memory** | Full social participation | Asymmetric—queryable but not socially embedded |
| **Persistence** | Accumulated understanding across time | Fresh context each session (as of 2024-2025) |
| **Retrieval at scale** | Limited | Excellent |

**Epistemic note**: Naur (1985) and Wegner (1986) defined theory-building and transactive memory for human cognition before modern AI. Claims about AI's relationship to these constructs are this framework's interpretations, not established findings.

---

## Framework Application

### For Practitioners

The Dialogue Framework provides:

1. **Activity classification**: Map activities to capabilities, phases, knowledge types
2. **Actor selection**: Determine appropriate human/AI involvement
3. **Pattern selection**: Choose collaboration patterns based on knowledge composition
4. **Risk identification**: Predict where information loss will occur
5. **Measurement guidance**: Select metrics appropriate to phase and activity

### For Researchers

The Dialogue Framework enables:

1. **Hypothesis generation**: Predict outcomes based on framework constructs
2. **Measurement instruments**: Validated measures for key constructs (TTKM, SPACE, etc.)
3. **Intervention design**: Target specific framework elements
4. **Comparative analysis**: Evaluate practices against framework predictions

### For Organisations

The Dialogue Framework supports:

1. **Work system design**: Apply STS principles to human-AI integration
2. **Team formation**: Consider transactive memory and knowledge distribution
3. **Process design**: Minimise information loss at transitions
4. **Tool selection**: Match AI capabilities to appropriate activities
5. **Measurement systems**: Move beyond velocity to multidimensional assessment

---

## Evidence Base

The framework's claims are grounded in:

| Evidence Type | Sources | Strength |
|---------------|---------|----------|
| Meta-analyses | Colfer & Baldwin (N=142 studies), Pasmore et al. (N=134 experiments) | Strong |
| Large-scale empirical | Meyer (N=5,971), Hicks (N=1,282), Ryan & O'Connor (N=48 teams) | Strong |
| Replicated findings | Socio-technical congruence (32% effect, multiple replications) | Strong |
| Theoretical foundations | Naur, Wegner, Trist, Cherns (70+ years of development) | Strong |
| Contemporary validation | Obi telemetry validation, SPACE framework validation | Moderate-Strong |

---

## Limitations and Boundaries

### What the Framework Does Not Claim

1. **Prescriptive certainty**: Guidance is probabilistic, context-dependent
2. **Universal applicability**: Western, large-tech-company bias in evidence base
3. **AI capability prediction**: Current limitations may change; framework temporally qualified

### Process Guidance

The framework provides two meta-processes for AI-augmented development, reflecting different change strategies:

- **Evolution**: Incremental adoption from current practice—adding AI capabilities to existing workflows while preserving team knowledge and organisational structures
- **Revolution**: Transformational redesign—fundamentally reconceiving work systems for joint human-AI optimisation

The Seven-Phase SDLC provides the structural foundation; these meta-processes guide *how* organisations traverse phases with AI integration. Detailed process specifications are provided in the guidance documents.

### Known Gaps

1. **Longitudinal evidence**: Most studies cross-sectional
2. **Domain specificity**: Limited evidence for embedded, games, scientific computing
3. **Cultural variation**: Non-Western contexts understudied
4. **Small team dynamics**: Evidence biased toward larger organisations

---

## Document Map

| Document | Type | Purpose |
|----------|------|---------|
| `dialogue-framework.md` | Overview | This document—framework introduction and structure |
| `integration_framework-architecture.md` | Integration | Detailed analysis of source integration |
| `concept_*.md` | Concept | Individual concept specifications |
| `foundation_*.md` | Foundation | Theoretical foundations |
| `guidance_*.md` | Guidance | Application guidance |
| `example_*.md` | Example | Worked examples and registries |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 0.2 | December 2025 | Refined AI capability framing; corrected evidence base claims; added Evolution/Revolution meta-processes |
| 0.1 | December 2025 | Initial skeleton |

---

*The Dialogue Framework: Because software is built through conversation.*
