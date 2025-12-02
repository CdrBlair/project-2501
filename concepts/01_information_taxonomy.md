# Key Reference Concept 1: Information Composition Taxonomy

## Definition

Software development involves three fundamentally different types of information, each requiring different handling approaches. **Formal** information is explicitly representable and machine-processable. **Tacit** information is experientially embedded and resists complete articulation. **Emergent** information arises from interactions and doesn't exist until exploration creates it. Any software artifact or activity involves some composition of all three types, and this composition determines appropriate documentation strategies, automation levels, and collaboration patterns.

## The Three Information Types

| Type | Definition | Examples | AI Accessibility |
|------|------------|----------|------------------|
| **Formal** | Explicitly representable, machine-processable, verifiable | Source code, specifications, schemas, test cases, API contracts | **High** - AI can process, generate, and validate |
| **Tacit** | Experientially embedded, resists articulation, "we know more than we can tell" | Architectural intuition, coding judgement, stakeholder context, design rationale | **Low** - AI cannot access or replicate human experiential knowledge |
| **Emergent** | Arises from interactions, discoverable unknown, doesn't exist until exploration | Creative insights, unexpected requirements, system behaviors, team dynamics | **Very Low** - AI cannot observe emergence in real-time contexts |

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

**For human-AI collaboration:** AI can effectively handle formal information but cannot process tacit or emergent knowledge. The information composition of an activity determines appropriate automation levels—formal-heavy activities enable AI-Led patterns, tacit-heavy activities require Human-Only or Human-Led patterns.

**For measurement:** Formal-heavy activities support quantitative metrics. Tacit-heavy activities require qualitative assessment. Mixed-composition activities need hybrid measurement approaches.

**For team organisation:** Activities with high tacit composition benefit from team stability (preserving accumulated understanding). Activities with high formal composition support more flexible staffing.

**For theory building:** Tacit knowledge is what makes theory "theory"—the understanding that resides in developers' minds and enables intelligent system evolution. Over-automating tacit-heavy activities risks theory atrophy.

## Integration with Other Concepts

- [**Theory-Building Principle**](./02_theory_building.md): Theory is tacit by nature—what makes certain knowledge tacit is that it represents theory in developers' minds
- [**Eight-Capability Model**](./03_capability_model.md): Different capabilities require different knowledge types (Elicit/Synthesise require tacit; Transform/Preserve enable formal)
- [**Seven-Phase SDLC**](04_7phase_SDLC.md): Each phase has characteristic information composition that shifts from tacit-heavy early to formal-heavy late
- [**Actor Model**](./05_actor_model.md): Human and AI actors differ in their ability to process different knowledge types—humans can handle all three, AI only formal
- [**Five Collaboration Patterns**](07_collaboration_patterns.md): Pattern selection depends on activity information composition
- [**Phase-Specific Composition**](06_phase_specific_composition.md): Provides specific percentage estimates for each phase
- [**Information Loss at Transitions**](./08_transitions_info_loss.md): Tacit and emergent information are disproportionately lost at phase boundaries
- [**Phase-Aware Measurement**](09_phase_aware_measurement.md): Different phases need different measurement approaches based on their information composition

## Evidence Base

**Formal/tacit distinction**: Well-established through Polanyi (1966) and extensive organisational knowledge management literature. **Emergent category**: Conceptually defensible but requires empirical validation. **Specific percentages**: Reasoned estimates requiring systematic measurement studies. **70-80% tacit prevalence**: Multiple studies across software engineering contexts. **42% unique knowledge**: Large-scale survey finding that nearly half of job-critical knowledge exists in individual minds only.

## Validation Status

- ✓ **Formal/tacit distinction**: Empirically validated across multiple domains
- ✓ **Three-type taxonomy**: Conceptually coherent, face validity from practitioners
- ⚠ **Emergent as distinct category**: Requires validation that it's not simply tacit knowledge
- ⚠ **Specific percentages**: Estimates requiring empirical studies with systematic measurement
- ⚠ **Phase progression pattern**: Directionally supported but needs quantitative validation

---

*This taxonomy provides the foundational framework for reasoning about all other concepts. Understanding what types of information exist and how they're distributed enables principled decisions about documentation, automation, collaboration, and measurement throughout the SDLC.*
