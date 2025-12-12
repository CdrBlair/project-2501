# Example 3.2: Capability Flow Specifications (Phase 3 — Analysis/Requirements)

## Overview

This document applies the **Process and Capability Flow Specification Framework (Concept 16)** to Phase 3 (Analysis/Requirements), specifying the capability flows for all four Phase 3 processes at instance granularity.

Each capability instance is fully specified with inputs, outputs, actor patterns, escalation triggers, and completion criteria. Document references use type IDs from **Example 3.1: Document Type Registry (Phase 3)**, which applies the **Document Type Classification Framework (Concept 15)**.

The specification structure template is defined in Concept 16. This example demonstrates its application.

---

## PROC-3.1: Stakeholder Requirements Elicitation

**Purpose**: Capture stakeholder needs, expectations, and constraints in stakeholder language.

**Process Information Composition**: 30% Formal, 60% Tacit, 10% Emergent

**Process Inputs**: STR-001, STR-002, STR-003, STR-004

**Process Outputs**: SPC-001, REF-001 (partial), REF-002 (incremental), WRK-001, WRK-002

---

### Step 3.1.1: Identify Stakeholders and Plan Elicitation

```
Step 3.1.1:
  Name: Identify Stakeholders and Plan Elicitation
  Capability: Elicit
  
  Input:
    Documents:
      - STR-002 (Project Charter) [required: stakeholder section, governance structure]
      - STR-001 (Business Case) [required: affected parties, benefit recipients]
      - STR-003 (Scope Statement) [required: scope boundaries]
    Other:
      - Organisational knowledge of stakeholder landscape
  
  Output:
    Documents: None (working output)
    Other:
      - Stakeholder register (list with roles, interests, influence, availability)
      - Elicitation plan (who, when, what method)
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Identify stakeholders beyond those documented
    - Assess political landscape and access constraints
    - Determine appropriate elicitation methods per stakeholder
    - Sequence engagements strategically
  
  AI Role:
    - Extract named stakeholders from input documents
    - Suggest stakeholder categories based on project type
    - Draft initial elicitation schedule
    - Identify potential gaps (e.g., no end-user representation)
  
  Escalation Triggers:
    - Key stakeholder unavailable or unwilling
    - Political sensitivities around stakeholder inclusion
    - Scope ambiguity affecting stakeholder identification
  
  Completion Criteria:
    - All stakeholder categories represented
    - Elicitation method chosen for each stakeholder/group
    - Schedule established with stakeholder agreement
  
  Validation:
    - Cross-check stakeholder list against scope boundaries
    - Confirm no obvious categories missing (users, operators, maintainers, regulators)
```

---

### Step 3.1.2: Elicit from Documentation

```
Step 3.1.2:
  Name: Elicit from Documentation
  Capability: Elicit
  
  Input:
    Documents:
      - STR-001 (Business Case) [required: objectives, success criteria]
      - STR-002 (Project Charter) [required: scope, constraints]
      - STR-003 (Scope Statement) [required: in/out of scope]
      - Existing system documentation (if available)
      - Regulatory/compliance documents (if applicable)
    Other: None
  
  Output:
    Documents:
      - WRK-003 (Analysis Notes) [partial: documented requirements candidates]
    Other:
      - Requirements candidates extracted from documents
      - Questions and ambiguities identified
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Provide access to relevant documents
    - Review AI extractions for accuracy
    - Interpret ambiguous statements
    - Add context not visible in documents
  
  AI Role:
    - Parse documents for requirement-like statements
    - Extract constraints, objectives, success criteria
    - Identify inconsistencies across documents
    - Flag ambiguous or contradictory statements
    - Generate questions for clarification
  
  Escalation Triggers:
    - Contradictory information across documents
    - Statements that could be interpreted multiple ways
    - References to external documents not available
    - Implicit requirements detected (gaps in explicit coverage)
  
  Completion Criteria:
    - All input documents processed
    - Requirements candidates extracted and categorised
    - Ambiguities logged for stakeholder clarification
  
  Validation:
    - Each extraction traceable to source location
    - Confidence level assigned to each candidate
    - Contradictions flagged (not resolved—that requires human judgement)
```

---

### Step 3.1.3: Elicit from Stakeholders

```
Step 3.1.3:
  Name: Elicit from Stakeholders
  Capability: Elicit
  
  Input:
    Documents:
      - STR-003 (Scope Statement) [required: boundaries for discussion framing]
    Other:
      - Stakeholder register from 3.1.1
      - Requirements candidates from 3.1.2 (for validation/expansion)
      - Elicitation plan from 3.1.1
  
  Output:
    Documents:
      - WRK-001 (Interview Notes) [per interview conducted]
      - WRK-002 (Workshop Output) [per workshop conducted]
    Other:
      - Raw stakeholder input (needs, wants, constraints, concerns)
      - Contextual information about stakeholder perspectives
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Conduct interviews and workshops
    - Build rapport and trust with stakeholders
    - Probe for unstated needs and assumptions
    - Observe non-verbal cues and group dynamics
    - Capture rationale and context in real-time
    - Manage conflicting stakeholder interests
  
  AI Role:
    - Transcription assistance (if permitted)
    - Real-time note structuring (if used during session)
    - Post-session: extract key points from recordings/notes
    - Generate follow-up question suggestions
  
  Escalation Triggers:
    - Stakeholder conflicts require governance involvement
    - Access to key stakeholders blocked
  
  Completion Criteria:
    - All planned stakeholders engaged
    - Notes captured for each engagement
    - **Critical**: Rationale for stakeholder statements recorded (capture window)
    - Open questions documented for follow-up
  
  Validation:
    - WRK-001/WRK-002 instances include rationale field populated
    - If rationale missing: DO NOT proceed to 3.1.4; return to stakeholder or document as "rationale not captured"
```

