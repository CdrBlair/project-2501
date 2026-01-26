#!/bin/bash
# session-start-guided.sh — Guided variant: mode-aware operating instructions
# Part of the Dialogue Framework plugin
# SessionStart hook - GUIDED APPROACH with interaction mode support
#
# Reads interaction_mode from config.yaml and user session-memo.
# Adapts output verbosity: human-led (minimal), partnership (balanced), ai-led (verbose)

set -euo pipefail

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"

DIALOGUE_DIR="${PROJECT_ROOT}/.dialogue"
CONFIG_FILE="${DIALOGUE_DIR}/config.yaml"
TASKS_DIR="${DIALOGUE_DIR}/tasks"

# ANSI color codes
BOLD=$'\033[1m'
BOLD_GREEN=$'\033[1;32m'
BOLD_CYAN=$'\033[1;36m'
RED=$'\033[31m'
BLUE=$'\033[34m'
RESET=$'\033[0m'

# Check initialisation
if [[ ! -d "$DIALOGUE_DIR" ]] || [[ ! -f "$CONFIG_FILE" ]]; then
    # Not initialised - use minimal message, CLAUDE.md handles init guidance
    if [[ ! -d "$DIALOGUE_DIR" ]]; then
        echo "{\"continue\": true, \"systemMessage\": \"${BLUE}Dialogue Framework: NOT INITIALISED.${RESET} Use /init-dialogue to set up.\"}"
    else
        echo "{\"continue\": true, \"systemMessage\": \"${RED}Dialogue Framework: PARTIAL.${RESET} Missing config.yaml.\"}"
    fi
    exit 0
fi

# Read interaction_mode from config.yaml (default: partnership)
INTERACTION_MODE="partnership"
if [[ -f "$CONFIG_FILE" ]]; then
    mode=$(grep -m1 "^interaction_mode:" "$CONFIG_FILE" 2>/dev/null | awk '{print $2}' | tr -d '"' || echo "")
    if [[ -n "$mode" ]]; then
        INTERACTION_MODE="$mode"
    fi
fi

# Detect team mode (FW-040)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEAM_MODE="solo"
if [[ -x "${SCRIPT_DIR}/detect-team-mode.sh" ]]; then
    TEAM_MODE=$("${SCRIPT_DIR}/detect-team-mode.sh" 2>/dev/null || echo "solo")
fi
export DIALOGUE_TEAM_MODE="$TEAM_MODE"

# Check for user preference in session-memo (overrides project config)
USERNAME="${USER:-$(whoami)}"
# Session memo naming: solo mode uses single file, team mode uses per-user files (FW-040)
if [[ "$TEAM_MODE" == "team" ]]; then
    SESSION_MEMO="${DIALOGUE_DIR}/session-memo-${USERNAME}.yaml"
else
    SESSION_MEMO="${DIALOGUE_DIR}/session-memo.yaml"
fi
if [[ -f "$SESSION_MEMO" ]]; then
    user_pref=$(grep -m1 "^interaction_mode_preference:" "$SESSION_MEMO" 2>/dev/null | awk '{print $2}' | tr -d '"' || echo "")
    if [[ -n "$user_pref" ]]; then
        INTERACTION_MODE="$user_pref"
    fi
fi

# Register user if not already registered (FW-043)
# Only in team mode - solo mode skips user registration overhead (FW-040)
if [[ "$TEAM_MODE" == "team" ]]; then
    USERS_DIR="${DIALOGUE_DIR}/users"
    USER_FILE="${USERS_DIR}/${USERNAME}.yaml"
    if [[ ! -f "$USER_FILE" ]]; then
        # Create users directory if needed
        mkdir -p "$USERS_DIR"
        # Register user with first-seen timestamp
        cat > "$USER_FILE" << EOF
# Dialogue Framework user registration
username: "${USERNAME}"
registered: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
last_seen: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
EOF
        echo "[dialogue-hook] Registered new user: ${USERNAME}" >&2
    else
        # Update last_seen timestamp (non-blocking, ignore errors)
        if command -v sed &>/dev/null; then
            sed -i.bak "s/^last_seen:.*/last_seen: \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"/" "$USER_FILE" 2>/dev/null || true
            rm -f "${USER_FILE}.bak" 2>/dev/null || true
        fi
    fi
fi

# Git sync check for team mode (FW-040)
GIT_SYNC_WARNING=""
if [[ "$TEAM_MODE" == "team" ]] && [[ -x "${SCRIPT_DIR}/check-git-sync.sh" ]]; then
    SYNC_STATUS=$("${SCRIPT_DIR}/check-git-sync.sh" --quiet 2>/dev/null || echo "synced")
    case "$SYNC_STATUS" in
        behind)
            GIT_SYNC_WARNING="${RED}Warning:${RESET} Local branch is behind remote. Consider pulling latest changes."
            ;;
        diverged)
            GIT_SYNC_WARNING="${RED}Warning:${RESET} Local and remote have diverged. Merge or rebase recommended."
            ;;
    esac
