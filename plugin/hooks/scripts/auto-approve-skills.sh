#!/bin/bash
# PreToolUse hook: Auto-approve Dialogue Framework skills
#
# Checks if a Skill tool invocation is for a dialogue-framework skill
# and auto-approves it to avoid permission prompts.
#
# Design: Only approve skills from the dialogue-framework plugin.

set -euo pipefail

# Read JSON input
INPUT=$(cat)
TOOL_NAME=$(echo "$INPUT" | jq -r '.tool_name // ""')
SKILL_NAME=$(echo "$INPUT" | jq -r '.tool_input.skill // ""')

# Only process Skill tools
if [[ "$TOOL_NAME" != "Skill" ]]; then
    exit 0
fi

# Auto-approve dialogue-framework skills
if [[ "$SKILL_NAME" == dialogue-framework:* ]] || [[ "$SKILL_NAME" == "dialogue-"* ]]; then
    jq -n --arg skill "$SKILL_NAME" '{
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "allow",
            "permissionDecisionReason": ("Auto-approved dialogue-framework skill: " + $skill)
        }
    }'
    exit 0
fi

# Not a dialogue-framework skill - allow normal permission flow
exit 0