---

### Step 3.1.4: Analyse Patterns and Themes

```
Step 3.1.4:
  Name: Analyse Patterns and Themes
  Capability: Analyse
  
  Input:
    Documents:
      - WRK-001 (Interview Notes) [required: rationale field populated]
      - WRK-002 (Workshop Output) [required: decision rationale captured]
      - WRK-003 (Analysis Notes) [from 3.1.2]
    Other:
      - Requirements candidates from documentation
  
  Output:
    Documents:
      - WRK-003 (Analysis Notes) [updated: patterns, themes, conflicts]
    Other:
      - Grouped requirements by theme
      - Identified conflicts and tensions
      - Priority signals from stakeholder emphasis
  
  Actor Pattern: Partnership
  
  Human Role:
    - Interpret stakeholder intent beyond literal statements
    - Assess relative importance based on stakeholder context
    - Identify implicit requirements from patterns
    - Judge significance of conflicts
  
  AI Role:
    - Cluster similar requirements across sources
    - Detect contradictions and overlaps
    - Quantify frequency of themes across stakeholders
    - Identify gaps (themes not covered by certain stakeholder groups)
    - Suggest priority based on mention frequency and emphasis markers
  
  Escalation Triggers:
    - Fundamental conflicts between key stakeholder groups
    - Requirements that contradict scope boundaries
    - Patterns suggesting missing stakeholder perspectives
    - AI clustering produces groupings human finds incorrect
  
  Completion Criteria:
    - All inputs processed and grouped
    - Themes identified with supporting evidence
    - Conflicts enumerated with affected stakeholders
    - Gaps flagged for potential follow-up elicitation
  
  Validation:
    - Each theme traceable to source documents
    - Conflicts have both sides represented
    - Human has reviewed AI groupings and corrected errors
```

---

### Step 3.1.5: Synthesise Requirements Set

```
Step 3.1.5:
  Name: Synthesise Requirements Set
  Capability: Synthesise
  
  Input:
    Documents:
      - WRK-003 (Analysis Notes) [required: patterns, themes, conflicts from 3.1.4]
    Other:
      - Grouped requirements by theme
      - Conflict analysis
  
  Output:
    Documents:
      - SPC-001 (Stakeholder Requirements) [draft status]
    Other:
      - Coherent requirements set (not yet validated)
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Resolve ambiguities through judgement
    - Frame requirements in consistent language
    - Ensure completeness (no obvious gaps)
    - Add requirements implied but not stated
    - Assign preliminary priorities
    - Write rationale for each requirement
  
  AI Role:
    - Suggest standard requirement phrasing
    - Check for duplicates and near-duplicates
    - Ensure consistent terminology (reference REF-002)
    - Flag potential gaps based on requirement patterns
    - Generate requirement IDs
    - Draft rationale statements for human review
  
  Escalation Triggers:
    - Cannot resolve conflict without stakeholder input
    - Scope boundary questions arise
    - Requirements imply capabilities outside project scope
  
  Completion Criteria:
    - All themes covered by at least one requirement
    - Each requirement has: ID, statement, source, rationale, preliminary priority
    - Conflicts either resolved or explicitly flagged for resolution
    - No duplicate requirements
  
  Validation:
    - Every requirement traceable to at least one source (WRK-001, WRK-002, or document)
    - Rationale field populated for each requirement
    - Terminology consistent with REF-002 (or new terms added to REF-002)
```

---

### Step 3.1.6: Validate with Stakeholders

```
Step 3.1.6:
  Name: Validate with Stakeholders
  Capability: Validate
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [draft from 3.1.5]
    Other:
      - Stakeholder availability
  
  Output:
    Documents:
      - SPC-001 (Stakeholder Requirements) [validated, updated based on feedback]
    Other:
      - Validation record (who validated what, when)
      - Outstanding issues list
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Present requirements to stakeholders
    - Facilitate discussion of conflicts and priorities
    - Capture corrections and additions
    - Negotiate resolution of conflicts
    - Document stakeholder sign-off or concerns
  
  AI Role:
    - Generate presentation materials from SPC-001
    - Track changes during review sessions
    - Update SPC-001 based on human-provided feedback
  
  Escalation Triggers:
    - Stakeholder rejects requirements as inaccurate
    - New requirements emerge that affect scope
    - Conflicts cannot be resolved at working level
  
  Completion Criteria:
    - All key stakeholders have reviewed relevant requirements
    - Feedback incorporated or explicitly deferred
    - Validation record complete
    - Outstanding issues documented with owners
  
  Validation:
    - Each stakeholder's review recorded
    - Changes traceable to validation feedback
    - No requirement lacks stakeholder validation (or explicit exception)
```

