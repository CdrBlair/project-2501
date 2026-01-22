#!/usr/bin/env bash
# shellcheck shell=bash
# graph-invalidate.sh — TMS staleness: mark nodes as outdated
# Part of the Context Graph (FW-028)
#
# Usage: graph-invalidate.sh <id> [--cascade] [--reason "reason"]
#   id          Node ID to invalidate
#   --cascade   Also mark dependents as stale (DERIVES_FROM edges)
#   --reason    Reason for invalidation

set -euo pipefail

# Use Claude's project directory environment variable
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
GRAPH_DIR="$PROJECT_ROOT/.dialogue/context-graph"
EDGES_DIR="$GRAPH_DIR/edges"
NODES_DIR="$GRAPH_DIR/nodes"

# Parse arguments
CASCADE=false
REASON=""
NODE_ID=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --cascade)
            CASCADE=true
            shift
            ;;
        --reason)
            REASON="$2"
            shift 2
            ;;
        -h|--help)
            echo "Usage: graph-invalidate.sh <id> [--cascade] [--reason \"reason\"]"
            echo ""
            echo "Arguments:"
            echo "  id          Node ID to invalidate"
            echo "  --cascade   Also mark dependents as stale (DERIVES_FROM edges)"
            echo "  --reason    Reason for invalidation"
            echo ""
            echo "Examples:"
            echo "  graph-invalidate.sh THY-001 --reason \"Source document updated\""
            echo "  graph-invalidate.sh REF-001 --cascade --reason \"API changed\""
            exit 0
            ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            NODE_ID="$1"
            shift
            ;;
    esac
done

if [[ -z "$NODE_ID" ]]; then
    echo "Error: Node ID required" >&2
    echo "Usage: graph-invalidate.sh <id> [--cascade] [--reason \"reason\"]" >&2
    exit 1
fi

# Helper: Extract YAML field value
yaml_field() {
    local file="$1"
    local field="$2"
    grep -E "^${field}:" "$file" 2>/dev/null | head -1 | sed "s/^${field}:[[:space:]]*//" | tr -d '"'
}

# Helper: Find node file by ID
find_node_file() {
    local id="$1"

    # Try artifacts
    local file="$NODES_DIR/artifacts/$id.yaml"
    if [[ -f "$file" ]]; then
        echo "$file"
        return
    fi

    # Try actors (sanitise colons)
    local sanitised="${id//:/-}"
    file="$NODES_DIR/actors/$sanitised.yaml"
    if [[ -f "$file" ]]; then
        echo "$file"
        return
    fi

    # Try systems
    file="$NODES_DIR/systems/$id.yaml"
    if [[ -f "$file" ]]; then
        echo "$file"
        return
    fi

    echo ""
}

# Helper: Update node status to STALE
mark_stale() {
    local file="$1"
    local id="$2"

    if [[ ! -f "$file" ]]; then
        echo "Warning: File not found: $file" >&2
        return 1
    fi

    local current_status
    current_status=$(yaml_field "$file" "status")

    if [[ "$current_status" == "STALE" ]]; then
        echo "  $id: already STALE"
        return 0
    fi

    # Update status in file (using sed)
    if sed -i.bak "s/^status:.*/status: STALE/" "$file"; then
        rm -f "${file}.bak"
        echo "  $id: $current_status -> STALE"
        return 0
    else
        echo "  $id: FAILED to update" >&2
        return 1
    fi
}

# Helper: Find nodes that derive from this one
find_dependents() {
    local source_id="$1"
    local dir="$EDGES_DIR/information"

    [[ ! -d "$dir" ]] && return

    while IFS= read -r -d '' file; do
        local source target etype
        source=$(yaml_field "$file" "source")
        target=$(yaml_field "$file" "target")
        etype=$(yaml_field "$file" "edge_type")

        # DERIVES_FROM: source derives from target
        # So if target is our source_id, the source is dependent
        if [[ "$target" == "$source_id" && "$etype" == "DERIVES_FROM" ]]; then
            echo "$source"
        fi
    done < <(find "$dir" -name "*.yaml" -print0 2>/dev/null)
}

# Find the node file
NODE_FILE=$(find_node_file "$NODE_ID")

if [[ -z "$NODE_FILE" ]]; then
    echo "Error: Node not found: $NODE_ID" >&2
    exit 1
fi

echo "Invalidating node: $NODE_ID"
[[ -n "$REASON" ]] && echo "Reason: $REASON"
echo ""

# Mark the target node as stale
if ! mark_stale "$NODE_FILE" "$NODE_ID"; then
    exit 1
fi

# If cascade, find and mark dependents
if [[ "$CASCADE" == "true" ]]; then
    echo ""
    echo "Cascading to dependents (DERIVES_FROM edges)..."

    # Collect all dependents (breadth-first)
    to_process=("$NODE_ID")
    processed=()
    dependents=()

    while [[ ${#to_process[@]} -gt 0 ]]; do
        current="${to_process[0]}"
        to_process=("${to_process[@]:1}")  # Remove first element

        # Skip if already processed
        for p in "${processed[@]:-}"; do
            [[ "$p" == "$current" ]] && continue 2
        done
        processed+=("$current")

        # Find dependents of current
        while IFS= read -r dep; do
            [[ -z "$dep" ]] && continue

            # Add to dependents if not the original node
            if [[ "$dep" != "$NODE_ID" ]]; then
                dependents+=("$dep")
                to_process+=("$dep")
            fi
        done < <(find_dependents "$current")
    done

    if [[ ${#dependents[@]} -eq 0 ]]; then
        echo "No dependents found."
    else
        echo "Found ${#dependents[@]} dependent(s):"
        for dep in "${dependents[@]}"; do
            dep_file=$(find_node_file "$dep")
            if [[ -n "$dep_file" ]]; then
                mark_stale "$dep_file" "$dep"
            else
                echo "  $dep: file not found"
            fi
        done
    fi
fi

echo ""
echo "Done."
