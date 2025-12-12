# Example 3.1: Document Type Registry (Phase 3 — Analysis/Requirements)

## Overview

This document applies the **Document Type Classification Framework (Concept 15)** to Phase 3 (Analysis/Requirements), defining the specific document types consumed and produced by Phase 3 processes.

This example demonstrates how to create a document type registry for an SDLC phase. The classification dimensions (Content Domain, Temporal Class, Scope), relationship types, and instance lifecycle are defined in Concept 15. Process references use IDs defined in the **Process and Capability Flow Specification Framework (Concept 16)**.

---

## Document Types Consumed by Phase 3

These document types are created in earlier phases and serve as inputs to Phase 3 processes.

### STR-001: Business Case

| Attribute | Value |
|-----------|-------|
| **ID** | STR-001 |
| **Name** | Business Case |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.3 (Business Case Development) |
| **Consumed by** | PROC-2.1, PROC-2.2, PROC-3.1, PROC-3.4 |
| **Update pattern** | Major revisions at stage gates; minor updates as assumptions change |
| **Retention** | Project lifetime plus audit period |

**Creation Requirements:**
- Required inputs: Opportunity statement, strategic fit analysis, market research
- Tacit knowledge required: Strategic context, stakeholder landscape, value assessment methods
- Validation criteria: Benefits quantified; costs estimated; risks identified; alternatives documented
- AI role: Market research, financial modelling, document structuring

**Consumption Characteristics:**
- Tacit knowledge required: Organisational strategy, political dynamics, investment thresholds
- Typical formalisation gaps: Stakeholder negotiation history; confidence levels in estimates
- AI role: Extract key constraints and success criteria; surface for requirements validation

**Standards Alignment:** ISO 15289 Business or Mission Analysis Report

---

### STR-002: Project Charter

| Attribute | Value |
|-----------|-------|
| **ID** | STR-002 |
| **Name** | Project Charter |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.4 (Project Chartering) |
| **Consumed by** | PROC-2.1, PROC-2.5, PROC-3.1 |
| **Update pattern** | Rarely updated; amendments require governance approval |
| **Retention** | Project lifetime plus audit period |

**Creation Requirements:**
- Required inputs: Business case, stakeholder analysis
- Tacit knowledge required: Organisational governance, authority structures
- Validation criteria: Objectives stated; scope bounded; governance defined; authority granted
- AI role: Template population, consistency checking

**Consumption Characteristics:**
- Tacit knowledge required: Organisational hierarchy, decision-making norms
- Typical formalisation gaps: Informal authority; escalation preferences
- AI role: Extract scope boundaries for requirements validation

**Standards Alignment:** ISO 15289 Project Charter

---

### STR-003: Scope Statement

| Attribute | Value |
|-----------|-------|
| **ID** | STR-003 |
| **Name** | Scope Statement |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-2.1 (Scope Definition) |
| **Consumed by** | PROC-3.1, PROC-3.3, PROC-3.4 |
| **Update pattern** | Updated via formal change control |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Project charter, preliminary stakeholder requirements
- Tacit knowledge required: Stakeholder expectations, technical feasibility boundaries
- Validation criteria: In-scope items enumerated; out-of-scope items explicit; boundaries testable
- AI role: Consistency checking against charter

**Consumption Characteristics:**
- Tacit knowledge required: Why boundaries were drawn where they are
- Typical formalisation gaps: Boundary negotiation rationale; grey areas
- AI role: Validate requirements against scope boundaries

**Standards Alignment:** Part of ISO 15289 Project Management Plan

---

### STR-004: Risk Register

| Attribute | Value |
|-----------|-------|
| **ID** | STR-004 |
| **Name** | Risk Register |
| **Content Domain** | Strategy |
| **Temporal Class** | Dynamic |
| **Typical Scope** | Project |
| **Created by** | PROC-2.2 (Risk Assessment) |
| **Consumed by** | All phases; PROC-3.1, PROC-3.4 specifically |
| **Update pattern** | Continuous; reviewed at milestones |
| **Retention** | Project lifetime; archived for lessons learned |

**Creation Requirements:**
- Required inputs: Scope statement, project charter, historical risk data
- Tacit knowledge required: Domain experience, pattern recognition for risks
- Validation criteria: Significant risks identified; likelihood/impact assessed; responses defined; owners assigned
- AI role: Historical pattern matching, categorisation, tracking

