#!/bin/bash
# create-adr.sh — Create an Architecture Decision Record with decision log cross-reference
# Part of the AI-Augmented SDLC Framework
# Usage: create-adr.sh <title> <actor> <context> <decision> <alternatives> <consequences> <rationale> [tags]

set -euo pipefail

# Find project root (git root)
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Error: Must be run from within a git repository" >&2
    exit 1
}

ADR_DIR="${PROJECT_ROOT}/decisions"
LOG_SCRIPT="${PROJECT_ROOT}/.claude/skills/dialogue-log-decision/scripts/log-decision.sh"

# Validate required arguments
if [[ $# -lt 7 ]]; then
    echo "Usage: create-adr.sh <title> <actor> <context> <decision> <alternatives> <consequences> <rationale> [tags]" >&2
    echo "  title:        Short descriptive title" >&2
    echo "  actor:        human:<id> | ai:claude" >&2
    echo "  context:      What issue motivated this decision?" >&2
    echo "  decision:     What change are we making?" >&2
    echo "  alternatives: Alternatives considered with pros/cons" >&2
    echo "  consequences: What becomes easier or harder?" >&2
    echo "  rationale:    Why is this the right choice?" >&2
    echo "  tags:         (optional) Comma-separated tags" >&2
    exit 1
fi

TITLE="$1"
ACTOR="$2"
CONTEXT="$3"
DECISION="$4"
ALTERNATIVES="$5"
CONSEQUENCES="$6"
RATIONALE="$7"
TAGS="${8:-}"

# Ensure decisions directory exists
mkdir -p "$ADR_DIR"

# Determine next ADR number
LAST_ADR=$(ls -1 "$ADR_DIR"/ADR-*.md 2>/dev/null | sed 's/.*ADR-\([0-9]*\).*/\1/' | sort -n | tail -1 || echo "0")
NEXT_NUM=$((LAST_ADR + 1))
ADR_NUM=$(printf "%03d" $NEXT_NUM)

# Slugify title for filename
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')
ADR_ID="ADR-${ADR_NUM}"
ADR_FILE="${ADR_DIR}/${ADR_ID}-${SLUG}.md"

# Get current date
DATE=$(date +"%Y-%m-%d")

# Create ADR file
cat > "$ADR_FILE" << EOF
# ${ADR_ID}: ${TITLE}

Date: ${DATE}
Status: Proposed
Actor: ${ACTOR}

## Context

${CONTEXT}

## Decision

${DECISION}

## Alternatives Considered

${ALTERNATIVES}

## Consequences

${CONSEQUENCES}

## Rationale

${RATIONALE}
EOF

# Output ADR info
echo "${ADR_ID}: ${ADR_FILE}"

# Log cross-reference to decision log
if [[ -x "$LOG_SCRIPT" ]]; then
    DEC_ID=$("$LOG_SCRIPT" "ADR" "$ACTOR" "$TITLE" "Created ${ADR_ID}" "$RATIONALE" "$CONTEXT" "${TAGS:-architecture}" "$ADR_ID")
    echo "${DEC_ID}: Cross-reference logged"
else
    echo "Warning: Could not log cross-reference (log-decision.sh not found or not executable)" >&2
fi
