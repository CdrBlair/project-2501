#!/bin/bash
# shellcheck shell=bash
# resolve-reference.sh — Resolve framework reference IDs to content
# Part of the AI-Augmented SDLC Framework
# Usage: resolve-reference.sh <id> [output_format]

set -euo pipefail

# Find project root (git root)
PROJECT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || {
    echo '{"status": "ERROR", "error": "Must be run from within a git repository"}' >&2
    exit 1
}

# Validate required arguments
if [[ $# -lt 1 ]]; then
    echo "Usage: resolve-reference.sh <id> [output_format]" >&2
    echo "  id:            Reference ID (e.g., THY-001, DEC-20260114-091633)" >&2
    echo "  output_format: full | metadata | path (default: full)" >&2
    exit 1
fi

ID="$1"
OUTPUT_FORMAT="${2:-full}"

# Validate output format
if [[ "$OUTPUT_FORMAT" != "full" && "$OUTPUT_FORMAT" != "metadata" && "$OUTPUT_FORMAT" != "path" ]]; then
    echo '{"status": "ERROR", "error": "output_format must be full, metadata, or path"}' >&2
    exit 1
fi

# Helper: JSON escape string
json_escape() {
    local s="$1"
    s="${s//\\/\\\\}"
    s="${s//\"/\\\"}"
    s="${s//$'\n'/\\n}"
    s="${s//$'\r'/\\r}"
    s="${s//$'\t'/\\t}"
    printf '%s' "$s"
}

# Helper: Output success result
output_success() {
    local id="$1"
    local type="$2"
    local location="$3"
    local content="${4:-}"

    if [[ "$OUTPUT_FORMAT" == "path" ]]; then
        echo "$location"
        return
    fi

    local escaped_content
    escaped_content=$(json_escape "$content")

    if [[ "$OUTPUT_FORMAT" == "metadata" ]]; then
        cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "$type",
  "location": "$location"
}
EOF
    else
        cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "$type",
  "location": "$location",
  "content": "$escaped_content"
}
EOF
    fi
}

# Helper: Output not found result
output_not_found() {
    local id="$1"
    local type="$2"
    local searched="$3"

    cat <<EOF
{
  "status": "NOT_FOUND",
  "id": "$id",
  "type": "$type",
  "error": "No content matching pattern found",
  "searched": $searched
}
EOF
}

# Helper: Output invalid ID result
output_invalid_id() {
    local id="$1"

    cat <<EOF
{
  "status": "INVALID_ID",
  "id": "$id",
  "error": "ID does not match any known pattern",
  "known_patterns": [
    "THY-NNN: Theory documents",
    "REF-NNN: Reference documents",
    "STR-NNN: Strategy documents",
    "ADR-NNN: Architecture Decision Records",
    "F-N, C-N, I-N, G-N, E-N: Concept documents",
    "DEC-YYYYMMDD-HHMMSS: Decision log entries",
    "OBS-YYYYMMDD-HHMMSS: Observation log entries",
    "SH-NNN, CD-NNN, FW-NNN: Work items",
    "human:<id>, ai:<id>: Actors"
  ]
}
EOF
}

# Helper: Extract YAML entry by ID from a file
extract_yaml_entry() {
    local file="$1"
    local id="$2"

    if [[ ! -f "$file" ]]; then
        return 1
    fi

    # Use awk to extract the entry block
    awk -v id="$id" '
        /^---$/ { in_entry=0; buffer="" }
        /^- id:/ {
            if ($0 ~ "\"" id "\"" || $0 ~ id) {
                in_entry=1
            }
        }
        /^  id:/ {
            if ($0 ~ "\"" id "\"" || $0 ~ id) {
                in_entry=1
            }
        }
        in_entry { buffer = buffer $0 "\n" }
        /^---$/ && in_entry { print buffer; exit }
        END { if (in_entry) print buffer }
    ' "$file"
}

# Helper: Extract YAML entry from work items
extract_work_item() {
    local file="$1"
    local id="$2"

    if [[ ! -f "$file" ]]; then
        return 1
    fi

    # Use awk to find and extract the work item
    awk -v id="$id" '
        BEGIN { found=0; depth=0 }
        /^  - id:/ {
            if ($0 ~ "\"" id "\"") {
                found=1
                depth=1
                print
                next
            }
        }
        found && /^  - id:/ { found=0 }
        found && /^[^ ]/ { found=0 }
        found { print }
    ' "$file"
}

