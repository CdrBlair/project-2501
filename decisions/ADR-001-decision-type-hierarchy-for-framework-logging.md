# ADR-001: Decision type hierarchy for framework logging

Date: 2026-01-14
Status: Proposed
Actor: human:pidster

## Context

The framework needed a way to classify and log decisions at different levels of significance. The existing OPERATIONAL/TACTICAL types were insufficient for design decisions that don't warrant full ADRs.

## Decision

Implement four-tier decision hierarchy: OPERATIONAL, TACTICAL, DESIGN, ADR. Each type maps to framework document classification concepts.

## Alternatives Considered

1. Two types (OPERATIONAL/TACTICAL only): Pros - simple. Cons - no middle ground for design decisions. 2. Three types (add DESIGN): Pros - covers component decisions. Cons - still need ADR handling. 3. Four types (add DESIGN and ADR): Pros - complete coverage, ADR cross-referencing. Cons - more complexity.

## Consequences

✅ Complete decision classification coverage. ✅ Framework-grounded type definitions. ✅ ADR cross-referencing ensures audit trail completeness. ⚠️ Users must choose correct type.

## Rationale

The four-tier model provides complete coverage while maintaining clear boundaries. Each type maps to framework concepts (document domains, temporal classes, knowledge types), providing theoretical grounding for the distinctions.
