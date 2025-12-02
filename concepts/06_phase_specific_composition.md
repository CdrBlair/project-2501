# Key Reference Concept 6: Phase-Specific Information Composition

## Definition

Each of the seven SDLC phases has a characteristic information composition—a specific mix of formal, tacit, and emergent knowledge that shapes appropriate approaches to documentation, automation, collaboration, and measurement. The composition shifts systematically across the lifecycle from tacit-heavy early phases (Initiation: 75% tacit) through balanced middle phases (Requirements: 40% formal, 50% tacit) to formal-heavy later phases (Implementation: 55% formal). This progression is not arbitrary but reflects the nature of work in each phase: early phases involve problem framing and stakeholder alignment requiring extensive tacit judgement; middle phases transform tacit understanding into formal specifications; later phases operate primarily on formal artifacts like code and tests. Understanding phase-specific composition enables targeted strategies rather than one-size-fits-all approaches—documentation strategies that work for Implementation (formal-heavy) fail for Initiation (tacit-heavy); automation approaches appropriate for Testing (formal-heavy) are inappropriate for Planning (tacit-heavy); measurement frameworks effective for Operations (formal-heavy) don't work for Conception (tacit-heavy).

## Phase-Specific Composition Estimates

| Phase | Formal | Tacit | Emergent | What This Composition Means |
|-------|--------|-------|----------|----------------------------|
| **1. Initiation/Conception** | 5% | 75% | 20% | Extremely tacit-heavy: strategic rationale, stakeholder politics, market understanding, opportunity framing resist documentation. High emergent: insights arise through exploration. Minimal formal artifacts. Requires human leadership, social learning, extensive interaction. |
| **2. Planning** | 35% | 55% | 10% | Predominantly tacit: estimation based on experience, risk assessment requiring contextual judgement, team dynamics understanding. Moderate formal: schedules, budgets, resource allocations can be documented. Low emergent: most planning knowledge exists before planning starts. Requires human judgement with AI analytical support. |
| **3. Analysis/Requirements** | 40% | 50% | 10% | Balanced composition: formal specifications are produced but require extensive tacit understanding to create. Elicitation draws out stakeholder tacit knowledge; transformation into formal specifications requires tacit interpretation. Low emergent: requirements are discovered not invented. Benefits from human-AI partnership. |
| **4. Design/Architecture** | 50% | 40% | 10% | Transitional: slightly more formal than tacit. Architecture documents and design specifications are formal, but design rationale, trade-off reasoning, and pattern selection require substantial tacit understanding. Low emergent: mostly applying known patterns. Benefits from human-AI partnership with human leadership on decisions. |
| **5. Implementation/Construction** | 55% | 35% | 10% | Formal-dominant: source code is entirely formal and machine-processable. However, significant tacit knowledge remains—coding judgement, design intent understanding, appropriate abstraction selection. Low emergent: mostly executing known designs. Enables substantial AI participation with human oversight. |
| **6. Testing/Validation** | 60% | 30% | 10% | Strongly formal: test specifications, test execution, and test results are formal and automatable. Tacit knowledge matters for test design (what to test), exploratory testing (finding unexpected issues), and acceptance judgement (does this meet the need). Low emergent: mostly validating known requirements. Enables AI-led execution with human design and judgement. |
| **7. Deployment/Operations** | 60% | 30% | 10% | Strongly formal: deployment procedures, monitoring rules, operational runbooks are formal and automatable. Tacit knowledge critical for complex incident diagnosis, performance tuning judgement, and understanding system behaviour under unusual conditions. Low emergent: most operational knowledge develops over time. Enables AI-led automation with human expertise for complex issues. |

## The Progression Pattern

The systematic shift from tacit-heavy to formal-heavy reflects the fundamental nature of software development as theory building followed by theory instantiation. Early phases build theory about the problem and opportunity—this theory is inherently tacit, residing in developers' and stakeholders' minds. Middle phases transform theory into formal specifications and designs—a translation process requiring substantial tacit understanding. Later phases instantiate specifications into formal artifacts (code, tests, procedures) that machines can execute—work operating primarily on formal representations.

**Why emergent stays consistently low (10%)**: Emergent knowledge arises from interactions and discoveries during work. It remains relatively constant across phases because every phase involves some discovery—unexpected stakeholder needs in Requirements, unanticipated design trade-offs in Architecture, surprising implementation challenges in Construction. However, emergent knowledge never dominates because most work involves applying existing knowledge rather than discovering fundamentally new understanding.

**Why the transition point occurs around Design/Implementation**: Design is where theory transformation into formal representation reaches a tipping point. Requirements capture "what" in semi-formal specifications requiring human interpretation. Design defines "how" in structures increasingly amenable to formalisation. Implementation executes designs in entirely formal representations (code). This progression explains why AI capabilities correspond inversely with tacit density—AI excels at formal manipulation but cannot access tacit understanding.

## Key Implications

**For documentation strategy**: Tacit-heavy phases (Initiation, Planning) require supplementary approaches beyond documents—mentoring, communities of practice, storytelling. Balanced phases (Requirements, Design) need dual strategies—formal specifications plus rationale capture. Formal-heavy phases (Implementation, Testing, Operations) benefit from comprehensive formal documentation with targeted tacit knowledge capture for critical decisions.