---

### Step 3.1.7: Preserve Requirements Specification

```
Step 3.1.7:
  Name: Preserve Requirements Specification
  Capability: Preserve
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [validated from 3.1.6]
    Other:
      - Validation record
      - Outstanding issues
  
  Output:
    Documents:
      - SPC-001 (Stakeholder Requirements) [status: CURRENT, version incremented]
      - REF-002 (Glossary) [updated with new terms]
    Other:
      - Baseline established for change control
  
  Actor Pattern: Partnership
  
  Human Role:
    - Final review of document quality
    - Approve baseline
    - Ensure rationale is complete and clear
  
  AI Role:
    - Format document to standard structure
    - Generate table of contents, indices
    - Verify all required fields populated
    - Cross-reference with REF-002 for terminology
    - Archive working documents (WRK-001, WRK-002) with links
  
  Escalation Triggers:
    - Validation criteria not met (missing rationale, unresolved conflicts)
    - Document structure non-compliant
  
  Completion Criteria:
    - SPC-001 status changed to CURRENT
    - Version incremented
    - Working documents archived with traceability
    - Glossary updated
  
  Validation:
    - All requirements have: ID, statement, source, rationale, priority, validation record
    - No unresolved conflicts (or explicitly deferred with rationale)
    - Document passes structural compliance check
```

---

## PROC-3.2: Legacy System Analysis

**Purpose**: Extract understanding from existing systems (code, data, behaviour) for modernisation or replacement.

**Process Information Composition**: 35% Formal, 55% Tacit, 10% Emergent

**Process Inputs**: Legacy system access, existing documentation, STR-003

**Process Outputs**: SPC-003, REF-001, WRK-004

**Note**: This process is particularly relevant for modernisation scenarios. For greenfield development, this process may be skipped or reduced to analysis of similar/competitor systems.

---

### Step 3.2.1: Inventory Legacy Assets

```
Step 3.2.1:
  Name: Inventory Legacy Assets
  Capability: Elicit
  
  Input:
    Documents:
      - STR-003 (Scope Statement) [required: which systems in scope]
      - Existing system documentation (if available)
    Other:
      - Legacy system access (source code, databases, running system)
  
  Output:
    Documents:
      - WRK-004 (Legacy Code Analysis Report) [initial: inventory section]
    Other:
      - Module/component inventory
      - Code volume metrics
      - Technology stack identification
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Provide system access
    - Confirm inventory completeness
    - Identify undocumented components
    - Explain system boundaries
  
  AI Role:
    - Scan source repositories
    - Enumerate modules, files, components
    - Calculate code metrics (LOC, complexity)
    - Identify technologies, frameworks, languages
    - Map directory/package structures
  
  Escalation Triggers:
    - Access issues (permissions, connectivity)
    - Unexpected technologies encountered
    - Code in formats AI cannot parse
    - Scope boundaries unclear (which code is in scope)
  
  Completion Criteria:
    - All in-scope code repositories inventoried
    - Component list complete
    - Metrics calculated
    - Unknown/unparseable areas flagged
  
  Validation:
    - Inventory reviewed by someone with system knowledge
    - No major components missing
    - Metrics plausible (sanity check)
```

---

### Step 3.2.2: Analyse Code Structure

```
Step 3.2.2:
  Name: Analyse Code Structure
  Capability: Analyse
  
  Input:
    Documents:
      - WRK-004 (Legacy Code Analysis Report) [required: inventory from 3.2.1]
    Other:
      - Source code access
  
  Output:
    Documents:
      - WRK-004 (Legacy Code Analysis Report) [updated: structure analysis]
    Other:
      - Dependency graph
      - Call hierarchies
      - Data flow paths
      - Architectural patterns identified
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Guide analysis focus areas
    - Validate architectural interpretations
    - Explain historical context for unusual patterns
  
  AI Role:
    - Parse code to build AST/dependency graphs
    - Identify architectural patterns (layers, modules, services)
    - Trace data flows
    - Detect coupling patterns
    - Identify dead code candidates
    - Map database access patterns
  
  Escalation Triggers:
    - Unusual patterns AI cannot classify
    - Circular dependencies or complex coupling
    - Code that defies standard parsing
    - Significant dead code detected (needs human confirmation)
  
  Completion Criteria:
    - Dependency graph generated
    - Major architectural patterns identified
    - Data flows traced for key entities
    - Analysis documented in WRK-004
  
  Validation:
    - Human review of architectural interpretation
    - Dependency graph matches human understanding
    - Dead code candidates confirmed or rejected
```

---

### Step 3.2.3: Extract Business Rules from Code

