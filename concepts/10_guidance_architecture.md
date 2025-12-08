# Key Reference Concept 10: Guidance Architecture

## Definition

Engineering guidance exists at multiple abstraction levels, each with appropriate update velocities. **Standards, application frameworks, and implementation patterns form a layered architecture where confusion about which layer should provide what guidance produces the perception of "standards lag."** The framework occupies Layer 2 (Application Framework)—translating stable process abstractions into current-capability guidance—a position that standards structurally cannot fill and implementation patterns are too context-specific to address.

## The Three-Layer Model

| Layer | Function | Appropriate Velocity | Stability Source |
|-------|----------|---------------------|------------------|
| **1. Process Abstractions** | Define purposes, outcomes, relationships between activities | Slow (decadal) | Conceptual durability—what constitutes "requirements definition" or "verification" changes little even as methods transform |
| **2. Application Frameworks** | Map abstractions to current capabilities, actors, contexts | Medium (annual to biannual) | Empirical grounding—updated as evidence accumulates about what works under current technological conditions |
| **3. Implementation Patterns** | Specific tooling, techniques, configurations | Fast (continuous) | Organisational learning—adapted to local context, tools, and team capabilities |

**Layer 1 examples**: ISO/IEC/IEEE 12207 processes, ISO/IEC/IEEE 15288 processes, ISO/IEC 5338 AI lifecycle extensions

**Layer 2 examples**: This framework; DORA capability model; organisation-specific SDLC standards

**Layer 3 examples**: Team coding standards; CI/CD pipeline configurations; tool-specific playbooks

## Why Abstraction Level Determines Appropriate Velocity

The "standards lag" critique typically conflates layers. When practitioners complain that ISO/IEC/IEEE 12207:2017 doesn't address AI code generation, they're expecting Layer 1 to provide Layer 3 guidance—a category error.

Consider the Implementation process (ISO/IEC/IEEE 12207 §6.4.7). Its purpose is: *"to realise a specified system element."* Its outcomes include: *"implementation constraints are identified"* and *"the system element is realised."*

These statements remain valid whether:
- A human writes code manually (1995)
- A team uses test-driven development in sprints (2015)
- An AI generates code with human review (2025)
- Some future approach we cannot yet anticipate (2035)

This isn't slowness—it's appropriate abstraction. The *process* is stable; the *method* and *actor* are parameters that Layer 2 and Layer 3 address.

**The failure mode of premature Layer 1 specificity**: Had ISO standardised "pair programming" as part of the Implementation process in 2005, organisations would now face compliance burdens around a practice that may be less relevant in AI-augmented contexts. Layer 1 should specify *what* must be achieved, not *how* to achieve it.

## What Standards Actually Provide

Standards serve coordination functions that don't require content currency:

**Common vocabulary**: When contract says "verification" or "validation," ISO/IEC/IEEE 12207 provides shared meaning. This coordination value is independent of whether the standard describes cutting-edge practice.

**Audit frameworks**: Regulated industries require demonstrable process compliance. Stable standards enable stable audit criteria. Constantly shifting standards would undermine the predictability that regulation requires.

**Contractual reference points**: Supplier agreements can specify "conformance to ISO/IEC/IEEE 12207" precisely because the standard is stable. Moving targets cannot serve as contractual foundations.

**Interoperability agreements**: When organisations must integrate processes (acquirer/supplier, prime/subcontractor), shared process models enable coordination even across organisational boundaries.

**These coordination functions require stability more than currency.** A "dated" standard that everyone understands coordinates better than a "current" standard that fragments interpretation.

## The Framework's Position

This framework occupies Layer 2—the translation layer between stable process abstractions and volatile implementation patterns. It can:

1. **Reference ISO process definitions** for legitimacy, interoperability, and coordination with standards-based governance
2. **Provide actor-capability-phase specificity** that standards structurally cannot offer without sacrificing abstraction stability
3. **Update at technology velocity** without destabilising the foundational process layer that contracts and audits depend upon
4. **Acknowledge uncertainty explicitly** rather than either ignoring emerging practices (as stable standards must) or pretending false confidence (as premature standardisation does)

### What the Framework Does That Standards Cannot

| Concern | Standards Approach | Framework Approach |
|---------|-------------------|-------------------|
| AI actor capabilities | Silent or generic ("appropriate tools") | Specific capability characterisation with temporal qualification |
| Phase-specific automation suitability | Process-agnostic | Explicit phase-by-phase actor pattern guidance |
| Information composition | Implicit in process descriptions | Quantified (even if estimated) to guide decisions |
| Capability instance analysis | Not addressed | Granular activity-level suitability assessment |
| Emerging practice integration | 5-8 year revision cycles | Continuous refinement as evidence accumulates |

### What the Framework Must Not Do

The framework should not attempt to replace Layer 1 functions:

- **Do not redefine processes** already defined in ISO/IEC/IEEE 12207—reference them
- **Do not create competing vocabulary** where ISO terminology exists—adopt it
- **Do not claim standards equivalence**—acknowledge the framework as interpretive guidance, not normative standard
- **Do not embed tool-specific patterns** that belong in Layer 3—remain at capability and actor level

## Engineering Rigour Without Temporal Excuses

The traditional defence of standards lag—"consensus takes time," "we need decades of evidence," "premature standardisation causes harm"—confuses *rigour* with *elapsed time*.

Engineering proceeds with disciplined uncertainty. Rigorous guidance can be current if it:

