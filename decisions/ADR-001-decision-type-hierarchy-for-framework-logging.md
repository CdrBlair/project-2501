# ADR-001: Decision type hierarchy for framework logging

Date: 2026-01-14
Status: Accepted
Actor: human:pidster

## References

| Reference | Relationship | Context |
|-----------|--------------|---------|
| C-8 | DERIVES_FROM | Document type classification (Standing/Dynamic/Ephemeral) |
| C-1 | DERIVES_FROM | Information taxonomy (formal/tacit/emergent) |
| FW-003 | BLOCKS | task for DESIGN type implementation |
| FW-004 | BLOCKS | task for ADR skill creation |
| DEC-20260114-101710 | TRACES_TO | Decision that ADR creation must log to decision log |
| DEC-20260114-102417 | TRACES_TO | First DESIGN type decision logged |

## Context

The framework needed a way to classify and log decisions at different levels of significance. The existing OPERATIONAL/TACTICAL types were insufficient for design decisions that don't warrant full ADRs.

## Decision

Implement four-tier decision hierarchy: OPERATIONAL, TACTICAL, DESIGN, ADR. Each type maps to framework document classification concepts.

## Alternatives Considered

### Alternative 1: Two types (OPERATIONAL/TACTICAL only)
**Pros:**
- Simple, minimal cognitive overhead

**Cons:**
- No middle ground for design decisions that don't warrant full ADRs
- Forces either under-documenting or over-documenting decisions

### Alternative 2: Three types (add DESIGN)
**Pros:**
- Covers component-level decisions
- Clear escalation path from tactical to design

**Cons:**
- Still need separate ADR handling
- No cross-referencing mechanism between ADRs and decision log

### Alternative 3: Four types (add DESIGN and ADR) — Selected
**Pros:**
- Complete coverage across decision significance spectrum
- ADR cross-referencing ensures audit trail completeness
- Each type maps cleanly to framework concepts

**Cons:**
- More complexity in type selection
- Users must understand the distinctions

## Consequences

**Positive:**
- Complete decision classification coverage across all significance levels
- Framework-grounded type definitions (mapped to document domains, temporal classes, knowledge types)
- ADR cross-referencing ensures decision log remains complete audit trail
- Clear escalation path: OPERATIONAL → TACTICAL → DESIGN → ADR

**Negative/Trade-offs:**
- Users must choose correct type (mitigated by selection flowchart in SKILL.md)
- More complex than simple binary classification
- ADR creation requires additional step (create ADR, then log cross-reference)

## Rationale

The four-tier model provides complete coverage while maintaining clear boundaries. Each type maps to framework concepts:

| Type | Domain | Temporal Class | Knowledge Type |
|------|--------|----------------|----------------|
| OPERATIONAL | WRK | Ephemeral | Documentable |
| TACTICAL | WRK | Ephemeral-Dynamic | Elicitable |
| DESIGN | STR | Dynamic-Standing | Elicitable with rationale |
| ADR | STR | Standing | Embedded (formal alternatives analysis) |

This grounding ensures the distinctions aren't arbitrary but reflect genuine differences in how decisions should be captured and preserved.
