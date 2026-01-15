# Example 1.1: Document Type Registry (Phase 1 — Initiation/Conception)

## Overview

This document applies the **Document Type Classification Framework (Concept 15)** to Phase 1 (Initiation/Conception), defining the specific document types consumed and produced by Phase 1 processes.

This example demonstrates how to create a document type registry for an SDLC phase characterised by **very high tacit knowledge content** (75% tacit, 20% emergent, 5% formal per Concept 6). Phase 1 is the most tacit-heavy phase in the lifecycle, which creates distinctive challenges for document type specification.

**Key insight**: In tacit-heavy phases, document types often capture *traces* of tacit knowledge rather than the knowledge itself. The validation criteria emphasise capturing context, rationale, and the reasoning behind conclusions—not just conclusions.

---

## Phase 1 Characteristics

### Information Composition

| Type | Percentage | Implication for Documentation |
|------|------------|------------------------------|
| **Tacit** | 75% | Most knowledge exists in stakeholder minds; documents are prompts for retrieval |
| **Emergent** | 20% | Problem framing evolves through exploration; documents track evolution |
| **Formal** | 5% | Very little is formally specifiable; what exists is primarily constraints |

### Dominant Capabilities

Phase 1 work involves primarily:
- **Elicit**: Drawing out stakeholder understanding, constraints, and context
- **Synthesise**: Combining diverse inputs into coherent problem framing
- **Decide**: Selecting opportunity framing, scope boundaries, and go/no-go

Notably absent: Transform, Generate, Preserve in their formal senses. This is discovery work.

### Collaboration Patterns

- **Human-Only**: Strategic decisions, stakeholder politics, opportunity framing
- **Human-Led**: Market research synthesis, financial modelling, document drafting

AI cannot lead Phase 1 work because the tacit knowledge required (strategic context, stakeholder dynamics, organisational politics) is not accessible to AI and cannot be fully documented.

### Scaling: Minimal vs. Full Phase 1

Phase 1 scales dramatically based on project context. Not all processes or document types are required in all situations.

**Full Phase 1** (enterprise projects, significant investment, multiple stakeholders):
- All document types produced
- Formal governance gates
- Explicit stakeholder analysis and alignment
- Comprehensive business case with alternatives analysis

**Minimal Phase 1** (small projects, single stakeholder, low risk):
- Opportunity Statement (STR-004) may be implicit or verbal
- Stakeholder Analysis (STR-003) may be "obvious" (single requester)
- Business Case (STR-001) may be a paragraph, not a document
- Project Charter (STR-002) may be implicit authority

**The Straw Man Pattern**: In early-stage or exploratory work, Phase 1 documents often begin as placeholders:

| Document | Straw Man Version | Evolution |
|----------|-------------------|-----------|
| STR-003 Stakeholder Analysis | "Stakeholders TBD—starting with requester" | Expanded as scope clarifies |
| STR-004 Opportunity Statement | Initial problem framing (likely incomplete) | Reframed as understanding deepens |
| STR-001 Business Case | Rough cost/benefit estimate | Refined with actual data |
| STR-005 Feasibility | "Assumed feasible—will validate" | Updated with technical assessment |

**Critical insight**: Straw man documents are valid—they make assumptions explicit and trackable. The document types below describe *what to capture*, not *how much ceremony is required*. A one-paragraph business case is still a business case.

**Process informality**: The PROC-1.x references in this document indicate *which work creates/consumes each document type*. In minimal Phase 1, these "processes" may be:
- A single conversation (PROC-1.1 + PROC-1.2 + PROC-1.3 in 30 minutes)
- Implicit ("everyone knows why we're doing this")
- Performed by one person (no handoffs, no formal gates)

The process references help trace document lineage, not mandate ceremony.

**What's genuinely required vs. context-dependent**:

| Document | Required? | Notes |
|----------|-----------|-------|
| STR-004 Opportunity Statement | Always (may be implicit) | Something triggered this work; capture it |
| STR-003 Stakeholder Analysis | Always (may be trivial) | At minimum: who requested, who approves |
| STR-001 Business Case | Context-dependent | Formal in enterprises; may be verbal in startups |
| STR-002 Project Charter | Context-dependent | Required when authority must be explicit |
| STR-005 Feasibility | Context-dependent | Required when technical risk is non-trivial |

