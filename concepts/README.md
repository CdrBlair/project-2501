# Concepts

This directory contains the conceptual framework documentation for the **Dialogue Framework**—an evidence-based approach to AI-augmented software development.

---

## Framework Overview

| Document | Description |
|----------|-------------|
| **[dialogue-framework.md](../dialogue-framework.md)** | **Start here** — The Dialogue Framework overview, core concepts, and theoretical foundations |

---

## Index

### Integration Documents

These documents explain how the framework components connect and form a coherent whole.

| Document | Description |
|----------|-------------|
| [integration_framework-architecture.md](./integration_framework-architecture.md) | Master integration document explaining how thirteen academic sources form the knowledge base, selection rationale, and conceptual architecture |
| [integration_phase-specific-composition.md](./integration_phase-specific-composition.md) | Detailed information composition analysis for each SDLC phase, specifying formal/tacit/emergent percentages |
| [integration_naur-wegner.md](./integration_naur-wegner.md) | Integration analysis connecting Naur's theory-building with Wegner's transactive memory systems |

### Concept Documents

Core framework concepts that define the key abstractions, models, and taxonomies.

| Document | Description |
|----------|-------------|
| [concept_actor-model.md](./concept_actor-model.md) | Actor taxonomy distinguishing human and AI actors, their capabilities, and appropriate participation patterns |
| [concept_capability-model.md](./concept_capability-model.md) | Eight-capability taxonomy defining fundamental operations in software development work |
| [concept_collaboration-patterns.md](./concept_collaboration-patterns.md) | Five collaboration patterns for human-AI interaction, from Human-Only to AI-Only |
| [concept_decision-observation-tracking.md](./concept_decision-observation-tracking.md) | System for recording observations (factual states) and decisions (judgements) throughout the SDLC |
| [concept_document-type-classification.md](./concept_document-type-classification.md) | Classification framework for document types across the SDLC lifecycle |
| [concept_information-taxonomy.md](./concept_information-taxonomy.md) | Information composition taxonomy distinguishing formal, tacit, and emergent knowledge |
| [concept_phase-aware-measurement.md](./concept_phase-aware-measurement.md) | Measurement framework accounting for phase-specific characteristics and information composition |
| [concept_process-capability-flow.md](./concept_process-capability-flow.md) | Framework for specifying capability flows within SDLC processes |
| [concept_seven-phase-sdlc.md](./concept_seven-phase-sdlc.md) | Seven-phase SDLC model consolidating ISO/IEC/IEEE 12207 processes into practical phases |
| [concept_transitions-info-loss.md](./concept_transitions-info-loss.md) | Analysis of information loss at phase transitions and mitigation strategies |
| [concept_work-coordination.md](./concept_work-coordination.md) | Mechanisms for coordinating work between actors, including assignment, messaging, and queuing |

### Foundation Documents

Foundational theory and research that grounds the framework in established knowledge.

| Document | Description |
|----------|-------------|
| [foundation_iso-12207-processes.md](./foundation_iso-12207-processes.md) | Analysis of ISO/IEC/IEEE 12207:2017 processes as the standards foundation |
| [foundation_socio-technical-systems.md](./foundation_socio-technical-systems.md) | Socio-technical systems theory as applied to software development |
| [foundation_sts-meta-analysis.md](./foundation_sts-meta-analysis.md) | Meta-analysis of socio-technical systems research and its implications |
| [foundation_theory-building.md](./foundation_theory-building.md) | Naur's theory-building principle: programming as theory construction, not text production |
| [foundation_transactive-memory.md](./foundation_transactive-memory.md) | Wegner's transactive memory systems: team-level knowledge coordination and "who knows what" |

### Example Documents

Worked examples demonstrating framework application.

| Document | Description |
|----------|-------------|
| [example_capability-flow-specifications.md](./example_capability-flow-specifications.md) | Detailed capability flow specifications for Phase 3 (Analysis/Requirements) |
| [example_document-type-registry.md](./example_document-type-registry.md) | Document type registry example for Phase 3 |

### Guidance Documents

Practical guidance for applying the framework in real-world contexts.

| Document | Description |
|----------|-------------|
| [guidance_architecture.md](./guidance_architecture.md) | Three-layer guidance architecture: standards, application frameworks, and implementation patterns |
| [guidance_implementation.md](./guidance_implementation.md) | Implementation guidance for adopting the framework |
| [guidance_performance-measures.md](./guidance_performance-measures.md) | Performance measurement guidance aligned with phase-specific characteristics |

---

## Summary

This concepts directory forms the core intellectual foundation of the **Dialogue Framework**. The framework addresses a fundamental challenge: how to systematically integrate AI capabilities into software development while preserving the human cognitive engagement essential for building and maintaining **theory** about software systems.

The name "Dialogue" reflects the framework's core insight: software development succeeds or fails based on the quality of *conversation* that transfers understanding between participants—humans and humans, humans and AI, and across time through artifacts.

### Key Principles

1. **Theory Building over Artifact Production**: Following Naur (1985), the framework recognises that the primary product of software development is the coherent understanding in developers' minds, not the code or documentation they produce. This theory cannot be fully articulated and is essential for intelligent system evolution.

2. **Phase-Aware Collaboration**: Different SDLC phases have different information compositions (formal/tacit/emergent ratios) that determine appropriate human-AI collaboration patterns. Early phases are tacit-heavy and require human leadership; later phases are formal-heavy and enable greater AI autonomy.

3. **Rigour over Influence**: The framework prioritises empirically validated research over industry folklore. Selection criteria emphasise theoretical coherence, empirical grounding, and methodological transparency rather than popularity.

4. **Information Preservation**: Phase transitions are critical points where information—particularly tacit knowledge—can be lost. The framework provides explicit strategies for preserving understanding across handoffs.

5. **Capability-Based Reasoning**: Eight fundamental capabilities (Elicit, Synthesise, Decide, Generate, Transform, Validate, Preserve, Coordinate) provide granular analysis of what work requires human engagement versus what can be delegated to AI.

### Framework Architecture

The documents follow a layered structure:

- **Foundations** establish the theoretical and standards basis
- **Concepts** define the core abstractions and models
- **Integrations** show how components connect into a coherent whole
- **Guidance** provides practical application advice
- **Examples** demonstrate concrete application

This architecture enables the framework to remain stable at higher abstraction levels while adapting to evolving AI capabilities at implementation levels.
