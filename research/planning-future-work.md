# Planning: Future Work

This document tracks potential future development directions for the AI-Augmented SDLC Framework. Items here represent ideas under consideration, not committed work.

---

## Priority and Dependency Analysis

*Analysis completed: 12 January 2026*

### Item Clustering

| Cluster | Items | Nature |
|---------|-------|--------|
| **Conceptual Refinement** | 8, 10, 11, 12 | Mature framework theory |
| **Executable Manifestation** | 1, 5, 6, 7, 9 | Make framework operational |
| **Analytical/Validation** | 2, 3, 4, 13 | Test and apply framework |

### Priority Summary

| Priority | Items | Rationale |
|----------|-------|-----------|
| **P1** | 8, 11 | Foundational conceptual decisions that unblock other work |
| **P2** | 9, 10, 12 | Secondary conceptual work informed by P1 decisions |
| **P3** | 4, 5, 6 | Infrastructure (investigations complete for 5, 6) |
| **P4** | 1, 7 | Executable manifestation (depends on P3) |
| **P5** | 2, 3, 13 | Validation and application (depends on executable framework) |

### Critical Path to Executable Framework

```
8 (Actor Differentiation) → 9 (Provenance) → 5 (Decision Tracking) ─┐
                                                                     ├→ 7 (Process Architect) → 1 (Executable)
8 (Actor Differentiation) → 6 (Work Coordination) ──────────────────┘
```

### Recommended Sequencing

**Phase A: Conceptual Completion**
1. Item 11: Meta-theory decision
2. Item 8: AI actor differentiation model
3. Item 12: Accountability clarification

**Phase B: Infrastructure Design**
4. Item 9: Provenance granularity
5. Item 10: Orchestration skill atrophy
6. Item 4: AI configuration registry

**Phase C: Infrastructure Implementation**
7. Item 5: Decision/observation tracking
8. Item 6: Work coordination

**Phase D: Executable Demonstration**
9. Item 7: Process Architect agent skill
10. Item 1: Executable Framework consolidation

**Phase E: Validation & Application**
11. Items 2, 3, 13: Analytical lens, self-reference, empirical predictions

---

## Current Phase: Framework Self-Hosting

*Started: 13 January 2026*

### Objective

Restart framework development from Phase 1 (Initiation) using the framework itself, validating consistency and completeness.

### Motivation

We've built framework components opportunistically (Process Architect, decision logging, etc.) but haven't systematically worked through what self-hosting the entire SDLC requires. Starting fresh from "why are we building this?" should:

1. Validate that the framework guides coherent development
2. Reveal gaps or inconsistencies not visible when building bottom-up
3. Produce explicit Phase 1-2 artifacts that are currently missing
4. Test whether we arrive at the same (or compatible) design decisions

### Key Design Decisions

#### Information Architecture Principles

The framework must be **location-agnostic** while remaining **context-aware**:

1. **Logical information model** — What information exists, how it relates
2. **Physical storage** — Where information actually lives (multiple stores possible)
3. **Access patterns** — How actors retrieve and update information
4. **Context assembly** — How information from multiple sources is composed for a task

**Critical constraint**: We use local filesystem now, but must not assume it's the only store. Organisations have:
- Enterprise systems (Confluence, Jira, GitHub)
- Project-specific stores
- External sources (standards, vendor docs)
- Ephemeral/session context

#### Context Graph as Operational TMS

The Context Graph externalises transactive memory:

| TMS Component | Context Graph Equivalent |
|---------------|-------------------------|
| Directory | Node registry + metadata |
| Allocation | Store routing |
| Retrieval | Resolution + fetch |

**Actor dimension**: Nodes can be artifacts, humans, AI agents, or systems. The graph must model *actors as information sources*, not just artifacts.

```yaml
ContextNode:
  node_type: ARTIFACT | ACTOR_HUMAN | ACTOR_AI | SYSTEM
  # Metadata varies by type
```

**Graph operations** (TMS-aligned):
- `locate(query)` — Directory lookup
- `route(new_info)` — Allocation
- `retrieve(node)` — Retrieval (dispatch by type)
- `refresh(node)` — Maintenance
- `discover(actor, domain)` — Learning
- `invalidate(node)` — Staleness

