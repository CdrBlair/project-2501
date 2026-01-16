# Key Reference Concept 1: Information Composition Taxonomy

## Definition

Software development involves three fundamentally different types of information, each requiring different handling approaches. **Formal** information is explicitly representable and machine-processable. **Tacit** information is experientially embedded and resists complete articulation. **Emergent** information arises from interactions and doesn't exist until exploration creates it. Any software artifact or activity involves some composition of all three types, and this composition determines appropriate documentation strategies, automation levels, and collaboration patterns.

## The Three Information Types

| Type | Definition | Examples | AI Relationship* |
|------|------------|----------|------------------|
| **Formal** | Explicitly representable, machine-processable, verifiable | Source code, specifications, schemas, test cases, API contracts | **Direct** — AI can process, generate, and validate |
| **Tacit** | Experientially embedded, resists articulation, "we know more than we can tell" | Architectural intuition, coding judgement, stakeholder context, design rationale | **Mediated** — AI processes what humans articulate; dialogue can surface tacit understanding |
| **Emergent** | Arises from interactions, discoverable unknown, doesn't exist until exploration | Creative insights, unexpected requirements, system behaviors, team dynamics | **Participatory** — AI participates in interactions that may generate emergent understanding; whether AI-human dialogue produces genuine emergence is contested |

*\*Note on AI Relationship: The formal/tacit distinction originates with Polanyi (1966); the emergent category extends this taxonomy. These concepts predate modern AI. The "AI Relationship" column represents this framework's interpretation as of 2024-2025, not claims from the original literature. AI's relationship to tacit and emergent knowledge is mediated through dialogue—humans articulate, AI processes, humans refine—rather than direct access or categorical exclusion.*

## Tacit Knowledge Subtypes

The category "tacit knowledge" encompasses knowledge with varying degrees of resistance to externalisation. Not all tacit knowledge is equally difficult to capture—some is merely undocumented, while some is fundamentally inarticulable. This differentiation has significant implications for capture strategies, transactive memory requirements, and AI assistance potential.

### The Three Subtypes

| Subtype | Definition | Capture method | Capture fidelity | TMS requirement |
|---------|------------|----------------|------------------|-----------------|
| **Documentable** | Known but not yet externalised; holder could document if prioritised | Standard documentation effort | High (~90%) | Low—direct lookup once captured |
| **Elicitable** | Can be surfaced through structured dialogue but wouldn't emerge spontaneously | Interviews, retrospectives, design reviews, pair sessions | Medium (~50-70%) | Medium—TMS helps locate who to elicit from |
| **Embedded** | Fused with practice; cannot be fully separated from the activity itself | Apprenticeship, extended pairing, learning by doing | Low (~10-20%) | High—must route to expert; no capture substitute |

**Documentable** knowledge is effectively formal knowledge in latent state. The holder possesses articulable facts, decisions, or rationale that simply haven't been written down. Once documented, this knowledge becomes formal and directly accessible. Example: A developer knows which configuration flags are needed for a specific deployment scenario but hasn't added them to the runbook.

**Elicitable** knowledge requires active effort to surface. The holder may not spontaneously articulate it, but structured questioning, design reviews, or collaborative sessions can draw it out. Capture is possible but lossy—some nuance or context is typically lost in translation. Example: An architect can explain their reasoning for choosing a particular pattern when asked, but wouldn't naturally document all the trade-offs they considered.

**Embedded** knowledge corresponds to Naur's "theory"—understanding so integrated with practice that it cannot be fully externalised. The holder can demonstrate but not fully explain. Transfer requires extended collaboration where the learner develops their own embodied understanding through practice. Example: A senior developer's intuition about when code "smells wrong" or when a design will cause maintenance problems—they can point to examples but cannot provide complete rules.

### Prospective Identification

A key practical question: can we identify which subtype we're dealing with *before* attempting capture? The following heuristic provides actionable guidance:

