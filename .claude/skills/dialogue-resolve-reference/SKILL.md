---
name: dialogue-resolve-reference
description: Resolves framework reference IDs to their content. Use when you need to look up a document, decision, observation, work item, or ADR by its ID. Triggers on "resolve reference", "look up THY-001", "find DEC-...", "get content of", "what is ADR-001".
allowed-tools: Bash
---

# Dialogue: Reference Resolver

Resolves framework reference IDs to their content. This skill implements the retrieval operation for the framework's Transactive Memory System.

## When to Use

Use this skill when you need to:
- Look up a document by its ID (THY-001, REF-001, C-1, etc.)
- Find a decision or observation log entry
- Retrieve a work item's details
- Get the content of an ADR

**Do NOT use for:**
- External URLs → use WebFetch
- File paths → use Read tool directly
- Creating new references → use appropriate logging/creation skills

## Dependencies

This skill requires:
- **Git repository** — Script finds project root using git
- **Framework directory structure** — Conventions for locating documents

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

### Documents

| Pattern | Type | Example |
|---------|------|---------|
| `THY-NNN` | Theory | `THY-001` |
| `REF-NNN` | Reference | `REF-001` |
| `STR-NNN` | Strategy | `STR-001` |
| `ADR-NNN` | Architecture Decision Record | `ADR-001` |
| `F-N` | Foundation | `F-1` |
| `C-N` | Concept | `C-1` |
| `I-N` | Integration | `I-1` |
| `G-N` | Guidance | `G-1` |
| `E-N` | Example | `E-1` |

### Log Entries

| Pattern | Type | Example |
|---------|------|---------|
| `DEC-YYYYMMDD-HHMMSS` | Decision | `DEC-20260114-091633` |
| `OBS-YYYYMMDD-HHMMSS` | Observation | `OBS-20260114-094825` |

### Work Items

| Pattern | Type | Example |
|---------|------|---------|
| `SH-NNN` | Self-Hosting | `SH-002` |
| `CD-NNN` | Conceptual Debt | `CD-001` |
| `FW-NNN` | Framework | `FW-003` |

### Actors

| Pattern | Type | Example |
|---------|------|---------|
| `human:<id>` | Human Actor | `human:pidster` |
| `ai:<id>` | AI Actor | `ai:claude` |

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
  "searched": ["implementation/theory_thy-999*.md"]
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
| `INVALID_ID` | ID doesn't match any known pattern |
| `AMBIGUOUS` | Multiple matches found |
| `EXTERNAL` | URL reference (use WebFetch instead) |

## Framework Grounding

The resolver implements **TMS Retrieval**:
- **Directory**: Pattern matching identifies what type of reference
- **Retrieval**: Fetch content from appropriate location
- **Location-agnostic**: Same ID works regardless of storage backend

This enables the Context Graph (SH-003) to resolve edges to actual content.