```
Step 3.2.3:
  Name: Extract Business Rules from Code
  Capability: Elicit
  
  Input:
    Documents:
      - WRK-004 (Legacy Code Analysis Report) [required: structure from 3.2.2]
    Other:
      - Source code access
      - Database schemas
  
  Output:
    Documents:
      - SPC-003 (Business Rules Catalogue) [draft status, validation: UNCONFIRMED]
      - WRK-004 (Legacy Code Analysis Report) [updated: rule extraction notes]
    Other:
      - Extracted rules with source locations
      - Confidence levels per rule
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Review extracted rules for accuracy
    - Interpret ambiguous logic
    - Provide domain context for rule meaning
    - Confirm or reject AI interpretations
  
  AI Role:
    - Identify validation logic patterns
    - Extract calculation formulas
    - Detect conditional business logic
    - Parse constraint definitions
    - Map rules to source locations
    - Assign confidence levels
    - Flag ambiguous or complex rules
  
  Escalation Triggers:
    - Rule logic is ambiguous or complex
    - Magic numbers or unexplained constants
    - Contradictory logic in different code paths
    - Rules that seem incorrect or outdated
    - Low confidence extractions
  
  Completion Criteria:
    - Business logic locations systematically processed
    - Rules extracted with source references
    - Each rule has confidence level
    - Ambiguous rules flagged for SME review
  
  Validation:
    - **Critical**: Every rule marked as UNCONFIRMED until human validation
    - Confidence levels appropriate (high confidence only for clear logic)
    - Source locations accurate
```

---

### Step 3.2.4: Analyse Data Structures

```
Step 3.2.4:
  Name: Analyse Data Structures
  Capability: Analyse
  
  Input:
    Documents:
      - WRK-004 (Legacy Code Analysis Report) [required: structure from 3.2.2]
    Other:
      - Database schemas
      - Data access layer code
  
  Output:
    Documents:
      - REF-001 (Domain Model) [draft: extracted from data structures]
      - WRK-004 (Legacy Code Analysis Report) [updated: data analysis]
    Other:
      - Entity inventory
      - Relationship map
      - Data quality observations
  
  Actor Pattern: Partnership
  
  Human Role:
    - Interpret entity meanings
    - Explain naming conventions
    - Identify historical artifacts vs. current usage
    - Validate relationship interpretations
  
  AI Role:
    - Parse schema definitions
    - Identify entities and relationships
    - Detect cardinalities from constraints
    - Trace foreign key relationships
    - Identify potential reference data
    - Flag orphaned tables
    - Analyse data patterns (if data access provided)
  
  Escalation Triggers:
    - Undocumented table purposes
    - Complex or unusual relationships
    - Orphaned tables (no references)
    - Data quality issues detected
    - Naming conventions unclear
  
  Completion Criteria:
    - All tables/entities inventoried
    - Relationships mapped
    - Entity definitions drafted
    - Data quality issues documented
  
  Validation:
    - Entity interpretations reviewed by SME
    - Relationships confirmed
    - Orphaned artifacts classified (dead vs. needed)
```

---

### Step 3.2.5: Elicit Tribal Knowledge

```
Step 3.2.5:
  Name: Elicit Tribal Knowledge
  Capability: Elicit
  
  Input:
    Documents:
      - SPC-003 (Business Rules Catalogue) [draft: UNCONFIRMED rules from 3.2.3]
      - REF-001 (Domain Model) [draft from 3.2.4]
      - WRK-004 (Legacy Code Analysis Report) [accumulated analysis]
    Other:
      - SME availability
      - Operations staff availability
  
  Output:
    Documents:
      - WRK-001 (Interview Notes) [from SME sessions]
      - SPC-003 (Business Rules Catalogue) [updated: some rules now CONFIRMED]
      - REF-001 (Domain Model) [updated: entity definitions refined]
    Other:
      - Contextual knowledge not in code
      - Historical rationale for design decisions
      - Known issues and workarounds
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Conduct SME interviews
    - Present extracted rules and models for validation
    - Probe for "why" behind observed patterns
    - Capture workarounds and undocumented behaviours
    - Document historical context
  
  AI Role:
    - Prepare interview materials (rules to validate, entities to clarify)
    - Generate targeted questions based on uncertainty flags
    - Structure interview notes post-session
  
  Escalation Triggers:
    - SME access blocked or limited
    - SME provides conflicting information
  
  Completion Criteria:
    - Key SMEs interviewed
    - High-priority rules validated (status updated in SPC-003)
    - Entity definitions confirmed or corrected
    - **Critical**: Rationale for unusual patterns captured
    - Known issues documented
  
  Validation:
    - Interview notes include rationale, not just confirmations
    - Rules marked CONFIRMED only when SME explicitly validates
    - If SME uncertain, rule remains UNCONFIRMED with note
```

---

### Step 3.2.6: Synthesise Domain Understanding

```
Step 3.2.6:
  Name: Synthesise Domain Understanding
  Capability: Synthesise
  
  Input:
    Documents:
      - SPC-003 (Business Rules Catalogue) [partially confirmed]
      - REF-001 (Domain Model) [draft]
      - WRK-004 (Legacy Code Analysis Report) [complete]
      - WRK-001 (Interview Notes) [from 3.2.5]
    Other:
      - All accumulated understanding
  
  Output:
    Documents:
      - REF-001 (Domain Model) [status: CURRENT]
      - SPC-003 (Business Rules Catalogue) [status: CURRENT, with validation status per rule]
    Other:
      - Coherent understanding of legacy system
      - Gaps and uncertainties documented
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Integrate all sources into coherent model
    - Resolve apparent contradictions
    - Make judgement calls on uncertain interpretations
    - Identify remaining gaps
    - Document assumptions made
  
  AI Role:
    - Check consistency across documents
    - Identify contradictions between code analysis and SME input
    - Suggest model refinements
    - Generate visualisations of domain model
  
  Escalation Triggers:
    - Fundamental contradictions cannot be resolved
    - Critical business rules remain UNCONFIRMED
    - Domain model has significant gaps
  
  Completion Criteria:
    - REF-001 is coherent and internally consistent
    - SPC-003 has validation status for each rule
    - Remaining uncertainties explicitly documented
    - Assumptions listed
  
  Validation:
    - Domain model reviewed by at least one SME
    - Business rules catalogue reviewed
    - Uncertainties acknowledged (not hidden)
```