### tasks

| ID | Item | Status | Notes |
|----|------|--------|-------|
| **SH-1** | Information Reference Schema | Pending | Location-agnostic references |
| **SH-2** | Resolution Interface | Pending | Abstract resolver, filesystem implementation |
| **SH-3** | Context Graph Schema | Pending | Nodes, edges, TMS operations |
| **SH-4** | Graph Storage Investigation | **Complete** | Decision: Start with filesystem + YAML; Kuzu identified for future evolution |
| **SH-5** | Phase 1 Initiation | Pending | Elicit strategic context, stakeholders, rationale |
| **SH-6** | Phase 2 Planning | Pending | Resource, risk, governance artifacts |
| **SH-7** | Retrofit vs Forward | Pending | Decision on existing artifacts |

### Open Questions

1. **Graph persistence**: Is the Context Graph itself a standing artifact? Where does it live?
2. **Graph discovery**: How do we bootstrap the graph for a new project/organisation?
3. **Actor self-registration**: Should AI agents register their capabilities in the graph?
4. **Confidence decay**: How do we model knowledge becoming stale over time?
5. **Graph vs. conversation**: Some TMS knowledge is implicit in conversation history. How do we bridge?

### Decisions Made

#### SH-4: Graph Storage (13 January 2026)

**Decision**: Start with filesystem + YAML; design abstractions for future evolution.

**Rationale**:
- Don't over-engineer—build what we need now
- Information Reference Schema provides location-agnosticism
- Resolver interface allows swapping storage backends later
- Kuzu identified as preferred evolution path (embedded, Cypher, Python/Node bindings, MIT license)
- Memgraph suitable for enterprise/multi-user scenarios if needed

**Implication**: SH-1, SH-2, SH-3 should design abstractions that don't assume filesystem, even though initial implementation uses it.

### Related Documents

- `implementation/framework-manual.md` — Compact AI reference (created 13 January 2026)
- `concepts/concept_work-coordination.md` — task and coordination schemas
- `concepts/concept_decision-observation-tracking.md` — Decision/observation schemas
- `foundation_transactive-memory.md` — TMS theoretical foundation

---

## Active Considerations

### ~~1. Executable Framework Manifestation~~ → COMPLETED

**Resolution** (13 January 2026): Initial executable manifestation achieved through Item 7 implementation and supporting infrastructure.

**Form chosen**: Claude Code native integration (skills, agents, commands) with bash script infrastructure.

**Executable artifacts created**:

| Layer | Artifacts | Purpose |
|-------|-----------|---------|
| **Infrastructure** | `.dialogue/log-decision.sh`, `.dialogue/log-observation.sh` | Logging scripts for decisions and observations |
| **Skills** | `.claude/skills/log-decision/`, `.claude/skills/log-observation/` | AI-accessible wrappers for logging |
| **Agents** | `.claude/agents/process-architect.md` | Process design following capability flow schema |
| **Generation** | `implementation/schema-environment-capability-registry.md`, `implementation/registries/registry_claude-code.yaml` | Registry schema and Claude Code instance |
| **Context** | `.claude/CLAUDE.md` | Project instructions applying framework to its own development |

**Answers to original questions**:

1. **What form is most useful?**
   - Tooling for Claude Code (skills, agents) combined with documentation
   - Bash scripts for non-AI access to logging functions
   - YAML schemas for structured data
   - This represents a "Claude Code-first" approach; other tools would use their native mechanisms

2. **Which parts are mature enough?**
   - Process capability flow schema (operationalised via Process Architect agent)
   - Decision/observation tracking (operationalised via skills and logs)
   - 3S2P context provision (operationalised via CLAUDE.md structure)
   - Collaboration patterns (used in agent design and logging)

3. **How to maintain alignment?**
   - `implementation/` directory separates generation inputs from generated outputs
   - Environment Capability Registry schema documents what each tool can do
   - CLAUDE.md captures meta-application principle—framework applies to its own development
   - Skills/agents reference canonical concept documents, maintaining traceability

