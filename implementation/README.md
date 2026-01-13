# Implementation

This directory contains **generation artifacts** — schemas, registries, templates, and tooling used to *generate* the AI-Augmented SDLC Framework for specific tool environments.

**Important distinction**: This directory contains *inputs* to framework generation, not the generated framework itself. Generated artifacts (skills, agents, commands, hooks) are placed in their tool-specific directories (e.g., `.claude/` for Claude Code).

---

## Generation Model

```
┌─────────────────────────────────────────────────────────────────┐
│                    implementation/                               │
│  ┌─────────────────┐    ┌─────────────────────────────────┐     │
│  │ Schemas         │    │ Registries                      │     │
│  │ (how to doc)    │───▶│ (what each tool can do)         │     │
│  └─────────────────┘    └─────────────────────────────────┘     │
│                                      │                           │
│                                      │ Generation                │
│                                      ▼                           │
└──────────────────────────────────────┼──────────────────────────┘
                                       │
              ┌────────────────────────┼────────────────────────┐
              │                        │                        │
              ▼                        ▼                        ▼
        ┌──────────┐            ┌──────────┐            ┌──────────┐
        │ .claude/ │            │ .cursor/ │            │ .copilot/│
        │ Skills   │            │ Rules    │            │ Config   │
        │ Agents   │            │ etc.     │            │ etc.     │
        │ Commands │            │          │            │          │
        └──────────┘            └──────────┘            └──────────┘
         (generated)             (generated)             (generated)
```

---

## Structure

```
implementation/
├── schema-environment-capability-registry.md   # Schema: how to document tool capabilities
├── registries/                                  # Registry instances (one per tool)
│   └── registry-claude-code.yaml               # What Claude Code can do
└── README.md
```

## Contents

### Schemas

Schemas define *how* to document tool environments.

| Document | Description |
|----------|-------------|
| [schema-environment-capability-registry.md](./schema-environment-capability-registry.md) | Schema for documenting AI tool capabilities against framework concepts |

### Registries

Registries document *what* each tool environment can do. Each registry is an instance of the schema applied to a specific tool.

| Registry | Tool | Last Updated |
|----------|------|--------------|
| [registry-claude-code.yaml](./registries/registry-claude-code.yaml) | Claude Code | 2026-01-13 |

---

## Purpose

Implementation artifacts serve to:

1. **Document tool capabilities** — Systematically capture what each AI tool can do
2. **Enable framework generation** — Provide the knowledge needed to generate tool-specific framework artifacts
3. **Support comparison** — Compare tools against framework requirements
4. **Track evolution** — Document capability changes over time

## What Goes Where

| Artifact Type | Location | Example |
|---------------|----------|---------|
| Schemas (how to document) | `implementation/` | `schema-environment-capability-registry.md` |
| Registries (tool capabilities) | `implementation/registries/` | `registry-claude-code.yaml` |
| Generated skills | Tool directory | `.claude/skills/log-decision.md` |
| Generated agents | Tool directory | `.claude/agents/process-architect.md` |
| Generated commands | Tool directory | `.claude/commands/*.md` |

## Relationship to Other Directories

| Directory | Contains | Relationship |
|-----------|----------|--------------|
| `concepts/` | Framework theory | Concepts define *what* to generate |
| `implementation/` | Generation artifacts | Implementation defines *how* to generate |
| `.claude/` | Claude Code framework | Generated output for Claude Code |
| `.dialogue/` | Operational logging | Runtime artifacts (logs, state) |
| `research/` | Exploratory work | May inform new schemas or registries |

---

## Adding a New Tool

To add framework support for a new tool (e.g., Cursor, Copilot):

1. Create a new registry: `implementation/registries/registry-<tool>.yaml`
2. Fill in the registry following the schema
3. Generate tool-specific artifacts based on the registry
4. Place generated artifacts in the tool's directory (e.g., `.cursor/`)

---

*Implementation artifacts are inputs to framework generation. Generated framework artifacts live in their tool-specific directories.*