```
1. Can the knowledge holder state it clearly on request?
   YES → Documentable (capture via documentation)
   NO  → Proceed to step 2

2. Can the knowledge holder demonstrate it or recognise correct instances?
   NO  → Knowledge may not exist (or wrong person identified)
   YES → Proceed to step 3

3. Has structured elicitation been attempted?
   NO  → Assume Elicitable (attempt structured elicitation)
   YES → Proceed to step 4

4. Did elicitation yield satisfactory capture?
   YES → Was Elicitable (capture complete)
   PARTIAL → Mixed; captured portion was Elicitable, remainder is Embedded
   NO  → Embedded (transfer via apprenticeship only)
```

**Default assumption**: When encountering unexternalised expert knowledge, assume it is **Elicitable** and attempt structured elicitation first. Only reclassify as Embedded after elicitation attempts yield incomplete results.

**Early indicators suggesting Embedded knowledge** (heuristics, not guarantees):
- Knowledge manifests only in real-time judgement, not recollection
- Holder uses phrases like "you just know" or "it feels wrong"
- Expertise is highly contextual—changes based on subtle situational factors
- Capability took years of deliberate practice to develop
- Domain involves pattern recognition across many variables (debugging intuition, architectural taste)

### Implications for Knowledge Management

**For capture investment**: Efforts to document Documentable knowledge have high ROI—straightforward capture of accessible information. Efforts to elicit Elicitable knowledge have moderate ROI but require appropriate methods (structured interviews, design reviews, pair sessions). Attempts to document Embedded knowledge waste effort—investment is better directed toward apprenticeship, team stability, and mentoring relationships.

**For transactive memory**: The subtype determines TMS requirements:
- Documentable → No TMS needed once captured; direct lookup suffices
- Elicitable → TMS helps identify who holds the knowledge for elicitation
- Embedded → TMS essential; must route to the expert since knowledge cannot be captured

**For AI assistance**: AI can directly assist with capturing Documentable knowledge (transcription, structuring, formatting). AI can facilitate elicitation of Elicitable knowledge (structured questioning, dialogue scaffolding). AI cannot capture Embedded knowledge but may support access by helping route to appropriate human experts.

**For the "70-80% tacit" finding**: This aggregate figure likely comprises a mix of all three subtypes. Decomposition matters: if 25% is Documentable, 35% is Elicitable, and 20% is Embedded, the capture and automation strategies differ dramatically from treating all 80% uniformly as "tacit."

### Phase Variation

The composition of tacit subtypes likely varies across SDLC phases:
- **Early phases** (Initiation, Planning): Higher proportion of Embedded knowledge—strategic intuition, stakeholder dynamics, market understanding
- **Middle phases** (Requirements, Design): Mixed—Elicitable design rationale alongside Embedded architectural judgement
- **Later phases** (Implementation, Testing, Operations): Higher proportion of Documentable knowledge—decisions and patterns that simply haven't been written down yet

This variation has implications for phase-appropriate knowledge management strategies. See [Phase-Specific Information Composition](./integration_phase-specific-composition.md) for detailed phase analysis.

## Measuring Information Composition

Activities and artifacts can be characterised by their approximate information composition. These are estimates, not precise measurements:

**Indicators of high formal content:**
- Produces machine-verifiable artifacts
- Can be completely specified in advance
- Success criteria are unambiguous
- Same inputs consistently produce same outputs

**Indicators of high tacit content:**
- Requires extensive experience to perform well
- Experts struggle to fully explain their process
- Judgement and intuition are central
- Novices produce qualitatively different results

**Indicators of high emergent content:**
- Outcomes cannot be fully predicted in advance
- Understanding develops through exploration
- Participants discover new information through interaction
- Requirements or designs change as work proceeds

**Typical phase compositions (directional patterns):**
- **Early phases** (Initiation, Planning): 60-75% tacit, 10-25% formal, 10-20% emergent
- **Middle phases** (Requirements, Design): 40-50% tacit, 40-50% formal, 10% emergent
- **Later phases** (Implementation, Testing, Operations): 30-40% tacit, 55-65% formal, 5-10% emergent

## Key Implications