---

## Document Types Consumed by Phase 1

Phase 1 consumes inputs from outside the project—organisational context, market intelligence, and strategic direction.

### EXT-001: Strategic Plan

| Attribute | Value |
|-----------|-------|
| **ID** | EXT-001 |
| **Name** | Strategic Plan |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Organisational |
| **Created by** | Organisational strategy process (outside project) |
| **Consumed by** | PROC-1.1 (Opportunity Identification), PROC-1.4 (Business Case) |
| **Update pattern** | Annual refresh; major revisions at strategic pivots |
| **Retention** | Permanent (organisational archive) |

**Consumption Characteristics:**
- Tacit knowledge required: How to interpret strategic priorities for specific opportunities; political dynamics behind stated priorities; actual vs. aspirational goals
- Typical formalisation gaps: Why certain priorities exist; trade-offs between stated goals; confidence levels in projections
- AI role: Extract stated priorities and success criteria; surface relevant strategic context for opportunity assessment

**Note**: This is an *external* document type—not created by this project but consumed as context. The EXT prefix indicates organisational inputs.

---

### EXT-002: Market Intelligence

| Attribute | Value |
|-----------|-------|
| **ID** | EXT-002 |
| **Name** | Market Intelligence |
| **Content Domain** | Reference |
| **Temporal Class** | Dynamic |
| **Typical Scope** | Organisational |
| **Created by** | Market research function (outside project) |
| **Consumed by** | PROC-1.1, PROC-1.3 (Problem Framing), PROC-1.4 |
| **Update pattern** | Continuous; project consumes point-in-time snapshots |
| **Retention** | Per organisational policy |

**Consumption Characteristics:**
- Tacit knowledge required: How to interpret market data; what signals matter vs. noise; competitor intent vs. stated position
- Typical formalisation gaps: Confidence in forecasts; assumptions behind projections; alternative interpretations
- AI role: Synthesise market trends; identify patterns; structure competitive analysis

---

### EXT-003: Regulatory Constraints

| Attribute | Value |
|-----------|-------|
| **ID** | EXT-003 |
| **Name** | Regulatory Constraints |
| **Content Domain** | Reference |
| **Temporal Class** | Standing |
| **Typical Scope** | Organisational |
| **Created by** | Legal/compliance function (outside project) |
| **Consumed by** | PROC-1.1, PROC-1.3, PROC-1.4 |
| **Update pattern** | Updated as regulations change |
| **Retention** | Permanent (compliance archive) |

**Consumption Characteristics:**
- Tacit knowledge required: How regulations apply to specific opportunities; regulatory interpretation history; relationship with regulators
- Typical formalisation gaps: Grey areas in regulation; enforcement priorities; pending changes
- AI role: Identify applicable regulations; flag compliance considerations; track regulatory changes

---

## Document Types Produced by Phase 1

### STR-001: Business Case

| Attribute | Value |
|-----------|-------|
| **ID** | STR-001 |
| **Name** | Business Case |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.4 (Business Case Development) |
| **Consumed by** | PROC-2.1, PROC-2.2, PROC-3.1, PROC-3.4, Governance |
| **Update pattern** | Major revisions at stage gates; minor updates as assumptions change |
| **Retention** | Project lifetime plus audit period |

**Creation Requirements:**
- Required inputs: Opportunity statement (STR-004), stakeholder analysis (STR-003), market research (WRK-001), financial projections
- Tacit knowledge required: Strategic context, stakeholder landscape, value assessment methods, organisational investment thresholds
- Validation criteria:
  - **Critical**: Problem statement that articulates *why* this opportunity matters (not just what it is)
  - **Critical**: Alternatives considered with rationale for rejection (HST content)
  - Benefits quantified with confidence indicators
  - Costs estimated with assumptions explicit
  - Risks identified with mitigation approaches
  - Strategic fit articulated (link to EXT-001)
  - Success criteria defined and measurable