# Resolve based on ID pattern
resolve_id() {
    local id="$1"

    # Check for external URLs first
    if [[ "$id" =~ ^https?:// ]]; then
        cat <<EOF
{
  "status": "EXTERNAL",
  "id": "$id",
  "type": "URL",
  "note": "External URLs are not resolved; use WebFetch"
}
EOF
        return
    fi

    # Actor references
    if [[ "$id" =~ ^human:([a-zA-Z0-9_-]+)$ ]]; then
        local actor_id="${BASH_REMATCH[1]}"
        cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "ACTOR_HUMAN",
  "metadata": {
    "actor_type": "human",
    "identifier": "$actor_id"
  },
  "note": "Actor references resolve to metadata only"
}
EOF
        return
    fi

    if [[ "$id" =~ ^ai:([a-zA-Z0-9_-]+)$ ]]; then
        local actor_id="${BASH_REMATCH[1]}"
        cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "ACTOR_AI",
  "metadata": {
    "actor_type": "ai",
    "identifier": "$actor_id"
  },
  "note": "Actor references resolve to metadata only"
}
EOF
        return
    fi

    # Theory documents: THY-NNN
    if [[ "$id" =~ ^THY-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="implementation/theory_*.md"
        local search_glob="$PROJECT_ROOT/$pattern"

        # Look for file containing THY-NNN in content or matching pattern
        local found_file=""
        while IFS= read -r -d '' file; do
            if grep -q "^# THY-$num:" "$file" 2>/dev/null || \
               grep -q "THY-$num" "$file" 2>/dev/null; then
                found_file="$file"
                break
            fi
        done < <(find "$PROJECT_ROOT/implementation" -name "theory_*.md" -print0 2>/dev/null)

        if [[ -n "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern\"]"
        fi
        return
    fi

    # Reference documents: REF-NNN
    if [[ "$id" =~ ^REF-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="implementation/ref_*.md"

        local found_file=""
        while IFS= read -r -d '' file; do
            if grep -q "^# REF-$num:" "$file" 2>/dev/null || \
               grep -q "REF-$num" "$file" 2>/dev/null; then
                found_file="$file"
                break
            fi
        done < <(find "$PROJECT_ROOT/implementation" -name "ref_*.md" -print0 2>/dev/null)

        if [[ -n "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern\"]"
        fi
        return
    fi

    # Strategy documents: STR-NNN
    if [[ "$id" =~ ^STR-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="implementation/str_*.md"

        local found_file=""
        while IFS= read -r -d '' file; do
            if grep -q "^# STR-$num:" "$file" 2>/dev/null || \
               grep -q "STR-$num" "$file" 2>/dev/null; then
                found_file="$file"
                break
            fi
        done < <(find "$PROJECT_ROOT/implementation" -name "str_*.md" -print0 2>/dev/null)

        if [[ -n "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern\"]"
        fi
        return
    fi

    # ADR documents: ADR-NNN
    if [[ "$id" =~ ^ADR-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local padded_num
        padded_num=$(printf "%03d" "$num")
        local pattern="decisions/ADR-$padded_num-*.md"

        local found_file=""
        if compgen -G "$PROJECT_ROOT/decisions/ADR-$padded_num-*.md" > /dev/null 2>&1; then
            found_file=$(ls -1 "$PROJECT_ROOT/decisions/ADR-$padded_num-"*.md 2>/dev/null | head -1)
        fi

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "ADR" "$rel_path" "$content"
        else
            output_not_found "$id" "ADR" "[\"$pattern\"]"
        fi
        return
    fi

    # Foundation documents: F-N
    if [[ "$id" =~ ^F-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="concepts/foundation_*.md"

        # Get Nth foundation file (1-indexed) - portable approach
        local found_file=""
        found_file=$(find "$PROJECT_ROOT/concepts" -name "foundation_*.md" -print 2>/dev/null | sort | sed -n "${num}p")

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern (index $num)\"]"
        fi
        return
    fi

    # Concept documents: C-N
    if [[ "$id" =~ ^C-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="concepts/concept_*.md"

        local found_file=""
        found_file=$(find "$PROJECT_ROOT/concepts" -name "concept_*.md" -print 2>/dev/null | sort | sed -n "${num}p")

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern (index $num)\"]"
        fi
        return
    fi

    # Integration documents: I-N
    if [[ "$id" =~ ^I-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="concepts/integration_*.md"

        local found_file=""
        found_file=$(find "$PROJECT_ROOT/concepts" -name "integration_*.md" -print 2>/dev/null | sort | sed -n "${num}p")

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern (index $num)\"]"
        fi
        return
    fi

    # Guidance documents: G-N
    if [[ "$id" =~ ^G-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="concepts/guidance_*.md"

        local found_file=""
        found_file=$(find "$PROJECT_ROOT/concepts" -name "guidance_*.md" -print 2>/dev/null | sort | sed -n "${num}p")

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern (index $num)\"]"
        fi
        return
    fi

    # Example documents: E-N
    if [[ "$id" =~ ^E-([0-9]+)$ ]]; then
        local num="${BASH_REMATCH[1]}"
        local pattern="concepts/example_*.md"

        local found_file=""
        found_file=$(find "$PROJECT_ROOT/concepts" -name "example_*.md" -print 2>/dev/null | sort | sed -n "${num}p")

        if [[ -n "$found_file" && -f "$found_file" ]]; then
            local rel_path="${found_file#$PROJECT_ROOT/}"
            local content
            content=$(cat "$found_file")
            output_success "$id" "DOCUMENT" "$rel_path" "$content"
        else
            output_not_found "$id" "DOCUMENT" "[\"$pattern (index $num)\"]"
        fi
        return
    fi

    # Decision log entries: DEC-YYYYMMDD-HHMMSS
    if [[ "$id" =~ ^DEC-[0-9]{8}-[0-9]{6}$ ]]; then
        local log_file="$PROJECT_ROOT/.dialogue/logs/decisions.yaml"

        if [[ ! -f "$log_file" ]]; then
            output_not_found "$id" "DECISION" "[\".dialogue/logs/decisions.yaml\"]"
            return
        fi

        # Extract the entry using awk (YAML stream format: entries separated by ---)
        local entry
        entry=$(awk -v id="$id" '
            /^---$/ { if (found) exit; in_entry=0; next }
            /^id:/ { if (index($0, id) > 0) { found=1; in_entry=1 } }
            in_entry { print }
        ' "$log_file")

        if [[ -n "$entry" ]]; then
            local escaped_entry
            escaped_entry=$(json_escape "$entry")
            if [[ "$OUTPUT_FORMAT" == "path" ]]; then
                echo ".dialogue/logs/decisions.yaml#$id"
            elif [[ "$OUTPUT_FORMAT" == "metadata" ]]; then
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "DECISION",
  "location": ".dialogue/logs/decisions.yaml#$id"
}
EOF
            else
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "DECISION",
  "location": ".dialogue/logs/decisions.yaml#$id",
  "content": "$escaped_entry"
}
EOF
            fi
        else
            output_not_found "$id" "DECISION" "[\".dialogue/logs/decisions.yaml\"]"
        fi
        return
    fi

    # Observation log entries: OBS-YYYYMMDD-HHMMSS
    if [[ "$id" =~ ^OBS-[0-9]{8}-[0-9]{6}$ ]]; then
        local log_file="$PROJECT_ROOT/.dialogue/logs/observations.yaml"

        if [[ ! -f "$log_file" ]]; then
            output_not_found "$id" "OBSERVATION" "[\".dialogue/logs/observations.yaml\"]"
            return
        fi

        # Extract the entry using awk (YAML stream format: entries separated by ---)
        local entry
        entry=$(awk -v id="$id" '
            /^---$/ { if (found) exit; in_entry=0; next }
            /^id:/ { if (index($0, id) > 0) { found=1; in_entry=1 } }
            in_entry { print }
        ' "$log_file")

        if [[ -n "$entry" ]]; then
            local escaped_entry
            escaped_entry=$(json_escape "$entry")
            if [[ "$OUTPUT_FORMAT" == "path" ]]; then
                echo ".dialogue/logs/observations.yaml#$id"
            elif [[ "$OUTPUT_FORMAT" == "metadata" ]]; then
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "OBSERVATION",
  "location": ".dialogue/logs/observations.yaml#$id"
}
EOF
            else
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "OBSERVATION",
  "location": ".dialogue/logs/observations.yaml#$id",
  "content": "$escaped_entry"
}
EOF
            fi
        else
            output_not_found "$id" "OBSERVATION" "[\".dialogue/logs/observations.yaml\"]"
        fi
        return
    fi

    # Work items: SH-NNN, CD-NNN, FW-NNN
    if [[ "$id" =~ ^(SH|CD|FW)-([0-9]+)$ ]]; then
        local prefix="${BASH_REMATCH[1]}"
        local num="${BASH_REMATCH[2]}"
        local work_file="$PROJECT_ROOT/.dialogue/work-items.yaml"

        if [[ ! -f "$work_file" ]]; then
            output_not_found "$id" "WORK_ITEM" "[\".dialogue/work-items.yaml\"]"
            return
        fi

        local entry
        entry=$(extract_work_item "$work_file" "$id")

        if [[ -n "$entry" ]]; then
            local escaped_entry
            escaped_entry=$(json_escape "$entry")
            if [[ "$OUTPUT_FORMAT" == "path" ]]; then
                echo ".dialogue/work-items.yaml#$id"
            elif [[ "$OUTPUT_FORMAT" == "metadata" ]]; then
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "WORK_ITEM",
  "location": ".dialogue/work-items.yaml#$id"
}
EOF
            else
                cat <<EOF
{
  "status": "RESOLVED",
  "id": "$id",
  "type": "WORK_ITEM",
  "location": ".dialogue/work-items.yaml#$id",
  "content": "$escaped_entry"
}
EOF
            fi
        else
            output_not_found "$id" "WORK_ITEM" "[\".dialogue/work-items.yaml\"]"
        fi
        return
    fi

    # If we get here, ID didn't match any pattern
    output_invalid_id "$id"
}

# Main
resolve_id "$ID"