**For documentation strategy:** Formal information can and should be comprehensively documented. Tacit information requires supplementary approaches (mentoring, pair programming, communities of practice). Emergent information cannot be documented in advance but can be captured retrospectively.

**For human-AI collaboration:** AI operates directly on formal information. Its relationship to tacit and emergent knowledge is mediated through dialogue: AI can elicit articulation from humans, process those articulations, and present understanding back for validation and refinement. This iterative process surfaces tacit knowledge progressively. The information composition of an activity influences collaboration design—formal-heavy activities suit AI-Led patterns, while tacit-heavy activities benefit from Human-Led or Partnership patterns where dialogue enables knowledge transfer. Well-designed escalation mechanisms (see Concept 7) enable AI participation in mixed-composition activities by ensuring human engagement at critical decision points.

**For measurement:** Formal-heavy activities support quantitative metrics. Tacit-heavy activities require qualitative assessment. Mixed-composition activities need hybrid measurement approaches.

**For team organisation:** Activities with high tacit composition benefit from team stability (preserving accumulated understanding). Activities with high formal composition support more flexible staffing.

**For theory building:** Tacit knowledge is what makes theory "theory"—the understanding that resides in developers' minds and enables intelligent system evolution. Over-automating tacit-heavy activities risks theory atrophy.

## Document Lifecycle Classification

Documents can be further classified by their temporal characteristics and organisational scope, based on ISO/IEC/IEEE 15289:2019. This classification intersects with information composition to guide retention policies, automation levels, and knowledge management strategies.

### Temporal Classification

| Class | Update Frequency | Lifespan | Information Composition | Typical Automation | Examples |
|-------|------------------|----------|-------------------------|-------------------|----------|
| **Standing** | Quarterly or less | Years | ~80% tacit capture attempt; 30-40% retention | L2-L3 (humans provide theory, AI assists structure) | Architecture Descriptions, Policies, ADRs, System Specifications |
| **Dynamic** | Weekly or more | Project duration | ~60% formal, 40% tacit interpretation | L3-L4 (AI generates, humans interpret) | Project Plans, Risk Registers, Status Reports, Dashboards |
| **Ephemeral** | Single use | Days to weeks | Point-in-time capture; window at creation or lost | L3-L4 (AI captures, humans add meaning) | Pull Requests, Support Tickets, Meeting Notes, Chat threads |

### Scope Classification

| Scope | Applicability | Examples |
|-------|---------------|----------|
| **Organisational** | Enterprise-wide; conditions decisions across projects | Reference architectures, coding standards, security policies |
| **Project** | Single initiative; tracks project-specific understanding | Solution designs, project plans, requirements specifications |
| **Task** | Single task; enables immediate coordination | User stories, bug reports, change requests, working notes |

### The Temporal-Scope Matrix

Temporal and scope classifications are orthogonal. A document type occupies a cell in this matrix:

|  | Standing | Dynamic | Ephemeral |
|--|----------|---------|-----------|
| **Organisational** | Enterprise architecture, Policies | Org-wide dashboards, Portfolio status | Leadership announcements |
| **Project** | Solution architecture, ADRs | Sprint plans, Risk registers | Daily standups, PR reviews |
| **Task** | (rare) | Task tracking, Kanban cards | Slack threads, Working notes |

### Knowledge Retention Implications

**Standing documents** attempt to crystallise tacit knowledge into formal artefacts. Research indicates that without supplementary strategies, only 30-40% of original understanding survives formalisation—a significant loss that explains why comprehensive documentation alone fails to preserve organisational knowledge. Standing documents remain essential for preserving retrievable rationale, but must be combined with tacit knowledge transfer mechanisms (mentoring, communities of practice, team continuity) to reduce losses.

**Dynamic documents** track evolving state; their formal content is current but interpretation requires understanding the trajectory. AI can generate and update these effectively; humans provide contextual interpretation.

**Ephemeral documents** capture knowledge at a single moment. If tacit understanding isn't added at creation (e.g., context in a commit message, rationale in a ticket), it's permanently lost. The capture window is narrow and non-recoverable.

### Automation Level Guidance