- AI role: Market research synthesis, financial modelling, document structuring, consistency checking

**Consumption Characteristics:**
- Tacit knowledge required: Organisational strategy, political dynamics, investment decision patterns
- Typical formalisation gaps: Stakeholder negotiation history; confidence levels in estimates; unstated constraints
- AI role: Extract key constraints and success criteria; surface for requirements validation

**Standards Alignment:** ISO 15289 Business or Mission Analysis Report

**Typical Relationships:**
- DERIVES_FROM: STR-003 (Stakeholder Analysis), STR-004 (Opportunity Statement), WRK-001 (Market Research Notes)
- REFERENCES: EXT-001 (Strategic Plan), EXT-003 (Regulatory Constraints)
- TRACES_TO: STR-002 (Project Charter)

---

### STR-002: Project Charter

| Attribute | Value |
|-----------|-------|
| **ID** | STR-002 |
| **Name** | Project Charter |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.5 (Project Chartering) |
| **Consumed by** | PROC-2.1, PROC-2.5, PROC-3.1, All project governance |
| **Update pattern** | Rarely updated; amendments require governance approval |
| **Retention** | Project lifetime plus audit period |

**Creation Requirements:**
- Required inputs: Approved business case (STR-001), stakeholder alignment evidence
- Tacit knowledge required: Organisational governance norms, authority structures, political landscape
- Validation criteria:
  - **Critical**: Objectives stated with clear success criteria
  - **Critical**: Scope boundaries defined (what's in, what's explicitly out)
  - **Critical**: Authority granted with specific decision rights
  - Governance structure defined
  - Stakeholders enumerated with roles
  - High-level timeline (not detailed schedule)
  - Budget envelope (not detailed budget)
- AI role: Template population, consistency checking against business case

**Consumption Characteristics:**
- Tacit knowledge required: Organisational hierarchy, decision-making norms, escalation patterns
- Typical formalisation gaps: Informal authority; escalation preferences; political constraints
- AI role: Extract scope boundaries for requirements validation

**Standards Alignment:** ISO 15289 Project Charter

**Typical Relationships:**
- DERIVES_FROM: STR-001 (Business Case)
- REFERENCES: EXT-001 (Strategic Plan)
- TRACES_TO: STR-005 (Scope Statement in Phase 2)

---

### STR-003: Stakeholder Analysis

| Attribute | Value |
|-----------|-------|
| **ID** | STR-003 |
| **Name** | Stakeholder Analysis |
| **Content Domain** | Strategy |
| **Temporal Class** | Dynamic |
| **Typical Scope** | Project |
| **Created by** | PROC-1.2 (Stakeholder Identification and Analysis) |
| **Consumed by** | PROC-1.3, PROC-1.4, PROC-1.5, PROC-3.1 |
| **Update pattern** | Updated as stakeholder landscape changes; reviewed at phase boundaries |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Organisational knowledge, initial opportunity framing
- Tacit knowledge required: Organisational politics, informal influence structures, historical relationships
- Validation criteria:
  - All stakeholder groups identified (not just obvious ones)
  - For each stakeholder:
    - Interest/stake clearly articulated
    - Influence level assessed
    - **Critical**: Attitude/position with *rationale* (not just "supportive" but "supportive because...")
    - Engagement approach defined
  - **Critical**: Potential conflicts and alliances identified
  - **Critical**: Political dynamics documented (sensitive—may be access-restricted)
- AI role: Structure templates; identify stakeholder categories; track engagement

**Consumption Characteristics:**
- Tacit knowledge required: How to interpret stated vs. actual positions; political dynamics; history
- Typical formalisation gaps: True motivations; hidden agendas; relationship history
- AI role: Surface stakeholder concerns during requirements; identify potential conflicts

**Standards Alignment:** Part of ISO 15289 Stakeholder Needs Definition Report

**Typical Relationships:**
- CONTRIBUTES_TO: STR-001 (Business Case), STR-002 (Project Charter)
- REFERENCES: EXT-001 (Strategic Plan)

---