**Future extension points**:
- Additional skills for other framework concepts (e.g., phase transition validation)
- Process templates for specific workflows
- CI/CD hooks for validation at phase boundaries
- Registries for other AI tools (Cursor, Copilot, etc.)

**Moved to**: Completed Items

---

### 2. Framework as Analytical Lens for Other Frameworks

**Description**: Use the AI-Augmented SDLC Framework as an analytical tool to evaluate other executable frameworks, methodologies, and tools—assessing how well they address tacit knowledge, theory-building, collaboration patterns, and information transitions.

**Potential applications**:
- Analyse existing methodologies (Agile, SAFe, DevOps) through the framework's concepts
- Evaluate AI coding assistants against collaboration pattern expectations
- Assess project management tools for information loss at transitions
- Compare CI/CD pipelines against phase-specific composition requirements
- Review documentation tools for standing/dynamic/ephemeral document support

**Value proposition**:
- Demonstrates framework's practical utility
- Identifies gaps in existing tools and methodologies
- Provides structured critique grounded in empirical research
- May reveal where the framework itself needs refinement

**Progress** (13 January 2026):
- Created Environment Capability Registry schema (`research/schema-environment-capability-registry.md`)
- Schema enables systematic documentation of AI tool environments against framework concepts
- Created Claude Code registry as worked example (`research/registry_claude-code.yaml`)
- Registry demonstrates framework mapping for capability coverage, collaboration patterns, and 3S2P

**Open questions** (refined):
- ~~Which frameworks/tools would be most valuable to analyse first?~~ → Start with AI coding assistants using the registry schema
- ~~What format should analyses take?~~ → YAML registries for tools; companion-style documents for methodologies
- How to handle frameworks that use different terminology for similar concepts?
- **Schema extension needed**: Should registries include "artifact creation tooling"? Tools like Claude Code have plugins (plugin-dev) that assist in creating/validating configuration artifacts. This meta-capability affects generation quality but isn't currently captured.

**Lessons learned**:
- Skills created without using plugin-dev validation were incorrectly structured
- The registry should capture not just *what artifacts exist* but *how to correctly create them*
- Consider adding a `generation_support` section to the schema covering:
  - Validation tooling (e.g., `plugin-dev:plugin-validator`)
  - Creation assistance (e.g., `plugin-dev:skill-reviewer`)
  - Canonical formats and conventions
  - Common errors and how to avoid them

**Files created**:
- `implementation/schema-environment-capability-registry.md` — Schema definition
- `implementation/registries/registry_claude-code.yaml` — Claude Code capability registry (worked example)

**Status**: Complete — schema with generation_support section and Claude Code registry created

---

### 3. Framework Self-Reference and Bootstrapping

**Description**: Investigate whether the framework can achieve properties analogous to a self-hosting compiler—a compiler capable of compiling itself. This represents a notable milestone in compiler development (bootstrapping), demonstrating that the system is sufficiently complete and coherent to operate on its own constructs.

**Dimensions to explore**:

- **Self-referencing**: Can the framework's concepts describe the framework itself? (Already partially achieved via CLAUDE.md "Meta-Application Principle")
- **Self-validation**: Can the framework's validation approaches be applied to validate the framework's own claims?
- **Self-generation**: Could the framework guide an AI assistant in generating or extending framework documents according to its own principles?

**Theoretical significance**:
- A self-hosting compiler proves the language is powerful enough to express its own implementation
- A self-referencing framework would demonstrate conceptual completeness—all concepts needed to describe human-AI collaboration are present
- Self-validation would demonstrate internal consistency and falsifiability
- Self-generation would demonstrate operational maturity

**Current state**:
- CLAUDE.md already applies framework principles to framework development (partial self-reference)
- Companion analyses use consistent structure (partial self-generation template)
- Validation status sections acknowledge what's validated vs. requiring validation (partial self-validation awareness)

**Open questions**:
- What would "complete" self-reference look like? Is there a formal test?
- Can we articulate the framework's information composition (formal/tacit/emergent) for framework development itself?
- What collaboration patterns are we using to develop the framework, and do they match the framework's own recommendations?
- Could an AI generate a new concept document that meets framework standards, guided only by the framework itself?

