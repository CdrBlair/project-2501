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

**Empirical justification**: Research indicates 39-47% of project failures trace to requirements and scope issues. Many originate not in the requirements phase itself but earlier in inadequate problem framing during initiation. When teams don't truly understand why they're building something, they cannot elicit appropriate requirements. When stakeholders aren't genuinely aligned on purpose, requirements become political rather than technical. When the business case is weak, projects continue despite lack of value.

**Information composition rationale**: Initiation exhibits the highest tacit and emergent knowledge content of any phase. This makes it both the most critical for human leadership and the phase where information loss is greatest. Separating it from Planning maintains visibility and enables specific mitigation strategies.

## Methodology Independence

The seven phases describe types of work, not execution patterns. How phases execute varies dramatically across methodologies:

**Waterfall (Sequential)**: Phases execute in strict sequence with formal gates. Initiation completes before Planning begins. Requirements fully specified before Design starts. Comprehensive documentation at each gate. Limited iteration between phases.

**Agile (Iterative)**: All seven phases compress into 1-4 week sprints. Each sprint involves initiation (why this feature), planning (sprint planning), requirements (story refinement), design (technical design), implementation (coding), testing (continuous testing), and deployment (sprint deployment). Phases cycle rapidly rather than executing once.

**DevOps (Continuous)**: Phases blur into continuous flow. Deployment occurs continuously rather than as distinct phase. Testing integrates throughout implementation. Requirements emerge from production feedback. Phase boundaries become indistinct.

**Hybrid (Adaptive)**: Different phases follow different patterns. Early phases (Initiation, Planning, Requirements) execute sequentially to establish foundation. Later phases (Design, Implementation, Testing) proceed iteratively with continuous deployment.

Regardless of pattern, all seven work types occur. The most rapid Agile team still performs initiation work (understanding feature value), planning work (sprint planning), requirements work (refinement), design work (technical design), implementation work (coding), testing work (verification), and deployment work (release).

## Key Implications

**For phase-specific reasoning**: Each phase has characteristic information composition, appropriate automation levels, typical failure modes, and required capabilities. Understanding phase boundaries enables targeted strategies rather than one-size-fits-all approaches.

**For information architecture**: Different phases produce and consume different information types. Early phases are tacit-heavy, requiring extensive social learning and mentoring. Later phases are formal-heavy, enabling automation and quantitative measurement. The progression explains why documentation strategies must vary.

**For measurement framework design**: Different phases need different measurement approaches based on their information composition. Tacit-heavy early phases require qualitative assessment of stakeholder alignment and shared understanding. Formal-heavy later phases support quantitative metrics like defect density and test coverage.

**For understanding failure patterns**: Each phase has characteristic failure modes traced to its information composition. Initiation failures stem from inadequate problem framing and stakeholder misalignment. Requirements failures stem from incomplete tacit knowledge transfer. Implementation failures stem from design understanding loss. Deployment failures stem from operational knowledge gaps.

**For human-AI collaboration design**: Phase characteristics determine appropriate collaboration patterns. Tacit-heavy early phases require human leadership with AI support. Formal-heavy later phases enable AI leadership with human oversight. The seven-phase structure provides scaffolding for systematic collaboration design across the lifecycle.

## Integration with Other Concepts

- **Information Composition Taxonomy**: Each phase has characteristic formal/tacit/emergent composition (specified in Concept 6), explaining why approaches must vary
- **Theory-Building Principle**: Theory building occurs throughout lifecycle—early phases build theory about problem space, middle phases about solution structure, later phases about implementation details
- **Eight-Capability Taxonomy**: Different phases emphasise different capabilities—early phases emphasise Elicit/Synthesise/Decide, later phases emphasise Transform/Generate/Validate
- **Actor Model**: Phase characteristics determine appropriate actor participation—tacit-heavy phases need human actors, formal-heavy phases enable AI actors
- **Five Collaboration Patterns**: Patterns shift systematically across phases from Human-Only/Human-Led early to Partnership/AI-Led later
- **Phase-Specific Information Composition**: Concept 6 provides specific percentage estimates for each phase's formal/tacit/emergent composition
- **Information Loss at Transitions**: Each phase boundary (Concept 8) represents potential information loss, with different transitions having different loss patterns
- **Phase-Aware Measurement**: Concept 10 uses phase structure to argue for phase-specific measurement rather than universal metrics

## Evidence Base

ISO/IEC/IEEE 12207:2017 provides internationally recognised foundation through decades of consensus-building across industry, academia, and government. The thirty processes map cleanly to seven phases without loss or contradiction. Research across lifecycle models (PMBOK, BABOK, ITIL, various Agile methodologies) shows convergence on 5-7 core phases regardless of terminology or execution pattern. Studies of project failures consistently identify inadequate early phases (initiation, planning, requirements) as primary predictors, with 39-47% of failures attributed to requirements issues often originating in weak problem framing. Research on information types validates the shift from tacit-heavy early phases to formal-heavy later phases. The methodology independence claim is validated through observation that all methodologies perform these work types, with systematic comparative research quantifying how execution patterns affect outcomes.

## Validation Status

- ✓ **Standards grounding**: Maps completely to ISO/IEC/IEEE 12207:2017 with full traceability
- ✓ **Convergence across frameworks**: All examined frameworks recognise these work types even with different terminology
- ✓ **Failure research correlation**: Early phase inadequacy predicts poor outcomes across multiple studies
- ✓ **Methodology independence**: Validated through observation that all methodologies perform these work types
- ⚠ **Benefits of Initiation separation**: Supported by failure research but lacks controlled comparison studies
- ⚠ **Information composition shift**: Directionally validated but specific percentages (Concept 6) require measurement studies
- ⚠ **Optimal phase granularity**: Seven phases is practical but whether different granularity would be better requires comparative validation

---

*The Seven-Phase SDLC Model provides the temporal structure enabling all phase-specific reasoning in the framework. Understanding what work occurs in each phase—and how information composition shifts across the lifecycle—enables principled decisions about documentation, automation, measurement, and collaboration throughout software development.*
