# Project 2501

The Dialogue Framework, an AI-Augmented Software Development Lifecycle (SDLC) framework, grounded in empirical research and theoretical foundations.

## Overview

This project develops a comprehensive framework for integrating AI capabilities into software development while preserving the tacit knowledge and theory-building that determine project success. The framework synthesises 70+ years of research spanning socio-technical systems theory (1951), cognitive theory (1985), and contemporary developer experience research (2024-2025).

To learn more about the Dialogue Framework, start here:
 1. [Dialogue Framework - Explained](dialogue-framework-explained.md)
 2. [Dialogue Framework - Research Background](dialogue-framework.md)
 3. [Dialogue Framework Implementation - Evolution Model](dialogue-framework-evolution.md)
 4. [Dialogue Framework Implementation - Revolution Model (TBD)](dialogue-framework-revolution.md)

## Directory Structure

- **[concepts/](./concepts/README.md)** — Core framework documents (concepts, foundations, integrations, guidance, examples)
- **[papers/](./papers/README.md)** — Academic source PDFs and companion analyses
- **[research/](./research/README.md)** — Integration analyses and exploratory research
- **[implementation/](./implementation/README.md)** — Framework generation artifacts (schemas, registries, theory docs)
- **[decisions/](./decisions/)** — Architecture Decision Records (ADRs)
- **[claude-plugin-evo/](./claude-plugin-evo/)** — Claude Code plugin implementation (skills, hooks, commands)
- **[.dialogue/](./.dialogue/README.md)** — Runtime artifacts (decision logs, observation logs, tasks)

## Key Framework Components

### Theoretical Foundations
- [Theory-Building Principle](./concepts/foundation_theory-building.md) — Naur (1985)
- [Transactive Memory Systems](./concepts/foundation_transactive-memory.md) — Wegner (1986)
- [Socio-Technical Systems](./concepts/foundation_socio-technical-systems.md) — Trist & Bamforth (1951), Cherns (1976)

### Core Concepts
- [Information Taxonomy](./concepts/concept_information-taxonomy.md) — Formal/Tacit/Emergent knowledge
- [Eight-Capability Model](./concepts/concept_capability-model.md) — Fundamental operations in software work
- [Seven-Phase SDLC](./concepts/concept_seven-phase-sdlc.md) — ISO 12207-aligned lifecycle phases
- [Actor Model](./concepts/concept_actor-model.md) — Human and AI actor characterisation
- [Five Collaboration Patterns](./concepts/concept_collaboration-patterns.md) — Human-AI interaction patterns

### Integration
- [Framework Architecture](./concepts/integration_framework-architecture.md) — How thirteen academic sources form a coherent whole
- [Naur-Wegner Integration](./concepts/integration_naur-wegner.md) — Individual theory-building meets team coordination

## Core Thesis

Software development is fundamentally about building shared mental models ("theories") in developers' minds, with 70-80% of software knowledge being tacit rather than documented. This has profound implications for AI integration:

1. **Different phases require different approaches** — Early phases are tacit-heavy and require human leadership; later phases are formal-heavy and enable greater AI autonomy
2. **Joint optimisation is essential** — Human-AI work systems require socio-technical design, not just AI tool adoption
3. **Theory-building remains human** — Current AI systems generate artefacts without developing the explanatory understanding that enables intelligent system evolution

## Documentation

See [.claude/CLAUDE.md](./.claude/CLAUDE.md) for detailed project guidelines, writing standards, and evidential requirements.