---

### Step 3.2.7: Preserve Legacy Understanding

```
Step 3.2.7:
  Name: Preserve Legacy Understanding
  Capability: Preserve
  
  Input:
    Documents:
      - REF-001 (Domain Model) [from 3.2.6]
      - SPC-003 (Business Rules Catalogue) [from 3.2.6]
      - WRK-004 (Legacy Code Analysis Report) [complete]
    Other:
      - All working materials
  
  Output:
    Documents:
      - REF-001 (Domain Model) [version incremented]
      - SPC-003 (Business Rules Catalogue) [version incremented]
      - WRK-004 (Legacy Code Analysis Report) [archived]
    Other:
      - Baseline for requirements and design work
  
  Actor Pattern: Partnership
  
  Human Role:
    - Final review and approval
    - Ensure critical knowledge captured
    - Approve archival of working documents
  
  AI Role:
    - Format documents to standards
    - Generate cross-references
    - Archive working materials with traceability
    - Verify completeness
  
  Escalation Triggers:
    - Critical knowledge gaps remain
    - Document quality insufficient
  
  Completion Criteria:
    - Documents baselined
    - Working materials archived
    - Traceability established
  
  Validation:
    - All documents pass structural validation
    - Cross-references accurate
    - Versions incremented appropriately
```

---

## PROC-3.3: Requirements Formalisation

**Purpose**: Transform stakeholder requirements into precise, testable system specifications.

**Process Information Composition**: 55% Formal, 40% Tacit, 5% Emergent

**Process Inputs**: SPC-001, REF-001, SPC-003, STR-003

**Process Outputs**: SPC-002, SPC-004

---

### Step 3.3.1: Analyse Requirements for Formalisation

```
Step 3.3.1:
  Name: Analyse Requirements for Formalisation
  Capability: Analyse
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [required: CURRENT status]
      - REF-001 (Domain Model) [if available]
      - SPC-003 (Business Rules Catalogue) [if available]
      - STR-003 (Scope Statement) [required: boundaries]
    Other: None
  
  Output:
    Documents:
      - WRK-003 (Analysis Notes) [formalisation analysis]
    Other:
      - Requirements categorised by formalisation difficulty
      - Ambiguities identified
      - Gaps identified
      - Inconsistencies flagged
  
  Actor Pattern: Partnership
  
  Human Role:
    - Assess requirement intent
    - Identify ambiguities that need stakeholder clarification
    - Judge which requirements need decomposition
    - Flag requirements that resist formalisation
  
  AI Role:
    - Parse requirements for structure
    - Identify vague terms ("fast", "easy", "reliable")
    - Detect potential conflicts between requirements
    - Check consistency with domain model entities
    - Flag requirements without clear acceptance criteria
  
  Escalation Triggers:
    - Requirements fundamentally ambiguous
    - Conflicts between requirements
    - Requirements outside scope boundaries
    - Requirements incompatible with domain model
  
  Completion Criteria:
    - All stakeholder requirements analysed
    - Formalisation difficulty assessed
    - Ambiguities listed for resolution
    - Pre-conditions for formalisation identified
  
  Validation:
    - Each requirement assessed
    - Issues categorised (ambiguity, conflict, gap, scope)
```

---

### Step 3.3.2: Resolve Ambiguities

```
Step 3.3.2:
  Name: Resolve Ambiguities
  Capability: Decide
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [required]
      - WRK-003 (Analysis Notes) [required: ambiguity list from 3.3.1]
    Other:
      - Stakeholder access for clarification
  
  Output:
    Documents:
      - SPC-001 (Stakeholder Requirements) [updated: ambiguities resolved]
      - WRK-003 (Analysis Notes) [updated: resolution decisions]
    Other:
      - Clarified requirement interpretations
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Contact stakeholders for clarification
    - Make judgement calls when stakeholder unavailable
    - Document resolution rationale
    - Update requirements with clarifications
  
  AI Role:
    - Draft clarification questions
    - Track resolution status
    - Update documents based on human decisions
  
  Escalation Triggers:
    - Stakeholder provides conflicting clarification
    - Judgement call has significant implications
    - Resolution affects scope
  
  Completion Criteria:
    - All identified ambiguities addressed
    - Resolutions documented with rationale
    - SPC-001 updated
  
  Validation:
    - Each ambiguity has resolution or explicit deferral
    - Rationale captured (not just the decision)
```

---

### Step 3.3.3: Transform to System Requirements