**Risks**:
- Self-reference can lead to circular reasoning or infinite regress
- The framework may be incomplete in ways that self-reference cannot detect
- Over-focus on self-reference may distract from practical utility

**Status**: Under consideration

---

### ~~4. AI Configuration and Integration Registry~~ → COMPLETED

**Resolution** (12 January 2026): Created comprehensive reference document at `research/reference-ai-configuration-registry.md`.

**Coverage**:
- Configuration file mechanisms (project, user, organisation levels)
- Integration protocols (MCP, skills, slash commands, context injection)
- Hook and event-driven integration (AI hooks, git hooks, CI/CD, IDE)
- Emerging patterns (hierarchy, trust boundaries, standing vs dynamic)

**Framework mappings documented**:
- Configuration → 3S2P context provision
- Trust boundaries → Collaboration pattern selection
- Hooks → Escalation criteria and accountability documentation
- Standing/dynamic → Document lifecycle classification

**Format decision**: Point-in-time reference document with obsolescence warning. Conceptual patterns more durable than specific tool details.

**Moved to**: Completed Items

---

### ~~5. Decision and Observation Tracking System~~ → COMPLETED

**Resolution** (12 January 2026): Formalised the investigation into a concept document at `concepts/concept_decision-observation-tracking.md`.

**Key elements documented**:
- **Observation Log Schema**: Append-only, chronological recording of measurements, states, events, and durations
- **Decision Tree Schema**: Hierarchical structure with dependencies, supersession, and actor pattern classification
- **Query patterns**: Causal traceability, impact analysis, policy compliance checking
- **Capability integration**: Only Decide produces decisions; Preserve operates on both record types
- **Policy framework**: Schema for governance policies binding to decisions

**Framework connections established**:
- Integration with Eight-Capability Taxonomy (capability-to-record mapping)
- Connection to Provenance Tracking (capability invocation level alignment)
- Links to Actor Model and Collaboration Patterns

**Moved to**: Completed Items

---

### ~~6. Work Coordination and Actor Assignment~~ → COMPLETED

**Resolution** (12 January 2026): Formalised the investigation into a concept document at `concepts/concept_work-coordination.md`.

**Key elements documented**:
- **task Schema**: Units of work with context packaging, assignment tracking, and state machine
- **Coordination paradigms**: Interactive (synchronous) and queue-based (asynchronous) with hybrid patterns
- **Message and Conversation schemas**: For synchronous human-AI dialogue
- **Queue patterns**: FIFO, priority, capability-matched routing
- **Actor profiles and capability matching**: Algorithm for routing work to appropriate actors
- **Pattern-specific coordination**: Different coordination modes for each collaboration pattern

**Framework connections established**:
- Integration with Decision/Observation Tracking (work events generate records)
- Connection to Process and Capability Flow (capability instances become tasks)
- Links to Actor Model and AI Actor Differentiation Model

**Moved to**: Completed Items

---

### ~~7. Process Architect Custom Agent~~ → COMPLETED

**Resolution** (13 January 2026): Implemented the full sub-item chain from log format through custom agent.

**Implementation summary**:
- **7a**: YAML stream format with `---` separators for append-only logging
- **7b/7c**: Bash scripts `log-decision.sh` and `log-observation.sh` in `.dialogue/`
- **7d/7e**: Agent skills wrapping the bash scripts in `.claude/skills/`
- **7f**: Process Architect custom agent in `.claude/agents/`

**Design decisions**:
- Location: `.dialogue/logs/` for decision and observation logs
- ID format: Timestamp-based (DEC-YYYYMMDD-HHMMSS) avoiding sequence tracking
- Scope: Operational/tactical decisions only (architecture decisions use ADRs)
- Format: Lightweight v0.1 schema with single-line rationale

