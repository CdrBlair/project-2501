---
id: REF-001
type: REF
title: Framework Concepts Reference
scope: Project
temporal_class: Standing
status: CURRENT
version: 1
created: 2026-01-14
author: ai:claude

references:
  - id: THY-001
    relationship: REFERENCES

ref:
  catalogues:
    - F-1
    - F-2
    - F-3
    - F-4
    - F-5
    - C-1
    - C-2
    - C-3
    - C-4
    - C-5
    - C-6
    - C-7
    - C-8
    - O-1
    - O-2
    - O-3
    - O-4
    - I-1
    - I-2
    - I-3
    - G-1
    - G-2
    - G-3
    - E-1
    - E-2
    - THY-001
    - THY-002
    - THY-003
  quick_lookup: true

tags:
  - reference
  - catalogue
  - concepts
---

# REF-001: Framework Concepts Reference

## Purpose

This document provides a structured reference to the AI-Augmented SDLC Framework's concept documents. It explains *what* each concept is and where to find detailed documentation.

For *why* these concepts hang together and how to modify the framework coherently, see [THY-001: Framework Theory](./theory_framework.md).

---

## Foundations

Theoretical sources that the framework synthesises.

| ID | Document | Description |
|----|----------|-------------|
| F-1 | [Theory-Building](../concepts/foundation_theory-building.md) | Naur's insight: programming builds theory in minds, not just artifacts |
| F-2 | [Transactive Memory](../concepts/foundation_transactive-memory.md) | Wegner's TMS: teams develop "who knows what" coordination |
| F-3 | [Socio-Technical Systems](../concepts/foundation_socio-technical-systems.md) | STS theory: technical and social systems require joint optimisation |
| F-4 | [STS Meta-Analysis](../concepts/foundation_sts-meta-analysis.md) | Empirical validation of STS principles in software contexts |
| F-5 | [ISO 12207 Processes](../concepts/foundation_iso-12207-processes.md) | Standard lifecycle processes providing structural alignment |

---

## Core Concepts

The framework's primary abstractions.

| ID | Document | Description |
|----|----------|-------------|
| C-1 | [Information Taxonomy](../concepts/concept_information-taxonomy.md) | Formal/Tacit/Emergent knowledge classification |
| C-2 | [Capability Model](../concepts/concept_capability-model.md) | Eight capabilities: Elicit, Analyse, Synthesise, Transform, Validate, Decide, Generate, Preserve |
| C-3 | [Seven-Phase SDLC](../concepts/concept_seven-phase-sdlc.md) | Lifecycle phases with ISO 12207 alignment |
| C-4 | [Actor Model](../concepts/concept_actor-model.md) | Human and AI actor characterisation and differentiation |
| C-5 | [Collaboration Patterns](../concepts/concept_collaboration-patterns.md) | Five patterns: Human-Only → Human-Led → Partnership → AI-Led → AI-Only |
| C-6 | [Transitions & Info Loss](../concepts/concept_transitions-info-loss.md) | 35-55% information loss at phase boundaries |
| C-7 | [Phase-Aware Measurement](../concepts/concept_phase-aware-measurement.md) | Metrics appropriate to different phases |
| C-8 | [Document Type Classification](../concepts/concept_document-type-classification.md) | Standing/Dynamic/Ephemeral; content domains including THY |

---

## Operational Concepts

Concepts that enable framework execution.

| ID | Document | Description |
|----|----------|-------------|
| O-1 | [Process & Capability Flow](../concepts/concept_process-capability-flow.md) | Schema for capability instance specifications |
| O-2 | [Decision & Observation Tracking](../concepts/concept_decision-observation-tracking.md) | Recording decisions and observations throughout work |
| O-3 | [Work Coordination](../concepts/concept_work-coordination.md) | Work items, assignment, state machine, coordination patterns |
| O-4 | [Agent Context Model (3S2P)](../concepts/concept_agent-context-model.md) | Standing, Situational, Stylistic, Procedural, Project context |

---

## Integrations

Documents that connect multiple concepts.

| ID | Document | Description |
|----|----------|-------------|
| I-1 | [Framework Architecture](../concepts/integration_framework-architecture.md) | Master integration of thirteen academic sources |
| I-2 | [Phase-Specific Composition](../concepts/integration_phase-specific-composition.md) | Formal/Tacit/Emergent percentages per phase |
| I-3 | [Naur-Wegner Integration](../concepts/integration_naur-wegner.md) | How individual theory-building and team TMS interact |

---

## Guidance

Practical application guidance.

| ID | Document | Description |
|----|----------|-------------|
| G-1 | [Guidance Architecture](../concepts/guidance_architecture.md) | Three-layer guidance model |
| G-2 | [Implementation Guidance](../concepts/guidance_implementation.md) | Practical implementation guidance |
| G-3 | [Performance Measures](../concepts/guidance_performance-measures.md) | Performance measurement guidance |

---

## Examples

Worked examples demonstrating framework application.

| ID | Document | Description |
|----|----------|-------------|
| E-1 | [Document Type Registry (Phase 3)](../concepts/example_document-type-registry.md) | Phase 3 document types exemplar |
| E-2 | [Capability Flow Specifications](../concepts/example_capability-flow-specifications.md) | Phase 3 capability flow exemplar |

---

## Concept Relationships

```
Foundations                          Core Concepts                    Operational
───────────                          ─────────────                    ───────────

F-1 Theory-Building ──────────────► C-1 Information Taxonomy ──────► O-1 Process Flow
        │                                    │
        │                            C-2 Capability Model ──────────► O-2 Decision Tracking
        │                                    │
F-2 Transactive Memory ───────────► C-4 Actor Model ────────────────► O-3 Work Coordination
        │                                    │
        │                            C-5 Collaboration Patterns ────► O-4 Agent Context
        │                                    │
F-3 STS Theory ───────────────────► C-3 Seven-Phase SDLC
        │                                    │
        │                            C-6 Transitions & Loss
        │                                    │
F-5 ISO 12207 ────────────────────► C-7 Phase-Aware Measurement
                                             │
                                     C-8 Document Classification
```

---

## Quick Lookup

**"What capability should handle this?"** → [C-2 Capability Model](../concepts/concept_capability-model.md)

**"What pattern should we use?"** → [C-5 Collaboration Patterns](../concepts/concept_collaboration-patterns.md)

**"What phase is this?"** → [C-3 Seven-Phase SDLC](../concepts/concept_seven-phase-sdlc.md)

**"How do we track this decision?"** → [O-2 Decision Tracking](../concepts/concept_decision-observation-tracking.md)

**"What document type is this?"** → [C-8 Document Classification](../concepts/concept_document-type-classification.md)

**"Why does tacit knowledge matter?"** → [F-1 Theory-Building](../concepts/foundation_theory-building.md)

---

*This REF document catalogues framework concepts. For integrated understanding of why these concepts connect and how to modify the framework, see THY-001.*
