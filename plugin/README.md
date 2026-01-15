# Dialogue Framework

An AI-augmented software development lifecycle framework that leverages dialogue, decisions, and observations to enhance project outcomes.

## Overview

This Claude Code plugin provides skills and agents for maintaining structured logs of decisions and observations during software development work. These logs create an audit trail that supports:

- **Traceability**: Understanding why decisions were made
- **Knowledge preservation**: Capturing tacit knowledge as it emerges
- **Compliance verification**: Ensuring required documentation occurs

## Installation

### Development (self-hosted)

Run Claude Code with the plugin directory:

```bash
claude --plugin-dir ./plugin
```

### Production

Copy the `plugin/` directory to your Claude Code plugins location or install from marketplace (when published).

## Skills

### Core Logging Skills

#### dialogue-log-decision

Log decisions to a chronological decision log. Supports four decision types:

| Type | Use Case |
|------|----------|
| OPERATIONAL | Routine choices during task execution |
| TACTICAL | Approach changes affecting method |
| DESIGN | Component/schema decisions with rationale |
| ADR | Cross-reference to Architecture Decision Record |

**Triggers**: "log decision", "record decision", "document choice"

#### dialogue-log-observation

Log observations (measurements, states, events) to an observation log.

| Type | Use Case |
|------|----------|
| MEASUREMENT | Quantitative data |
| STATE | System/process state |
| EVENT | Occurrences |

**Triggers**: "log observation", "record observation", "note finding", "capture state"

#### dialogue-create-adr

Create Architecture Decision Records for significant architectural decisions requiring formal alternatives analysis.

**Triggers**: "create ADR", "make ADR", "record architecture decision", "formal alternatives analysis"

### Supporting Skills

#### dialogue-resolve-reference

Resolve framework reference IDs (THY-001, DEC-..., ADR-001, etc.) to their content.

**Triggers**: "resolve reference", "look up THY-001", "find DEC-...", "what is ADR-001"

#### dialogue-structured-elicit

Gather structured information through framework-aware questioning.

**Triggers**: "gather requirements", "elicit context", "structured questions", "need to understand"

#### dialogue-verify-logging-compliance

Verify that required logging occurred during process execution.

**Triggers**: "verify logging", "check compliance", "validate logs"

#### dialogue-manage-work-items

Manage persistent work items in `.dialogue/work-items.yaml`. Guidance-only skill for direct YAML editing.

**Triggers**: "create work item", "update work item", "manage work items", "track work"

## Agents

### Process Architect

Designs capability flow specifications for SDLC processes following the AI-Augmented SDLC Framework.

**Use when**: Analysing or creating process definitions with human-AI collaboration patterns.

**Collaboration pattern**: Partnership — human provides context and approves; AI applies framework knowledge and drafts specifications.

**Tools**: Read, Write, Edit, Glob, Grep, Bash, AskUserQuestion

## Requirements

- Claude Code with plugin support
- Project must have `.dialogue/logs/` directory (created automatically)

## Environment Variables

The plugin uses Claude Code's built-in environment variables:

| Variable | Purpose |
|----------|---------|
| `CLAUDE_PROJECT_DIR` | Project root for log file storage |
| `CLAUDE_PLUGIN_ROOT` | Plugin installation directory |

## Log File Locations

Logs are written to the project directory:

- Decisions: `${CLAUDE_PROJECT_DIR}/.dialogue/logs/decisions.yaml`
- Observations: `${CLAUDE_PROJECT_DIR}/.dialogue/logs/observations.yaml`
- Work items: `${CLAUDE_PROJECT_DIR}/.dialogue/work-items.yaml`
- ADRs: `${CLAUDE_PROJECT_DIR}/decisions/ADR-NNN-*.md`

## Part of the AI-Augmented SDLC Framework

This plugin is the delivery mechanism for the framework's dialogue and process design capabilities. For full framework documentation, see the [project repository](https://github.com/pidster/project-2501).