**Consumption Characteristics:**
- Tacit knowledge required: Risk assessment calibration, organisational risk tolerance
- Typical formalisation gaps: Confidence in assessments; interdependencies between risks
- AI role: Surface relevant risks during requirements analysis; flag risk implications of requirements decisions

**Standards Alignment:** ISO 15289 Risk Management Report

---

## Document Types Produced by Phase 3

### SPC-001: Stakeholder Requirements Specification

| Attribute | Value |
|-----------|-------|
| **ID** | SPC-001 |
| **Name** | Stakeholder Requirements Specification |
| **Content Domain** | Specification |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-3.1 (Stakeholder Requirements Elicitation) |
| **Consumed by** | PROC-3.3, PROC-3.4, PROC-4.1, PROC-6.5 |
| **Update pattern** | Baselined at phase end; changes via control process |
| **Retention** | Project lifetime plus maintenance period |

**Creation Requirements:**
- Required inputs: Project charter, scope statement, stakeholder access
- Tacit knowledge required: Elicitation techniques, stakeholder psychology, domain understanding
- Validation criteria:
  - All key stakeholders represented
  - Each requirement has: unique ID, statement, rationale, source, priority
  - Conflicts identified and flagged
  - Traceability to business objectives established
- AI role: Structure and consistency checking; pattern detection across stakeholder inputs; draft consolidation

**Consumption Characteristics:**
- Tacit knowledge required: Stakeholder context, priority negotiation history
- Typical formalisation gaps: Unstated assumptions; stakeholder preferences not captured as requirements
- AI role: Parse for downstream processing; identify gaps and conflicts

**Standards Alignment:** ISO 15289 Stakeholder Requirements Definition Report

**Typical Relationships:**
- DERIVES_FROM: STR-001 (Business Case), STR-002 (Project Charter)
- TRACES_TO: SPC-002 (System Requirements)

---

### SPC-002: System Requirements Specification

| Attribute | Value |
|-----------|-------|
| **ID** | SPC-002 |
| **Name** | System Requirements Specification |
| **Content Domain** | Specification |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-3.3 (Requirements Formalisation) |
| **Consumed by** | PROC-4.1, PROC-4.2, PROC-5.1, PROC-6.2, PROC-6.5 |
| **Update pattern** | Baselined; changes via formal control |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: SPC-001 (Stakeholder Requirements), REF-001 (Domain Model), SPC-003 (Business Rules)
- Tacit knowledge required: Requirements formalisation methods, testability assessment
- Validation criteria:
  - Each requirement: unique ID, unambiguous statement, testable acceptance criteria
  - Full traceability to stakeholder requirements
  - No unresolved conflicts
  - Consistency verified (no contradictions)
  - Completeness reviewed (no obvious gaps)
- AI role: Formalisation assistance; consistency checking; gap detection; traceability generation

**Consumption Characteristics:**
- Tacit knowledge required: Intent behind formal statements; acceptable interpretations
- Typical formalisation gaps: Edge cases; implicit constraints; performance expectations
- AI role: Direct consumption for design and test generation; traceability maintenance

**Standards Alignment:** ISO 15289 System/Software Requirements Specification

**Typical Relationships:**
- DERIVES_FROM: SPC-001 (Stakeholder Requirements)
- TRACES_TO: DES-001 (Architecture), VAL-002 (Test Cases)

---

### SPC-003: Business Rules Catalogue

| Attribute | Value |
|-----------|-------|
| **ID** | SPC-003 |
| **Name** | Business Rules Catalogue |
| **Content Domain** | Specification |
| **Temporal Class** | Standing |
| **Typical Scope** | Project (may elevate to Organisational if rules span systems) |
| **Created by** | PROC-3.1, PROC-3.2 (Legacy System Analysis) |
| **Consumed by** | PROC-3.3, PROC-4.2, PROC-5.1, PROC-5.2, PROC-6.3 |
| **Update pattern** | Updated as rules are discovered or changed |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: Stakeholder knowledge, legacy system access (if applicable), regulatory references
- Tacit knowledge required: Domain expertise, rule interpretation
- Validation criteria:
  - Each rule: unique ID, formal statement, natural language description, source
  - Rules categorised (calculation, validation, inference, constraint)
  - Conflicts identified
  - Validation status recorded (confirmed/unconfirmed/disputed)
- AI role: Extraction from legacy code; pattern detection; conflict identification

