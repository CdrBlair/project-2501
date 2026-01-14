# Key Reference Concept 15: Document Type Classification Framework

## Definition

The Document Type Classification Framework provides a structured schema for defining and classifying information artefacts produced and consumed throughout the software development lifecycle. By establishing consistent classification dimensions, relationship types, and validation requirements, the framework enables principled decisions about document creation, retention, automation, and knowledge preservation.

This framework defines *how* to classify documents. Specific document type definitions (registries) are created by applying this framework to particular SDLC phases or organisational contexts.

## Classification Dimensions

Each document type is characterised by three orthogonal dimensions:

### Dimension 1: Content Domain

Content domain identifies *what* the document is about.

| Code | Domain | Description | Examples |
|------|--------|-------------|----------|
| STR | Strategy | Rationale, decisions, business justification | Business Case, Project Charter, ADR |
| SPC | Specification | Requirements, acceptance criteria, constraints | Stakeholder Requirements, System Requirements |
| DES | Design | Architecture, component structure, interfaces | Architecture Description, Component Design |
| IMP | Implementation | Code documentation, APIs, build configuration | API Documentation, Build Configuration |
| VAL | Validation | Test plans, results, verification evidence | Test Plan, Test Results |
| OPS | Operational | Runbooks, incident records, maintenance logs | Operational Runbook, Post-Mortem |
| REF | Reference | Conceptual models, explainers, glossaries | Domain Model, Glossary |
| THY | Theory | Integrated understanding, the "why" that connects | System Theory, Framework Theory |
| WRK | Working | Transient process artefacts, analysis notes | Interview Notes, Workshop Output, Analysis Notes |
| HST | Historical | Preserved negative knowledge, rejected alternatives | Discarded Alternative, Superseded Design |

#### THY (Theory) Domain

The THY domain warrants special explanation as it addresses a distinctive need: capturing the integrated understanding that enables coherent system modification.

**Relationship to Naur's Theory-Building**: Naur (1985) argued that software development creates a "theory" in developers' minds—an understanding that cannot be fully documented. THY documents acknowledge this limitation while deliberately attempting to capture what can be captured. Reading a THY document does not transfer theory; it provides a scaffold for rebuilding it.

**What THY documents contain**:
- The problem understanding that shaped the solution
- Why the system is structured the way it is (integrated picture, not individual decisions)
- The mental model that enables modification
- Key tensions and how they were resolved
- What would invalidate the current approach

**Distinction from other domains**:

| Domain | Captures | THY Captures |
|--------|----------|--------------|
| STR | What was decided | Why the whole hangs together |
| REF | Structure and terminology | Understanding and rationale |
| DES | How it works | Why that "how" was chosen |
| HST | Rejected paths | The coherent picture that emerged |

**Typical characteristics**:
- Temporal Class: Standing (meant to persist and evolve with the system)
- Typical Scope: Project or System
- Update pattern: Evolves as understanding deepens; major revisions at architectural shifts
- Explicitly imperfect: Acknowledges that full theory cannot be formalised

**Creation guidance**: THY documents are best created by theory-holders reflecting on their understanding. AI can assist with structure and prompting questions, but the integrated understanding comes from human cognition. Partnership pattern is typical.

### Dimension 2: Temporal Class

Temporal class identifies the document's update frequency and retention characteristics. This is a characteristic of the document *type*, not individual instances. Temporal classification derives from research on information lifecycle and knowledge retention (see Concept 1).

| Class | Update Frequency | Typical Lifespan | Retention Policy | Default Automation Level |
|-------|------------------|------------------|------------------|-------------------------|
| **Standing** | Quarterly or less | Years | Long-term archive | Human-Led to Partnership |
| **Dynamic** | Weekly or more | Project duration | Project archive | Partnership to AI-Led |
| **Ephemeral** | Single use | Days to weeks | Discretionary | Partnership to AI-Led |