### STR-004: Opportunity Statement

| Attribute | Value |
|-----------|-------|
| **ID** | STR-004 |
| **Name** | Opportunity Statement |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.1 (Opportunity Identification), PROC-1.3 (Problem Framing) |
| **Consumed by** | PROC-1.2, PROC-1.4, PROC-2.1 |
| **Update pattern** | Stable once problem framing complete; rarely updated thereafter |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Initial opportunity recognition, market intelligence, stakeholder input
- Tacit knowledge required: Domain expertise, strategic context, problem framing methods
- Validation criteria:
  - **Critical**: Problem statement distinguishes *problem* from *solution* (no embedded solutions)
  - **Critical**: Problem framing evolution documented (how understanding changed)
  - **Critical**: Why this framing vs. alternatives (rationale for problem boundary)
  - Context established (why now? what changed?)
  - Opportunity scope bounded
  - Success vision articulated
- AI role: Structure problem statements; identify embedded assumptions; surface alternative framings

**Consumption Characteristics:**
- Tacit knowledge required: Why this framing was chosen; alternatives considered
- Typical formalisation gaps: The "aha moment" that led to this framing; intuitions not yet articulated
- AI role: Ensure solution requirements trace back to problem statement

**Note on Problem Framing**: The Opportunity Statement captures the *outcome* of problem framing, but the *process* of problem framing often involves multiple reframings. The WRK-003 (Problem Framing Notes) captures this evolution; key insights should be summarised in STR-004.

**Standards Alignment:** Part of ISO 15289 Business or Mission Analysis Report

**Typical Relationships:**
- DERIVES_FROM: WRK-001 (Market Research Notes), WRK-003 (Problem Framing Notes)
- TRACES_TO: STR-001 (Business Case), PROC-3.1 outputs

---

### STR-005: Feasibility Assessment

| Attribute | Value |
|-----------|-------|
| **ID** | STR-005 |
| **Name** | Feasibility Assessment |
| **Content Domain** | Strategy |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.3 (Problem Framing), PROC-1.4 (Business Case Development) |
| **Consumed by** | PROC-1.4, Governance (go/no-go decision) |
| **Update pattern** | Single creation; may be revised if scope changes significantly |
| **Retention** | Project lifetime plus audit period |

**Creation Requirements:**
- Required inputs: Opportunity statement, stakeholder analysis, technical assessment, resource assessment
- Tacit knowledge required: Technical feasibility judgement, organisational capability assessment, risk tolerance
- Validation criteria:
  - Technical feasibility assessed with confidence level
  - Organisational capability assessed (can we do this?)
  - Resource availability assessed (people, budget, time)
  - **Critical**: Risks identified with severity and mitigation feasibility
  - **Critical**: Constraints enumerated (hard constraints vs. preferences)
  - Go/no-go recommendation with rationale
- AI role: Structure assessment; synthesise technical inputs; risk categorisation

**Consumption Characteristics:**
- Tacit knowledge required: How to weight different feasibility factors; organisational risk appetite
- Typical formalisation gaps: Confidence in technical assessments; hidden assumptions; optimism bias
- AI role: Surface feasibility constraints during planning and requirements

**Standards Alignment:** Part of ISO 15289 Feasibility Analysis Report

**Typical Relationships:**
- DERIVES_FROM: STR-003 (Stakeholder Analysis), STR-004 (Opportunity Statement), WRK-004 (Technical Assessment Notes)
- REFERENCES: EXT-003 (Regulatory Constraints)
- CONTRIBUTES_TO: STR-001 (Business Case)

---

## Working Document Types (Ephemeral)

Phase 1's high tacit content means ephemeral documents are critically important. They capture exploration and discovery that cannot be repeated. **Capture window requirements are paramount.**

### WRK-001: Market Research Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-001 |
| **Name** | Market Research Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-1.1 (during opportunity exploration) |
| **Consumed by** | PROC-1.1, PROC-1.3, PROC-1.4 |
| **Update pattern** | Single creation per research activity; not updated |
| **Retention** | Project discretion; recommend retain for audit trail |