**Consumption Characteristics:**
- Tacit knowledge required: Rule application context; exception handling
- Typical formalisation gaps: Rule precedence in conflicts; edge case handling
- AI role: Direct implementation reference; test case generation

**Standards Alignment:** Part of ISO 15289 System/Software Requirements Specification

**Typical Relationships:**
- DERIVES_FROM: Legacy systems (if modernisation), stakeholder knowledge
- REFERENCES: Regulatory documents, policy documents
- TRACES_TO: SPC-002 (System Requirements), IMP-001 (Source Code)

---

### SPC-004: Traceability Matrix

| Attribute | Value |
|-----------|-------|
| **ID** | SPC-004 |
| **Name** | Traceability Matrix |
| **Content Domain** | Specification |
| **Temporal Class** | Dynamic |
| **Typical Scope** | Project |
| **Created by** | PROC-3.3 (Requirements Formalisation) |
| **Consumed by** | PROC-4.1, PROC-5.1, PROC-6.2, PROC-6.5 |
| **Update pattern** | Continuous as artefacts evolve |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: SPC-001, SPC-002, and downstream artefacts as created
- Tacit knowledge required: Relationship semantics; coverage assessment
- Validation criteria:
  - All stakeholder requirements traced to system requirements
  - Forward traceability maintained as design/implementation proceeds
  - Orphan detection (requirements with no implementation; implementations with no requirement)
- AI role: Automated link maintenance; coverage analysis; orphan detection

**Consumption Characteristics:**
- Tacit knowledge required: Link confidence; partial satisfaction assessment
- Typical formalisation gaps: Partial traces; implicit satisfaction
- AI role: Impact analysis; coverage reporting; change propagation

**Standards Alignment:** Part of ISO 15289 Traceability documentation

**Typical Relationships:**
- Links SPC-001 ↔ SPC-002 ↔ DES-001 ↔ IMP-001 ↔ VAL-002

---

### SPC-005: Prioritised Requirements Backlog

| Attribute | Value |
|-----------|-------|
| **ID** | SPC-005 |
| **Name** | Prioritised Requirements Backlog |
| **Content Domain** | Specification |
| **Temporal Class** | Dynamic |
| **Typical Scope** | Project |
| **Created by** | PROC-3.4 (Requirements Prioritisation) |
| **Consumed by** | PROC-4.1, PROC-5.1, Sprint/iteration planning |
| **Update pattern** | Continuous; re-prioritised at planning boundaries |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: SPC-002 (System Requirements), STR-001 (Business Case), STR-004 (Risk Register)
- Tacit knowledge required: Value assessment, stakeholder priority weighting, dependency understanding
- Validation criteria:
  - All requirements from SPC-002 included
  - Priority assigned with rationale
  - Dependencies identified
  - Stakeholder agreement recorded
- AI role: Dependency analysis; priority conflict detection

**Consumption Characteristics:**
- Tacit knowledge required: Priority negotiation context; flexibility in ordering
- Typical formalisation gaps: Soft dependencies; priority rationale nuances
- AI role: Sequencing support; impact analysis for re-prioritisation

**Standards Alignment:** Agile backlog practices; relates to ISO 15289 requirements management

**Typical Relationships:**
- DERIVES_FROM: SPC-002 (System Requirements)
- REFERENCES: STR-001 (Business Case), STR-004 (Risk Register)

---

### REF-001: Domain Model

| Attribute | Value |
|-----------|-------|
| **ID** | REF-001 |
| **Name** | Domain Model |
| **Content Domain** | Reference |
| **Temporal Class** | Standing |
| **Typical Scope** | Project (may elevate to Organisational for enterprise domains) |
| **Created by** | PROC-3.1, PROC-3.2 |
| **Consumed by** | PROC-3.3, PROC-4.1, PROC-4.3, PROC-5.1 |
| **Update pattern** | Refined as understanding deepens; stable after requirements phase |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: Stakeholder knowledge, legacy system analysis (if applicable), existing domain documentation
- Tacit knowledge required: Domain expertise, abstraction skills, entity-relationship thinking
- Validation criteria:
  - Key entities identified with definitions
  - Relationships named and described
  - Cardinalities specified
  - Validated with domain experts
- AI role: Pattern extraction from legacy; consistency checking; visualisation generation

**Consumption Characteristics:**
- Tacit knowledge required: Domain nuances not captured in model
- Typical formalisation gaps: Exception cases; temporal aspects of relationships; implicit constraints
- AI role: Reference for consistent terminology; input to data architecture