**Standing documents** attempt to crystallise tacit knowledge into formal artefacts. Research indicates only 30-40% of original understanding survives formalisation without supplementary transfer mechanisms.

**Dynamic documents** track evolving state. Their formal content is current, but interpretation requires understanding the trajectory.

**Ephemeral documents** capture knowledge at a single moment. If tacit understanding isn't added at creation, it is permanently lost. Process validation must enforce capture of critical context.

### Dimension 3: Scope

Scope identifies the document's applicability breadth and determines storage location and context inclusion rules.

| Scope | Applicability | Storage Location | Context Inclusion |
|-------|---------------|------------------|-------------------|
| **Organisational** | Enterprise-wide | Org-level repository | Always included for org decisions |
| **Project** | Single initiative | Project repository | Included for project work |
| **Task** | Single work item | Task-attached | Included while task active; may exclude when complete |

The scope dimension is hierarchical: Organisational > Project > Task. A document type has a *typical* scope; instances may have a narrower scope but not broader.

---

## Instance Lifecycle

### Status Values

Document instances progress through lifecycle states:

| Status | Meaning | Typical Transitions |
|--------|---------|---------------------|
| **DRAFT** | Working toward approval; not yet authoritative | → CURRENT (approved) or → DISCARDED (rejected) |
| **CURRENT** | Active, approved, authoritative version | → SUPERSEDED (replaced) |
| **SUPERSEDED** | Replaced by newer document (not just version) | Terminal state |
| **DISCARDED** | Considered but rejected; retained for negative knowledge | Terminal state |

**Note**: Version increments do not change status. A CURRENT document remains CURRENT as versions increment. SUPERSEDED applies when a *different* document replaces this one entirely.

### Versioning

Document instances have monotonically increasing version numbers:
- Version is a positive integer starting at 1
- Each substantive change increments the version
- Version history is retained per organisational policy

### Instance Identification

**Instance ID**: `[Project]-[TypeCode]-[Sequence]`
- Stable identifier across versions
- Example: `ACME-SPC-001`

**Version reference**: `[InstanceID]@v[Version]`
- For citing specific versions
- Example: `ACME-SPC-001@v3`
- Omitting version implies current

---

## Document Relationships

Documents exist in a directed graph of relationships. The framework defines standard relationship types:

### Relationship Types

| Relationship | Semantics | Example |
|--------------|-----------|---------|
| **DERIVES_FROM** | Content synthesised or transformed from source | System Requirements DERIVES_FROM Stakeholder Requirements |
| **TRACES_TO** | Formal traceability link for verification | Test Case TRACES_TO Requirement |
| **REFERENCES** | Citation without derivation | ADR REFERENCES Architecture Description |
| **SUPERSEDES** | This document replaces another entirely | New SRS SUPERSEDES legacy SRS (different scope) |
| **CONTRIBUTES_TO** | Ephemeral content incorporated into standing document | Interview Notes CONTRIBUTES_TO Stakeholder Requirements |

### Relationship Cardinality

- DERIVES_FROM: Many-to-many (a document may derive from multiple sources; a source may feed multiple derivatives)
- TRACES_TO: Many-to-many (managed in traceability matrices)
- REFERENCES: Many-to-many
- SUPERSEDES: One-to-one (one document supersedes at most one other)
- CONTRIBUTES_TO: Many-to-one (multiple ephemeral documents contribute to one standing document)

---

## Document Type Definition Schema

Each document type is defined using this schema:

```
Document Type Definition:
├── Identity
│   ├── ID: [Domain]-[NNN]
│   └── Name: [Document Type Name]
│
├── Classification
│   ├── Content Domain: [STR | SPC | DES | IMP | VAL | OPS | REF]
│   ├── Temporal Class: [Standing | Dynamic | Ephemeral]
│   └── Typical Scope: [Organisational | Project | Task]
│
├── Lifecycle
│   ├── Created by: [Process ID(s) that produce this type]
│   ├── Consumed by: [Process ID(s) that use this type]
│   ├── Update pattern: [Description of typical update frequency/triggers]
│   └── Retention guidance: [How long to retain; archival requirements]
│
├── Creation Requirements
│   ├── Required inputs: [What must be available to create this document]
│   ├── Tacit knowledge required: [Understanding the author must possess]
│   ├── Validation criteria: [What must be present for document to be complete]
│   └── AI role: [How AI can assist in creation]
│
├── Consumption Characteristics
│   ├── Tacit knowledge required: [Understanding the reader must possess]
│   ├── Typical formalisation gaps: [What usually remains uncaptured]
│   └── AI role: [How AI can process/use the document]
│
├── Relationships
│   └── Typical relationships: [Common DERIVES_FROM, TRACES_TO, etc.]
│
└── Standards Alignment
    └── ISO 15289 reference: [Related information item, if applicable]
```

### Validation Criteria

Validation criteria specify what must be present for a document instance to be considered complete. These are enforced at process boundaries to ensure critical tacit knowledge is captured.

For ephemeral documents, validation criteria must include **capture window requirements**—information that must be recorded at creation time or will be permanently lost.

---

## Application Guidance

### Creating a Document Type Registry

To create a document type registry for a phase or context:

1. **Identify document types** consumed and produced by relevant processes
2. **Classify each type** using the three dimensions (domain, temporal class, scope)
3. **Define validation criteria** with particular attention to ephemeral capture windows
4. **Map relationships** between types to show information flow
5. **Integrate with process definitions** ensuring processes reference document types by ID

### Document Type ID Assignment

- IDs follow pattern: `[Domain]-[NNN]`
- NNN is globally unique across the registry (not per-domain)
- Reserve ranges for extensibility (e.g., STR-001 to STR-099 for core strategic documents)

### Context Inclusion Rules

When determining what documents to include in working context:

1. Always include relevant Organisational-scope documents
2. Include Project-scope documents for the active project
3. Include Task-scope documents for the active task
4. Exclude completed Task-scope ephemeral documents unless specifically relevant
5. Consider temporal class: Standing documents persist; Ephemeral may be excluded after contribution

---

## Integration with Other Concepts

- [**Information Composition Taxonomy**](./concept_information-taxonomy.md): Temporal class derives from information composition research; the 30-40% formalisation retention figure grounds Standing document limitations
- [**Theory-Building Principle**](./foundation_theory-building.md): Standing documents are the primary (imperfect) mechanism for preserving theory in recoverable form
- [**Seven-Phase SDLC Model**](./concept_seven-phase-sdlc.md): Document types are created and consumed across phases; registries map this flow
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): AI roles in creation/consumption align with collaboration pattern guidance
- [**Information Loss at Transitions**](./concept_transitions-info-loss.md): Validation criteria and capture window requirements address transition losses
- [**Process and Capability Flow Framework**](./concept_process-capability-flow.md): Processes reference document types as inputs and outputs

---

## Evidence Base

**ISO/IEC/IEEE 15289:2019** defines 73+ information items for software and systems lifecycle processes, providing normative foundation for document type identification.

**Temporal classification** derives from knowledge management research on information lifecycle, update patterns, and retention requirements.

**Scope hierarchy** reflects organisational information architecture patterns validated across enterprise contexts.

**Relationship types** synthesise requirements traceability research with document management practices.

---

## Validation Status

- ✓ **Classification dimensions**: Aligned with ISO 15289 and temporal research
- ✓ **Relationship types**: Cover common documentation patterns
- ✓ **Instance lifecycle**: Standard version control semantics
- ⚠ **Validation criteria approach**: Conceptually sound; effectiveness requires empirical validation
- ⚠ **Context inclusion rules**: Initial guidance; may need refinement based on tooling constraints

---

*The Document Type Classification Framework provides the schema for reasoning about information artefacts throughout the SDLC. By establishing consistent classification dimensions and relationship types, the framework enables systematic document management, principled automation decisions, and deliberate knowledge preservation.*