**For automation boundaries**: Tacit-heavy phases must remain human-led regardless of AI technical capabilities because tacit knowledge cannot be accessed by AI. Balanced phases benefit from human-AI partnership where humans provide tacit understanding and AI handles formal transformations. Formal-heavy phases enable AI-led execution with human oversight for exceptional situations requiring tacit judgement.

**For team organisation and knowledge transfer**: Tacit-heavy phases benefit critically from team stability—Initiation and Planning knowledge resides in specific individuals and degrades with turnover. Formal-heavy phases support more flexible staffing because knowledge exists in formal artifacts. Knowledge transfer strategies must adapt—tacit phases need mentoring and pairing; formal phases can use documentation and training.

**For measurement approaches**: Formal-heavy phases support quantitative metrics (defect density, test coverage, deployment frequency) because artifacts are measurable. Tacit-heavy phases require qualitative assessment (stakeholder alignment, shared understanding, problem framing adequacy) because critical knowledge resists quantification. Mixed approaches are needed for balanced phases.

**For understanding failure patterns**: Phase composition predicts failure modes. Tacit-heavy Initiation failures stem from stakeholder misalignment and inadequate problem framing (39-47% of total failures). Balanced Requirements failures stem from incomplete tacit-to-formal translation. Formal-heavy Implementation failures stem from lost design understanding. Each requires composition-appropriate mitigation.

## Integration with Other Concepts

- **Information Composition Taxonomy**: Concept 6 applies Concept 1's three knowledge types to the seven phases, providing specific percentage estimates rather than general definitions.
- **Theory-Building Principle**: Phase composition reflects theory-building progression—early phases build problem theory (tacit-heavy), middle phases transform theory to specifications (balanced), later phases instantiate specifications (formal-heavy).
- **Eight-Capability Taxonomy**: Different phases emphasise different capabilities based on their composition. Tacit-heavy phases emphasise Elicit, Synthesise, Decide. Formal-heavy phases emphasise Transform, Generate, Preserve.
- **Seven-Phase SDLC Model**: Concept 6 characterises each phase from Concept 4 by its information composition, enabling all phase-specific reasoning in the framework.
- **Actor Model**: Phase composition determines appropriate actor participation. Human actors required for tacit-heavy phases; AI actors enable formal-heavy phases.
- **Five Collaboration Patterns**: Patterns shift systematically across phases—Human-Only/Human-Led for tacit-heavy early phases, Partnership for balanced middle phases, AI-Led for formal-heavy later phases.
- **Information Loss at Transitions**: Loss patterns differ by phase composition. Tacit knowledge loss is severe at early transitions (Initiation→Planning: 35-45% loss); formal knowledge loss is lower at later transitions.
- **Phase-Aware Measurement**: Phase composition determines appropriate measurement approaches—qualitative for tacit-heavy, quantitative for formal-heavy, hybrid for balanced.

## Evidence Base and Methodological Notes

**Derivation methodology**: The percentages are derived estimates based on empirical studies of knowledge types in software development, artifact production rates across phases, and practitioner surveys about work characteristics. They represent informed estimates rather than direct measurements.

**Robust finding vs estimates**: The directional pattern (tacit-heavy early, formal-heavy late) is the robust empirical finding validated across multiple studies and organisational contexts. The specific percentages should be treated as indicative rather than precise—the actual composition in specific organisations may vary by ±10% based on domain, methodology, and organisational practices.

**Evidence supporting the pattern**: Studies showing 70-80% of critical software knowledge is tacit (not captured in documents). Research on requirements failures (39-47% of project failures) originating in inadequate early phases where tacit knowledge dominates. Observation that later phases produce measurable artifacts (code, tests) indicating higher formal content. Practitioner reports that different phases feel qualitatively different in terms of how much "gut feel" versus "mechanical execution" they involve.

**Validation needs**: Systematic measurement studies using consistent methodology across multiple organisations would enable more precise percentage estimates. Longitudinal studies tracking how composition shifts within organisations over time. Cross-cultural validation whether composition patterns hold across different national and organisational cultures.

## Validation Status

- ✓ **Directional pattern**: Well-validated—early phases are tacit-heavier than later phases across multiple empirical studies
- ✓ **Failure correlation**: Early phase failures (tacit-heavy) dominate project failure statistics (39-47% requirements-related)
- ⚠ **Specific percentages**: Reasoned estimates requiring systematic measurement studies with consistent methodology
- ⚠ **Organisational variance**: How much composition varies across organisations with different domains and methodologies needs quantification
- ⚠ **Emergent percentage consistency**: The claim that emergent stays consistently around 10% across all phases needs validation
- ⚠ **Optimal granularity**: Whether finer-grained composition estimates (e.g., sub-phase level) would provide additional value

---

*Phase-Specific Information Composition provides the empirical foundation for all phase-aware reasoning in the framework. By characterising each phase's knowledge mix, this concept enables principled decisions about documentation, automation, collaboration, and measurement strategies that respect the fundamental nature of work in each phase rather than imposing one-size-fits-all approaches.*