**Makes bounded claims**: "Under conditions X, evidence suggests Y with confidence Z" rather than universal assertions that require decades of validation.

**Specifies failure modes**: "If assumption A proves wrong, consequence B follows" enables users to monitor for invalidating conditions.

**Includes revision triggers**: "This guidance should be revisited when D occurs" builds obsolescence awareness into the guidance itself.

**Quantifies uncertainty**: Distinguishing "validated across 39,000 professionals" (DORA metrics) from "estimated based on framework analysis" (phase information compositions) enables appropriate reliance.

**Acknowledges temporal scope**: "As of 2024-2025, current AI systems..." rather than timeless assertions about AI capabilities.

This is not lower rigour—it is *honest* rigour that doesn't hide uncertainty behind stability theatre.

## Handling the AI Transition

The framework arrives at a moment when AI is transforming software development practices. The three-layer model provides a response:

**Layer 1 remains stable**: ISO/IEC/IEEE 12207 processes (purpose: realise system elements; outcome: elements are realised) accommodate AI actors without revision. The process abstraction is already actor-agnostic.

**Layer 2 requires active maintenance**: This framework must continuously reassess actor capability characterisations, collaboration pattern recommendations, and phase-specific guidance as AI capabilities evolve. Annual review cycles are appropriate.

**Layer 3 transforms rapidly**: Implementation patterns involving AI tools (prompting strategies, review workflows, human-AI pairing configurations) will change faster than any documented guidance can track. The framework should identify *what* Layer 3 patterns are needed without specifying *which* patterns to use.

### The Framework's Temporal Honesty

All actor capability assessments in this framework are temporally qualified to 2024-2025 conditions. The framework explicitly acknowledges:

- Current AI limitations (e.g., cannot build theory in Naur's sense) may not persist
- Actor pattern recommendations may require revision as capabilities change
- Information composition estimates are working approximations, not empirical measurements
- Phase transition guidance reflects current understanding of human-AI collaboration

This temporal honesty enables the framework to be useful now while remaining intellectually honest about its shelf life.

## Integration with Other Concepts

- **Information Composition Taxonomy (Concept 1)**: The taxonomy operates at Layer 2, translating abstract recognition that "phases differ" into quantified guidance. Standards acknowledge phase differences; the framework characterises them.

- **Theory-Building Principle (Concept 2)**: Naur's insight is Layer 1 stable—theory building as fundamental to programming is unlikely to change. The framework's application (which activities build theory, how AI affects theory building) is Layer 2, requiring updates as AI capabilities evolve.

- **Eight-Capability Taxonomy (Concept 3)**: The capabilities themselves (Elicit, Analyse, Synthesise, etc.) are Layer 1 stable. The framework's mapping of capabilities to actors and phases is Layer 2.

- **Actor Model (Concept 5)**: Actor characterisations are explicitly Layer 2, temporally qualified. The *concept* of different actor types is Layer 1; *which* actors can do *what* is Layer 2 and will change.

- **Collaboration Patterns (Concept 7)**: The patterns themselves (Human-Only, Human-Led, etc.) are Layer 1 stable. Assignment of activities to patterns is Layer 2 and will evolve.

- **Phase-Aware Measurement (Concept 9)**: The insight that measurement must be phase-aware is Layer 1 stable. Specific measurement recommendations are Layer 2.

## Evidence Base

The three-layer model synthesises observations from multiple domains:

**Standards evolution history**: ISO/IEC 12207 revisions (1995 → 2008 → 2017 → 2025) show process abstractions remaining stable while activities and tasks evolve. The upcoming revision clarifies iteration/recursion concepts rather than redefining processes—evidence that Layer 1 abstractions are durable.

**Methodology-independence principle**: ISO/IEC/IEEE 12207 explicitly states it "does not prescribe a specific life cycle model, development methodology, method, modelling approach, or technique." This is architectural acknowledgment that Layer 1 should not attempt Layer 2/3 functions.

**Standards coordination value**: Empirical observation that organisations reference ISO standards for contracts and audits even when internal practices have evolved beyond what standards describe—evidence that coordination and currency serve different functions.

**AI standards development**: ISO/IEC 5338:2023 extended the process framework with three new AI-specific processes (Knowledge Acquisition, AI Data Engineering, Continuous Validation) rather than modifying existing processes—evidence that appropriate extension maintains Layer 1 stability.

**Framework revision patterns**: DORA metrics remain stable since 2014 (four key metrics) while specific benchmarks and implementation guidance evolve annually—a successful Layer 2 approach.

## Validation Status

- ✓ **Three-layer distinction**: Well-supported by standards architecture and methodology-independence principles
- ✓ **Coordination value of stability**: Validated by continued standards use in contracts/audits despite perceived "lag"
- ✓ **Framework positioning**: Logically coherent with existing standards ecosystem
- ⚠ **Appropriate velocities**: Proposed update cycles (decadal/annual/continuous) are hypotheses requiring validation
- ⚠ **AI transition handling**: Untested—framework's ability to maintain useful guidance during rapid capability change is uncertain
- ⚠ **Temporal honesty effectiveness**: Whether explicit uncertainty acknowledgment improves or undermines practitioner confidence requires study

---

*The Guidance Architecture concept explains why this framework exists and what role it plays. Standards provide stable process abstractions and coordination mechanisms. Implementation patterns address local context. The framework bridges these layers—translating stable abstractions into current-capability guidance with explicit temporal qualification. This positioning enables rigorous, useful guidance without either the false currency of premature standardisation or the false stability of ignoring technological change.*