**Standards Alignment:** Conceptual data model; supports ISO 15289 requirements documentation

**Typical Relationships:**
- DERIVES_FROM: Stakeholder knowledge, legacy systems
- REFERENCES: SPC-003 (Business Rules)
- Supports: SPC-002 (System Requirements), DES-003 (Data Architecture)

---

### REF-002: Glossary

| Attribute | Value |
|-----------|-------|
| **ID** | REF-002 |
| **Name** | Glossary |
| **Content Domain** | Reference |
| **Temporal Class** | Standing |
| **Typical Scope** | Project (may derive from Organisational glossary) |
| **Created by** | PROC-3.1 (incrementally) |
| **Consumed by** | All processes |
| **Update pattern** | Incremental as terms are encountered |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: Stakeholder communication, domain documentation
- Tacit knowledge required: Term disambiguation, context sensitivity
- Validation criteria:
  - Each term: definition, context, synonyms (if any), antonyms/contrasts (if helpful)
  - No contradictory definitions
  - Validated with stakeholders
- AI role: Term extraction; consistency checking across documents

**Consumption Characteristics:**
- Tacit knowledge required: When definitions apply vs. exceptions
- Typical formalisation gaps: Context-dependent meanings; evolving usage
- AI role: Terminology validation; consistent usage checking

**Standards Alignment:** ISO 15289 recommends glossary as part of documentation set

**Typical Relationships:**
- REFERENCES: All specification documents
- May DERIVES_FROM: Organisational glossary

---

## Working Document Types (Ephemeral)

These document types capture point-in-time information during Phase 3 activities. Their value must be extracted into Standing documents or explicitly preserved.

### WRK-001: Interview Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-001 |
| **Name** | Interview Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-3.1 (during elicitation) |
| **Consumed by** | PROC-3.1 (synthesis steps) |
| **Update pattern** | Single creation; not updated |
| **Retention** | Project discretion; recommend retain for audit trail |

**Creation Requirements:**
- Required inputs: Interview occurrence, participant availability
- Tacit knowledge required: Active listening, probe questioning, note-taking skill
- Validation criteria:
  - Participant(s) identified
  - Date/time recorded
  - Key points captured
  - **Critical**: Action items and open questions flagged
  - **Critical**: Insights and rationale captured at time of interview (capture window)
- AI role: Transcription assistance; structure suggestion; action item extraction

**Consumption Characteristics:**
- Tacit knowledge required: Interview context; non-verbal cues; rapport factors
- Typical formalisation gaps: Tone, emphasis, confidence levels, interpersonal dynamics
- AI role: Extract requirements candidates; identify themes across interviews

**Process Validation Note:**
> PROC-3.1 steps consuming WRK-001 must validate that rationale and context are present. If missing, escalate to interviewer to add before proceeding with synthesis.

**Typical Relationships:**
- CONTRIBUTES_TO: SPC-001 (Stakeholder Requirements)

---

### WRK-002: Workshop Output

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-002 |
| **Name** | Workshop Output |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-3.1 (during elicitation) |
| **Consumed by** | PROC-3.1 (synthesis steps) |
| **Update pattern** | Single creation; not updated |
| **Retention** | Project discretion |

**Creation Requirements:**
- Required inputs: Workshop occurrence, participant engagement
- Tacit knowledge required: Facilitation, group dynamics, synthesis during session
- Validation criteria:
  - Participants listed
  - Objectives stated
  - Outputs captured (diagrams, lists, decisions)
  - **Critical**: Disagreements and resolutions recorded
  - **Critical**: Rationale for group decisions captured at session end (capture window)
- AI role: Real-time capture assistance; output structuring

**Consumption Characteristics:**
- Tacit knowledge required: Group dynamics; dissenting views; energy/engagement levels
- Typical formalisation gaps: Minority opinions; conditional agreements; post-workshop clarifications
- AI role: Extract requirements candidates; conflict identification

**Process Validation Note:**
> PROC-3.1 synthesis steps must validate that decision rationale is present. If workshop decisions are recorded without rationale, escalate to facilitator before proceeding.

**Typical Relationships:**
- CONTRIBUTES_TO: SPC-001 (Stakeholder Requirements), REF-001 (Domain Model)

---

### WRK-003: Analysis Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-003 |
| **Name** | Analysis Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-3.2, PROC-3.3 |
| **Consumed by** | Same process, subsequent steps |
| **Update pattern** | Accumulated during analysis; not formally versioned |
| **Retention** | Project discretion; valuable insights should migrate to Standing documents |