**Creation Requirements:**
- Required inputs: Research occurrence, data sources accessed
- Tacit knowledge required: How to interpret market data; what signals matter; source credibility assessment
- Validation criteria:
  - Sources documented
  - Date of research recorded
  - Key findings captured
  - **Critical**: Interpretations distinguished from data (what the data says vs. what it means)
  - **Critical**: Confidence levels noted (strong signal vs. weak signal vs. speculation)
  - **Critical**: Alternative interpretations flagged if considered
  - Questions raised for follow-up
- AI role: Data gathering; pattern identification; structure findings

**Consumption Characteristics:**
- Tacit knowledge required: How to weight different sources; domain context for interpretation
- Typical formalisation gaps: Why certain sources were prioritised; intuitions about data quality
- AI role: Extract market insights for business case; identify trends

**Process Validation Note:**
> PROC-1.1 synthesis steps must validate that interpretation rationale is present. If conclusions are recorded without reasoning chain, escalate to researcher to add before proceeding.

**Typical Relationships:**
- CONTRIBUTES_TO: STR-001 (Business Case), STR-004 (Opportunity Statement)

---

### WRK-002: Stakeholder Interview Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-002 |
| **Name** | Stakeholder Interview Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-1.2 (during stakeholder engagement) |
| **Consumed by** | PROC-1.2 (synthesis), PROC-1.3, PROC-1.4 |
| **Update pattern** | Single creation per interview; not updated |
| **Retention** | Project discretion; recommend retain for audit trail |

**Creation Requirements:**
- Required inputs: Interview occurrence, stakeholder availability
- Tacit knowledge required: Active listening, probe questioning, political sensitivity, note-taking skill
- Validation criteria:
  - Stakeholder identified
  - Date/time recorded
  - Role and perspective noted
  - Key points captured
  - **Critical**: Stakeholder's *stated rationale* for positions (not just positions)
  - **Critical**: Tone, confidence, and emotional content noted (enthusiasm vs. reluctance)
  - **Critical**: What's *not* said—topics avoided, questions deflected
  - Action items and open questions flagged
  - Insights and hypotheses captured at time of interview
- AI role: Transcription assistance; structure suggestion; action item extraction

**Consumption Characteristics:**
- Tacit knowledge required: Interview context; non-verbal cues; relationship dynamics; political subtext
- Typical formalisation gaps: True vs. stated positions; confidence levels; interpersonal dynamics
- AI role: Extract stakeholder concerns; identify themes across interviews; flag conflicts

**Process Validation Note:**
> PROC-1.2 synthesis steps must validate that rationale for stakeholder positions is captured. If positions are recorded without reasoning, the capture window has closed—escalate to interviewer immediately.

**Typical Relationships:**
- CONTRIBUTES_TO: STR-003 (Stakeholder Analysis), STR-001 (Business Case)

---

### WRK-003: Problem Framing Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-003 |
| **Name** | Problem Framing Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-1.3 (during problem exploration) |
| **Consumed by** | PROC-1.3 (synthesis), PROC-1.4 |
| **Update pattern** | Accumulated during framing process |
| **Retention** | Project lifetime (valuable for understanding problem evolution) |

**Creation Requirements:**
- Required inputs: Opportunity recognition, stakeholder input, domain exploration
- Tacit knowledge required: Problem framing methods, domain expertise, lateral thinking
- Validation criteria:
  - **Critical**: Evolution of problem understanding documented (how framing changed)
  - **Critical**: Alternative framings considered with reasons for rejection
  - **Critical**: "Aha moments" captured at time of occurrence (capture window!)
  - Assumptions surfaced and questioned
  - Root cause vs. symptom analysis
  - Connections to other problems/opportunities noted
- AI role: Surface assumptions; suggest alternative framings; structure exploration

**Consumption Characteristics:**
- Tacit knowledge required: Why certain framings were rejected; intuitions guiding exploration
- Typical formalisation gaps: The reasoning leaps that led to insights; dead ends explored
- AI role: Ensure final framing can be traced to exploration; surface rejected framings if relevant

