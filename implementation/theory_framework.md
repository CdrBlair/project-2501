---
id: THY-001
type: THY
title: AI-Augmented SDLC Framework Theory
scope: Project
temporal_class: Standing
status: DRAFT
version: 2
created: 2026-01-13
updated: 2026-01-14
author: human:pidster

references:
  - id: REF-001
    relationship: REQUIRES
  - id: F-1
    relationship: SYNTHESISES
  - id: F-2
    relationship: SYNTHESISES
  - id: F-3
    relationship: SYNTHESISES
  - id: C-1
    relationship: SYNTHESISES
  - id: C-2
    relationship: SYNTHESISES
  - id: C-3
    relationship: SYNTHESISES
  - id: C-4
    relationship: SYNTHESISES
  - id: C-5
    relationship: SYNTHESISES

thy:
  covers:
    problem_mapping: true
    design_rationale: true
    modification_patterns: true
    invalidation_conditions: true

tags:
  - theory
  - framework
  - naur
---

# THY-001: AI-Augmented SDLC Framework Theory

## Purpose

This document captures the integrated understanding—the "theory" in Naur's sense—that enables coherent modification of the AI-Augmented SDLC Framework.

**What this document is**: A scaffold for rebuilding theory. It addresses Naur's three essential areas: problem mapping, design rationale, and modification patterns.

**What this document is not**: A complete transfer of understanding. Reading this does not make you a theory-holder; working with the framework while consulting this document may help you become one.

**Required references**: This document assumes familiarity with [REF-001: Framework Concepts Reference](./ref_framework-concepts.md), which catalogues the detailed concept documents.

---

## 1. Problem Mapping

*What real-world concerns does this framework address? How do framework elements correspond to those concerns?*

### The Real-World Problem

Software development fails. Not occasionally—routinely. Despite decades of methodology development, projects still:
- Deliver late or over budget
- Produce systems that don't meet actual needs
- Create "legacy" systems that resist modification
- Lose critical knowledge when people leave

**The common diagnosis** (naive): "We need better processes, better tools, better documentation."