**Creation Requirements:**
- Required inputs: Artefacts being analysed
- Tacit knowledge required: Analytical reasoning, pattern recognition
- Validation criteria:
  - Source artefact identified
  - Observations recorded
  - **Critical**: Interpretations and hypotheses distinguished from facts
  - Questions and uncertainties flagged
- AI role: Pattern detection; cross-reference identification

**Consumption Characteristics:**
- Tacit knowledge required: Analyst's reasoning chain; confidence levels
- Typical formalisation gaps: Dead ends explored; alternative interpretations considered
- AI role: Theme extraction; gap identification

**Typical Relationships:**
- CONTRIBUTES_TO: SPC-002 (System Requirements), SPC-003 (Business Rules), REF-001 (Domain Model)

---

### WRK-004: Legacy Code Analysis Report

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-004 |
| **Name** | Legacy Code Analysis Report |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral (may elevate to Standing if comprehensive) |
| **Typical Scope** | Task to Project |
| **Created by** | PROC-3.2 (Legacy System Analysis) |
| **Consumed by** | PROC-3.2, PROC-3.3, PROC-5.2 |
| **Update pattern** | Accumulated during analysis |
| **Retention** | Project lifetime (valuable for modernisation reference) |

**Creation Requirements:**
- Required inputs: Legacy code access, analysis tools
- Tacit knowledge required: Legacy technology understanding, pattern recognition
- Validation criteria:
  - Modules/components enumerated
  - Complexity metrics captured
  - Business logic locations identified
  - **Critical**: Ambiguities and uncertainties explicitly flagged
  - **Critical**: Hypotheses about intent clearly marked as hypotheses
- AI role: Code parsing; pattern extraction; metrics generation; hypothesis generation

**Consumption Characteristics:**
- Tacit knowledge required: Legacy technology context; why certain patterns were used
- Typical formalisation gaps: Original developer intent; undocumented workarounds
- AI role: Reference for transformation; rule extraction source

**Process Validation Note:**
> PROC-3.2 must escalate when AI analysis produces low-confidence interpretations. Human SME validation required before interpretations are treated as confirmed.

**Typical Relationships:**
- CONTRIBUTES_TO: SPC-003 (Business Rules), REF-001 (Domain Model)
- REFERENCES: Legacy system documentation (if exists)

---

## Historical Document Types

### HST-001: Discarded Alternative

| Attribute | Value |
|-----------|-------|
| **ID** | HST-001 |
| **Name** | Discarded Alternative |
| **Content Domain** | Reference |
| **Temporal Class** | Standing (negative knowledge has long-term value) |
| **Typical Scope** | Project |
| **Created by** | Any process where alternatives are evaluated and rejected |
| **Consumed by** | Future decision-making; maintenance; similar projects |
| **Update pattern** | Created once; not updated |
| **Retention** | System lifetime |

**Creation Requirements:**
- Required inputs: Decision context, alternatives considered
- Tacit knowledge required: Evaluation reasoning, rejection rationale
- Validation criteria:
  - Alternative clearly described
  - **Critical**: Rejection rationale documented
  - Conditions under which alternative might be reconsidered (if any)
- AI role: Template population; cross-reference to related decisions

**Consumption Characteristics:**
- Tacit knowledge required: Original decision context
- Typical formalisation gaps: Strength of conviction; political factors
- AI role: Surface during related decisions ("this was previously considered and rejected because...")

**Standards Alignment:** Supports ISO 15289 Decision Management

**Typical Relationships:**
- REFERENCES: Related decisions (ADRs, requirement choices)
- Context for: Future similar decisions

---

## Document Relationship Patterns

### Phase 3 Information Flow

```
PHASE 1-2 INPUTS                    PHASE 3 WORKING                 PHASE 3 OUTPUTS
─────────────────                   ───────────────                 ───────────────

STR-001 Business Case ─────────┐
                               │
STR-002 Project Charter ───────┼──► WRK-001 Interview Notes ──┐
                               │                               │
STR-003 Scope Statement ───────┤    WRK-002 Workshop Output ──┼──► SPC-001 Stakeholder Reqs
                               │                               │           │
STR-004 Risk Register ─────────┤    WRK-003 Analysis Notes ───┤           │
                               │                               │           ▼
                               │    WRK-004 Legacy Analysis ──┼──► SPC-003 Business Rules
                               │              │                │           │
                               │              │                │           ▼
                               │              ▼                ├──► REF-001 Domain Model
                               │         SPC-003 ◄─────────────┤           │
                               │              │                │           ▼
                               │              ▼                └──► SPC-002 System Reqs
                               │         REF-001                           │
                               │              │                            ▼
                               │              ▼                    SPC-004 Traceability
                               │         SPC-001 ──────────────────────────┤
                               │              │                            ▼
                               └──────────────┴───────────────────► SPC-005 Prioritised Backlog
```