fi

# Count tasks
in_progress=0
ready=0
in_progress_list=""
ready_list=""

## Scan task files for statuses
if [[ -d "$TASKS_DIR" ]] && [[ -n "$(ls -A "$TASKS_DIR" 2>/dev/null)" ]]; then
    for task_file in "$TASKS_DIR"/*.yaml; do
        [[ -f "$task_file" ]] || continue
        status=$(grep -m1 "^status:" "$task_file" 2>/dev/null | awk '{print $2}' || echo "")
        if [[ "$status" == "IN_PROGRESS" ]]; then
            ((in_progress++))
            id=$(grep -m1 "^id:" "$task_file" | awk '{print $2}' | tr -d '"')
            [[ $in_progress -le 3 ]] && in_progress_list+="${id} "
        elif [[ "$status" == "READY" ]]; then
            ((ready++))
            if [[ $ready -le 2 ]]; then
                id=$(grep -m1 "^id:" "$task_file" | awk '{print $2}' | tr -d '"')
                ready_list+="${id} "
            fi
        fi
    done
fi

# Build task status string
task_status="Tasks: ${BOLD}${in_progress} in-progress${RESET}"
if [[ -n "$in_progress_list" ]]; then
    task_status+=" [${BOLD_CYAN}${in_progress_list% }${RESET}]"
fi
task_status+=", ${BOLD}${ready}${RESET} ready"

# Build system message based on interaction mode
case "$INTERACTION_MODE" in
    "human-led")
        # Minimal: status only
        system_msg="${BOLD_GREEN}Dialogue active.${RESET} ${task_status}"
        # Add git sync warning in team mode
        if [[ -n "$GIT_SYNC_WARNING" ]]; then
            system_msg+=$'\n'"$GIT_SYNC_WARNING"
        fi
        ;;

    "ai-led")
        # Verbose: status + instructions + recommendations
        read -r -d '' INSTRUCTIONS << EOF || true
${BOLD_GREEN}Dialogue Framework is active.${RESET}

OPERATING INSTRUCTIONS:
1. Log decisions: Use dialogue-log-decision skill when choices are made
2. Log observations: Use dialogue-log-observation skill for findings
3. Track work: Use dialogue-manage-tasks skill for all work & task management
4. All other actions: Consult claude-plugin-evo/references/framework-manual.md

${task_status}
EOF
        # Add recommendation if there are ready tasks
        if [[ $ready -gt 0 ]] && [[ -n "$ready_list" ]]; then
            INSTRUCTIONS+=$'\n\n'"${BOLD}Suggestion:${RESET} Consider starting with ${BOLD_CYAN}${ready_list% }${RESET}"
        fi
        # Add git sync warning in team mode
        if [[ -n "$GIT_SYNC_WARNING" ]]; then
            INSTRUCTIONS+=$'\n\n'"$GIT_SYNC_WARNING"
        fi
        # Add team collaboration hint in team mode
        if [[ "$TEAM_MODE" == "team" ]]; then
            INSTRUCTIONS+=$'\n'"${BOLD}Team mode:${RESET} Remember to commit and push changes for team visibility."
        fi
        system_msg="${INSTRUCTIONS}"
        ;;

    *)
        # partnership (default): status + hint
        read -r -d '' INSTRUCTIONS << EOF || true
${BOLD_GREEN}Dialogue Framework is active.${RESET}

OPERATING INSTRUCTIONS:
1. Log decisions: Use dialogue-log-decision skill when choices are made
2. Log observations: Use dialogue-log-observation skill for findings
3. Track work: Use dialogue-manage-tasks skill for all work & task management
4. All other actions: Consult claude-plugin-evo/references/framework-manual.md

${task_status}
EOF
        system_msg="${INSTRUCTIONS}"$'\n'"Type ${BOLD}/help skills${RESET} to see available capabilities."
        # Add git sync warning in team mode
        if [[ -n "$GIT_SYNC_WARNING" ]]; then
            system_msg+=$'\n\n'"$GIT_SYNC_WARNING"
        fi
        # Add team collaboration hint in team mode
        if [[ "$TEAM_MODE" == "team" ]]; then
            system_msg+=$'\n'"${BOLD}Team mode:${RESET} Commit and push changes for team visibility."
        fi
        ;;
esac

# Escape for JSON (newlines to \n)
system_msg_escaped=$(echo "$system_msg" | jq -Rs '.')

echo "{\"continue\": true, \"systemMessage\": ${system_msg_escaped}}"
exit 0
