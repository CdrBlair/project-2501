# Dialogue Framework

## Project Overview

This project develops a comprehensive AI-Augmented Software Development Lifecycle (SDLC) Framework grounded in empirical research and theoretical foundations. The primary objective is to create a working, practical implementation that can be used in real software development projects, bridging theoretical software engineering concepts with actionable guidance.

**Core thesis**: Software development is fundamentally about building shared mental models ("theories") in developers' minds, with 70-80% of software knowledge being tacit rather than documented. This has profound implications for AI integration, as different SDLC phases have vastly different information compositions requiring different human-AI collaboration patterns.

## Framework Reference

For framework mechanics, schemas, and operational guidance, see:
- **[Framework Manual](../implementation/framework-manual.md)**: Compact operational reference (phases, capabilities, patterns, constraints, schemas)
- **[THY-001: Framework Theory](../implementation/theory_framework.md)**: Integrated understanding of why concepts connect
- **[REF-001: Framework Concepts](../implementation/ref_framework-concepts.md)**: Catalogue of all framework concepts

## Session Start: Dialogue Framework Status

At session start, a hook checks the Dialogue Framework initialisation status. Look for a message containing "Dialogue Framework status:" in the session context.

**Required action based on status:**

| Status | Action |
|--------|--------|
| NOT INITIALISED | Greet the user and mention that this project uses the Dialogue Framework but hasn't been initialised yet. Offer to help set it up. |
| PARTIAL | Greet the user and mention that Dialogue Framework setup is incomplete. Offer to complete the configuration. |
| INITIALISED (with tasks) | Greet the user, briefly mention the Dialogue Framework is active, and offer to review current tasks or continue with prior work. |
| INITIALISED (no tasks) | No special greeting needed. Proceed normally. |

This is the first thing to address when starting a session (unless the user immediately asks something specific).

## AI Collaboration Guidelines for Framework Development

This section applies the framework's own concepts to the work of developing the framework. AI assistants working on this project must embody the principles they are helping to document.

### Collaboration Pattern: Human-Led

Framework development operates as **Human-Led** collaboration:
- The human holds the theory—the deep understanding of why concepts connect, what the framework is trying to achieve, and how it should evolve
- AI assists with elicitation, analysis, synthesis, generation, and validation—but does not make architectural or conceptual decisions autonomously
- AI-generated content is always a draft for human validation, never a final artefact

### Dialogue Protocol

Apply the framework's dialogue loop (ELICIT → ANALYSE → SYNTHESISE → VALIDATE → PRESERVE) to all substantive work. See [Framework Manual: Dialogue Protocol](../implementation/framework-manual.md#dialogue-protocol) for details.

**Key for this project**: In the PRESERVE step, log observations and decisions using the skills in `.claude/skills/`.

### Decision and Observation Logging

**Actively log decisions and observations during work:**

When the human makes an observation (e.g., "I noticed...", "I observed...", "Here's an observation..."):
- Use the `log-observation` skill to record it immediately
- Observer should be `human:<username>`

When a decision is made (by human or AI):
- Use the `log-decision` skill to record it
- Include rationale, not just outcome

When AI makes operational choices during task execution:
- Log significant decisions (not trivial ones)
- Actor should be `ai:claude`

**Trigger phrases to watch for:**
- Observations: "I noticed", "I observed", "here's an observation", "worth noting", "I see that"
- Decisions: "let's go with", "I decided", "the decision is", "we'll use", "I chose"

### Escalation Triggers

Surface decisions to the human rather than proceeding autonomously when:

| Trigger | Example | Action |
|---------|---------|--------|
| **Conceptual ambiguity** | Unclear how a new concept relates to existing ones | Ask for clarification before drafting |
| **Architectural impact** | Change would affect multiple documents or core concepts | Describe impact and seek approval |
| **Theoretical tension** | New content potentially conflicts with foundations | Surface the tension explicitly |
| **Evidential uncertainty** | Unsure of appropriate evidence tier or citation | Ask before asserting |
| **Scope question** | Unclear if request is in scope for current work | Confirm scope before proceeding |
| **Novel pattern** | Situation not covered by existing guidance | Propose approach and seek validation |

**Default behaviour**: When uncertain, ask rather than assume.

