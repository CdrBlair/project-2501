#!/bin/bash
# shellcheck shell=bash
# graph-locate.sh — TMS directory lookup: find nodes by query
# Part of the Context Graph (FW-028)
#
# Usage: graph-locate.sh [options] [query]
#   --type TYPE       Filter by node_type (ARTIFACT, ACTOR_HUMAN, ACTOR_AI, SYSTEM)
#   --artifact TYPE   Filter by artifact_type (DOCUMENT, DECISION, OBSERVATION, etc.)
#   --status STATUS   Filter by status (ACTIVE, ARCHIVED, STALE, UNKNOWN)
#   --format FORMAT   Output format: table (default), brief, json
#   --limit N         Limit results (default: 20)
#   query             Keyword to search in id, title, summary

set -euo pipefail

# Use Claude's project directory environment variable
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
GRAPH_DIR="$PROJECT_ROOT/.dialogue/context-graph"
NODES_DIR="$GRAPH_DIR/nodes"

# Defaults
NODE_TYPE=""
ARTIFACT_TYPE=""
STATUS=""
FORMAT="table"
LIMIT=20
QUERY=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --type)
            NODE_TYPE="$2"
            shift 2
            ;;
        --artifact)
            ARTIFACT_TYPE="$2"
            shift 2
            ;;
        --status)
            STATUS="$2"
            shift 2
            ;;
        --format)
            FORMAT="$2"
            shift 2
            ;;
        --limit)
            LIMIT="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: graph-locate.sh [options] [query]"
            echo ""
            echo "Options:"
            echo "  --type TYPE       Filter by node_type (ARTIFACT, ACTOR_HUMAN, ACTOR_AI, SYSTEM)"
            echo "  --artifact TYPE   Filter by artifact_type (DOCUMENT, DECISION, WORK_ITEM, etc.)"
            echo "  --status STATUS   Filter by status (ACTIVE, ARCHIVED, STALE, UNKNOWN)"
            echo "  --format FORMAT   Output format: table (default), brief, json"
            echo "  --limit N         Limit results (default: 20)"
            echo "  query             Keyword to search in id, title, summary"
            echo ""
            echo "Examples:"
            echo "  graph-locate.sh theory              # Find nodes mentioning 'theory'"
            echo "  graph-locate.sh --type ARTIFACT     # List all artifacts"
            echo "  graph-locate.sh --artifact DOCUMENT # List all documents"
            echo "  graph-locate.sh --status STALE      # Find stale nodes"
            exit 0
            ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            QUERY="$1"
            shift
            ;;
    esac
done

# Validate format
if [[ "$FORMAT" != "table" && "$FORMAT" != "brief" && "$FORMAT" != "json" ]]; then
    echo "Error: format must be table, brief, or json" >&2
    exit 1
fi

# Helper: Extract YAML field value (simple single-line extraction)
yaml_field() {
    local file="$1"
    local field="$2"
    grep -E "^${field}:" "$file" 2>/dev/null | head -1 | sed "s/^${field}:[[:space:]]*//" | tr -d '"'
}

# Helper: Extract nested YAML field (e.g., metadata.title)
yaml_nested() {
    local file="$1"
    local field="$2"
    # Simple approach: look for indented field after metadata:
    awk -v field="$field" '
        /^metadata:/ { in_meta=1; next }
        /^[^ ]/ { in_meta=0 }
        in_meta && $0 ~ "^  " field ":" {
            gsub(/^  [^:]+:[[:space:]]*/, "")
            gsub(/"/, "")
            print
            exit
        }
    ' "$file" 2>/dev/null
}

# Collect matching nodes
results=()
json_results="["
first_json=true

find_nodes() {
    local dir="$1"

    if [[ ! -d "$dir" ]]; then
        return
    fi

    while IFS= read -r -d '' file; do
        # Extract fields
        local id
        id=$(yaml_field "$file" "id")
        [[ -z "$id" ]] && continue

        local ntype
        ntype=$(yaml_field "$file" "node_type")

        local atype
        atype=$(yaml_nested "$file" "artifact_type")

        local nstatus
        nstatus=$(yaml_field "$file" "status")

        local title
        title=$(yaml_nested "$file" "title")
        [[ -z "$title" ]] && title=$(yaml_nested "$file" "name")

        local summary
        summary=$(yaml_nested "$file" "summary")

        # Apply filters
        if [[ -n "$NODE_TYPE" && "$ntype" != "$NODE_TYPE" ]]; then
            continue
        fi

        if [[ -n "$ARTIFACT_TYPE" && "$atype" != "$ARTIFACT_TYPE" ]]; then
            continue
        fi

        if [[ -n "$STATUS" && "$nstatus" != "$STATUS" ]]; then
            continue
        fi

        # Apply keyword search (case-insensitive)
        if [[ -n "$QUERY" ]]; then
            local match=false
            if echo "$id" | grep -qi "$QUERY"; then
                match=true
            elif echo "$title" | grep -qi "$QUERY"; then
                match=true
            elif echo "$summary" | grep -qi "$QUERY"; then
                match=true
            fi

            if [[ "$match" != "true" ]]; then
                continue
            fi
        fi

        # Add to results
        results+=("$id|$ntype|$atype|$nstatus|$title")

        # Build JSON
        if [[ "$first_json" == "true" ]]; then
            first_json=false
        else
            json_results+=","
        fi

        # Escape for JSON
        local esc_title="${title//\"/\\\"}"
        local esc_summary="${summary//\"/\\\"}"

        json_results+=$(cat <<EOF

  {"id": "$id", "node_type": "$ntype", "artifact_type": "$atype", "status": "$nstatus", "title": "$esc_title"}
EOF
)

        # Check limit
        if [[ ${#results[@]} -ge $LIMIT ]]; then
            return
        fi

    done < <(find "$dir" -name "*.yaml" -print0 2>/dev/null)
}

# Search all node directories
find_nodes "$NODES_DIR/artifacts"
find_nodes "$NODES_DIR/actors"
find_nodes "$NODES_DIR/systems"

json_results+="]"

# Output based on format
case "$FORMAT" in
    json)
        echo "$json_results"
        ;;
    brief)
        for r in "${results[@]}"; do
            echo "${r%%|*}"
        done
        ;;
    table)
        # Header
        printf "%-15s %-12s %-12s %-8s %s\n" "ID" "NODE_TYPE" "ARTIFACT" "STATUS" "TITLE"
        printf "%-15s %-12s %-12s %-8s %s\n" "---------------" "------------" "------------" "--------" "-----"

        for r in "${results[@]}"; do
            IFS='|' read -r id ntype atype nstatus title <<< "$r"
            # Truncate title if too long
            if [[ ${#title} -gt 40 ]]; then
                title="${title:0:37}..."
            fi
            printf "%-15s %-12s %-12s %-8s %s\n" "$id" "$ntype" "$atype" "$nstatus" "$title"
        done

        echo ""
        echo "Found ${#results[@]} node(s)"
        ;;
esac
