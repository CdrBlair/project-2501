---
id: THY-003
type: THY
title: Conversation as Transactive Memory
scope: Project
temporal_class: Standing
status: PROVISIONAL
version: 1
created: 2026-01-14
author: human:pidster

references:
  - id: F-2
    relationship: EXTENDS
  - id: I-3
    relationship: EXTENDS
  - id: O-2
    relationship: SYNTHESISES
  - id: C-2
    relationship: REFERENCES

thy:
  covers:
    problem_mapping: true
    design_rationale: true
    modification_patterns: true
    invalidation_conditions: true
  provisional:
    reason: "Synthesises insight not yet fully grounded in conceptual foundation"
    requires_retrofit:
      - "F-2: Add conversation as TMS mechanism"
      - "I-3: Extend Naur-Wegner integration to cover human-AI dialogue"

tags:
  - theory
  - transactive-memory
  - conversation
  - dialogue
  - preserve
---

# THY-003: Conversation as Transactive Memory

## Status: PROVISIONAL

This THY document captures an insight that emerged during framework development but is not yet fully grounded in the conceptual foundation. It is marked PROVISIONAL to indicate:

1. The insight is believed valid and worth preserving
2. The conceptual foundation (F-2, I-3) needs extension to fully support it
3. This document may evolve as concepts are retrofitted

**Conceptual debt**: F-2 (Transactive Memory) and I-3 (Naur-Wegner Integration) should be extended to explicitly address conversation as a TMS mechanism. Until then, this THY synthesises an insight that extends beyond documented concepts.

---

## Purpose

This document captures the integrated understanding that **conversation is the primary medium through which transactive memory operates**, and that this applies equally to human-human and human-AI collaboration—with critical asymmetries that the framework must address.

**Core thesis**: In human teams, conversation performs TMS operations in real-time. Human-AI conversation performs the same functions, but AI context is ephemeral. This asymmetry necessitates deliberate PRESERVE operations to maintain TMS integrity across sessions.

---

## 1. Problem Mapping

*What real-world concern does this theory address?*

### The Conversation Problem

Knowledge work happens through conversation. When humans collaborate:
- They update each other on what they know (directory)
- They negotiate who handles what (allocation)
- They ask questions and get answers (retrieval)
- They discover new expertise in each other (learning)

This is TMS in action—not a separate activity, but the *mechanism* by which TMS operates.

### The Human-AI Asymmetry

When humans collaborate with AI:
- The same TMS operations occur during conversation
- But AI context is bounded by session/context window
- Session end = AI "forgets" = TMS degradation
- Human memory retains partial information only

| TMS Component | Human-Human | Human-AI |
|---------------|-------------|----------|
| Directory updates | Both persist | Human persists; AI forgets |
| Allocation agreements | Both persist | Human persists; AI forgets |
| Retrieved knowledge | Both can recall | Human partial; AI none |
| Learned expertise | Both retain | Human partial; AI none |

### The Framework Gap

The framework has:
- F-2 explaining TMS at the team level
- O-2 providing decision/observation logging
- Dialogue skills for capture

But it hasn't articulated **why** logging matters in TMS terms. The current framing treats logging as "good practice" rather than "essential TMS mechanism for human-AI collaboration."

---

## 2. Design Rationale

*Why does conversation-as-TMS matter? How does this understanding shape the framework?*

### Conversation Performs TMS Operations

| TMS Operation | Conversation Manifestation | Example |
|---------------|---------------------------|---------|
| **Directory update** | "I know about X" / "You should ask Y" | "I noticed the tests are failing" |
| **Allocation** | "I'll handle this" / "This is your area" | "Let me investigate the auth module" |
| **Retrieval** | Questions and answers | "What pattern should we use here?" |
| **Learning** | Discovering expertise through interaction | "You seem to understand the build system well" |
| **Maintenance** | Confirming or correcting prior knowledge | "Actually, that approach was deprecated" |

### Why This Matters for Human-AI Collaboration

In human teams, conversation builds TMS *and* TMS persists beyond any single conversation. Team members remember:
- What was discussed
- What was decided
- Who knows what
- What each person's expertise is

In human-AI collaboration, the AI's TMS participation is ephemeral:
- AI contributes to TMS during session
- AI's TMS knowledge doesn't persist
- New session = AI starts with no TMS context
- Human must re-establish directory, allocation, history

### The PRESERVE Capability as TMS Externalisation

The framework's PRESERVE capability (C-2) addresses this asymmetry:

| PRESERVE Operation | TMS Function |
|-------------------|--------------|
| Decision logging | Externalise allocation and rationale |
| Observation logging | Externalise directory updates |
| Session summaries | Compress TMS state for retrieval |
| Context documents | Encode standing TMS knowledge |

**Key insight**: Decision and observation logs aren't just "documentation"—they're **externalised TMS transactions** that allow AI to rejoin the team's transactive memory system.

