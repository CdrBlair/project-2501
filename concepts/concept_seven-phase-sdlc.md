# Key Reference Concept 4: Seven-Phase SDLC Model

## Definition

The Seven-Phase Software Development Lifecycle model identifies seven fundamental types of work that occur in all software development regardless of methodology: understanding why development is undertaken (Initiation/Conception), planning how to execute (Planning), specifying what to build (Analysis/Requirements), designing structure (Design/Architecture), building the system (Implementation/Construction), confirming correctness (Testing/Validation), and delivering value (Deployment/Operations). This model consolidates the thirty processes in ISO/IEC/IEEE 12207:2017 into practical phases while preserving critical distinctions—particularly the separation of Initiation from Planning that captures strategic "why" information often lost in simpler models. The seven phases are methodology-independent: whether organisations use Waterfall (sequential execution), Agile (compressed sprints), DevOps (continuous flow), or hybrid approaches, these same seven types of work occur. The methodology determines when and how phases execute, not whether they exist.

## The Seven Phases

| Phase | Primary Focus | ISO/IEC/IEEE 12207:2017 Processes | Key Outputs |
|-------|--------------|-----------------------------------|-------------|
| **1. Initiation/Conception** | Why: Business case, opportunity framing, stakeholder alignment, strategic rationale | Business or Mission Analysis, Stakeholder Needs Definition | Business case, feasibility assessment, stakeholder identification, project charter |
| **2. Planning** | How: Project organisation, resource allocation, risk management, governance structure | Project Planning, Decision Management, Risk Management | Project plan, resource allocations, risk register, governance structure |
| **3. Analysis/Requirements** | What: Transform stakeholder needs into formal specifications | Stakeholder Requirements Definition, System Requirements Definition, Software Requirements Definition | Requirements specifications, use cases, acceptance criteria, traceability matrices |
| **4. Design/Architecture** | Structure: How system will be organised to satisfy requirements | Architecture Definition, Design Definition, System Analysis | Architecture documents, design specifications, interface definitions, ADRs |
| **5. Implementation/Construction** | Build: Create actual system components and integrate them | Implementation, Integration, Configuration Management | Source code, unit tests, build artifacts, API documentation |
| **6. Testing/Validation** | Correctness: Verify implementation and validate stakeholder needs met | Verification, Validation, Quality Assurance | Test plans, test results, defect logs, validated system |
| **7. Deployment/Operations** | Value delivery: Deploy, operate, maintain, evolve, retire | Transition, Operation, Maintenance, Disposal | Deployment documentation, operational runbooks, maintenance logs, incident reports |

## Why Seven Phases: The Critical Initiation Separation

The model's key differentiator from simpler five- or six-phase models is explicitly separating Initiation/Conception from Planning. Many models consolidate these, treating project initiation as part of project planning. However, this loses critical information about strategic "why" that research shows is essential for success.

**What Initiation captures that Planning doesn't**: The strategic rationale—why this problem is worth solving and this opportunity worth pursuing. Market understanding and competitive context. Stakeholder politics and organisational dynamics. Problem framing and opportunity definition—often involving redefining the problem from how initially presented. Alternatives considered and rejected, with rationale. The fundamental business case that justifies all subsequent investment.

**What gets lost when consolidated**: When Initiation merges into Planning, the strategic rationale becomes subordinate to execution details. Alternatives explored during opportunity analysis disappear from the record—we document what we're building but not what we decided not to build and why. Political context and stakeholder dynamics reduce to simple stakeholder registers missing the nuanced understanding necessary for ongoing engagement. The business case becomes a checkbox rather than a living justification guiding decisions.

**Empirical justification**: Multiple lines of evidence support early-phase importance for project outcomes. PMI's Pulse of the Profession found poor communication contributes to 56% of failed projects—and communication failures frequently originate in early phases where shared understanding must be established. Curtis et al.'s (1988) field study of 17 large projects identified "thin spread of application domain knowledge" as a critical problem. When teams don't truly understand why they're building something, they cannot elicit appropriate requirements. When stakeholders aren't genuinely aligned on purpose, requirements become political rather than technical. When the business case is weak, projects continue despite lack of value.

