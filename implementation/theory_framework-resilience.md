---
id: THY-002
type: THY
title: Framework Resilience
scope: Project
temporal_class: Standing
status: DRAFT
version: 1
created: 2026-01-14
author: ai:claude

references:
  - id: THY-001
    relationship: DERIVES_FROM
  - id: F-1
    relationship: SYNTHESISES
  - id: F-3
    relationship: SYNTHESISES
  - id: C-5
    relationship: REFERENCES

thy:
  covers:
    problem_mapping: true
    design_rationale: true
    modification_patterns: true
    invalidation_conditions: true

tags:
  - theory
  - resilience
  - evolution
  - change-response
---

# THY-002: Framework Resilience

## Purpose

This document captures the theory of how the AI-Augmented SDLC Framework responds to change. It addresses the question: what happens when evidence challenges the framework's assumptions?

**Core thesis**: The framework is designed to survive the challenges it anticipates. Evidence that contradicts assumptions triggers evolution, not invalidation. The framework's purpose—ensuring software remains intelligently modifiable—persists regardless of which actors hold theory.

**Relationship to THY-001**: THY-001 captures the framework's integrated understanding (problem mapping, design rationale, modification patterns). THY-002 addresses how that understanding evolves when challenged.

---

## 1. Problem Mapping

*What does "resilience" mean in this context? Why does it matter?*

### The Resilience Problem

Frameworks fail in two ways:

1. **Brittleness**: Framework assumes X; evidence shows ¬X; framework is invalidated
2. **Ossification**: Framework ignores challenging evidence; becomes increasingly divorced from reality

Both failure modes lead to the same outcome: the framework becomes useless for guiding practice.

### Why This Framework Needs Resilience Theory

The AI-Augmented SDLC Framework makes temporally-qualified claims about AI capabilities (as of 2024-2025). AI capabilities are evolving rapidly. Without explicit resilience design, the framework risks:

- Being dismissed as "outdated" when AI capabilities change
- Being applied rigidly when flexibility is warranted
- Losing coherence through ad-hoc adaptations

### The Framework's Resilience Claim

> **The framework is designed such that evidence challenging its assumptions changes how it is applied, not whether it applies.**

This is a strong claim requiring justification. The rest of this document provides that justification.

---

## 2. Design Rationale

*Why is the framework designed to be resilient? How does this resilience work?*

### Separation of Purpose and Mechanism

The framework distinguishes between:

| Level | Example | Stability |
|-------|---------|-----------|
| **Purpose** | Ensure software remains intelligently modifiable | Highly stable |
| **Principles** | Joint optimisation of human and AI capabilities | Stable |
| **Patterns** | Human-Led collaboration for early phases | Adaptable |
| **Assignments** | This capability instance uses Partnership | Context-dependent |

Evidence challenging the framework typically affects lower levels while preserving higher levels:

- If AI builds theory → Pattern assignments change; purpose remains
- If tacit knowledge is reducible → Principles adapt; purpose remains
- If information loss is mitigated → Specific practices change; principles remain

### The "Who Holds Theory" Invariant

Consider the framework's most fundamental claim: intelligent software modification requires theory (understanding of problem mapping, design rationale, and modification implications).

**Current state** (2024-2025): Humans hold theory; AI generates artifacts.

**Hypothetical future**: AI systems develop theory-building capabilities.

**Framework response**: The framework doesn't assume humans must hold theory—it ensures that *whoever* holds theory, the system remains intelligently modifiable. If AI holds theory:

1. **Accessibility requirement**: Humans must be able to access AI-held understanding
2. **Explicability requirement**: AI must be able to explain rationale, not just produce outputs
3. **Accountability persistence**: Human accountability for system outcomes persists

The framework would shift from "humans must build theory" to "humans must be able to understand theory (wherever it resides)."

### Why This Works

The framework's abstractions are chosen for stability:

| Abstraction | Why Stable |
|-------------|------------|
| **Capabilities** (Elicit, Analyse, etc.) | Describe cognitive work, not who performs it |
| **Information types** (Formal, Tacit, Emergent) | Describe knowledge properties, not storage mechanisms |
| **Collaboration patterns** | Describe coordination modes, not fixed assignments |
| **Phases** | Describe lifecycle structure, not calendar time |

These abstractions don't presume human or AI superiority—they describe the work and knowledge that must be managed, regardless of actor.

---

## 3. Evolution Pathways

*How does the framework evolve in response to specific challenges?*

### Pathway 1: AI Develops Theory-Building Capability

**Signal**: AI systems demonstrate ability to explain why solutions are structured as they are, justify design decisions, and respond intelligently to novel modification demands.

**Evolution**:
1. Shift pattern recommendations toward AI-Led or AI-Only for more capabilities
2. Add requirements for theory accessibility (humans must be able to query AI understanding)
3. Add requirements for theory explicability (AI must explain, not just perform)
4. Preserve human accountability—who is responsible if AI-held theory is wrong?

**What remains unchanged**: The importance of theory; the need for intelligent modification capability; the structure of capabilities and phases.

### Pathway 2: Tacit Knowledge Becomes Reducible

**Signal**: Evidence shows that knowledge previously considered tacit can be reliably formalised and transferred through documentation alone.

**Evolution**:
1. Revise information composition estimates (lower tacit percentages)
2. Adjust collaboration patterns for affected phases
3. Potentially simplify information taxonomy

**What remains unchanged**: The capability model; the phase structure; the principle of matching practices to knowledge types.

### Pathway 3: Information Loss at Transitions is Mitigated

**Signal**: New practices or tools substantially reduce the 35-55% information loss at phase boundaries.

**Evolution**:
1. Update information loss estimates
2. Reduce emphasis on transition validation practices
3. Potentially simplify handoff protocols

**What remains unchanged**: Phase structure; capability model; the principle that transitions warrant attention.

### Pathway 4: Joint Optimisation is Unnecessary

**Signal**: Evidence shows that optimising technical and social systems independently produces equivalent or better outcomes than joint optimisation.

**Evolution**:
1. Re-examine STS theory application
2. Potentially decouple technical and social guidance
3. Revise collaboration pattern rationale

**What remains unchanged**: The capabilities that must be performed; the phases work moves through; the importance of theory.

### Pathway 5: Phase Structure is Obsolete

**Signal**: Evidence shows that the seven-phase structure no longer describes how software is developed (perhaps continuous delivery eliminates phase boundaries entirely).

**Evolution**:
1. Revise phase model to match contemporary practice
2. Re-examine phase-specific composition (may need different categorisation)
3. Preserve capability model (work still needs to be done)

**What remains unchanged**: Capabilities; information types; collaboration patterns (which apply regardless of phase structure).

---

## 4. Resilience Properties

*What properties make the framework resilient?*

### Property 1: Abstraction Stability

The framework's core abstractions describe *what* must happen, not *how* or *who*:

- Capabilities describe cognitive work types → stable regardless of performer
- Information types describe knowledge properties → stable regardless of storage
- Patterns describe coordination modes → stable regardless of assignment

### Property 2: Compositional Independence

The framework's components can be updated independently:

- Pattern assignments can change without changing the patterns themselves
- Phase composition can change without changing the phase structure
- Actor characterisation can change without changing the capability model

### Property 3: Purpose Preservation

The framework's purpose is expressed at a level that survives mechanism changes:

> **Ensure software remains intelligently modifiable**

This purpose is valid whether:
- Humans hold theory or AI holds theory
- Knowledge is tacit or formalised
- Transitions lose information or preserve it

### Property 4: Explicit Temporality

The framework explicitly qualifies temporal claims:

- "As of 2024-2025, AI systems do not build theory in Naur's sense"
- "Current evidence suggests 35-55% information loss"

This temporality signals that claims are subject to revision, not eternal truths.

---

## 5. Modification Patterns for Resilience

*How should modifiers approach resilience-related changes?*

### Pattern: Responding to Challenging Evidence

**Recognise this situation**: New evidence appears to contradict a framework claim.

