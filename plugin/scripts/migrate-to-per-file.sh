#!/bin/bash
# migrate-to-per-file.sh — Migrate from single-file to per-file artifact structure
# Part of the Dialogue Framework (FW-017)
#
# This script migrates:
# - .dialogue/logs/decisions.yaml → .dialogue/logs/decisions/*.yaml
# - .dialogue/logs/observations.yaml → .dialogue/logs/observations/*.yaml
# - .dialogue/tasks.yaml → .dialogue/tasks/*.yaml
#
# Usage: migrate-to-per-file.sh [--dry-run]

set -euo pipefail

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
DIALOGUE_DIR="${PROJECT_ROOT}/.dialogue"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "=== DRY RUN MODE ==="
fi

# Helper to split YAML stream (--- delimited) into individual files
# Handles duplicate IDs by appending to same file (multiple YAML docs)
split_yaml_stream() {
    local input_file="$1"
    local output_dir="$2"
    local id_field="$3"  # e.g., "id" to extract ID from "id: DEC-..."

    if [[ ! -f "$input_file" ]]; then
        echo "  Skipping: $input_file does not exist"
        return 0
    fi

    echo "  Processing: $input_file"

    mkdir -p "$output_dir"

    local count=0
    local current_entry=""
    local current_id=""
    local seen_ids=""  # Space-separated list of seen IDs for dry run

    while IFS= read -r line || [[ -n "$line" ]]; do
        if [[ "$line" == "---" ]]; then
            # Write previous entry if exists
            if [[ -n "$current_id" && -n "$current_entry" ]]; then
                local output_file="${output_dir}/${current_id}.yaml"
                local is_duplicate=false

                # Check if duplicate (file exists or seen in dry run)
                if [[ -f "$output_file" ]] || echo "$seen_ids" | grep -q " ${current_id} "; then
                    is_duplicate=true
                fi
                seen_ids="$seen_ids ${current_id} "

                if [[ "$DRY_RUN" == true ]]; then
                    if [[ "$is_duplicate" == false ]]; then
                        echo "    Would create: $output_file"
                    else
                        echo "    Would append to: $output_file (duplicate)"
                    fi
                else
                    if [[ "$is_duplicate" == false ]]; then
                        # First occurrence - create new file
                        echo "$current_entry" > "$output_file"
                    else
                        # Duplicate - append with separator
                        printf '\n---\n%s' "$current_entry" >> "$output_file"
                    fi
                fi
                ((count++))
            fi
            current_entry=""
            current_id=""
        else
            # Append line to current entry
            if [[ -n "$current_entry" ]]; then
                current_entry+=$'\n'"$line"
            else
                current_entry="$line"
            fi
            # Extract ID if this is the id line
            if [[ "$line" =~ ^${id_field}:\ *(.+)$ ]]; then
                current_id="${BASH_REMATCH[1]}"
                current_id="${current_id//\"/}"  # Remove quotes
            fi
        fi
    done < "$input_file"

    # Write last entry
    if [[ -n "$current_id" && -n "$current_entry" ]]; then
        local output_file="${output_dir}/${current_id}.yaml"
        local is_duplicate=false

        if [[ -f "$output_file" ]] || echo "$seen_ids" | grep -q " ${current_id} "; then
            is_duplicate=true
        fi

        if [[ "$DRY_RUN" == true ]]; then
            if [[ "$is_duplicate" == false ]]; then
                echo "    Would create: $output_file"
            else
                echo "    Would append to: $output_file (duplicate)"
            fi
        else
            if [[ "$is_duplicate" == false ]]; then
                echo "$current_entry" > "$output_file"
            else
                printf '\n---\n%s' "$current_entry" >> "$output_file"
            fi
        fi
        ((count++))
    fi

    echo "  Migrated $count entries"

    # Archive original file
    if [[ "$DRY_RUN" != true && $count -gt 0 ]]; then
        mv "$input_file" "${input_file}.migrated"
        echo "  Archived original to ${input_file}.migrated"
    fi
}

# Migrate tasks.yaml - more complex structure (list of tasks)
migrate_tasks() {
    local input_file="${DIALOGUE_DIR}/tasks.yaml"
    local output_dir="${DIALOGUE_DIR}/tasks"

    if [[ ! -f "$input_file" ]]; then
        echo "  Skipping: $input_file does not exist"
        return 0
    fi

    echo "  Processing: $input_file"

    mkdir -p "$output_dir"

    # Use awk to split tasks - each task starts with "  - id:"
    local count=0
    local current_task=""
    local current_id=""
    local in_task=false

    while IFS= read -r line || [[ -n "$line" ]]; do
        # Detect start of new task
        if [[ "$line" =~ ^[[:space:]]*-[[:space:]]*id:[[:space:]]*\"?([^\"]+)\"? ]]; then
            # Write previous task if exists
            if [[ -n "$current_id" && -n "$current_task" ]]; then
                local output_file="${output_dir}/${current_id}.yaml"
                if [[ "$DRY_RUN" == true ]]; then
                    echo "    Would create: $output_file"
                else
                    # Remove leading indentation and "- " prefix, output as standalone YAML
                    echo "$current_task" | sed 's/^  - //' | sed 's/^    //' > "$output_file"
                fi
                ((count++))
            fi
            current_id="${BASH_REMATCH[1]}"
            current_task="$line"
            in_task=true
        elif [[ "$in_task" == true ]]; then
            # Skip the "tasks:" header line
            if [[ "$line" == "tasks:" ]]; then
                continue
            fi
            current_task+=$'\n'"$line"
        fi
    done < "$input_file"

    # Write last task
    if [[ -n "$current_id" && -n "$current_task" ]]; then
        local output_file="${output_dir}/${current_id}.yaml"
        if [[ "$DRY_RUN" == true ]]; then
            echo "    Would create: $output_file"
        else
            echo "$current_task" | sed 's/^  - //' | sed 's/^    //' > "$output_file"
        fi
        ((count++))
    fi

    echo "  Migrated $count tasks"

    # Archive original file
    if [[ "$DRY_RUN" != true && $count -gt 0 ]]; then
        mv "$input_file" "${input_file}.migrated"
        echo "  Archived original to ${input_file}.migrated"
    fi
}

echo "=== Dialogue Framework Migration: Per-File Structure ==="
echo "Project root: $PROJECT_ROOT"
echo ""

echo "1. Migrating decisions..."
split_yaml_stream "${DIALOGUE_DIR}/logs/decisions.yaml" "${DIALOGUE_DIR}/logs/decisions" "id"
echo ""

echo "2. Migrating observations..."
split_yaml_stream "${DIALOGUE_DIR}/logs/observations.yaml" "${DIALOGUE_DIR}/logs/observations" "id"
echo ""

echo "3. Migrating tasks..."
migrate_tasks
echo ""

echo "=== Migration complete ==="
if [[ "$DRY_RUN" == true ]]; then
    echo "This was a dry run. Run without --dry-run to perform migration."
fi