**Information composition rationale**: Initiation exhibits the highest tacit and emergent knowledge content of any phase. This makes it both the most critical for human leadership and the phase where information loss is greatest. Separating it from Planning maintains visibility and enables specific mitigation strategies.

## Methodology Independence

The seven phases describe types of work, not execution patterns. How phases execute varies dramatically across methodologies:

**Waterfall (Sequential)**: Phases execute in strict sequence with formal gates. Initiation completes before Planning begins. Requirements fully specified before Design starts. Comprehensive documentation at each gate. Limited iteration between phases.

**Agile (Iterative)**: All seven phases compress into 1-4 week sprints. Each sprint involves initiation (why this feature), planning (sprint planning), requirements (story refinement), design (technical design), implementation (coding), testing (continuous testing), and deployment (sprint deployment). Phases cycle rapidly rather than executing once.

**DevOps (Continuous)**: Phases blur into continuous flow. Deployment occurs continuously rather than as distinct phase. Testing integrates throughout implementation. Requirements emerge from production feedback. Phase boundaries become indistinct.

**Hybrid (Adaptive)**: Different phases follow different patterns. Early phases (Initiation, Planning, Requirements) execute sequentially to establish foundation. Later phases (Design, Implementation, Testing) proceed iteratively with continuous deployment.

Regardless of pattern, all seven work types occur. The most rapid Agile team still performs initiation work (understanding feature value), planning work (sprint planning), requirements work (refinement), design work (technical design), implementation work (coding), testing work (verification), and deployment work (release).

## Phase Dynamics: States, Events, and Information Flow

The seven phases are best understood not as discrete time periods but as **states** in an information flow system. **Events**—triggered by information discoveries, decisions, or validations—cause transitions between states. These transitions can move forward (progress) or backward (revisit).

### Complementary Views of Phase Execution

| View | What It Shows | When It's Useful |
|------|---------------|------------------|
| **Linear** | The "happy path"—sequential progression through phases | High-level planning, stakeholder communication, milestone tracking |
| **Loop-based** | Expected iteration patterns between phases | Process design, resource planning, understanding common rework |
| **Event-driven** | Actual dynamics—why transitions happen when they do | Understanding behaviour, designing interventions, root cause analysis |

All three views are correct at different levels of abstraction. The linear view is a useful simplification. The loop view shows common patterns. The event view reveals mechanism.

### Phase Span and Overlap

Phases have **start points** and **end points** that can overlap significantly:

```
Timeline:     ─────────────────────────────────────────────────────────►

Initiation:   [■■■■■■]
Planning:        [■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■]
Requirements:        [■■■■■■■■■■■■■■■■]
Design:                   [■■■■■■■■■■■■■■■■]
Implementation:                       [■■■■■■■■■■■■■■■■■■]
Testing:                                  [■■■■■■■■■■■■■■■]
Deployment:                                           [■■■■■■■]
```

**Key observations:**
- **Planning spans most of the project**—starts early but cannot complete until Design provides sufficient detail for realistic estimates
- **Requirements and Design overlap significantly**—they inform each other iteratively
- **Testing starts before Implementation ends**—continuous verification, TDD
- **Initiation is concentrated early**—but its outputs inform all subsequent phases

This overlap explains why information composition within a phase may shift as the phase progresses.

### Event Taxonomy

**Forward Events (Progress Triggers):**

| Event | From Phase | To Phase | Information Trigger |
|-------|------------|----------|---------------------|
| `OPPORTUNITY_VALIDATED` | Initiation | Planning | Stakeholders aligned, business case accepted |
| `SCOPE_BOUNDED` | Planning | Requirements | Resources allocated, timeline agreed, risks identified |
| `NEEDS_FORMALISED` | Requirements | Design | Requirements stable enough to design against |
| `ARCHITECTURE_STABLE` | Design | Implementation | Design decisions made, interfaces defined |
| `CODE_COMPLETE` | Implementation | Testing | Features implemented, unit tests pass |
| `QUALITY_SUFFICIENT` | Testing | Deployment | Acceptance criteria met |
| `DEPLOYED` | Deployment | Operations | System live, handover complete |

**Backward Events (Revisit Triggers):**

