#!/bin/bash
# check-dialogue-init.sh — Check if project has initialised Dialogue
# Part of the Dialogue Framework plugin
# SessionStart hook

set -euo pipefail

# Use Claude's project directory
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"

DIALOGUE_DIR="${PROJECT_ROOT}/.dialogue"
CONFIG_FILE="${DIALOGUE_DIR}/config.yaml"
WORK_ITEMS_FILE="${DIALOGUE_DIR}/work-items.yaml"

# Check status and output simple systemMessage (CLAUDE.md handles instructions)
if [[ ! -d "$DIALOGUE_DIR" ]]; then
    echo "[dialogue-hook] NOT INITIALISED" >&2
    echo '{"continue": true, "systemMessage": "Dialogue Framework status: NOT INITIALISED"}'
    exit 0
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "[dialogue-hook] PARTIAL" >&2
    echo '{"continue": true, "systemMessage": "Dialogue Framework status: PARTIAL"}'
    exit 0
fi

if [[ -f "$WORK_ITEMS_FILE" ]]; then
    in_progress=$(grep -c "status: IN_PROGRESS" "$WORK_ITEMS_FILE" 2>/dev/null || echo "0")
    ready=$(grep -c "status: READY" "$WORK_ITEMS_FILE" 2>/dev/null || echo "0")
    echo "[dialogue-hook] INITIALISED: ${in_progress} in-progress, ${ready} ready" >&2
    echo "{\"continue\": true, \"systemMessage\": \"Dialogue Framework status: INITIALISED (${in_progress} in-progress, ${ready} ready work items)\"}"
    exit 0
fi

echo "[dialogue-hook] INITIALISED: no work items" >&2
echo '{"continue": true, "systemMessage": "Dialogue Framework status: INITIALISED (no work items)"}'
exit 0