**Files created**:
- `.dialogue/README.md` — Format specification and documentation
- `.dialogue/log-decision.sh` — Decision logging bash script
- `.dialogue/log-observation.sh` — Observation logging bash script
- `.dialogue/logs/decisions.yaml` — Decision log (YAML stream)
- `.dialogue/logs/observations.yaml` — Observation log (YAML stream)
- `.claude/skills/log-decision.md` — Decision Logger skill
- `.claude/skills/log-observation.md` — Observation Logger skill
- `.claude/agents/process-architect.md` — Process Architect custom agent

**Moved to**: Completed Items

---

#### Sub-Items (Reference)

| Sub-Item | Type | Description | Status |
|----------|------|-------------|--------|
| **7a** | File Format | Decision/Observation log file format (YAML) | ✓ Complete |
| **7b** | Bash Script | `log-decision.sh` | ✓ Complete |
| **7c** | Bash Script | `log-observation.sh` | ✓ Complete |
| **7d** | Agent Skill | Decision Logger | ✓ Complete |
| **7e** | Agent Skill | Observation Logger | ✓ Complete |
| **7f** | Custom Agent | Process Architect agent | ✓ Complete |

---

### ~~8. AI Actor Differentiation Model~~ → COMPLETED

**Resolution** (12 January 2026): Developed a formal four-dimension differentiation model and integrated it into `concept_actor-model.md`.

**Model summary**:
- **Training Profile**: Underlying model capabilities (general, domain, task, or organisation specialised)
- **Tool Access**: External capabilities through integrations (retrieval, creation, communication, validation)
- **Context State**: Information currently in context window (ephemeral expertise)
- **Reasoning Profile**: Speed/depth tradeoffs and problem-solving approach

**Key outputs**:
- AI Actor Capability Profile schema for specifying what an AI actor can reliably do
- Relationship to Extended Transactive Memory (capability profiles provide AI-AI TMS directory)
- Comparison of human vs AI differentiation mechanisms
- Validation status acknowledging empirical validation needs

**Moved to**: Completed Items

---

### ~~9. Provenance Tracking Granularity~~ → COMPLETED

**Resolution** (12 January 2026): Added provenance granularity guidance to `foundation_transactive-memory.md`.

**Recommendation**: Capability Invocation Level as default granularity.

**Rationale**:
- Actor level (too coarse): Doesn't identify which operation or which AI actor
- Output token level (too fine): Overhead exceeds value for most use cases
- Capability invocation level (appropriate): Aligns with framework's capability-based reasoning, provides actionable attribution, enables meaningful reliability assessment

**Key output**: Provenance record structure defined with fields for invocation ID, actor, capability, inputs/outputs, context state, collaboration pattern, confidence, and escalation status.

**Moved to**: Completed Items

---

### ~~10. Orchestration Skill Atrophy Risk~~ → COMPLETED

**Resolution** (12 January 2026): Developed comprehensive treatment in `concept_agent-context-model.md`.

**Key analysis**:
- Extended Bainbridge's ironies to orchestration meta-level
- Identified five orchestration skills at risk (process design, actor allocation, phase-appropriate practice, context engineering, emergent problem recognition)
- Described atrophy manifestation patterns (routine, novel, failure, generational)

**Mitigation strategies developed**:
1. Deliberate human involvement (spectrum from approval-only to human-led)
2. Rotation between automated and manual orchestration
3. Explicit teaching of orchestration principles
4. Visibility into AI orchestration reasoning
5. Graduated autonomy based on demonstrated understanding

**"Theory of the process" concept**: Developed parallel to Naur's theory of the software—understanding of development process that enables intelligent adaptation, which degrades without practice.

**Moved to**: Completed Items

---

### ~~11. Meta-Theory of Participation~~ → COMPLETED

**Resolution** (12 January 2026): Decided against formalising "meta-theory" as a separate concept. The 3S2P Agent Context Model provides sufficient coverage for what agents can develop (contextual awareness enabling appropriate behaviour) without introducing terminology that risks confusion with Naur's precise philosophical usage.

**Key decisions**:
- Use "contextual calibration" instead of "meta-theory"
- 3S2P describes operational awareness that agents *can* develop through configuration
- This is categorically distinct from Naur's theory (tacit understanding that resists formalisation)
- No separate concept document needed; integrated into `concept_agent-context-model.md`