```
Step 3.3.3:
  Name: Transform to System Requirements
  Capability: Transform
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [required: ambiguities resolved]
      - REF-001 (Domain Model) [required: for entity references]
      - SPC-003 (Business Rules Catalogue) [required: for rule references]
      - REF-002 (Glossary) [required: for terminology]
    Other: None
  
  Output:
    Documents:
      - SPC-002 (System Requirements Specification) [draft status]
    Other:
      - Formalised requirement statements
      - Testable acceptance criteria
  
  Actor Pattern: Partnership
  
  Human Role:
    - Verify formalisation captures intent
    - Write acceptance criteria
    - Ensure testability
    - Add constraints and assumptions
    - Decompose complex requirements
  
  AI Role:
    - Suggest formal phrasings
    - Generate acceptance criteria templates
    - Check terminology against glossary
    - Ensure consistent structure
    - Identify missing quality attributes
    - Reference relevant business rules
  
  Escalation Triggers:
    - Requirement resists testable formalisation
    - Acceptance criteria unclear
    - Decomposition creates scope questions
    - Business rules conflict with requirements
  
  Completion Criteria:
    - Each stakeholder requirement has corresponding system requirement(s)
    - All system requirements have acceptance criteria
    - Terminology consistent with glossary
    - Quality attributes addressed
  
  Validation:
    - Each requirement: ID, statement, acceptance criteria, priority
    - Terminology check passed
    - No orphan stakeholder requirements (all traced)
```

---

### Step 3.3.4: Generate Traceability

```
Step 3.3.4:
  Name: Generate Traceability
  Capability: Generate
  
  Input:
    Documents:
      - SPC-001 (Stakeholder Requirements) [required]
      - SPC-002 (System Requirements Specification) [draft from 3.3.3]
    Other: None
  
  Output:
    Documents:
      - SPC-004 (Traceability Matrix) [initial: stakeholder → system]
    Other:
      - Traceability links
      - Coverage analysis
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Review auto-generated links
    - Correct incorrect mappings
    - Add links AI missed
    - Verify coverage is appropriate
  
  AI Role:
    - Generate links based on ID references
    - Suggest links based on text similarity
    - Calculate coverage metrics
    - Identify orphan requirements (system reqs without stakeholder source)
    - Identify uncovered stakeholder requirements
  
  Escalation Triggers:
    - Stakeholder requirements with no system requirement coverage
    - System requirements with no stakeholder source
    - Coverage gaps in critical areas
  
  Completion Criteria:
    - All stakeholder requirements traced to system requirements
    - Coverage metrics calculated
    - Orphans identified and addressed
  
  Validation:
    - Bi-directional traceability complete
    - Human has reviewed and approved links
    - Coverage adequate (organisation-defined threshold)
```

---

### Step 3.3.5: Validate System Requirements

```
Step 3.3.5:
  Name: Validate System Requirements
  Capability: Validate
  
  Input:
    Documents:
      - SPC-002 (System Requirements Specification) [draft]
      - SPC-004 (Traceability Matrix) [from 3.3.4]
      - SPC-001 (Stakeholder Requirements) [for reference]
    Other:
      - Technical reviewers
      - Stakeholder representatives
  
  Output:
    Documents:
      - SPC-002 (System Requirements Specification) [validated]
    Other:
      - Review record
      - Corrections applied
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Conduct technical review
    - Verify testability of each requirement
    - Confirm formalisation preserves intent
    - Identify implementation concerns
    - Approve or request corrections
  
  AI Role:
    - Check internal consistency
    - Identify potential conflicts
    - Verify structural completeness
    - Track review comments and resolutions
  
  Escalation Triggers:
    - Technical concerns about feasibility
    - Formalisation does not match stakeholder intent
    - Testability issues
  
  Completion Criteria:
    - Technical review complete
    - Stakeholder representatives confirm intent preserved
    - All review comments addressed
  
  Validation:
    - Review record complete
    - No unresolved blocking issues
    - Stakeholder approval recorded
```

---

### Step 3.3.6: Preserve System Requirements

```
Step 3.3.6:
  Name: Preserve System Requirements
  Capability: Preserve
  
  Input:
    Documents:
      - SPC-002 (System Requirements Specification) [validated from 3.3.5]
      - SPC-004 (Traceability Matrix) [from 3.3.4]
    Other:
      - Review records
  
  Output:
    Documents:
      - SPC-002 (System Requirements Specification) [status: CURRENT]
      - SPC-004 (Traceability Matrix) [status: CURRENT]
    Other:
      - Baseline for design phase
  
  Actor Pattern: Partnership
  
  Human Role:
    - Final approval
    - Authorise baseline
  
  AI Role:
    - Format documents
    - Verify completeness
    - Establish baseline
    - Archive working materials
  
  Escalation Triggers:
    - Validation incomplete
    - Required approvals missing
  
  Completion Criteria:
    - Documents baselined
    - Status set to CURRENT
    - Version incremented
    - Ready for Phase 4 consumption
  
  Validation:
    - All requirements pass completeness check
    - Traceability complete
    - Approvals recorded
```

---

## PROC-3.4: Requirements Prioritisation

**Purpose**: Establish relative priority of requirements for implementation sequencing.

