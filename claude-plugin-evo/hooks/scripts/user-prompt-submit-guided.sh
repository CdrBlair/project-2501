#!/bin/bash
# user-prompt-submit-guided.sh — Guided variant: directive instructions not just signals
# Part of the Dialogue Framework plugin
# UserPromptSubmit hook - GUIDED APPROACH
#
# Difference from baseline: Outputs explicit action instructions,
# not just signal tags that Claude must interpret.

set -euo pipefail

INPUT=$(cat)
PROMPT=$(echo "$INPUT" | jq -r '.prompt // ""')

if [[ -z "$PROMPT" ]]; then
    exit 0
fi

PROMPT_LOWER=$(echo "$PROMPT" | tr '[:upper:]' '[:lower:]')
INSTRUCTIONS=""

# Decision indicators → directive instruction
if echo "$PROMPT_LOWER" | grep -qE "(i decided|let'?s go with|decision is|i chose|we'?ll use|going with|decided to|make a decision)"; then
    INSTRUCTIONS+="DECISION DETECTED: After responding, use the dialogue-log-decision skill to record this decision with rationale. "
fi

# Observation indicators → directive instruction
if echo "$PROMPT_LOWER" | grep -qE "(i noticed|i observed|here'?s an observation|worth noting|i see that|observation:|noticed that)"; then
    INSTRUCTIONS+="OBSERVATION DETECTED: After responding, use the dialogue-log-observation skill to record this finding. "
fi

# Task operations without ID → directive instruction for skill use
if echo "$PROMPT_LOWER" | grep -qE "(list|show|display)\s*(open\s*)?(tasks?|work\s*items?)"; then
    INSTRUCTIONS+="TASK OPERATION: MUST use dialogue-manage-tasks skill to list tasks. Do NOT run scripts directly via Bash. "
elif echo "$PROMPT_LOWER" | grep -qE "(create|add|new)\s*(a\s*)?(task|work\s*item)"; then
    INSTRUCTIONS+="TASK OPERATION: MUST use dialogue-manage-tasks skill to create task. Do NOT write task files directly. "
fi

# Task references with ID → directive instruction
if echo "$PROMPT" | grep -qiE "\b(SH|FW|CD|DOC|VAL)-[0-9]{3}\b"; then
    TASK_ID=$(echo "$PROMPT" | grep -oiE "\b(SH|FW|CD|DOC|VAL)-[0-9]{3}\b" | head -1)
    # Check for update/status change verbs
    if echo "$PROMPT_LOWER" | grep -qE "(start|begin|work)\s*(on|with)?|update|complete|finish|done|mark\s*(as)?"; then
        INSTRUCTIONS+="TASK UPDATE: MUST use dialogue-manage-tasks skill to update ${TASK_ID} status. Do NOT edit task files directly. "
    else
        INSTRUCTIONS+="TASK REFERENCE: Use dialogue-manage-tasks skill to resolve ${TASK_ID} context. "
    fi
fi

# Reference resolution → directive instruction
if echo "$PROMPT" | grep -qiE "\b(THY|REF|STR|ADR)-[0-9]{3}\b"; then
    REF_ID=$(echo "$PROMPT" | grep -oiE "\b(THY|REF|STR|ADR)-[0-9]{3}\b" | head -1)
    INSTRUCTIONS+="REFERENCE: Resolve ${REF_ID} using dialogue-resolve-reference skill. "
fi
if echo "$PROMPT" | grep -qE "\b(DEC|OBS)-[0-9]{8}-[0-9]{6}\b"; then
    REF_ID=$(echo "$PROMPT" | grep -oE "\b(DEC|OBS)-[0-9]{8}-[0-9]{6}\b" | head -1)
    INSTRUCTIONS+="REFERENCE: Resolve ${REF_ID} using dialogue-resolve-reference skill. "
fi

# Phase indicators → directive instruction
if echo "$PROMPT_LOWER" | grep -qE "(phase\s*1|initiation|opportunity|stakeholder)"; then
    INSTRUCTIONS+="PHASE 1 CONTEXT: Apply Phase 1 guidance from framework-manual.md (tacit-heavy, human-led). "
elif echo "$PROMPT_LOWER" | grep -qE "(phase\s*2|planning|estimate|schedule)"; then
    INSTRUCTIONS+="PHASE 2 CONTEXT: Apply Phase 2 guidance from framework-manual.md. "
elif echo "$PROMPT_LOWER" | grep -qE "(phase\s*3|requirements?|specification)"; then
    INSTRUCTIONS+="PHASE 3 CONTEXT: Apply Phase 3 guidance from framework-manual.md. "
elif echo "$PROMPT_LOWER" | grep -qE "(phase\s*4|design|architecture)"; then
    INSTRUCTIONS+="PHASE 4 CONTEXT: Apply Phase 4 guidance from framework-manual.md. "
elif echo "$PROMPT_LOWER" | grep -qE "(phase\s*5|implement|coding|develop)"; then
    INSTRUCTIONS+="PHASE 5 CONTEXT: Apply Phase 5 guidance from framework-manual.md. "
fi

# ADR creation → directive instruction
if echo "$PROMPT_LOWER" | grep -qE "(create|write|draft).*(adr|architecture decision)"; then
    INSTRUCTIONS+="ADR REQUEST: Use dialogue-create-adr skill for formal architecture decision record. "
fi

# Task candidate → directive instruction with triage guidance
if ! echo "$PROMPT" | grep -qiE "\b(SH|FW|CD)-[0-9]{3}\b"; then
    if echo "$PROMPT_LOWER" | grep -qE "(implement|build|develop|create).*(feature|capability|system|component|integration|module|service|api|framework|plugin)"; then
        INSTRUCTIONS+="TASK CANDIDATE: Consider whether this needs persistent tracking via dialogue-manage-tasks (multi-session work) or TodoWrite (session-only). "
    elif echo "$PROMPT_LOWER" | grep -qE "(investigate|research|explore|analy[sz]e|understand).*(how|why|what|whether|if|issue|problem|approach|option)"; then
        INSTRUCTIONS+="TASK CANDIDATE: Consider whether this needs persistent tracking via dialogue-manage-tasks (multi-session work) or TodoWrite (session-only). "
    elif echo "$PROMPT_LOWER" | grep -qE "(design|architect|plan|prototype).*(system|component|approach|solution|integration|interface)"; then
        INSTRUCTIONS+="TASK CANDIDATE: Consider whether this needs persistent tracking via dialogue-manage-tasks (multi-session work) or TodoWrite (session-only). "
    fi
fi

# Trim
INSTRUCTIONS=$(echo "$INSTRUCTIONS" | xargs)

if [[ -z "$INSTRUCTIONS" ]]; then
    exit 0
fi

# Output directive instructions (not just tags)
jq -n --arg instructions "$INSTRUCTIONS" '{
    "hookSpecificOutput": {
        "hookEventName": "UserPromptSubmit",
        "additionalContext": "<dialogue-instruction>\($instructions)</dialogue-instruction>"
    }
}'