**Moved to**: Completed Items

---

### ~~12. Context-Awareness and Accountability~~ → COMPLETED

**Resolution** (12 January 2026): Clarified the accountability relationship in `concept_agent-context-model.md` with a comprehensive new section.

**Key conclusions**:
- Accountability remains entirely human regardless of context-awareness level
- Context-awareness enables better performance but not accountability transfer
- Accountability requires understanding of consequences (which current AI lacks)
- Human accountability covers: automation design, escalation criteria, context provision, outcome review

**Four elements of human accountability**:
1. **Automation design**: Choosing where to apply AI and how to configure it
2. **Escalation criteria**: Setting appropriate thresholds for human involvement
3. **Context provision**: Providing accurate 3S2P context to agents
4. **Outcome review**: Evaluating results and taking corrective action

**Pattern implications**: Each collaboration pattern carries different accountability structure, but accountability remains human in all cases—even AI-Only patterns.

**Moved to**: Completed Items

---

### 13. Phase-Dependent TMS Empirical Predictions

**Description**: Develop testable empirical predictions for the Phase-Dependent TMS hypothesis, enabling validation or refutation.

**Core hypothesis**: Transactive memory requirements scale with tacit knowledge percentage across SDLC phases.

**Testable predictions**:
1. Teams with poor TMS show greater performance deficits in early phases than late phases
2. TMS investment has higher ROI in tacit-heavy phases
3. Early-phase failures more often manifest as expertise-location problems; late-phase failures as documentation problems
4. AI can substitute for TMS in formal-heavy phases but not tacit-heavy phases
5. Tacit subtype composition (Embedded vs. Documentable) varies by phase

**Study designs to consider**:
- Cross-sectional: Compare TMS quality and phase-specific performance across teams
- Longitudinal: Track TMS development and phase outcomes over project lifecycle
- Experimental: Intervene to improve TMS and measure phase-specific impact

**Metrics needed**:
- TMS quality measurement (Lewis scale or adaptation)
- Phase-specific performance measures
- Tacit subtype assessment instruments

**Status**: Identified; methodology development not started

---

## Parking Lot

*Items noted but not yet developed into full considerations*

---

## Completed Items

*Items that have been addressed and can be referenced*

### 11. Meta-Theory of Participation (Completed 12 January 2026)

**Original question**: Should "meta-theory of participation" be formalised as a distinct concept?

**Resolution**: No. The 3S2P Agent Context Model sufficiently captures what agents can develop (contextual awareness) without introducing terminology that risks confusion with Naur's theory. The term "contextual calibration" describes what agents achieve through 3S2P—adjustment of behaviour based on situational information—without implying theory-like understanding.

**Outcomes**:
- Updated `concept_agent-context-model.md` with "Relationship to Theory-Building" section
- Established clear distinction between 3S2P (explicit, configurable) and Naur's theory (tacit, irreducible)
- Avoided "meta-theory" terminology to prevent conceptual overload

---

### 8. AI Actor Differentiation Model (Completed 12 January 2026)

**Original question**: How should AI actor differentiation be formally represented?

**Resolution**: Developed a four-dimension differentiation model integrated into `concept_actor-model.md`:

1. **Training Profile** (permanent): Model capabilities from training data, fine-tuning, architecture
2. **Tool Access** (configured): External capabilities through integrations
3. **Context State** (ephemeral): Information currently in context window
4. **Reasoning Profile** (configurable): Speed/depth tradeoffs and problem-solving approach

**Key outputs**:
- AI Actor Capability Profile schema
- Relationship to Extended TMS (profiles provide directory knowledge)
- Orchestration implications (routing logic, load balancing, fallback chains)
- Human vs AI differentiation comparison

---

### 12. Context-Awareness and Accountability (Completed 12 January 2026)

**Original question**: Does context-awareness change where accountability lies?

**Resolution**: Accountability remains entirely human regardless of context-awareness level. Context-awareness enables better agent performance but does not transfer accountability because:
- Accountability requires understanding of consequences (current AI lacks this)
- Context-awareness is still pattern-based behaviour, not genuine judgement
- Judgement without understanding does not carry moral weight