| Event | From Phase | To Phase | Information Trigger |
|-------|------------|----------|---------------------|
| `SCOPE_CHANGE` | Any | Initiation | Strategic shift, new stakeholder, market change |
| `ESTIMATE_INVALID` | Requirements/Design | Planning | Discovered complexity invalidates plan |
| `REQUIREMENT_MISSED` | Design/Implementation | Requirements | Gap discovered during design or build |
| `DESIGN_FLAW` | Implementation/Testing | Design | Technical constraint discovered |
| `INTEGRATION_FAILURE` | Testing | Implementation | Components don't work together |
| `ACCEPTANCE_REJECTED` | Deployment | Testing/Requirements | Stakeholder says "this isn't what I meant" |
| `PRODUCTION_ISSUE` | Operations | Any | Bug, performance, or usability problem in production |

### Information Types and Event Triggers

Events are triggered by **information discoveries**, and the information type influences event character:

| Information Type | Event Character | Example |
|------------------|-----------------|---------|
| **Formal** | Measurable, unambiguous, often automated | "Tests fail" → `QUALITY_INSUFFICIENT` |
| **Tacit** | Judgement-based, requires human interpretation | "This design feels wrong" → investigation → `DESIGN_FLAW` |
| **Emergent** | Arises from interaction, often unexpected | "We never considered this scenario" → `REQUIREMENT_MISSED` |

**Key insight**: Tacit and emergent discoveries often trigger **backward** events (revisiting earlier phases). Formal discoveries can trigger movement in either direction. This explains why early phases—which are tacit-heavy—are more likely to cause later rework when inadequately executed.

### Implications of the Event-Driven Model

**For process design:**
- Define clear **forward event criteria** (when is a phase "done enough" to progress?)
- Anticipate **backward event triggers** (what discoveries would require revisiting earlier work?)
- Design **information checkpoints** that surface issues early

**For AI augmentation:**
- AI can **detect potential events** (patterns in data, inconsistencies, quality metrics)
- AI can **alert humans** to potential triggers before they become blocking
- Humans **decide responses** to events (forward, backward, investigate further)

**For estimation and planning:**
- Acknowledge that **Planning spans most of the project** and refines iteratively
- Build in **contingency for backward events**, especially from tacit/emergent discoveries
- Avoid treating early-phase outputs as fixed inputs to later phases

## Key Implications

**For phase-specific reasoning**: Each phase has characteristic information composition, appropriate automation levels, typical failure modes, and required capabilities. Understanding phase boundaries enables targeted strategies rather than one-size-fits-all approaches.

**For information architecture**: Different phases produce and consume different information types. Early phases are tacit-heavy, requiring extensive social learning and mentoring. Later phases are formal-heavy, enabling automation and quantitative measurement. The progression explains why documentation strategies must vary.

**For measurement framework design**: Different phases need different measurement approaches based on their information composition. Tacit-heavy early phases require qualitative assessment of stakeholder alignment and shared understanding. Formal-heavy later phases support quantitative metrics like defect density and test coverage.

**For understanding failure patterns**: Each phase has characteristic failure modes traced to its information composition. Initiation failures stem from inadequate problem framing and stakeholder misalignment. Requirements failures stem from incomplete tacit knowledge transfer. Implementation failures stem from design understanding loss. Deployment failures stem from operational knowledge gaps.

**For human-AI collaboration design**: Phase characteristics determine appropriate collaboration patterns. Tacit-heavy early phases require human leadership with AI support. Formal-heavy later phases enable AI leadership with human oversight. The seven-phase structure provides scaffolding for systematic collaboration design across the lifecycle.

## Integration with Other Concepts