### Relationship Type Usage

| Relationship | Phase 3 Usage |
|--------------|---------------|
| DERIVES_FROM | SPC-002 DERIVES_FROM SPC-001; SPC-003 DERIVES_FROM legacy + stakeholders |
| TRACES_TO | SPC-001 TRACES_TO SPC-002 (managed in SPC-004) |
| REFERENCES | SPC-005 REFERENCES STR-001, STR-004 for prioritisation context |
| SUPERSEDES | New SPC-002 instance SUPERSEDES prior when scope fundamentally changes |
| CONTRIBUTES_TO | WRK-001, WRK-002 CONTRIBUTES_TO SPC-001 (ephemeral→standing pattern) |

---

## Validation Integration

### Process Validation Points

Each process step that consumes documents should validate required information is present. Key validation points for Phase 3:

| Process Step | Document | Required Content | Escalation If Missing |
|--------------|----------|------------------|----------------------|
| 3.1.4 (Pattern analysis) | WRK-001, WRK-002 | Rationale for stakeholder statements | Request author add context |
| 3.2.5 (Rule extraction) | WRK-004 | Confidence flag on interpretations | Human SME review required |
| 3.3.2 (Formalisation) | SPC-001 | Rationale field per requirement | Cannot formalise without intent |
| 3.3.4 (Traceability) | SPC-001, SPC-002 | Unique IDs, clear statements | Cannot trace ambiguous items |
| 3.4.3 (Priority decision) | SPC-005 | Stakeholder agreement record | Escalate to governance |

### Completeness Criteria by Document Type

| Document Type | Minimum Viable Content | Full Content |
|---------------|----------------------|--------------|
| SPC-001 | ID, statement, source for each requirement | + rationale, priority, acceptance criteria |
| SPC-002 | ID, unambiguous statement, testable criteria | + trace to SPC-001, constraints, assumptions |
| SPC-003 | ID, formal statement, validation status | + natural language, source, exceptions |
| REF-001 | Entities with definitions, key relationships | + cardinalities, constraints, lifecycle states |

---

## Extension Guidance

This registry covers Phase 3. To extend to other phases:

1. **Identify document types** consumed and produced by phase processes
2. **Classify** using Content Domain, Temporal Class, Typical Scope
3. **Define validation criteria** emphasising capture window requirements for Ephemeral types
4. **Map relationships** showing information flow
5. **Integrate with Process Definitions** ensuring process steps reference document types and include validation

Document type IDs should follow the pattern: `[Domain]-[NNN]` where NNN is globally unique within the registry (not per-domain) to avoid ambiguity.

---

## Integration with Framework Concepts

This example applies:
- **Document Type Classification Framework (Concept 15)**: Classification schema, relationship types, instance lifecycle
- **Process and Capability Flow Specification Framework (Concept 16)**: Process references for creation/consumption

And integrates with:
- **Information Taxonomy (Concept 1)**: Temporal class guidance derives from information composition research
- **Capability Model (Concept 3)**: Document creation involves specific capability sequences
- **Collaboration Patterns (Concept 7)**: AI roles specified per document type align with pattern guidance
- **Phase Composition (Concept 6)**: Phase 3's 40% formal / 50% tacit / 10% emergent composition explains the emphasis on capturing rationale in ephemeral documents

---

## Validation Status

- ✓ **Framework application**: Correctly applies Concept 15 schema
- ✓ **Document type identification**: Covers Phase 3 inputs/outputs comprehensively
- ✓ **Relationship mapping**: Uses defined relationship types consistently
- ⚠ **Validation criteria**: Initial specification; requires refinement through practice
- ⚠ **AI role guidance**: Based on current (2024-2025) capabilities; will require updates
- ⚠ **Working document types**: May need expansion based on organisational practices

---

*This example demonstrates how to apply the Document Type Classification Framework (Concept 15) to a specific SDLC phase, creating a registry of document types with their classifications, validation criteria, and relationships.*