**Human accountability covers four elements**:
1. Automation design (choosing where to apply AI)
2. Escalation criteria (setting appropriate thresholds)
3. Context provision (accurate 3S2P context)
4. Outcome review (evaluating and correcting)

**Documentation added**: New "Accountability and Context-Aware Agents" section in `concept_agent-context-model.md`.

---

### 9. Provenance Tracking Granularity (Completed 12 January 2026)

**Original question**: At what level should provenance be tracked?

**Resolution**: Capability Invocation Level recommended as the default granularity. This provides:
- Alignment with the framework's capability-based reasoning
- Actionable attribution (specific operation, specific actor, specific inputs/outputs)
- Manageable overhead for typical workflows

**Provenance record structure defined** with fields for: invocation ID, timestamp, actor, capability, inputs/outputs, context state, collaboration pattern, confidence, and escalation status.

**Documentation added**: New "Provenance Tracking Granularity" section in `foundation_transactive-memory.md`.

---

### 10. Orchestration Skill Atrophy Risk (Completed 12 January 2026)

**Original question**: What is the risk that context-aware agents cause human process understanding degradation?

**Resolution**: Developed comprehensive treatment extending Bainbridge's ironies to orchestration meta-level:
- Identified five orchestration skills at risk
- Described atrophy manifestation patterns across operational contexts
- Developed mitigation strategies (involvement levels, rotation, teaching, visibility, graduated autonomy)
- Introduced "theory of the process" as parallel to Naur's theory of the software

**Documentation added**: New "Orchestration Skill Atrophy" section in `concept_agent-context-model.md`.

---

### 4. AI Configuration and Integration Registry (Completed 12 January 2026)

**Original question**: What mechanisms exist for configuring AI development assistants?

**Resolution**: Created comprehensive reference document cataloguing:
- Configuration files (CLAUDE.md, .cursorrules, copilot-instructions.md, etc.)
- Integration protocols (MCP, skills, commands, context injection)
- Hook mechanisms (AI hooks, git hooks, CI/CD hooks, IDE hooks)
- Emerging patterns (configuration hierarchy, trust boundaries, standing vs dynamic)

**Framework mappings**: Connected each mechanism type to relevant framework concepts (3S2P, collaboration patterns, accountability elements).

**Created**: `research/reference-ai-configuration-registry.md`

---

### 5. Decision and Observation Tracking System (Completed 12 January 2026)

**Original question**: How should observations and decisions be recorded throughout the SDLC?

**Resolution**: Created comprehensive concept document `concepts/concept_decision-observation-tracking.md` formalising the investigation findings.

**Key design elements**:
- **Observation Log**: Append-only, chronological log for measurements, states, events, durations
- **Decision Tree**: Hierarchical structure with parent-child relationships and dependency tracking
- **Core distinction**: Observations are independent events; decisions create dependency structures
- **Actor pattern classification**: Each decision classified by collaboration pattern
- **Policy framework**: Governance policies with constraints and validation methods

**Query patterns documented**:
- Causal traceability: "Why is the system in this state?"
- Impact analysis: "What would change if we reversed this decision?"
- Policy compliance: "What decisions were made under security policy v2?"

**Framework integrations**:
- Only Decide capability produces decisions; other capabilities produce observations
- Capability invocation level provenance aligns with observation/decision granularity
- Accountability separation: accountable_party distinct from participants

---

### 6. Work Coordination and Actor Assignment (Completed 12 January 2026)

**Original question**: How is work coordinated between human and AI actors?

**Resolution**: Created comprehensive concept document `concepts/concept_work-coordination.md` formalising the investigation findings.

**Key design elements**:
- **task Schema**: Full schema with context packaging, assignment tracking, state machine
- **Two coordination paradigms**: Interactive (synchronous) and queue-based (asynchronous)
- **Hybrid coordination**: Most real work transitions between paradigms
- **Conversation preservation**: Capturing tacit knowledge from interactive sessions
- **Capability matching algorithm**: Routing work to appropriate actors