**The actual diagnosis** (this framework's position): Software development fails because it's fundamentally a **knowledge management problem**, and most approaches treat knowledge as if it were all formal and transferable—when 70-80% is tacit and resists formalisation.

### How Framework Elements Map to This Problem

| Real-World Concern | Framework Element | Why This Mapping |
|--------------------|-------------------|------------------|
| Knowledge isn't all documentable | Information Taxonomy (C-1) | Distinguishes formal/tacit/emergent to enable appropriate handling |
| Different work needs different approaches | Capability Model (C-2) | Decomposes cognitive work into assignable units |
| Projects have phases with different characteristics | Seven-Phase SDLC (C-3) | Recognises that early phases are tacit-heavy, late phases formal-heavy |
| Humans and AI have different strengths | Actor Model (C-4) | Characterises what each can reliably do |
| Collaboration varies by context | Collaboration Patterns (C-5) | Five patterns from Human-Only to AI-Only |
| Knowledge is lost at handoffs | Transitions & Info Loss (C-6) | Quantifies and addresses phase boundary losses |
| Teams know "who knows what" | Transactive Memory (F-2) | Explains why this coordination matters and is fragile |
| Understanding enables modification | Theory-Building (F-1) | Explains why documentation alone isn't enough |
| Technical and social intertwine | STS Theory (F-3) | Explains why you can't optimise one without the other |

### The Core Insight

> **AI capabilities are real, but software success depends on human cognitive capabilities that AI cannot replicate.**

This isn't anti-AI—it's a recognition that naive AI integration (automating everything possible) degrades the very capabilities that determine project success. The framework exists to enable **principled integration** that leverages AI strengths while preserving human understanding.

---

## 2. Design Rationale

*Why is the framework structured this way? What alternatives were considered?*

### Why Eight Capabilities (Not Fewer, Not More)

**Alternatives considered**:
- Fewer (e.g., "Think" and "Do") — too coarse for pattern assignment
- More (e.g., 15+ fine-grained activities) — complexity without differentiation benefit

**Why eight**: These represent the minimal set that:
1. Covers all cognitive work in software development
2. Remains distinct enough to assign different collaboration patterns
3. Aligns with observable differences in human vs. AI suitability

See [C-2 Capability Model](../concepts/concept_capability-model.md) for definitions.

### Why Five Collaboration Patterns (Not a Spectrum)

**Alternatives considered**:
- Binary (human or AI) — ignores the reality of collaboration
- Continuous spectrum (0-100% AI) — loses actionable guidance

**Why five discrete patterns**: They represent qualitatively different modes:
- **Human-Only**: AI cannot contribute value
- **Human-Led**: Human could complete alone; AI accelerates
- **Partnership**: Neither can complete alone
- **AI-Led**: AI could complete; human ensures correctness
- **AI-Only**: Human review adds no value

The boundaries matter for accountability and escalation design.

See [C-5 Collaboration Patterns](../concepts/concept_collaboration-patterns.md) for details.

### Why Instance-Level Pattern Assignment

**Alternatives considered**:
- Capability-level ("Analyse is always Partnership")
- Phase-level ("Requirements phase is Human-Led")

**Why instance-level**: The same capability in the same phase may need different patterns depending on:
- What is being analysed (formal data vs. tacit context)
- Who holds relevant understanding
- What the stakes are

"Analyse stakeholder interviews" differs from "Analyse API response formats."

### Why Phase-Specific Information Composition

**Alternatives considered**:
- Uniform treatment across phases
- Task-specific only (ignore phase context)

**Why phase-specific**: Empirical observation shows consistent patterns:
- Early phases (Initiation, Planning): 70-75% tacit
- Middle phases (Requirements, Design): 40-50% tacit
- Late phases (Implementation, Testing, Operations): 30-35% tacit

This isn't prescriptive—it's descriptive. The framework recognises the pattern to guide appropriate practices.

See [I-2 Phase-Specific Composition](../concepts/integration_phase-specific-composition.md) for percentages.

### Key Tensions and Resolutions

| Tension | Resolution |
|---------|------------|
| AI capability vs. human accountability | Accountability always human, even in AI-Only patterns |
| Efficiency vs. skill preservation | Deliberate human involvement to maintain skills (Bainbridge) |
| Documentation vs. theory | THY documents acknowledge incompleteness; scaffold not transfer |
| Standardisation vs. context-sensitivity | Stable patterns, instance-level decisions |

---

## 3. Modification Patterns

*What should a modifier recognise? How do you extend coherently?*

### Pattern: Adding a New Concept

**Recognise this situation**: You've identified something the framework doesn't address that seems important.

**Questions to ask**:
1. What problem does this concept address?
2. Is it already covered by existing concepts? (Check REF-001)
3. What empirical evidence supports it?
4. How does it relate to existing concepts?
5. Does it enable better decisions, or just add complexity?

**Coherent modification**: New concepts should explain something existing concepts don't. They should integrate with the existing structure (cite foundations, connect to capabilities/phases/patterns).

**Incoherent modification**: Adding concepts that duplicate existing ones, contradict foundations, or exist "because other frameworks have them."

### Pattern: Changing an Existing Concept

**Recognise this situation**: You believe a concept is wrong or incomplete.

**Questions to ask**:
1. What evidence suggests the current formulation is wrong?
2. What depends on the current formulation? (Check integration documents)
3. Can the change be made without breaking dependencies?
4. Is this a correction (error) or evolution (new understanding)?

**Coherent modification**: Document the rationale. Update dependent documents. Preserve the change history.

**Incoherent modification**: Changing a concept in isolation, ignoring dependencies, or losing the rationale trail.

### Pattern: Applying to a New Context

**Recognise this situation**: You want to use the framework outside its original scope (e.g., non-software projects, different organisational context).

**Questions to ask**:
1. Do the foundational assumptions hold? (Tacit knowledge dominates? Theory-building matters? Socio-technical applies?)
2. Which concepts transfer directly?
3. Which need adaptation?
4. What new concepts might be needed?

**Coherent modification**: Validate foundations first. Adapt explicitly. Document what's different and why.

**Incoherent modification**: Assuming universal applicability. Forcing concepts that don't fit.

### Pattern: Adding Executable Components

**Recognise this situation**: You want to add a new agent, skill, or operational component.

**Questions to ask**:
1. What capability does this component exercise?
2. What collaboration pattern does it embody?
3. How does it integrate with existing components?
4. What escalation triggers does it need?

**Coherent modification**: Components should map to framework concepts. Skills exercise capabilities. Agents orchestrate capability flows. Patterns determine human involvement.

**Incoherent modification**: Components that bypass framework concepts, assume patterns without declaring them, or lack escalation design.

### Anti-Patterns to Avoid

| Anti-Pattern | Why It's Wrong | What to Do Instead |
|--------------|----------------|-------------------|
| "AI can do this now" | Capability ≠ suitability; accountability still matters | Evaluate at instance level; consider skill preservation |
| "Document everything" | Theory resists formalisation; 100% capture is impossible | Focus on rationale capture; acknowledge incompleteness |
| "One pattern fits all" | Context determines appropriate pattern | Assign at instance level based on actual requirements |
| "Skip early phases" | Tacit-heavy phases build essential understanding | Invest in understanding before formalisation |
| "Automate for efficiency" | May degrade skills needed for exceptions | Balance automation with deliberate human engagement |

---

## 4. Evolution Conditions

*What assumptions underpin this theory? What would trigger adaptation?*

### Core Assumptions

The framework rests on assumptions that, if challenged by evidence, would trigger **evolution rather than invalidation**:

| Assumption | If Challenged | Framework Response |
|------------|---------------|-------------------|
| **Tacit knowledge dominates early phases** | Evidence shows otherwise | Revise phase composition model |
| **AI cannot build theory (Naur sense)** | AI demonstrates theory-building | Shift patterns; ensure human access to AI-held theory |
| **Theory-holders essential for maintenance** | Alternative mechanisms emerge | Adapt theory preservation approaches |
| **Joint optimisation required** | Evidence for independent optimisation | Re-examine STS application |
| **Information loss at transitions significant** | Better transfer mechanisms found | Adjust transition validation emphasis |

**Critical insight**: These conditions would change *how* the framework is applied, not *whether* it applies. The framework's purpose—ensuring software remains intelligently modifiable—persists regardless of which actors hold theory.

### Temporal Qualification

The framework's claims about AI capabilities are temporally qualified (as of 2024-2025). Future AI developments might:
- Enable AI theory-building → shift pattern recommendations *and* require theory accessibility to humans
- Reduce tacit/formal distinction → simplify information taxonomy
- Change accountability considerations → revise pattern definitions

The underlying structure (capabilities, patterns, phases) would adapt rather than collapse—the abstractions are more stable than the specific assignments.

### Evidence That Would Trigger Adaptation

- Studies showing documentation alone enables intelligent modification → revise documentation strategy, not abandon it
- Evidence that early phases aren't actually tacit-heavy → adjust phase composition guidance
- AI systems demonstrating genuine theory-building → ensure human accessibility to AI-held theory
- Organisations succeeding with uniform automation → examine what conditions enable this

**None of these would invalidate the framework's core purpose**: ensuring systems remain intelligently modifiable by actors (human or AI) with access to the necessary understanding.

For detailed analysis of framework resilience properties, see [THY-002: Framework Resilience](./theory_framework-resilience.md).

---

## Document Relationships

| Document | Relationship to THY-001 |
|----------|------------------------|
| [REF-001](./ref_framework-concepts.md) | Catalogue of concepts this theory integrates |
| [Framework Manual](./framework-manual.md) | Operational reference derived from this understanding |
| `foundation_*.md` | Theoretical sources synthesised here |
| `concept_*.md` | Individual concepts explained in REF-001 |
| `integration_*.md` | How specific concepts connect |

---

## Validation Status

- ✓ **Problem mapping**: Grounded in observed failures and empirical research
- ✓ **Design rationale**: Each choice has documented reasoning
- ✓ **Modification patterns**: Initial guidance provided
- ⚠ **Completeness**: Unknown unknowns likely exist
- ⚠ **Transferability**: Whether this document helps rebuild theory is untested

---

*This document attempts to capture the integrated understanding of the AI-Augmented SDLC Framework per Naur's three essential areas. It is explicitly imperfect—theory resists formalisation. Its value lies in providing a scaffold for those seeking to understand, extend, or modify the framework coherently.*

---

**Document History**:
- v1 (13 January 2026): Initial draft
- v2 (13 January 2026): Restructured per Naur's three components; separated REF-001 for concept catalogue