**Process Validation Note:**
> Problem framing insights are highly perishable. If an insight occurs and isn't captured immediately, it may be lost. Process should include real-time capture mechanisms.

**Typical Relationships:**
- CONTRIBUTES_TO: STR-004 (Opportunity Statement), HST-001 (Discarded Alternative)

---

### WRK-004: Technical Assessment Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-004 |
| **Name** | Technical Assessment Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-1.3 (during feasibility exploration) |
| **Consumed by** | PROC-1.3, PROC-1.4 |
| **Update pattern** | Single creation per assessment activity |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Technical expertise, technology landscape knowledge, system access (if evaluating existing systems)
- Tacit knowledge required: Technical judgement, experience with similar systems, understanding of organisational technical capability
- Validation criteria:
  - Technology options assessed
  - **Critical**: Confidence level in assessments (high confidence vs. educated guess vs. unknown)
  - **Critical**: Assumptions underlying feasibility judgements
  - **Critical**: Risks and uncertainties explicitly flagged
  - Constraints identified (hard limits vs. preferences)
  - Skill gaps noted
- AI role: Technology research; pattern matching to similar systems; risk identification

**Consumption Characteristics:**
- Tacit knowledge required: How to weight technical risks; organisational technical capability
- Typical formalisation gaps: Intuitions about technical risk; experience-based judgements
- AI role: Surface technical constraints during planning; identify technology risks

**Typical Relationships:**
- CONTRIBUTES_TO: STR-005 (Feasibility Assessment), STR-001 (Business Case)

---

### WRK-005: Alignment Session Notes

| Attribute | Value |
|-----------|-------|
| **ID** | WRK-005 |
| **Name** | Alignment Session Notes |
| **Content Domain** | Reference |
| **Temporal Class** | Ephemeral |
| **Typical Scope** | Task |
| **Created by** | PROC-1.2 (during group sessions) |
| **Consumed by** | PROC-1.2, PROC-1.4, PROC-1.5 |
| **Update pattern** | Single creation per session |
| **Retention** | Project discretion |

**Creation Requirements:**
- Required inputs: Session occurrence, stakeholder participation
- Tacit knowledge required: Facilitation skills, group dynamics reading, synthesis during session
- Validation criteria:
  - Participants listed
  - Session objectives stated
  - Agreements reached (with specificity)
  - **Critical**: Disagreements and how they were resolved (or not)
  - **Critical**: Rationale for group decisions captured at session end
  - **Critical**: Minority views that were overruled (negative knowledge)
  - Action items with owners
  - Open issues for follow-up
- AI role: Real-time capture assistance; output structuring; action item tracking

**Consumption Characteristics:**
- Tacit knowledge required: Group dynamics; true vs. surface agreement; post-session evolution
- Typical formalisation gaps: Political dynamics in session; conditional agreements; unstated reservations
- AI role: Surface alignment status; flag unresolved issues

**Process Validation Note:**
> Alignment sessions often produce surface agreement that masks underlying disagreement. Validation must specifically probe for minority views and conditional agreement.

**Typical Relationships:**
- CONTRIBUTES_TO: STR-002 (Project Charter), STR-003 (Stakeholder Analysis)

---

## Historical Document Types

### HST-001: Discarded Opportunity Framing

| Attribute | Value |
|-----------|-------|
| **ID** | HST-001 |
| **Name** | Discarded Opportunity Framing |
| **Content Domain** | Historical |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.1, PROC-1.3 (when framings are rejected) |
| **Consumed by** | Future scope decisions; similar opportunities |
| **Update pattern** | Created once; not updated |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Framing that was considered, exploration context
- Tacit knowledge required: Why the framing was rejected; what would make it viable
- Validation criteria:
  - Alternative framing clearly described
  - **Critical**: Rejection rationale documented
  - **Critical**: Conditions under which framing might be reconsidered
  - Context of rejection (what was known at the time)
- AI role: Template population; cross-reference to related decisions

**Consumption Characteristics:**
- Tacit knowledge required: Original decision context; what has changed since
- Typical formalisation gaps: Strength of conviction; political factors in rejection
- AI role: Surface during scope changes ("this framing was previously rejected because...")