**Pattern-specific coordination**:
- Human-Only: Standard human coordination (no AI)
- Human-Led: Interactive primary; queue for AI preparation
- Partnership: Interactive essential; continuous back-and-forth
- AI-Led: Queue-based primary; interactive for escalation
- AI-Only: Queue-based; monitoring-based intervention

**Framework integrations**:
- Work events generate observation records
- Work completion can generate decision records
- Capability instances from process specs become tasks
- Actor profiles connect to AI Actor Differentiation Model

---

### 7. Process Architect Custom Agent (Completed 13 January 2026)

**Original question**: How can the framework be demonstrated as executable through tooling?

**Resolution**: Implemented the full sub-item chain from log format through custom agent.

**Implementation summary**:
- **7a**: YAML stream format with `---` separators for append-only logging (`.dialogue/logs/`)
- **7b/7c**: Bash scripts `log-decision.sh` and `log-observation.sh` for non-AI logging
- **7d/7e**: Agent skills wrapping the bash scripts in `.claude/skills/`
- **7f**: Process Architect custom agent in `.claude/agents/`

**Key design decisions**:
- Location: `.dialogue/logs/` for decision and observation logs
- ID format: Timestamp-based (DEC-YYYYMMDD-HHMMSS) avoiding sequence tracking
- Scope: Operational/tactical decisions only (architecture decisions use ADRs)
- Format: Lightweight v0.1 schema with single-line rationale

**Files created**:
- `.dialogue/README.md` — Format specification and documentation
- `.dialogue/log-decision.sh` — Decision logging bash script
- `.dialogue/log-observation.sh` — Observation logging bash script
- `.claude/skills/log-decision.md` — Decision Logger skill
- `.claude/skills/log-observation.md` — Observation Logger skill
- `.claude/agents/process-architect.md` — Process Architect custom agent

**Framework connections**:
- Implements decision/observation tracking from Item 5
- Process Architect uses capability flow schema from `concept_process-capability-flow.md`
- Skills demonstrate Skill vs Agent distinction (tool wrapper vs orchestrator)
- Logs demonstrate YAML stream for append-only operation

---

### 1. Executable Framework Manifestation (Completed 13 January 2026)

**Original question**: How can the framework be manifested in executable form?

**Resolution**: Initial executable manifestation achieved through layered implementation:

| Layer | Artifacts | Purpose |
|-------|-----------|---------|
| **Infrastructure** | `.dialogue/` scripts and logs | Shared logging infrastructure |
| **Skills** | `.claude/skills/log-*` | AI-accessible tool wrappers |
| **Agents** | `.claude/agents/process-architect.md` | Process design orchestration |
| **Generation** | `implementation/` schemas and registries | Framework generation inputs |

**Answers to original questions**:
1. **Form**: Claude Code native (skills/agents) + bash scripts + YAML schemas
2. **Mature parts**: Process capability flow, decision tracking, 3S2P context, collaboration patterns
3. **Alignment**: Separation of generation inputs (implementation/) from outputs (.claude/), registry schema

**Future extension**: Additional skills, process templates, CI/CD hooks, multi-tool registries.

---

### 2. Environment Capability Registry (Completed 13 January 2026)

**Original question**: How to systematically document AI tool capabilities against framework concepts?

**Resolution**: Created Environment Capability Registry schema and first instance.

**Artifacts created**:
- `implementation/schema-environment-capability-registry.md` — Schema definition
- `implementation/registries/registry_claude-code.yaml` — Claude Code capability registry

**Schema sections**:
- Tool identity and versioning
- Tool access (file ops, execution, integrations, communication)
- Context provision (standing, dynamic, limitations)
- Collaboration support (modes, approval, escalation)
- Configuration hierarchy
- Extensions (plugins, commands, agents, skills, hooks, MCP)
- Generation support (validation tooling, creation assistance, canonical formats, common pitfalls)
- Framework mapping (capability coverage, collaboration patterns, 3S2P)

**Lessons applied**: Added `generation_support` section after discovering skills created without validation were incorrectly structured. Registry now captures not just what tools exist but how to correctly create artifacts.

---

*Document created: 10 January 2026*
*Purpose: Track future development directions for the framework*