**Process Information Composition**: 40% Formal, 55% Tacit, 5% Emergent

**Process Inputs**: SPC-002, STR-001, STR-004

**Process Outputs**: SPC-005

---

### Step 3.4.1: Gather Prioritisation Inputs

```
Step 3.4.1:
  Name: Gather Prioritisation Inputs
  Capability: Elicit
  
  Input:
    Documents:
      - SPC-002 (System Requirements Specification) [required: CURRENT]
      - STR-001 (Business Case) [required: value drivers, success criteria]
      - STR-004 (Risk Register) [required: requirement-related risks]
    Other:
      - Stakeholder priority preferences
      - Technical dependencies
  
  Output:
    Documents:
      - WRK-003 (Analysis Notes) [prioritisation inputs]
    Other:
      - Value assessments per requirement
      - Risk associations
      - Dependency map
  
  Actor Pattern: Partnership
  
  Human Role:
    - Gather stakeholder priority input
    - Assess business value per requirement
    - Identify technical dependencies
    - Judge relative importance
  
  AI Role:
    - Extract value drivers from business case
    - Link requirements to risks
    - Analyse technical dependencies from requirement text
    - Identify clusters that should be prioritised together
  
  Escalation Triggers:
    - Stakeholders provide conflicting priorities
    - Technical dependencies force sequencing that conflicts with business priority
    - Requirements lack clear value connection
  
  Completion Criteria:
    - Value assessment for each requirement
    - Dependencies mapped
    - Stakeholder input gathered
  
  Validation:
    - All requirements have at least preliminary value assessment
    - Dependencies documented
```

---

### Step 3.4.2: Analyse Dependencies and Constraints

```
Step 3.4.2:
  Name: Analyse Dependencies and Constraints
  Capability: Analyse
  
  Input:
    Documents:
      - SPC-002 (System Requirements Specification) [required]
      - WRK-003 (Analysis Notes) [from 3.4.1]
    Other:
      - Technical architecture constraints (if available)
  
  Output:
    Documents:
      - WRK-003 (Analysis Notes) [updated: dependency analysis]
    Other:
      - Dependency graph
      - Sequencing constraints
      - Feasible ordering options
  
  Actor Pattern: AI-Led
  
  Human Role:
    - Validate dependency interpretations
    - Add dependencies AI missed
    - Confirm sequencing constraints
  
  AI Role:
    - Build dependency graph
    - Identify cycles (problematic)
    - Calculate critical path
    - Identify requirements that enable many others
    - Suggest sequencing options
  
  Escalation Triggers:
    - Circular dependencies detected
    - Dependencies conflict with desired priorities
    - Critical path forces undesired sequence
  
  Completion Criteria:
    - Dependency graph complete
    - Cycles identified and flagged
    - Sequencing constraints documented
  
  Validation:
    - Human review of dependency graph
    - No unresolved cycles (or explicit handling plan)
```

---

### Step 3.4.3: Decide Priorities

```
Step 3.4.3:
  Name: Decide Priorities
  Capability: Decide
  
  Input:
    Documents:
      - SPC-002 (System Requirements Specification) [required]
      - WRK-003 (Analysis Notes) [required: value and dependency analysis]
      - STR-001 (Business Case) [required: strategic guidance]
    Other:
      - Stakeholder input
  
  Output:
    Documents:
      - SPC-005 (Prioritised Requirements Backlog) [draft]
    Other:
      - Priority assignments with rationale
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Make priority decisions
    - Balance value, risk, and dependencies
    - Negotiate with stakeholders
    - Document rationale for priorities
    - Handle conflicts and trade-offs
  
  AI Role:
    - Present analysis summary
    - Model scenarios (what if X is prioritised higher?)
    - Track decisions and rationale
    - Update backlog based on decisions
  
  Escalation Triggers:
    - Stakeholder priority conflicts unresolved
    - Technical constraints make desired sequence infeasible
    - Priority decisions require governance approval
  
  Completion Criteria:
    - All requirements have priority assigned
    - Rationale documented for significant decisions
    - Stakeholder alignment achieved (or escalated)
  
  Validation:
    - Each requirement has priority
    - Rationale present for non-obvious assignments
    - Sequence respects dependencies
```

---

### Step 3.4.4: Validate Prioritisation

```
Step 3.4.4:
  Name: Validate Prioritisation
  Capability: Validate
  
  Input:
    Documents:
      - SPC-005 (Prioritised Requirements Backlog) [draft from 3.4.3]
      - SPC-002 (System Requirements Specification) [for reference]
    Other:
      - Stakeholder availability
  
  Output:
    Documents:
      - SPC-005 (Prioritised Requirements Backlog) [validated]
    Other:
      - Stakeholder agreement record
  
  Actor Pattern: Human-Led
  
  Human Role:
    - Present prioritisation to stakeholders
    - Gather feedback and concerns
    - Negotiate adjustments
    - Document agreement or dissent
  
  AI Role:
    - Generate prioritisation summary for presentation
    - Track feedback
    - Model impact of requested changes
  
  Escalation Triggers:
    - Key stakeholder disagrees with priorities
    - Requested changes affect other stakeholders
  
  Completion Criteria:
    - Stakeholders have reviewed prioritisation
    - Agreement reached (or disagreement escalated)
    - Feedback incorporated
  
  Validation:
    - Agreement record complete
    - Dissenting views documented
```