The temporal classification provides default automation levels that align with collaboration patterns:

- **Standing (L2-L3)**: Human-Led to Partnership. Humans provide the theory and rationale; AI assists with structure, consistency, and completeness checks.
- **Dynamic (L3-L4)**: Partnership to AI-Led. AI generates updates from formal data sources; humans interpret trends and make judgements.
- **Ephemeral (L3-L4)**: Partnership to AI-Led. AI captures and structures point-in-time information; humans add meaning and context.

These levels are defaults; specific documents may require adjustment based on their information composition and organisational context.

## Integration with Other Concepts

- [**Theory-Building Principle**](./foundation_theory-building.md): Theory is tacit by nature—what makes certain knowledge tacit is that it represents theory in developers' minds. Specifically, Naur's "theory" corresponds to the Embedded subtype of tacit knowledge—understanding so integrated with practice that it cannot be fully externalised.
- [**Transactive Memory Systems**](./foundation_transactive-memory.md): Transactive memory directory knowledge is meta-information (information about information location). Different tacit subtypes have different TMS requirements: Documentable knowledge needs minimal TMS once captured; Elicitable knowledge benefits from TMS to locate elicitation sources; Embedded knowledge requires robust TMS since the expert must be consulted directly.
- [**Eight-Capability Model**](./concept_capability-model.md): Different capabilities require different knowledge types (Elicit/Synthesise require tacit; Transform/Preserve enable formal)
- [**Seven-Phase SDLC**](./concept_seven-phase-sdlc.md): Each phase has characteristic information composition that shifts from tacit-heavy early to formal-heavy late
- [**Actor Model**](./concept_actor-model.md): Human and AI actors differ in their knowledge relationships—humans can directly access all three types; AI accesses formal knowledge directly and tacit/emergent knowledge through dialogue with humans. Escalation mechanisms and iterative conversation enable AI participation in activities involving tacit knowledge.
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): Pattern selection depends on activity information composition
- [**Phase-Specific Composition**](./integration_phase-specific-composition.md): Provides specific percentage estimates for each phase
- [**Information Loss at Transitions**](./concept_transitions-info-loss.md): Tacit and emergent information are disproportionately lost at transition events (35-55% per transition). Document lifecycle class affects retention—standing documents preserve rationale but with significant loss; ephemeral documents lose unrecorded tacit knowledge entirely. Information type also influences event triggers: tacit and emergent discoveries often cause backward events (revisiting earlier phases).
- [**Phase-Aware Measurement**](./concept_phase-aware-measurement.md): Different phases need different measurement approaches based on their information composition

## Evidence Base

**Formal/tacit distinction**: Well-established through Polanyi (1966) and extensive organisational knowledge management literature. **Emergent category**: Conceptually defensible but requires empirical validation. **Specific percentages**: Reasoned estimates requiring systematic measurement studies. **70-80% tacit prevalence**: Multiple studies across software engineering contexts. **42% unique knowledge**: Large-scale survey finding that nearly half of job-critical knowledge exists in individual minds only.

## Validation Status

- ✓ **Formal/tacit distinction**: Empirically validated across multiple domains
- ✓ **Three-type taxonomy**: Conceptually coherent, face validity from practitioners
- ⚠ **Emergent as distinct category**: Requires validation that it's not simply tacit knowledge
- ⚠ **Specific percentages**: Estimates requiring empirical studies with systematic measurement
- ⚠ **Phase progression pattern**: Directionally supported but needs quantitative validation
- ⚠ **Tacit subtypes (Documentable/Elicitable/Embedded)**: Conceptually derived from practitioner experience and theoretical analysis; requires empirical validation of boundaries, capture fidelity estimates, and phase variation patterns
- ⚠ **Subtype identification heuristic**: Practitioner-facing guidance derived from the subtype definitions; effectiveness in real knowledge management contexts untested

---

*This taxonomy provides the foundational framework for reasoning about all other concepts. Understanding what types of information exist and how they're distributed enables principled decisions about documentation, automation, collaboration, and measurement throughout the SDLC.*
