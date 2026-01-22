#!/usr/bin/env bash
# shellcheck shell=bash
# graph-discover.sh — TMS learning: find what an actor knows about
# Part of the Context Graph (FW-028)
#
# Usage: graph-discover.sh <actor> [domain]
#   actor     Actor ID (e.g., human:pidster, ai:claude)
#   domain    Optional keyword to filter results
#
# Traverses CREATED, CONTRIBUTED, OWNS, KNOWS edges from actor to artifacts.

set -euo pipefail

# Use Claude's project directory environment variable
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
GRAPH_DIR="$PROJECT_ROOT/.dialogue/context-graph"
EDGES_DIR="$GRAPH_DIR/edges"
NODES_DIR="$GRAPH_DIR/nodes"

# Validate arguments
if [[ $# -lt 1 ]]; then
    echo "Usage: graph-discover.sh <actor> [domain]" >&2
    echo "" >&2
    echo "Arguments:" >&2
    echo "  actor     Actor ID (e.g., human:pidster, ai:claude)" >&2
    echo "  domain    Optional keyword to filter results" >&2
    echo "" >&2
    echo "Examples:" >&2
    echo "  graph-discover.sh human:pidster           # All knowledge" >&2
    echo "  graph-discover.sh human:pidster theory    # Knowledge about 'theory'" >&2
    echo "  graph-discover.sh ai:claude               # AI contributions" >&2
    exit 1
fi

ACTOR="$1"
DOMAIN="${2:-}"

# Helper: Extract YAML field value
yaml_field() {
    local file="$1"
    local field="$2"
    grep -E "^${field}:" "$file" 2>/dev/null | head -1 | sed "s/^${field}:[[:space:]]*//" | tr -d '"'
}

# Helper: Extract nested YAML field
yaml_nested() {
    local file="$1"
    local field="$2"
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

# Helper: Get node title by ID
get_node_title() {
    local id="$1"
    local file=""

    # Try artifacts
    file="$NODES_DIR/artifacts/$id.yaml"
    if [[ -f "$file" ]]; then
        yaml_nested "$file" "title"
        return
    fi

    # Try with sanitised ID (colons become dashes for filenames)
    local sanitised="${id//:/-}"
    file="$NODES_DIR/actors/$sanitised.yaml"
    if [[ -f "$file" ]]; then
        yaml_nested "$file" "name"
        return
    fi

    echo "(unknown)"
}

# Check if actor exists
sanitised_actor="${ACTOR//:/-}"
if [[ ! -f "$NODES_DIR/actors/$sanitised_actor.yaml" ]]; then
    echo "Warning: Actor node not found for '$ACTOR'" >&2
    echo "Proceeding to search edges anyway..." >&2
fi

# Create temp file for results
TMPFILE=$(mktemp)
trap 'rm -f "$TMPFILE"' EXIT

# Find edges where this actor is the source
for dir in "$EDGES_DIR/actor-artifact" "$EDGES_DIR/actor-actor"; do
    [[ ! -d "$dir" ]] && continue

    while IFS= read -r -d '' file; do
        source=$(yaml_field "$file" "source")
        target=$(yaml_field "$file" "target")
        edge_type=$(yaml_field "$file" "edge_type")

        # Check if source matches our actor
        if [[ "$source" != "$ACTOR" ]]; then
            continue
        fi

        # Check if edge type is knowledge-related
        case "$edge_type" in
            CREATED|CONTRIBUTED|OWNS|KNOWS)
                ;;
            *)
                continue
                ;;
        esac

        # Get target info
        title=$(get_node_title "$target")

        # Apply domain filter if specified
        if [[ -n "$DOMAIN" ]]; then
            if ! echo "$target $title" | grep -qi "$DOMAIN"; then
                continue
            fi
        fi

        # Output to temp file (target|edge_type|title)
        echo "$target|$edge_type|$title" >> "$TMPFILE"

    done < <(find "$dir" -name "*.yaml" -print0 2>/dev/null)
done

# Check if any results
if [[ ! -s "$TMPFILE" ]]; then
    echo "No knowledge found for actor: $ACTOR"
    [[ -n "$DOMAIN" ]] && echo "(filtered by domain: $DOMAIN)"
    exit 0
fi

# Output results (sort and dedupe by target, merging edge types)
echo "Knowledge for: $ACTOR"
[[ -n "$DOMAIN" ]] && echo "Domain filter: $DOMAIN"
echo ""
printf "%-15s %-20s %s\n" "TARGET" "RELATIONSHIP" "TITLE"
printf "%-15s %-20s %s\n" "---------------" "--------------------" "-----"

# Sort by target and process
sort "$TMPFILE" | awk -F'|' '
{
    target = $1
    edge = $2
    title = $3

    if (target != prev_target && prev_target != "") {
        # Truncate title if too long
        if (length(prev_title) > 40) {
            prev_title = substr(prev_title, 1, 37) "..."
        }
        printf "%-15s %-20s %s\n", prev_target, prev_edges, prev_title
        count++
    }

    if (target != prev_target) {
        prev_target = target
        prev_edges = edge
        prev_title = title
    } else {
        # Same target, merge edge types if different
        if (index(prev_edges, edge) == 0) {
            prev_edges = prev_edges "," edge
        }
    }
}
END {
    if (prev_target != "") {
        if (length(prev_title) > 40) {
            prev_title = substr(prev_title, 1, 37) "..."
        }
        printf "%-15s %-20s %s\n", prev_target, prev_edges, prev_title
        count++
    }
    print ""
    print "Found " count " artifact(s)"
}
'