- [**Information Composition Taxonomy**](./concept_information-taxonomy.md): Each phase has characteristic formal/tacit/emergent composition (specified in Concept 6), explaining why approaches must vary. Information type also influences which events trigger phase transitions.
- [**Theory-Building Principle**](./foundation_theory-building.md): Theory building occurs throughout lifecycle—early phases build theory about problem space, middle phases about solution structure, later phases about implementation details. Backward events often indicate theory revision is needed.
- [**Eight-Capability Taxonomy**](./concept_capability-model.md): Different phases emphasise different capabilities—early phases emphasise Elicit/Synthesise/Decide, later phases emphasise Transform/Generate/Validate. Capabilities also enable event detection (Validate capability detects quality events).
- [**Actor Model**](./concept_actor-model.md): Phase characteristics determine appropriate actor participation—tacit-heavy phases need human actors, formal-heavy phases enable AI actors. AI can detect formal events; humans interpret tacit/emergent discoveries.
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): Patterns shift systematically across phases from Human-Only/Human-Led early to Partnership/AI-Led later. Pattern selection should also consider event response—backward events often require human-led investigation.
- [**Phase-Specific Information Composition**](./integration_phase-specific-composition.md): Concept 6 provides specific percentage estimates for each phase's formal/tacit/emergent composition. Note that composition may shift within a phase as it progresses (especially for long-spanning phases like Planning).
- [**Information Loss at Transitions**](./concept_transitions-info-loss.md): Each phase boundary (Concept 8) represents potential information loss, with different transitions having different loss patterns. The event model clarifies that transitions are triggered by information discoveries, and loss occurs when events are not properly communicated.
- [**Phase-Aware Measurement**](./concept_phase-aware-measurement.md): Concept 9 uses phase structure to argue for phase-specific measurement rather than universal metrics. Event frequency and type provide additional measurement dimensions.

## Evidence Base

ISO/IEC/IEEE 12207:2017 provides internationally recognised foundation through decades of consensus-building across industry, academia, and government. The thirty processes map cleanly to seven phases without loss or contradiction. Research across lifecycle models (PMBOK, BABOK, ITIL, various Agile methodologies) shows convergence on 5-7 core phases regardless of terminology or execution pattern.

Multiple lines of evidence support early-phase importance for project outcomes:

- **PMI Pulse of the Profession**: Poor communication contributes to 56% of failed projects; communication failures frequently originate in early phases where shared understanding must be established
- **Curtis et al. (1988)**: Field study of 17 large projects identified "thin spread of application domain knowledge" as a critical problem, highlighting how knowledge deficits in early phases propagate forward
- **Turnover studies**: Knowledge loss precedes productivity decline (Rigby et al., 2016); teams with high turnover accumulate 37% more technical debt (LinearB, 2024)
- **Team Tacit Knowledge**: r=0.35 correlation with team effectiveness using validated instrument (Ryan & O'Connor, 2013)
- **Logical dependency**: Later phases structurally depend on earlier phases; deficiencies in problem framing and requirements cascade into design and implementation

Research on information types validates the shift from tacit-heavy early phases to formal-heavy later phases. The methodology independence claim is validated through observation that all methodologies perform these work types, with systematic comparative research quantifying how execution patterns affect outcomes.

## Validation Status

- ✓ **Standards grounding**: Maps completely to ISO/IEC/IEEE 12207:2017 with full traceability
- ✓ **Convergence across frameworks**: All examined frameworks recognise these work types even with different terminology
- ✓ **Failure research correlation**: Early phase inadequacy predicts poor outcomes across multiple independent studies (PMI, Curtis et al., turnover research)
- ✓ **Methodology independence**: Validated through observation that all methodologies perform these work types
- ⚠ **Benefits of Initiation separation**: Supported by failure research but lacks controlled comparison studies
- ⚠ **Information composition shift**: Directionally validated but specific percentages (Concept 6) require measurement studies
- ⚠ **Optimal phase granularity**: Seven phases is practical but whether different granularity would be better requires comparative validation
- ⚠ **Phase overlap model**: Logically derived from methodology independence observation; requires empirical validation of typical span patterns
- ⚠ **Event taxonomy**: Derived from practitioner experience and failure analysis; specific event categories need validation across organisational contexts
- ⚠ **Information-event correlation**: Hypothesis that tacit/emergent discoveries trigger backward events more frequently requires systematic study

---

*The Seven-Phase SDLC Model provides the structural foundation enabling all phase-specific reasoning in the framework. The phases represent types of work, not discrete time periods—they overlap, iterate, and respond to information events throughout development. Understanding what work occurs in each phase, how phases interact dynamically, and how information discoveries trigger transitions enables principled decisions about documentation, automation, measurement, and collaboration throughout software development.*
