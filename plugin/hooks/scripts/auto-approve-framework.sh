#!/bin/bash
# PreToolUse hook: Auto-approve Dialogue Framework scripts
#
# Checks if a Bash command runs an approved framework script and
# auto-approves it to avoid permission prompts for routine logging.
#
# Design: Only approve known-safe framework scripts. Silent for other commands.

set -euo pipefail

# Read JSON input
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // ""')

# Only process Bash tools
if [[ "$TOOL_NAME" != "Bash" ]]; then
    exit 0
fi

# Approved script patterns (relative to CLAUDE_PLUGIN_ROOT)
# These are safe framework operations that don't need user confirmation
APPROVED_PATTERNS=(
    # Logging scripts
    "dialogue-log-decision/scripts/log-decision.sh"
    "dialogue-log-observation/scripts/log-observation.sh"
    # Reference resolver
    "dialogue-resolve-reference/scripts/resolve-reference.sh"
    # ADR creation
    "dialogue-create-adr/scripts/create-adr.sh"
)

# Check if command matches any approved pattern
for pattern in "${APPROVED_PATTERNS[@]}"; do
    if echo "$COMMAND" | grep -qF "$pattern"; then
        # Auto-approve this command
        jq -n --arg reason "Auto-approved framework script: $pattern" '{
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "allow",
                "permissionDecisionReason": $reason
            }
        }'
        exit 0
    fi
done

# Not an approved script - allow normal permission flow
exit 0