**Standards Alignment:** Supports ISO 15289 Decision Management

**Typical Relationships:**
- REFERENCES: STR-004 (Opportunity Statement—the framing that was chosen)
- Context for: Future scope decisions

---

### HST-002: Discarded Stakeholder

| Attribute | Value |
|-----------|-------|
| **ID** | HST-002 |
| **Name** | Discarded Stakeholder |
| **Content Domain** | Historical |
| **Temporal Class** | Standing |
| **Typical Scope** | Project |
| **Created by** | PROC-1.2 (when stakeholders are deemed out of scope) |
| **Consumed by** | Future stakeholder analysis; scope expansion decisions |
| **Update pattern** | Created once; not updated |
| **Retention** | Project lifetime |

**Creation Requirements:**
- Required inputs: Stakeholder that was considered, analysis context
- Tacit knowledge required: Why stakeholder was excluded from scope
- Validation criteria:
  - Stakeholder identified
  - **Critical**: Rationale for exclusion
  - **Critical**: Conditions under which stakeholder might become relevant
- AI role: Template population; tracking

**Consumption Characteristics:**
- Tacit knowledge required: Original scoping context; stakeholder landscape changes
- Typical formalisation gaps: Political reasons for exclusion; relationship dynamics
- AI role: Surface when scope changes ("this stakeholder was previously excluded because...")

**Typical Relationships:**
- REFERENCES: STR-003 (Stakeholder Analysis)
- Context for: Future scope decisions

---

## Document Relationship Patterns

### Phase 1 Information Flow

```
EXTERNAL INPUTS                     PHASE 1 WORKING                 PHASE 1 OUTPUTS
───────────────                     ───────────────                 ───────────────

EXT-001 Strategic Plan ─────────┐
                                │   WRK-001 Market Research ────┐
EXT-002 Market Intelligence ────┼──►                            │
                                │   WRK-002 Interview Notes ────┼──► STR-003 Stakeholder Analysis
EXT-003 Regulatory Constraints ─┤                               │          │
                                │   WRK-003 Problem Framing ────┼──► STR-004 Opportunity Statement
                                │          │                    │          │
                                │          │                    │          ▼
                                │          ▼                    ├──► STR-005 Feasibility
                                │   WRK-004 Technical Notes ────┤          │
                                │                               │          ▼
                                │   WRK-005 Alignment Notes ────┼──► STR-001 Business Case
                                │          │                    │          │
                                │          │                    │          ▼
                                │          ▼                    └──► STR-002 Project Charter
                                │   HST-001 Discarded Framing
                                │   HST-002 Discarded Stakeholder
```

### Relationship Type Usage

| Relationship | Phase 1 Usage |
|--------------|---------------|
| DERIVES_FROM | STR-001 DERIVES_FROM STR-003, STR-004, STR-005 (synthesised from analyses) |
| CONTRIBUTES_TO | WRK-001, WRK-002 CONTRIBUTES_TO STR documents (ephemeral→standing pattern) |
| REFERENCES | STR-001 REFERENCES EXT-001 (strategic alignment) |
| TRACES_TO | STR-002 TRACES_TO Phase 2 outputs (project charter grounds planning) |

---

## Validation Integration

### Process Validation Points

Phase 1's tacit-heavy nature requires aggressive capture window enforcement:

| Process Step | Document | Required Content | Escalation If Missing |
|--------------|----------|------------------|----------------------|
| 1.1.3 (Market synthesis) | WRK-001 | Interpretation rationale | Researcher must add context |
| 1.2.4 (Stakeholder synthesis) | WRK-002 | Position rationale | Cannot proceed; interview insight lost |
| 1.3.2 (Framing selection) | WRK-003 | Rejected framing rationale | Critical—create HST-001 |
| 1.4.2 (Business case drafting) | STR-004, STR-005 | Clear problem/opportunity | Cannot build business case on unclear foundation |
| 1.5.1 (Charter drafting) | STR-001 | Approved business case | Cannot charter unapproved opportunity |

### Completeness Criteria by Document Type

