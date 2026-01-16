#!/bin/bash
# log-observation.sh — Append an observation entry to the observation log
# Part of the Dialogue Framework
# Usage: log-observation.sh <type> <observer> <subject> <value> [context] [tags]

set -euo pipefail

# Use Claude's project directory environment variable
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
LOG_DIR="${PROJECT_ROOT}/.dialogue/logs/observations"

# Validate required arguments
if [[ $# -lt 4 ]]; then
    echo "Usage: log-observation.sh <type> <observer> <subject> <value> [context] [tags]" >&2
    echo "  type:     MEASUREMENT | STATE | EVENT" >&2
    echo "  observer: ai:claude | human:<id>" >&2
    echo "  subject:  Brief description of what was observed" >&2
    echo "  value:    The observed data/state" >&2
    echo "  context:  (optional) Additional context" >&2
    echo "  tags:     (optional) Comma-separated tags" >&2
    exit 1
fi

TYPE="$1"
OBSERVER="$2"
SUBJECT="$3"
VALUE="$4"
CONTEXT="${5:-}"
TAGS="${6:-}"

# Validate type
if [[ "$TYPE" != "MEASUREMENT" && "$TYPE" != "STATE" && "$TYPE" != "EVENT" ]]; then
    echo "Error: type must be MEASUREMENT, STATE, or EVENT" >&2
    exit 1
fi

# Generate timestamp and ID
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ID="OBS-$(date -u +"%Y%m%d-%H%M%S")"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Individual file for this observation
LOG_FILE="${LOG_DIR}/${ID}.yaml"

# Build YAML entry (single file per observation)
{
    echo "id: $ID"
    echo "timestamp: \"$TIMESTAMP\""
    echo "type: $TYPE"
    echo "observer: \"$OBSERVER\""
    echo "subject: \"$SUBJECT\""
    echo "value: \"$VALUE\""
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
} > "$LOG_FILE"

echo "$ID"
