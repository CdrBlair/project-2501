# Key Reference Concept 3: Eight-Capability Taxonomy

## Definition

Software development activities decompose into sequences of eight fundamental capabilities—information services that must be provided for work to succeed. These capabilities represent the basic operations performed on information throughout development: extracting it from sources (Elicit), breaking it down (Analyse), combining it into wholes (Synthesise), converting between forms (Transform), confirming correctness (Validate), choosing among options (Decide), producing artifacts (Generate), and storing for retrieval (Preserve). This capability-centric view enables more precise reasoning about task allocation than traditional role-based thinking. Activities like "requirements elicitation" involve multiple capabilities in sequence—elicit from stakeholders, analyse for patterns, synthesise into coherent understanding, transform into specifications, validate with stakeholders, decide on priorities, generate documentation, and preserve for downstream use. Understanding which capabilities an activity requires—and what knowledge enables each—enables principled decisions about who should provide them and how.

## The Eight Capabilities

| Capability | Description | Typical Knowledge Required | Primary Information Focus |
|------------|-------------|---------------------------|--------------------------|
| **Elicit** | Extract information from sources (stakeholders, systems, documents, observations) | Varies by source: system queries require technical knowledge; document extraction requires domain familiarity; stakeholder elicitation requires social skills and active listening | Formal knowledge from systems/documents; tacit knowledge from human sources (requires trust, social understanding) |
| **Analyse** | Decompose information, classify it, identify patterns, detect conflicts and inconsistencies | Analytical frameworks, domain models, classification schemes, heuristics | Pattern recognition across both formal and tacit knowledge |
| **Synthesise** | Combine disparate information into coherent wholes, integrate perspectives, create unified understanding | Systems thinking, integration patterns, holistic view, creative combination | Building theory from multiple information sources |
| **Transform** | Convert information between forms and representations (requirements→design, design→code, models→documentation) | Source/target formats, mapping rules, validation criteria, semantic understanding | Converting primarily formal information between representations |
| **Validate** | Confirm correctness, completeness, consistency, and fitness for purpose | Quality criteria, domain constraints, verification methods, acceptance standards | Checking formal correctness and tacit fitness-for-purpose |
| **Decide** | Select among alternatives, make trade-offs, prioritise, accept risk, commit resources | Value frameworks, trade-off analysis, risk assessment, contextual judgement | Applying tacit judgement to formal alternatives |
| **Generate** | Produce new information artifacts (specifications, code, tests, documentation, reports) | Templates, patterns, domain knowledge, generation rules, quality standards | Creating formal artifacts from formal/tacit understanding |
| **Preserve** | Capture and store information for later retrieval, maintain institutional memory | Storage mechanisms, retrieval requirements, retention policies, knowledge organisation | Storing formal artifacts and tacit rationale |

## Capability Sequences in Activities

Activities involve multiple capabilities in characteristic sequences. Understanding these sequences enables decomposition of complex activities into manageable capability-provision tasks:

**Requirements elicitation**: Elicit (from stakeholders) → Analyse (classify and structure) → Synthesise (coherent requirements set) → Transform (into formal specifications) → Validate (with stakeholders) → Decide (priorities) → Generate (documentation) → Preserve (for design)

**Architecture design**: Elicit (quality requirements) → Analyse (constraints and trade-offs) → Synthesise (architectural approach) → Decide (pattern selection) → Generate (architecture documentation) → Validate (against requirements) → Preserve (ADRs and rationale)

**Code implementation**: Transform (design to code) → Generate (source code) → Validate (unit testing) → Preserve (version control) — with continuous Analyse (code review) and Decide (refactoring choices)

**Test design**: Analyse (requirements and risks) → Synthesise (test strategy) → Decide (coverage priorities) → Generate (test cases) → Transform (to executable scripts) → Preserve (test suite)

## Capability Instances
A capability step within an activity sequence (e.g., "Elicit" in requirements elicitation) typically comprises multiple capability instances — individual executions targeting specific sources. The capability step completes when sufficiency criteria are satisfied.

For example, the Elicit step in requirements gathering might involve:

 - Elicit from legacy system APIs (formal -> AI-suited)
 - Elicit from existing documentation (formal -> AI-suited)
 - Elicit from primary stakeholders (tacit -> human-required)
 - Elicit from end users (tacit -> human-required)

Actor allocation decisions occur at the instance level, not the capability level. The eight capabilities are abstract operations; instances are their concrete executions against specific sources.

## Key Implications

**For task allocation**: Each capability spans a spectrum from formal to tacit variants, and actor suitability depends on where on that spectrum a specific instance falls. Eliciting from APIs or documents suits AI; eliciting unstated assumptions from stakeholders requires human social understanding. Transforming between formal representations suits AI; transforming tacit design rationale into explicit documentation requires human interpretation. Decide on rule-based criteria suits AI; Decide involving value trade-offs requires human judgement.