| Document Type | Minimum Viable Content | Full Content |
|---------------|----------------------|--------------|
| STR-001 Business Case | Problem statement, benefits, costs, go/no-go | + alternatives, risks, strategic fit, success criteria |
| STR-002 Charter | Objectives, scope, authority | + governance, stakeholders, timeline envelope |
| STR-003 Stakeholder | Stakeholders with interests and influence | + attitudes with rationale, engagement approach, conflicts |
| STR-004 Opportunity | Problem statement, scope | + framing evolution, alternatives considered, context |
| STR-005 Feasibility | Go/no-go with rationale | + technical, organisational, resource assessments |

---

## Tacit Knowledge Capture Strategies

Given Phase 1's 75% tacit composition, document types alone cannot preserve knowledge. Complementary strategies:

### 1. Aggressive Capture Windows

Ephemeral documents (WRK-*) must capture reasoning *at the time of insight*. Delayed documentation loses the tacit context. Process design should include:
- Real-time note-taking during interviews and sessions
- Same-day synthesis of exploration activities
- Immediate documentation of "aha moments" in problem framing

### 2. Rationale-First Validation

Validation criteria emphasise *why* over *what*:
- Positions without rationale are incomplete
- Decisions without alternatives considered are incomplete
- Conclusions without reasoning chains are incomplete

### 3. Historical Document Discipline

Rejected alternatives (HST-*) are as important as selected options:
- Every framing decision should create HST-001 for rejected framings
- Every stakeholder scoping decision should document excluded stakeholders
- "Negative knowledge" prevents future rediscovery of dead ends

### 4. Standing Document Scaffolding

Standing documents (STR-*) should be designed to prompt tacit knowledge retrieval:
- Business case section for "assumptions" triggers explicit statement
- Stakeholder analysis "concerns" section surfaces hidden issues
- Feasibility "risks" section surfaces intuitions about uncertainty

---

## Extension Guidance

This registry covers Phase 1. Distinctive considerations:

1. **External inputs**: Phase 1 uniquely consumes organisational context (EXT-*) not created by the project
2. **Capture window criticality**: 75% tacit content means delayed documentation loses most value
3. **Historical document importance**: Rejected framings are more valuable than in later phases because problem framing has highest leverage
4. **Standing document role**: STR-* documents attempt to crystallise tacit understanding for handoff to Phase 2

---

## Integration with Framework Concepts

This example applies:
- **Document Type Classification Framework (Concept 15)**: Classification schema, relationship types, instance lifecycle
- **Process and Capability Flow Specification Framework (Concept 16)**: Process references for creation/consumption

And integrates with:
- **Information Taxonomy (Concept 1)**: Phase 1's 75%/20%/5% composition drives capture window emphasis
- **Capability Model (Concept 3)**: Phase 1 is Elicit/Synthesise/Decide heavy; documents reflect this
- **Collaboration Patterns (Concept 7)**: Human-Only and Human-Led dominate; AI roles are supportive
- **Information Loss at Transitions (Concept 6)**: 35-45% loss at Phase 1→2 transition drives STR-* completeness requirements
- **Theory-Building (Foundation 1)**: Phase 1 creates theory that documentation can only partially capture

---

## Validation Status

- ✓ **Framework application**: Correctly applies Concept 15 schema
- ✓ **Document type identification**: Covers Phase 1 inputs/outputs comprehensively
- ✓ **Tacit knowledge handling**: Addresses 75% tacit composition through capture window emphasis
- ✓ **Relationship mapping**: Uses defined relationship types consistently
- ⚠ **Validation criteria**: Initial specification; requires refinement through practice
- ⚠ **AI role guidance**: Based on current (2024-2025) capabilities; will require updates
- ⚠ **Capture window effectiveness**: Conceptually sound; effectiveness requires empirical validation

---

*This example demonstrates how to apply the Document Type Classification Framework (Concept 15) to a tacit-heavy SDLC phase, creating a registry of document types that emphasises rationale capture, aggressive capture windows, and historical documentation to address the distinctive challenges of high tacit knowledge content.*
