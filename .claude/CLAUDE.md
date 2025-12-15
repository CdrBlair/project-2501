# AI-Augmented SDLC Framework

## Project Overview

This project develops a comprehensive AI-Augmented Software Development Lifecycle (SDLC) Framework grounded in empirical research and theoretical foundations. The framework bridges theoretical software engineering concepts with practical implementation guidance, targeting publication in top-tier academic venues such as IEEE Transactions on Software Engineering.

**Core thesis**: Software development is fundamentally about building shared mental models ("theories") in developers' minds, with 70-80% of software knowledge being tacit rather than documented. This has profound implications for AI integration, as different SDLC phases have vastly different information compositions requiring different human-AI collaboration patterns.

## Directory Structure

```
project-2501/
├── .claude/
│   └── CLAUDE.md          # This file - project guidelines
├── concepts/              # Core framework documents
│   ├── concept_*.md       # Core concept definitions
│   ├── foundation_*.md    # Theoretical foundations
│   ├── integration_*.md   # Integration documents
│   ├── guidance_*.md      # Practical guidance
│   ├── example_*.md       # Worked examples
│   └── README.md
├── papers/                # Academic sources
│   ├── *.pdf              # Primary source PDFs
│   ├── *-companion.md     # Companion analyses
│   └── README.md
├── research/              # Reference materials and exploratory work
│   ├── reference-*.md     # Reference materials
│   └── README.md
└── README.md
```

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

### Research Directory (`research/`)

Reference materials, integration analyses, and exploratory documents that inform framework development but aren't companion analyses.

## Key Theoretical Foundations

### Socio-Technical Systems Theory (1951-2011)

STS theory provides the system-level design lens. Core principle: **joint optimisation**—social and technical subsystems must be co-designed, not optimised independently.

**Key sources:**
- Trist & Bamforth (1951): Founded STS through coal mining research
- Cherns (1976): Nine actionable design principles
- Baxter & Sommerville (2011): Bridge to software engineering

**Implication**: Human-AI work systems require deliberate socio-technical design, not just AI tool adoption.

### Naur's Theory-Building (1985)

Software development involves building a "theory" in developers' minds—understanding of problem space, solution rationale, and modification implications. This theory cannot be fully documented; losing theory-holding developers causes "program death."

**Implication**: AI cannot replace human theory-building but can support it.

### Wegner's Transactive Memory (1986)

Teams develop shared knowledge systems where members know *who knows what* rather than everyone knowing everything. This distributed cognition enables collective capability exceeding individual capacity.

**Implication**: AI tools must integrate with team knowledge structures, not replace them.

### Naur-Wegner Integration

Individual theory-building (Naur) and team transactive memory (Wegner) are complementary:
- **Theory death**: Loss of individuals holding deep understanding
- **TMS degradation**: Disruption of "who knows what" coordination

Teams can fail through either mechanism—requiring different remediation strategies.

### Phase Information Composition

Different phases have different formal/tacit/emergent ratios:

| Phase | Formal | Tacit | Emergent |
|-------|--------|-------|----------|
| 1. Initiation | 5% | 75% | 20% |
| 2. Planning | 35% | 55% | 10% |
| 3. Requirements | 40% | 50% | 10% |
| 4. Design | 50% | 40% | 10% |
| 5. Implementation | 55% | 35% | 10% |
| 6. Testing | 60% | 30% | 10% |
| 7. Operations | 60% | 30% | 10% |

**These are derived estimates**, not empirically measured values. Present as "approximate compositions" for guidance, not precise measurements.

### Three-Layer Guidance Architecture

The framework occupies Layer 2 in a three-layer model:

1. **Layer 1: Process Abstractions** (decadal stability) — ISO/IEC/IEEE standards
2. **Layer 2: Application Framework** (annual updates) — This framework
3. **Layer 3: Implementation Patterns** (continuous change) — Tool-specific practices

## Evidential Standards

### Evidence Tiers

| Tier | Type | Causal Inference |
|------|------|------------------|
| T1 | Experimental/Quasi-experimental | Can support causation |
| T2 | Longitudinal/Panel | Establishes temporal precedence only |
| T3 | Cross-sectional with controls | Correlation only |
| T4 | Descriptive/Case study | Association only |

### Strong Evidence (cite confidently)

- **STS Mirroring Hypothesis**: 69% support across 142 studies (Colfer & Baldwin 2016)
- **Socio-Technical Congruence**: 32% reduction in resolution time (Cataldo et al. 2008)
- **DORA metrics**: N=39,000+ professionals, validated for Phases 5-7
- **Developer Thriving**: r=0.43 with productivity (Hicks et al., N=2,600+)
- **Good Day factors**: 60.6% good days validated (Meyer et al., N=5,971)
- **TTKM**: r=0.35 with team effectiveness (Ryan & O'Connor, N=48 teams)

### Weak Evidence (do not cite as primary)

- **CHAOS/Standish statistics**: Methodologically contested; "Standish opinion"
- **39-47% requirements failure**: No systematic review, wildly varying figures
- **Boehm's 50-200x cost curve**: 1970s waterfall data, not validated in modern contexts

### Evidential Language

Use language that signals evidential weight:

```markdown
✓ "Research indicates..." (for peer-reviewed findings)
✓ "Synthesis of evidence suggests..." (for derived conclusions)
✓ "Estimated at approximately..." (for reasoned approximations)
✓ "For illustrative purposes..." (for worked examples)

✗ Avoid presenting derived figures as directly measured
✗ Avoid absolute statements about AI capabilities without temporal qualification
```

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

1. **Overgeneralising actor suitability** — Determine at capability *instance* level, not broad capability categories
2. **Treating phase percentages as measured** — They are derived estimates for guidance
3. **Citing CHAOS/Standish as evidence** — Methodologically problematic
4. **Making absolute AI capability claims** — Always temporally qualify
5. **Optimising early phases for speed** — Understanding-heavy phases shouldn't prioritise velocity
6. **Conflating correlation with causation** — Most evidence is correlational (Tier 3)
7. **Using American spellings** — British English throughout
8. **Ignoring joint optimisation** — Human-AI systems require socio-technical design, not just AI adoption
9. **Companion naming mismatch** — Companion files must match PDF names exactly

## Key Statistics to Know

| Metric | Value | Source | Evidence Tier |
|--------|-------|--------|---------------|
| STS mirroring support | 69% of 142 studies | Colfer & Baldwin 2016 | Meta-analysis |
| Coordination congruence effect | 32% improvement | Cataldo et al. 2008 | T3 |
| Developer thriving → productivity | r=0.43 | Hicks et al. 2024, N=2,600+ | T3 |
| TTKM → team effectiveness | r=0.35 | Ryan & O'Connor 2013, N=48 | T3 |
| Good day prevalence | 60.6% | Meyer et al. 2019, N=5,971 | T3 |
| PR dwell time (bad days) | +48.84% | Obi et al. 2024 | T3 |

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

This framework is being developed for academic publication targeting IEEE Transactions on Software Engineering. The work synthesises existing research rather than presenting new empirical findings, building a conceptual framework that addresses why software projects fail despite AI advancement.

Primary theoretical tension: How do we integrate AI capabilities into software development while preserving the tacit knowledge and theory-building that determine project success?

**Core insight from STS**: The question is not "how do we use AI to improve productivity?" but rather "how do we *design the work system* so that human cognitive strengths and AI capabilities are jointly optimised?"