---

### Step 3.4.5: Preserve Prioritised Backlog

```
Step 3.4.5:
  Name: Preserve Prioritised Backlog
  Capability: Preserve
  
  Input:
    Documents:
      - SPC-005 (Prioritised Requirements Backlog) [validated from 3.4.4]
    Other:
      - Agreement records
  
  Output:
    Documents:
      - SPC-005 (Prioritised Requirements Backlog) [status: CURRENT]
    Other:
      - Baseline for implementation planning
  
  Actor Pattern: Partnership
  
  Human Role:
    - Final approval
    - Authorise baseline
  
  AI Role:
    - Format and finalise document
    - Verify completeness
    - Archive working materials
  
  Escalation Triggers:
    - Approval missing
    - Unresolved conflicts
  
  Completion Criteria:
    - Document baselined
    - Status set to CURRENT
    - Version incremented
  
  Validation:
    - All requirements included
    - Priorities assigned with rationale
    - Stakeholder agreement documented
```

---

## Process Summary

### Capability Distribution Across Phase 3

| Capability | PROC-3.1 | PROC-3.2 | PROC-3.3 | PROC-3.4 | Total |
|------------|----------|----------|----------|----------|-------|
| Elicit | 3 | 3 | 0 | 1 | 7 |
| Analyse | 1 | 2 | 1 | 1 | 5 |
| Synthesise | 1 | 1 | 0 | 0 | 2 |
| Transform | 0 | 0 | 1 | 0 | 1 |
| Validate | 1 | 0 | 1 | 1 | 3 |
| Decide | 0 | 0 | 1 | 1 | 2 |
| Generate | 0 | 0 | 1 | 0 | 1 |
| Preserve | 1 | 1 | 1 | 1 | 4 |
| **Total Steps** | **7** | **7** | **6** | **5** | **25** |

### Actor Pattern Distribution

| Pattern | Steps | Percentage |
|---------|-------|------------|
| Human-Only | 0 | 0% |
| Human-Led | 10 | 40% |
| Partnership | 9 | 36% |
| AI-Led | 6 | 24% |
| AI-Only | 0 | 0% |

### Document Flow Summary

```
PROC-3.1                     PROC-3.2                    PROC-3.3                    PROC-3.4
────────                     ────────                    ────────                    ────────
STR-001,002,003,004 ──┐                                      │                           │
                      │                                      │                           │
                      ▼                                      │                           │
              WRK-001,002 ────────────────────────────────────────────────────────────────────┐
                      │                                      │                           │   │
                      ▼                                      │                           │   │
                  SPC-001 ──────────────────────────────────▶│                           │   │
                      │                                      │                           │   │
                      │      Legacy System ──┐               │                           │   │
                      │                      │               │                           │   │
                      │                      ▼               │                           │   │
                      │                  WRK-004             │                           │   │
                      │                      │               │                           │   │
                      │                      ▼               │                           │   │
                      │                  SPC-003 ───────────▶│                           │   │
                      │                      │               │                           │   │
                      │                      ▼               │                           │   │
                      │                  REF-001 ───────────▶│                           │   │
                      │                                      │                           │   │
                      │                                      ▼                           │   │
                      │                                  SPC-002 ──────────────────────▶│   │
                      │                                      │                           │   │
                      │                                      ▼                           │   │
                      │                                  SPC-004                         │   │
                      │                                                                  │   │
                      │                                                                  ▼   │
                      │                                                              SPC-005 │
                      │                                                                      │
                  REF-002 ◄──────────────────────────────────────────────────────────────────┘
                  (incremental updates throughout)
```

---

## Integration with Framework Concepts

This example applies:
- **Process and Capability Flow Specification Framework (Concept 16)**: Specification schema, escalation categories, actor pattern guidance
- **Document Type Classification Framework (Concept 15)**: Via Example 3.1 document type references

And integrates with:
- **Capability Model (Concept 3)**: Each step uses exactly one primary capability from the eight-capability taxonomy
- **Collaboration Patterns (Concept 7)**: Actor patterns follow the five-pattern model with escalation triggers defined
- **Information Taxonomy (Concept 1)**: Tacit knowledge requirements identified; capture windows enforced through validation
- **Phase Composition (Concept 6)**: Actor pattern distribution reflects Phase 3's information composition

---

## Validation Status

- ✓ **Framework application**: Correctly applies Concept 16 schema
- ✓ **Capability coverage**: All eight capabilities used appropriately
- ✓ **Document references**: All use registry IDs from Example 3.1
- ✓ **Actor patterns**: Aligned with phase information composition
- ✓ **Escalation triggers**: Defined for all applicable steps
- ⚠ **Completion criteria**: Initial specification; requires refinement through practice
- ⚠ **Validation rules**: May need expansion based on organisational context
- ⚠ **Process sequencing**: Assumes typical flow; parallel execution possible in practice

---

*This example demonstrates how to apply the Process and Capability Flow Specification Framework (Concept 16) to a specific SDLC phase, creating detailed capability instance specifications that enable systematic human-AI collaboration.*