### Why Dialogue Logs Have This Structure

The dialogue log schemas (O-2) were designed without explicit TMS framing, but they map:

| Log Element | TMS Function |
|-------------|--------------|
| `observer` / `actor` | Who holds/held the knowledge |
| `subject` / `outcome` | What the knowledge is about |
| `rationale` | Why (supports intelligent retrieval) |
| `context` | When/where (enables relevance judgement) |
| `tags` | Categories (supports directory lookup) |

---

## 3. Modification Patterns

*How should the framework evolve based on this understanding?*

### Pattern: Designing Dialogue Capture

**Recognise this situation**: You're creating new dialogue mechanisms (skills, agents, logging).

**Apply this understanding**:
1. Frame the mechanism in TMS terms—what operation does it externalise?
2. Ensure captured information supports TMS rejoining (who, what, why, when)
3. Design for retrieval, not just storage (how will future AI find this?)

**Coherent extension**: New dialogue mechanisms should explicitly address TMS functions.

**Incoherent extension**: Logging "because it's good practice" without TMS rationale.

### Pattern: Session Continuity

**Recognise this situation**: AI needs to continue work across session boundaries.

**Apply this understanding**:
1. Session start = AI rejoining team TMS
2. AI needs: directory (who knows what), allocation (who handles what), history (what was decided)
3. Context assembly should prioritise TMS-relevant information

**Coherent approach**: Provide AI with externalised TMS state at session start.

**Incoherent approach**: Expecting AI to infer TMS from artifacts alone.

### Pattern: Conversation Design

**Recognise this situation**: Designing how humans and AI should interact.

**Apply this understanding**:
1. Conversation is TMS in action—design for TMS operations, not just task completion
2. Prompt AI to perform TMS operations explicitly ("Let me note that..." = directory update)
3. Capture TMS-significant exchanges, not every message

**Coherent approach**: Treat conversation as TMS mechanism; design for knowledge transfer.

**Incoherent approach**: Treating conversation as pure task execution without knowledge implications.

---

## 4. Evolution Conditions

*What would change this understanding?*

### Core Assumptions

| Assumption | If Challenged | Response |
|------------|---------------|----------|
| **AI context is ephemeral** | AI gains persistent memory | Re-examine PRESERVE emphasis |
| **Human memory is partial** | Tools enhance human recall | Re-examine asymmetry framing |
| **Conversation is primary TMS medium** | Other mechanisms dominate | Revise TMS operation mapping |
| **TMS externalisation enables AI rejoining** | Externalisation proves insufficient | Strengthen capture requirements |

### Temporal Qualification

This theory addresses human-AI collaboration as of 2024-2025, where:
- AI context is bounded by conversation/session
- AI cannot independently access prior conversation history
- Human provides the continuity bridge

Future developments (persistent AI memory, cross-session retrieval) would shift the asymmetry analysis but not invalidate the TMS framing.

---

## 5. Conceptual Debt

This THY extends beyond currently documented concepts. To fully ground it:

### F-2 Extension Required

F-2 (Transactive Memory) should add:
- Conversation as the mechanism through which TMS operates
- How TMS functions manifest in dialogue
- The role of externalisation in TMS maintenance

### I-3 Extension Required

I-3 (Naur-Wegner Integration) should add:
- How conversation builds both individual theory (Naur) and team TMS (Wegner)
- The human-AI asymmetry in TMS persistence
- Why PRESERVE capability matters for human-AI TMS

### New Integration Possible

Consider I-4: Dialogue as TMS Mechanism
- Focused integration of conversation, TMS, and human-AI collaboration
- Would provide conceptual grounding for this THY

---

## Document Relationships

| Document | Relationship to THY-003 |
|----------|------------------------|
| [F-2 Transactive Memory](../concepts/foundation_transactive-memory.md) | Foundation being extended |
| [I-3 Naur-Wegner Integration](../concepts/integration_naur-wegner.md) | Integration being extended |
| [O-2 Decision & Observation Tracking](../concepts/concept_decision-observation-tracking.md) | Operational concept reframed |
| [C-2 Capability Model](../concepts/concept_capability-model.md) | PRESERVE capability contextualised |

---

## Validation Status

- ✓ **Problem mapping**: Asymmetry clearly identified
- ✓ **Design rationale**: TMS framing provides explanatory power
- ✓ **Modification patterns**: Actionable guidance provided
- ⚠ **Conceptual grounding**: PROVISIONAL—requires concept retrofit
- ⚠ **Empirical validation**: Theoretical; effectiveness not yet tested

---

*This document captures the insight that conversation is the medium through which transactive memory operates, and that human-AI collaboration requires deliberate externalisation to address the asymmetry in TMS persistence. It is marked PROVISIONAL pending extension of the conceptual foundation.*

---

**Document History**:
- v1 (14 January 2026): Initial provisional draft capturing conversation-as-TMS insight
