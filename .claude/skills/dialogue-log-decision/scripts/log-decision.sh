#!/bin/bash
# log-decision.sh — Append a decision entry to the decision log
# Part of the AI-Augmented SDLC Framework
# Usage: log-decision.sh <type> <actor> <subject> <outcome> <rationale> [context] [tags]

set -euo pipefail

# Find project root (git root)
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo "Error: Must be run from within a git repository" >&2
    exit 1
}
LOG_FILE="${PROJECT_ROOT}/.dialogue/logs/decisions.yaml"

# Validate required arguments
if [[ $# -lt 5 ]]; then
    echo "Usage: log-decision.sh <type> <actor> <subject> <outcome> <rationale> [context] [tags]" >&2
    echo "  type:      OPERATIONAL | TACTICAL" >&2
    echo "  actor:     ai:claude | human:<id>" >&2
    echo "  subject:   Brief description of what the decision concerns" >&2
    echo "  outcome:   What was decided/done" >&2
    echo "  rationale: Single-line reasoning" >&2
    echo "  context:   (optional) Additional context" >&2
    echo "  tags:      (optional) Comma-separated tags" >&2
    exit 1
fi

TYPE="$1"
ACTOR="$2"
SUBJECT="$3"
OUTCOME="$4"
RATIONALE="$5"
CONTEXT="${6:-}"
TAGS="${7:-}"

# Validate type
if [[ "$TYPE" != "OPERATIONAL" && "$TYPE" != "TACTICAL" ]]; then
    echo "Error: type must be OPERATIONAL or TACTICAL" >&2
    exit 1
fi

# Generate timestamp and ID
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ID="DEC-$(date -u +"%Y%m%d-%H%M%S")"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")"

# Build YAML entry
{
    echo "---"
    echo "id: $ID"
    echo "timestamp: \"$TIMESTAMP\""
    echo "type: $TYPE"
    echo "actor: \"$ACTOR\""
    echo "subject: \"$SUBJECT\""
    echo "outcome: \"$OUTCOME\""
    echo "rationale: \"$RATIONALE\""
    if [[ -n "$CONTEXT" ]]; then
        echo "context: \"$CONTEXT\""
    fi
    if [[ -n "$TAGS" ]]; then
        # Convert comma-separated tags to YAML array
        IFS=',' read -ra TAG_ARRAY <<< "$TAGS"
        printf 'tags: ['
        for i in "${!TAG_ARRAY[@]}"; do
            if [[ $i -gt 0 ]]; then printf ', '; fi
            printf '"%s"' "$(echo "${TAG_ARRAY[$i]}" | xargs)"
        done
        printf ']\n'
    fi
} >> "$LOG_FILE"

echo "$ID"