**Questions to ask**:
1. What level does this evidence affect? (Purpose, Principle, Pattern, Assignment)
2. Does the evidence invalidate the claim or suggest adaptation?
3. What depends on the current claim?
4. How would the framework change if the evidence is accepted?

**Coherent modification**: Update at the appropriate level while preserving higher-level stability. Document the evidence and the evolution rationale.

**Incoherent modification**: Dismissing evidence to preserve the framework; wholesale invalidation based on single-level challenges.

### Pattern: Anticipating Future Change

**Recognise this situation**: You're extending the framework and want it to remain resilient.

**Questions to ask**:
1. Is this claim temporally qualified if it depends on current capabilities?
2. What level is this claim at? (Lower levels should be more adaptable)
3. What would cause this claim to need revision?
4. Is the revision pathway clear?

**Coherent modification**: Express claims at the appropriate level; include temporal qualification where relevant; design for adaptation.

**Incoherent modification**: Making absolute claims about evolving capabilities; expressing mechanism-dependent claims as purposes.

---

## 6. Anti-Patterns

| Anti-Pattern | Why It Undermines Resilience | What to Do Instead |
|--------------|------------------------------|-------------------|
| **Absolute capability claims** | Become false when capabilities change | Temporally qualify; express as current state |
| **Purpose-mechanism conflation** | Ties framework to specific implementations | Separate purpose (stable) from mechanism (adaptable) |
| **Monolithic structure** | Single challenge invalidates everything | Compositional design allowing partial updates |
| **Implicit assumptions** | Can't be revised because they're not visible | Make assumptions explicit and testable |
| **Evidence dismissal** | Leads to ossification | Engage with challenging evidence; evolve |

---

## 7. The Resilience Test

A framework passes the resilience test if, for each core assumption:

1. **The assumption is explicit** — Can be identified and examined
2. **Challenging evidence is describable** — Clear what would constitute a challenge
3. **Evolution pathway exists** — How the framework would adapt is specified
4. **Higher levels are preserved** — Purpose survives mechanism changes

### Applying the Test to This Framework

| Assumption | Explicit? | Challenge Describable? | Pathway Exists? | Purpose Preserved? |
|------------|-----------|----------------------|-----------------|-------------------|
| Tacit knowledge dominates early phases | ✓ | ✓ | ✓ | ✓ |
| AI cannot build theory | ✓ (temporally qualified) | ✓ | ✓ | ✓ |
| Theory-holders essential | ✓ | ✓ | ✓ | ✓ |
| Joint optimisation required | ✓ | ✓ | ✓ | ✓ |
| Information loss significant | ✓ | ✓ | ✓ | ✓ |

---

## Document Relationships

| Document | Relationship to THY-002 |
|----------|------------------------|
| [THY-001](./theory_framework.md) | Parent theory; THY-002 addresses how THY-001 understanding evolves |
| [F-1 Theory-Building](../concepts/foundation_theory-building.md) | Foundation; THY-002 addresses what happens if AI develops theory |
| [F-3 STS Theory](../concepts/foundation_socio-technical-systems.md) | Foundation; THY-002 addresses joint optimisation challenge |
| [C-5 Collaboration Patterns](../concepts/concept_collaboration-patterns.md) | Patterns that would shift under evolution |

---

## Validation Status

- ✓ **Problem mapping**: Resilience problem clearly defined
- ✓ **Design rationale**: Separation of levels justified
- ✓ **Evolution pathways**: Five main pathways specified
- ⚠ **Completeness**: Additional pathways may be needed as framework evolves
- ⚠ **Empirical validation**: Resilience properties are designed, not yet tested through actual evolution

---

*This document captures the theory of framework resilience—how the AI-Augmented SDLC Framework responds to change. The core insight is that the framework's purpose (ensuring intelligent modifiability) persists regardless of which actors hold theory or how specific mechanisms evolve. Evidence challenges mechanisms, not purposes.*

---

**Document History**:
- v1 (14 January 2026): Initial draft addressing framework evolution and resilience properties
