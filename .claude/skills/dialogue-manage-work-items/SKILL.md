# Skill: Manage Work Items

Manage persistent work items in `.dialogue/work-items.yaml`. This skill provides the schema and guidance for direct YAML editing—no scripts required.

## When to Use

- Creating new work items
- Updating work item status
- Listing or filtering work items
- Archiving completed items
- Adding notes to existing items

## When NOT to Use

- Session-level task tracking → use TodoWrite tool directly
- One-off tasks that don't need cross-session persistence
- Quick operational decisions → just do them

## Approach

Work item management is an **editing problem**, not a scripting problem:

1. Read `.dialogue/work-items.yaml`
2. Understand the schema (below)
3. Edit using the Edit tool
4. Validate changes match schema

## File Location

```
.dialogue/work-items.yaml
```

## Schema Reference

### File Structure

```yaml
version: "1.0"
last_updated: ISO8601            # Update when editing

prefixes:                        # ID prefix definitions
  - prefix: string               # 2-4 uppercase letters
    name: string                 # Human-readable name
    description: string          # Purpose

items:                           # Work items array
  - <WorkItem>
```

### WorkItem Required Fields

| Field | Type | Pattern/Constraints | Example |
|-------|------|---------------------|---------|
| `id` | string | `[A-Z]{2,4}-[0-9]{3}` | `SH-001`, `FW-006` |
| `title` | string | Non-empty, descriptive | `Work Item Management Skill` |
| `status` | enum | See Status Values | `READY` |
| `created` | string | ISO 8601 datetime | `2026-01-14T17:30:00Z` |

### WorkItem Recommended Fields

| Field | Type | Example |
|-------|------|---------|
| `updated` | ISO8601 | `2026-01-14T18:00:00Z` |
| `type` | enum | `CAPABILITY`, `SCHEMA`, `DOCUMENT`, `RESEARCH`, `DEBT`, `DECISION`, `DESIGN` |
| `phase` | integer | `1-7` (SDLC phase) |
| `priority` | enum | `CRITICAL`, `HIGH`, `MEDIUM`, `LOW` |
| `description` | string | Multiline description |
| `objective` | string | Success criteria |
| `rationale` | string | Why this work is needed |

### WorkItem Optional Fields

| Field | Type | Example |
|-------|------|---------|
| `blocked_by` | string[] | `["SH-001", "SH-002"]` |
| `blocks` | string[] | `["SH-003"]` |
| `assigned_to` | string | `human:pid`, `ai:claude` |
| `completed` | ISO8601 | Set when status = COMPLETED |
| `notes` | string | History, context, decisions |

### Status Values and Transitions

| Status | Meaning | Valid Next States |
|--------|---------|-------------------|
| `BACKLOG` | Identified, not ready | READY, CANCELLED |
| `READY` | Ready to start | IN_PROGRESS, BLOCKED, CANCELLED |
| `IN_PROGRESS` | Currently working | COMPLETED, BLOCKED, CANCELLED |
| `BLOCKED` | Cannot proceed | READY, IN_PROGRESS, CANCELLED |
| `COMPLETED` | Finished | (terminal) |
| `CANCELLED` | No longer needed | (terminal) |

### Standard Prefixes

| Prefix | Name | Description |
|--------|------|-------------|
| `SH` | Self-Hosting | Framework self-application work |
| `CD` | Conceptual Debt | Framework concept gaps |
| `FW` | Framework | Core framework development |
| `DOC` | Documentation | Documentation tasks |
| `VAL` | Validation | Validation and testing |

New prefixes must be added to the `prefixes` section before use.

## Operations

### Create New Work Item

1. Read the file to find existing items with same prefix
2. Determine next sequence number (e.g., if FW-005 exists, next is FW-006)
3. Add new item to `items` array with:
   - `id`: Next sequence number
   - `status`: BACKLOG or READY
   - `created`: Current ISO 8601 timestamp
   - All required fields filled
4. Update `last_updated` at file top

**Example addition:**
```yaml
  - id: "FW-007"
    title: "New Feature Implementation"
    status: READY
    created: "2026-01-14T18:00:00Z"
    type: CAPABILITY
    priority: MEDIUM
    description: |
      Implement the new feature...
    objective: "Feature working and tested"
    rationale: "User requested this capability"
```

### Update Work Item Status

1. Find the item by ID
2. Change `status` field
3. Update `updated` timestamp
4. If completing: add `completed` timestamp
5. Add context to `notes`

**Example status update:**
```yaml
# Before
status: IN_PROGRESS
updated: "2026-01-14T12:00:00Z"

# After
status: COMPLETED
updated: "2026-01-14T18:00:00Z"
completed: "2026-01-14T18:00:00Z"
notes: |
  Completed 14 January 2026.
  <details of what was done>
```

### Add Notes

Append to the `notes` field with timestamp:

```yaml
notes: |
  Previous notes here...

  Progress 14 January 2026:
  - New information or context
  - What was discovered or decided
```

### List Work Items

Read the file and filter as needed:
- By status: `status: IN_PROGRESS`
- By prefix: IDs starting with `FW-`
- By priority: `priority: HIGH`
- By blocked status: `blocked_by` is non-empty

## Validation Checklist

Before completing an edit, verify:

- [ ] ID matches pattern `[A-Z]{2,4}-[0-9]{3}`
- [ ] ID prefix is defined in `prefixes` section
- [ ] Status is valid enum value
- [ ] Timestamps are ISO 8601 format
- [ ] If COMPLETED, `completed` timestamp is set
- [ ] `last_updated` at file top is current
- [ ] YAML syntax is valid (proper indentation, quotes where needed)

## Relationship to TodoWrite

| Aspect | TodoWrite | Work Items File |
|--------|-----------|-----------------|
| Scope | Current session | Cross-session |
| Persistence | Session-only | File-based |
| Granularity | Tasks within a work item | Work items themselves |
| Use case | "Do X, then Y, then Z" | "SH-003 tracks Context Graph work" |

**Typical workflow:**
1. Load relevant work items from file at session start
2. Use TodoWrite for session task tracking
3. Update work items file when status changes
4. Record completion notes in work items file

## TMS Alignment

Work items externalise:
- **Directory knowledge**: What work exists, who's assigned
- **Allocation**: What's being worked, what's blocked
- **History**: Notes capture decisions and progress

This enables AI to "rejoin" ongoing work across sessions.