### Tacit Knowledge Elicitation

See [Framework Manual: Tacit Knowledge Elicitation](../implementation/framework-manual.md#tacit-knowledge-elicitation) for general approach.

**For this project**: The human holds theory about the framework that cannot be fully documented. Actively elicit rationale, constraints, alternatives considered, and historical context.

### Skill Preservation

See [Framework Manual: Skill Preservation](../implementation/framework-manual.md#skill-preservation) for principles.

**For this project**: Support the human in developing their own synthesis of framework concepts. Do not create dependency on AI for routine framework tasks.

### Backward Event Detection

See [Framework Manual: Backward Event Detection](../implementation/framework-manual.md#backward-event-detection) for signals and responses.

**Response protocol**: When detecting a backward event, stop forward progress and surface the issue. Do not attempt to resolve inconsistencies silently.

### Meta-Application Principle

**Apply the framework to developing the framework.**

When working on framework content:
1. Consider which **capability** you are exercising (Elicit, Analyse, Synthesise, Transform, Validate, Decide, Generate, Preserve)
2. Consider the **information composition** of the current work (framework development is tacit-heavy, similar to early SDLC phases)
3. Recognise that the human holds **theory** about the framework that cannot be fully documented
4. Treat framework documents as **Standing documents** with long-term value—quality over speed
5. Apply **escalation** principles when encountering uncertainty

### Quality Over Speed

Framework development is understanding-heavy work where:
- Velocity metrics are inappropriate
- Deep engagement with concepts matters more than output volume
- Getting it right matters more than getting it done quickly
- Iteration and refinement are expected, not failures

**Implication**: Do not optimise for speed. Optimise for correctness, coherence, and clarity.

## Directory Structure

```
project-2501/
├── .claude/               # Claude Code framework (generated output)
│   ├── CLAUDE.md          # This file - project guidelines
│   ├── agents/            # Custom agents
│   ├── skills/            # Agent skills
│   └── commands/          # Slash commands
├── .dialogue/             # Runtime artifacts
│   ├── logs/              # Decision and observation logs
├── concepts/              # Core framework documents
│   ├── concept_*.md       # Core concept definitions
│   ├── foundation_*.md    # Theoretical foundations
│   ├── integration_*.md   # Integration documents
│   ├── guidance_*.md      # Practical guidance
│   ├── example_*.md       # Worked examples
│   └── README.md
├── implementation/        # Framework generation artifacts
│   ├── schema-*.md        # Schemas (how to document)
│   └── registries/        # Tool capability registries
├── papers/                # Academic sources
│   ├── *.pdf              # Primary source PDFs
│   ├── *-companion.md     # Companion analyses
│   └── README.md
├── research/              # Reference materials and exploratory work
│   ├── reference-*.md     # Reference materials
│   └── README.md
└── README.md
```

## Framework Generation Model

See [Framework Generation](../implementation/framework-generation.md) for the full generation model.

**Key distinction for this project**:
- `implementation/` contains *inputs* to generation (schemas, registries, manual)
- Tool directories (`.claude/`, etc.) contain *outputs* — the generated framework

When creating new framework artifacts, consult `implementation/registries/registry_claude-code.yaml` for Claude Code capabilities.

## Document Architecture

### Concepts Directory (`concepts/`)

Documents are organised by prefix reflecting their role:

#### Integration Documents (`integration_*.md`)
| Document | Description |
|----------|-------------|
| `integration_framework-architecture.md` | Master integration explaining how thirteen academic sources form the knowledge base |
| `integration_phase-specific-composition.md` | Formal/tacit/emergent percentages per SDLC phase |
| `integration_naur-wegner.md` | Integration of Naur's theory-building with Wegner's transactive memory |

#### Concept Documents (`concept_*.md`)
| Document | Description |
|----------|-------------|
| `concept_information-taxonomy.md` | Formal/Tacit/Emergent knowledge classification |
| `concept_capability-model.md` | Eight capabilities: Elicit, Analyse, Synthesise, Transform, Validate, Decide, Generate, Preserve |
| `concept_seven-phase-sdlc.md` | Seven-phase model with ISO 12207 alignment |
| `concept_actor-model.md` | Human and AI actor characterisation |
| `concept_collaboration-patterns.md` | Five patterns: Human-Only, Human-Led, Partnership, AI-Led, AI-Only |
| `concept_transitions-info-loss.md` | 35-55% information loss at phase transitions |
| `concept_phase-aware-measurement.md` | Phase-specific metrics and validation |
| `concept_document-type-classification.md` | Standing/Dynamic/Ephemeral document classification |
| `concept_process-capability-flow.md` | Schema for capability instance specifications |

#### Foundation Documents (`foundation_*.md`)
| Document | Description |
|----------|-------------|
| `foundation_theory-building.md` | Naur's theory-building principle |
| `foundation_transactive-memory.md` | Wegner's transactive memory systems |
| `foundation_socio-technical-systems.md` | STS theory foundations (Trist & Bamforth, Cherns) |
| `foundation_sts-meta-analysis.md` | Meta-analysis of STS research in software development |
| `foundation_iso-12207-processes.md` | ISO/IEC/IEEE 12207:2017 process enumeration |

#### Guidance Documents (`guidance_*.md`)
| Document | Description |
|----------|-------------|
| `guidance_architecture.md` | Three-layer guidance architecture |
| `guidance_implementation.md` | Practical implementation guidance |
| `guidance_performance-measures.md` | Performance measurement guidance |

#### Example Documents (`example_*.md`)
| Document | Description |
|----------|-------------|
| `example_document-type-registry.md` | Phase 3 document type exemplar |
| `example_capability-flow-specifications.md` | Phase 3 capability flow exemplar |

### Papers Directory (`papers/`)

Primary sources (PDFs) with companion analyses following the naming convention `$<pdf-name>-companion.md`:

**Key Sources (thirteen core sources per integration_framework-architecture.md):**
- Trist & Bamforth (1951) — Socio-Technical Systems founding paper
- Cherns (1976) — Nine STS design principles
- Naur (1985) — Programming as Theory Building
- Wegner (1986) — Transactive Memory
- Baxter & Sommerville (2011) — STS bridge to software engineering
- Ryan & O'Connor (2013) — Team Tacit Knowledge Measure
- Meyer et al. (2019) — "Today was a Good Day" developer experience
- Storey et al. (2022) — SPACE/TRUCE productivity framework
- Obi et al. (2024) — "Bad Days" developer experience
- Hicks et al. (2024) — Developer Thriving
- Hicks & Hevesi (2024) — Cumulative Culture Theory
- Context Engineering 2.0 (2025) — AI context management
- Illusion of Thinking (2025) — AI reasoning limitations

**Additional Sources (in papers/ but not core thirteen):**
- Nonaka (1994) — SECI model (influential but contested; companion notes limitations)
- Bainbridge (1983) — Ironies of Automation (cognitive grounding for skill preservation and monitoring constraints)

### Research Directory (`research/`)

Reference materials, integration analyses, and exploratory documents that inform framework development but aren't companion analyses.

## Key Theoretical Foundations

See [Framework Manual: Quick Reference](../implementation/framework-manual.md#quick-reference) for tables of phases, capabilities, and patterns.

**Core theoretical sources** (see [REF-001](../implementation/ref_framework-concepts.md) for full catalogue):
- **Naur (1985)**: Theory-building—software development builds understanding in minds, not just artifacts
- **Wegner (1986)**: Transactive memory—teams know "who knows what"
- **STS Theory (1951-2011)**: Joint optimisation of human and technical systems

**Key implication for this project**: Framework development is tacit-heavy work (similar to early SDLC phases). The human holds theory; AI supports but cannot replace theory-building.

## Evidential Standards

See [Framework Manual: Evidential Standards](../implementation/framework-manual.md#evidential-standards) for evidence tiers, key statistics, and language guidance.

**For this project:**
- **Cite confidently**: STS mirroring (69%), coordination congruence (32%), developer thriving (r=0.43)
- **Do not cite as primary**: CHAOS/Standish, Boehm's cost curve
- **Always temporally qualify AI capability claims** (as of 2024-2025)

## Writing Standards

### British English

Use British spelling throughout: organise, colour, behaviour, analyse, centre, etc.

### Temporal Qualification

Always qualify AI capability claims:

```markdown
✗ "AI cannot build theory"
✓ "Current AI systems (as of 2024-2025) do not build theory in Naur's sense—they generate artefacts without developing the explanatory understanding that enables maintenance and extension"
```

### Prescriptive vs Descriptive Voice

Maintain separation between:
- **Descriptive**: "This phase exhibits..."
- **Analytical**: "Research indicates..."
- **Prescriptive**: "Organisations should..."

Signal transitions between modes. Consider separate "Recommendations" sections.

### Quantitative Claims

When making quantitative claims:
1. **Directly measured** — cite specific study, sample size, methodology
2. **Derived from synthesis** — explain reasoning chain and source inputs
3. **Estimated or illustrative** — state explicitly as approximations

### Standards Alignment

When referencing ISO/IEC/IEEE standards:
- Distinguish "defined by" (standard specifies) from "synthesised from" (framework derives)
- Note specific standard version and year
- Acknowledge where framework extends beyond standard

Example:
> "This seven-phase model synthesises ISO/IEC/IEEE 12207:2017 process definitions into lifecycle stages; the phase boundaries and actor patterns are framework constructs, not ISO-defined elements."

## Document Cross-References

Concepts are interconnected. Authoritative sources for key constructs:

| Construct | Authoritative Document |
|-----------|------------------------|
| Information types | `concept_information-taxonomy.md` |
| Theory-building | `foundation_theory-building.md` |
| Transactive memory | `foundation_transactive-memory.md` |
| STS theory | `foundation_socio-technical-systems.md` |
| Capabilities | `concept_capability-model.md` |
| Phase structure | `concept_seven-phase-sdlc.md` |
| Actor patterns | `concept_actor-model.md` |
| Collaboration patterns | `concept_collaboration-patterns.md` |
| Phase composition | `integration_phase-specific-composition.md` |
| Framework integration | `integration_framework-architecture.md` |

## File Naming Conventions

### Concepts Directory
- Concepts: `concept_descriptive-name.md`
- Foundations: `foundation_descriptive-name.md`
- Integrations: `integration_descriptive-name.md`
- Guidance: `guidance_descriptive-name.md`
- Examples: `example_descriptive-name.md`

### Papers Directory
- PDFs: `descriptive-name.pdf`
- Companions: `$<pdf-name>-companion.md` (must match PDF name exactly)

### Research Directory
- Reference materials: `reference-descriptive-name.md`
- Research documents: `descriptive-name.md`

## Common Pitfalls to Avoid

See [Framework Manual: Common Pitfalls](../implementation/framework-manual.md#common-pitfalls) for general framework pitfalls.

**Additional project-specific pitfalls:**
- **Using American spellings** — British English throughout (organise, colour, behaviour)
- **Companion naming mismatch** — Companion files must match PDF names exactly (`$<pdf-name>-companion.md`)

## Editing Workflow

When making changes:

1. **Check cross-references** — Update all documents that reference changed content
2. **Verify percentage sums** — Ensure formal+tacit+emergent = 100%
3. **Maintain terminology consistency** — Use glossary terms exactly
4. **Preserve evidence citations** — Don't remove sample sizes or study references
5. **Test Mermaid diagrams** — Ensure syntax is valid
6. **Verify link paths** — All internal links should use correct relative paths
7. **Check companion alignment** — PDF and companion names must match

## Useful Commands

```bash
# Find all references to a term
grep -r "term" concepts/ papers/ research/

# Check for American spellings
grep -rE "(organize|color|behavior)" concepts/ papers/

# Verify markdown link integrity
grep -oE '\[.*\]\(.*\.md\)' concepts/*.md | sort | uniq

# List PDFs without companions
ls papers/*.pdf | sed 's/.pdf/-companion.md/' | xargs -I {} sh -c 'test -f papers/{} || echo "Missing: {}"'
```

## Contact/Context

This framework synthesises existing research into a practical, working implementation for software development projects. The conceptual foundation addresses why software projects fail despite AI advancement.

Primary theoretical tension: How do we integrate AI capabilities into software development while preserving the tacit knowledge and theory-building that determine project success?

**Core insight from STS**: The question is not "how do we use AI to improve productivity?" but rather "how do we *design the work system* so that human cognitive strengths and AI capabilities are jointly optimised?"
