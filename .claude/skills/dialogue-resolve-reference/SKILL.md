---
name: dialogue-resolve-reference
description: Resolves framework reference IDs to their content. Use when you need to look up a document, decision, observation, work item, or ADR by its ID. Triggers on "resolve reference", "look up THY-001", "find DEC-...", "get content of", "what is ADR-001".
allowed-tools: Bash
---

# Dialogue: Reference Resolver

Resolves framework reference IDs to their content. This skill implements the retrieval operation for the framework's Transactive Memory System.

## When to Use

Use this skill when you need to:
- Look up a project document by its ID (THY-001, REF-001, STR-001, ADR-001)
- Find a decision or observation log entry
- Retrieve a work item's details

**Do NOT use for:**
- External URLs → use WebFetch
- File paths → use Read tool directly
- Creating new references → use appropriate logging/creation skills
- Framework source references (F-N, C-N, etc.) → see Framework Source References below

## Dependencies

This skill requires:
- **Git repository** — Script finds project root using git
- **Framework directory structure** — `.dialogue/`, `decisions/`, and document directories

## Configuration

Artifact locations are configured in the script. Projects can customise via `.dialogue/resolver-config.yaml` (config parsing TODO).

Default locations:
- THY/REF/STR documents: `implementation/` (framework dev) or `docs/` (typical deployments)
- ADR documents: `decisions/`
- Logs: `.dialogue/logs/`
- Work items: `.dialogue/work-items.yaml`

## How to Resolve a Reference

Execute the following bash command:

```bash
.claude/skills/dialogue-resolve-reference/scripts/resolve-reference.sh <id> [output_format]
```

### Required Parameters

| Parameter | Description |
|-----------|-------------|
| `id` | The reference ID to resolve (e.g., `THY-001`, `DEC-20260114-091633`, `SH-002`) |

### Optional Parameters

| Parameter | Values | Description |
|-----------|--------|-------------|
| `output_format` | `full`, `metadata`, `path` | What to return (default: `full`) |

## Output Formats

| Format | Returns |
|--------|---------|
| `full` | Complete content with metadata (default) |
| `metadata` | Just metadata (title, type, location) without content |
| `path` | Just the resolved file path |

## Supported Reference Types

### Project Documents (Resolvable)

| Pattern | Type | Location | Example |
|---------|------|----------|---------|
| `THY-NNN` | Theory | `implementation/theory_*.md` | `THY-001` |
| `REF-NNN` | Reference | `implementation/ref_*.md` | `REF-001` |
| `STR-NNN` | Strategy | `implementation/str_*.md` | `STR-001` |
| `ADR-NNN` | Architecture Decision Record | `decisions/ADR-NNN-*.md` | `ADR-001` |

### Log Entries (Resolvable)

| Pattern | Type | Location | Example |
|---------|------|----------|---------|
| `DEC-YYYYMMDD-HHMMSS` | Decision | `.dialogue/logs/decisions.yaml` | `DEC-20260114-091633` |
| `OBS-YYYYMMDD-HHMMSS` | Observation | `.dialogue/logs/observations.yaml` | `OBS-20260114-094825` |

### Work Items (Resolvable)

| Pattern | Type | Location | Example |
|---------|------|----------|---------|
| `SH-NNN` | Self-Hosting | `.dialogue/work-items.yaml` | `SH-002` |
| `CD-NNN` | Conceptual Debt | `.dialogue/work-items.yaml` | `CD-001` |
| `FW-NNN` | Framework | `.dialogue/work-items.yaml` | `FW-003` |

### Actors (Metadata Only)

| Pattern | Type | Example |
|---------|------|---------|
| `human:<id>` | Human Actor | `human:pidster` |
| `ai:<id>` | AI Actor | `ai:claude` |

### Framework Source References (NOT Resolvable)

These reference framework source documentation, not available in deployed projects:

| Pattern | Type | Returns |
|---------|------|---------|
| `F-N` | Foundation | `NOT_SUPPORTED` |
| `C-N` | Concept | `NOT_SUPPORTED` |
| `I-N` | Integration | `NOT_SUPPORTED` |
| `G-N` | Guidance | `NOT_SUPPORTED` |
| `E-N` | Example | `NOT_SUPPORTED` |

See FW-005 (Deployment Artifact Definition) for the deployment model that separates framework source from runtime artifacts.

## Examples

### Resolve a Theory Document
```bash
.claude/skills/dialogue-resolve-reference/scripts/resolve-reference.sh THY-001
```

### Get Just the Path to an ADR
```bash
.claude/skills/dialogue-resolve-reference/scripts/resolve-reference.sh ADR-001 path
```

### Look Up a Decision Log Entry
```bash
.claude/skills/dialogue-resolve-reference/scripts/resolve-reference.sh DEC-20260114-091633
```

### Get Work Item Metadata
```bash
.claude/skills/dialogue-resolve-reference/scripts/resolve-reference.sh SH-002 metadata
```

## Output

The script returns JSON with the resolution result:

### Success
```json
{
  "status": "RESOLVED",
  "id": "THY-001",
  "type": "DOCUMENT",
  "location": "implementation/theory_framework.md",
  "content": "..."
}
```

### Not Found
```json
{
  "status": "NOT_FOUND",
  "id": "THY-999",
  "error": "No document matching pattern found",
  "searched": ["implementation/theory_*.md"]
}
```

### Not Supported (Framework Source)
```json
{
  "status": "NOT_SUPPORTED",
  "id": "C-1",
  "type": "CONCEPT",
  "error": "Framework source reference - not available in deployed framework",
  "note": "See FW-005 for deployment model."
}
```

### Invalid ID
```json
{
  "status": "INVALID_ID",
  "id": "UNKNOWN-123",
  "error": "ID does not match any known pattern"
}
```

## Error Handling

| Status | Meaning |
|--------|---------|
| `RESOLVED` | Content found and returned |
| `NOT_FOUND` | Valid pattern but no content found |
| `NOT_SUPPORTED` | Framework source reference (F-N, C-N, etc.) |
| `INVALID_ID` | ID doesn't match any known pattern |
| `AMBIGUOUS` | Multiple matches found |
| `EXTERNAL` | URL reference (use WebFetch instead) |

## Framework Grounding

The resolver implements **TMS Retrieval** for runtime artifacts:
- **Directory**: Pattern matching identifies what type of reference
- **Retrieval**: Fetch content from project locations
- **Deployment-aware**: Distinguishes runtime artifacts from framework source

This enables the Context Graph (SH-003) to resolve edges to actual content within a deployed project.