**For skill development**: Rather than training for broad roles ("developer," "analyst"), organisations can identify specific capability gaps and target development. A junior developer might need to strengthen Analyse (recognising code patterns), Validate (testing judgement), and Synthesise (designing coherent modules) capabilities specifically.

**For activity decomposition**: Complex activities that seem overwhelming can be decomposed into capability sequences where each step is more tractable. Rather than "create architecture" as a monolithic task, break it into: elicit quality requirements, analyse constraints, synthesise approach, decide among patterns, generate documentation, validate against requirements.

**For understanding bottlenecks**: When work stalls, identifying which capability is the bottleneck enables targeted intervention. Is elicitation failing because stakeholders are unavailable? Is synthesis failing because information hasn't been adequately analysed? Is preservation failing because documentation tooling is inadequate?

**For recognising capability contributions to theory building**: Some capabilities contribute more to theory building than others. Synthesise builds understanding by combining information into coherent wholes. Decide builds understanding by forcing explicit trade-off evaluation. Elicit builds understanding through deep engagement with problem domain. Transform and Preserve, while essential, contribute less to theory building because they operate on existing understanding rather than creating it.

## Integration with Other Concepts

- **Information Composition Taxonomy**: Each capability can operate on different knowledge types, and the knowledge type—not the capability itself—determines actor suitability. Eliciting tacit knowledge requires human actors; eliciting formal knowledge from systems suits AI. Synthesising novel understanding from ambiguous inputs requires human theory-building; synthesising structured summaries from formal inputs suits AI. The capability is the operation; the knowledge type determines who should perform it.
- **Theory-Building Principle**: Capabilities differ in theory-building contribution. Synthesise, Decide, and Elicit actively build theory. Transform, Generate, and Preserve support theory but don't build it directly.
- **Seven-Phase SDLC Model**: Different phases emphasise different capabilities. Early phases (Initiation, Planning) emphasise Elicit, Synthesise, and Decide. Middle phases (Requirements, Design) add Transform and Validate. Later phases (Implementation, Testing) emphasise Generate, Transform, and Validate.
- **Actor Model**: Human and AI actors differ not in which capabilities they can provide, but in which knowledge types they can operate upon. Humans can perform all eight capabilities across formal, tacit, and emergent knowledge. AI can perform all eight capabilities effectively only when operating on formal knowledge. The mapping is knowledge-type-to-actor, not capability-to-actor. This means AI can elicit (from systems), analyse (formal patterns), synthesise (structured summaries), and even decide (rule-based selection)-but struggles when any capability requires accessing or generating tacit knowledge.
- **Five Collaboration Patterns**: Capabilities map to patterns based on knowledge requirements. This mapping (Concept 7) enables systematic pattern selection rather than intuition-based allocation.
- **Phase-Specific Information Composition**: Different phases not only have different information compositions but also require different capability mixes, explaining why automation levels shift across the lifecycle.

## Evidence Base

The eight-capability taxonomy derives from cognitive task analysis research showing that expert work decomposes into recognisable cognitive operations. Nonaka & Takeuchi's SECI model (Socialisation, Externalisation, Combination, Internalisation) from knowledge management literature provides theoretical grounding for information transformation capabilities. ISO/IEC/IEEE 12207 implicitly recognises many of these capabilities through its process definitions, though it doesn't make the capability abstraction explicit. Empirical studies of software development activities show that practitioners naturally describe their work using these capability concepts when asked to explain their processes. Research on expertise shows that capability mastery, not role knowledge, distinguishes expert from novice performance—experts provide capabilities more effectively across multiple traditional roles.

## Validation Status

- ✓ **Conceptual coherence**: Practitioners recognise these capabilities when explained and find them useful for reasoning about work
- ⚠ **Eight as complete**: While these eight capture most work, validation that no additional fundamental capabilities exist requires systematic empirical study
- ⚠ **Capability boundaries**: Some capabilities (Analyse vs Synthesise, Validate vs Decide) have fuzzy boundaries requiring clearer operational definitions
- ⚠ **Capability sequences**: Common sequences are observable but haven't been systematically catalogued across all activity types
- ⚠ **Knowledge requirement mappings**: The knowledge types required for each capability are reasoned assertions requiring empirical validation through studies of actual practitioners
- ⚠ **Capability-to-actor mapping**: Actor suitability is determined at the instance level by knowledge type, source type, and interaction mode — not at the capability category level. A single capability step within an activity typically comprises multiple instances requiring different actors. Completion criteria for capability steps often involve tacit sufficiency judgements.

---

*The Eight-Capability Taxonomy provides operational granularity for reasoning about work. By decomposing activities into capability sequences, the framework enables precise task allocation, targeted skill development, and systematic bottleneck identification. This capability lens makes abstract activities concrete and actionable.*
