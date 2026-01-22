#!/usr/bin/env bash
# shellcheck shell=bash
# graph-trace.sh — Traceability queries for validation chains
# Part of the Context Graph (FW-028)
#
# Usage: graph-trace.sh <query-type> [target]
#
# Query types:
#   validated <id>      Is this theory/assumption validated? What evidence?
#   assumptions <id>    What assumptions does this node depend on?
#   satisfies <id>      What implementations satisfy this requirement?
#   tests <id>          What tests cover this requirement/implementation?
#   unvalidated         Find all nodes with unvalidated assumptions
#   orphans             Find artifacts with no incoming traceability edges
#   deps <id>           What does this node depend on? (DEPENDS_ON edges)

set -euo pipefail

# Use Claude's project directory environment variable
PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
GRAPH_DIR="$PROJECT_ROOT/.dialogue/context-graph"
EDGES_DIR="$GRAPH_DIR/edges"
NODES_DIR="$GRAPH_DIR/nodes"

# Validate arguments
if [[ $# -lt 1 ]]; then
    echo "Usage: graph-trace.sh <query-type> [target]" >&2
    echo "" >&2
    echo "Query types:" >&2
    echo "  validated <id>      Is this theory/assumption validated? What evidence?" >&2
    echo "  assumptions <id>    What assumptions does this node depend on?" >&2
    echo "  satisfies <id>      What implementations satisfy this requirement?" >&2
    echo "  tests <id>          What tests cover this requirement/implementation?" >&2
    echo "  unvalidated         Find all nodes with unvalidated assumptions" >&2
    echo "  orphans             Find artifacts with no incoming traceability edges" >&2
    echo "  deps <id>           What does this node depend on? (DEPENDS_ON edges)" >&2
    echo "" >&2
    echo "Examples:" >&2
    echo "  graph-trace.sh validated THY-001" >&2
    echo "  graph-trace.sh assumptions DEC-20260114-091633" >&2
    echo "  graph-trace.sh unvalidated" >&2
    exit 1
fi

QUERY_TYPE="$1"
TARGET="${2:-}"

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
    local file="$NODES_DIR/artifacts/$id.yaml"
    if [[ -f "$file" ]]; then
        yaml_nested "$file" "title"
    else
        echo "(unknown)"
    fi
}

# Helper: Find edges by type targeting a specific node
find_edges_to() {
    local target_id="$1"
    local edge_type="$2"
    local dir="${3:-$EDGES_DIR/traceability}"

    [[ ! -d "$dir" ]] && return

    while IFS= read -r -d '' file; do
        local source target etype
        source=$(yaml_field "$file" "source")
        target=$(yaml_field "$file" "target")
        etype=$(yaml_field "$file" "edge_type")

        if [[ "$target" == "$target_id" && "$etype" == "$edge_type" ]]; then
            echo "$source"
        fi
    done < <(find "$dir" -name "*.yaml" -print0 2>/dev/null)
}

# Helper: Find edges by type from a specific node
find_edges_from() {
    local source_id="$1"
    local edge_type="$2"
    local dir="${3:-$EDGES_DIR/traceability}"

    [[ ! -d "$dir" ]] && return

    while IFS= read -r -d '' file; do
        local source target etype
        source=$(yaml_field "$file" "source")
        target=$(yaml_field "$file" "target")
        etype=$(yaml_field "$file" "edge_type")

        if [[ "$source" == "$source_id" && "$etype" == "$edge_type" ]]; then
            echo "$target"
        fi
    done < <(find "$dir" -name "*.yaml" -print0 2>/dev/null)
}

# Helper: Get all artifact nodes
get_all_artifacts() {
    [[ ! -d "$NODES_DIR/artifacts" ]] && return

    while IFS= read -r -d '' file; do
        yaml_field "$file" "id"
    done < <(find "$NODES_DIR/artifacts" -name "*.yaml" -print0 2>/dev/null)
}

# Helper: Get all traceability edge targets
get_all_trace_targets() {
    [[ ! -d "$EDGES_DIR/traceability" ]] && return

    while IFS= read -r -d '' file; do
        yaml_field "$file" "target"
    done < <(find "$EDGES_DIR/traceability" -name "*.yaml" -print0 2>/dev/null)
}

# Query: Is this theory/assumption validated?
query_validated() {
    local target="$1"

    if [[ -z "$target" ]]; then
        echo "Error: validated query requires a target ID" >&2
        exit 1
    fi

    echo "Validation status for: $target"
    echo "Title: $(get_node_title "$target")"
    echo ""

    # Find VALIDATES edges pointing to this target
    local evidence=()
    while IFS= read -r source; do
        [[ -n "$source" ]] && evidence+=("$source")
    done < <(find_edges_to "$target" "VALIDATES")

    if [[ ${#evidence[@]} -eq 0 ]]; then
        echo "Status: NOT VALIDATED"
        echo "No VALIDATES edges found targeting this node."
    else
        echo "Status: VALIDATED (${#evidence[@]} evidence source(s))"
        echo ""
        printf "%-25s %s\n" "EVIDENCE" "TITLE"
        printf "%-25s %s\n" "-------------------------" "-----"
        for e in "${evidence[@]}"; do
            title=$(get_node_title "$e")
            if [[ ${#title} -gt 45 ]]; then
                title="${title:0:42}..."
            fi
            printf "%-25s %s\n" "$e" "$title"
        done
    fi
}

# Query: What assumptions does this node depend on?
query_assumptions() {
    local target="$1"

    if [[ -z "$target" ]]; then
        echo "Error: assumptions query requires a target ID" >&2
        exit 1
    fi

    echo "Assumptions for: $target"
    echo "Title: $(get_node_title "$target")"
    echo ""

    # Find ASSUMES edges from this node
    local assumptions=()
    while IFS= read -r assumption; do
        [[ -n "$assumption" ]] && assumptions+=("$assumption")
    done < <(find_edges_from "$target" "ASSUMES")

    if [[ ${#assumptions[@]} -eq 0 ]]; then
        echo "No ASSUMES edges found from this node."
    else
        echo "Found ${#assumptions[@]} assumption(s):"
        echo ""
        printf "%-15s %-12s %s\n" "ASSUMPTION" "VALIDATED?" "TITLE"
        printf "%-15s %-12s %s\n" "---------------" "------------" "-----"
        for a in "${assumptions[@]}"; do
            title=$(get_node_title "$a")

            # Check if assumption is validated
            local val_count=0
            while IFS= read -r _; do
                ((val_count++)) || true
            done < <(find_edges_to "$a" "VALIDATES")

            local status="NO"
            [[ $val_count -gt 0 ]] && status="YES ($val_count)"

            if [[ ${#title} -gt 40 ]]; then
                title="${title:0:37}..."
            fi
            printf "%-15s %-12s %s\n" "$a" "$status" "$title"
        done
    fi
}

# Query: What implementations satisfy this requirement?
query_satisfies() {
    local target="$1"

    if [[ -z "$target" ]]; then
        echo "Error: satisfies query requires a requirement ID" >&2
        exit 1
    fi

    echo "Implementations for requirement: $target"
    echo "Title: $(get_node_title "$target")"
    echo ""

    # Find SATISFIES edges pointing to this requirement
    local implementations=()
    while IFS= read -r impl; do
        [[ -n "$impl" ]] && implementations+=("$impl")
    done < <(find_edges_to "$target" "SATISFIES")

    if [[ ${#implementations[@]} -eq 0 ]]; then
        echo "Status: NOT SATISFIED"
        echo "No SATISFIES edges found targeting this requirement."
    else
        echo "Status: SATISFIED (${#implementations[@]} implementation(s))"
        echo ""
        printf "%-25s %s\n" "IMPLEMENTATION" "TITLE"
        printf "%-25s %s\n" "-------------------------" "-----"
        for i in "${implementations[@]}"; do
            title=$(get_node_title "$i")
            if [[ ${#title} -gt 45 ]]; then
                title="${title:0:42}..."
            fi
            printf "%-25s %s\n" "$i" "$title"
        done
    fi
}

# Query: What tests cover this requirement/implementation?
query_tests() {
    local target="$1"

    if [[ -z "$target" ]]; then
        echo "Error: tests query requires a target ID" >&2
        exit 1
    fi

    echo "Test coverage for: $target"
    echo "Title: $(get_node_title "$target")"
    echo ""

    # Find TESTS and COVERS edges pointing to this target
    local tests=()
    while IFS= read -r test; do
        [[ -n "$test" ]] && tests+=("$test|TESTS")
    done < <(find_edges_to "$target" "TESTS")

    while IFS= read -r test; do
        [[ -n "$test" ]] && tests+=("$test|COVERS")
    done < <(find_edges_to "$target" "COVERS")

    if [[ ${#tests[@]} -eq 0 ]]; then
        echo "Status: NOT TESTED"
        echo "No TESTS or COVERS edges found targeting this node."
    else
        echo "Status: TESTED (${#tests[@]} test(s))"
        echo ""
        printf "%-25s %-10s %s\n" "TEST" "TYPE" "TITLE"
        printf "%-25s %-10s %s\n" "-------------------------" "----------" "-----"
        for t in "${tests[@]}"; do
            test_id="${t%%|*}"
            edge_type="${t#*|}"
            title=$(get_node_title "$test_id")
            if [[ ${#title} -gt 40 ]]; then
                title="${title:0:37}..."
            fi
            printf "%-25s %-10s %s\n" "$test_id" "$edge_type" "$title"
        done
    fi
}

# Query: Find all nodes with unvalidated assumptions
query_unvalidated() {
    echo "Nodes with unvalidated assumptions:"
    echo ""

    TMPFILE=$(mktemp)
    trap 'rm -f "$TMPFILE"' EXIT

    # Find all ASSUMES edges
    [[ ! -d "$EDGES_DIR/traceability" ]] && {
        echo "No traceability edges found."
        exit 0
    }

    while IFS= read -r -d '' file; do
        local source target etype
        source=$(yaml_field "$file" "source")
        target=$(yaml_field "$file" "target")
        etype=$(yaml_field "$file" "edge_type")

        if [[ "$etype" == "ASSUMES" ]]; then
            # Check if assumption is validated
            local validated=false
            while IFS= read -r _; do
                validated=true
                break
            done < <(find_edges_to "$target" "VALIDATES")

            if [[ "$validated" != "true" ]]; then
                echo "$source|$target" >> "$TMPFILE"
            fi
        fi
    done < <(find "$EDGES_DIR/traceability" -name "*.yaml" -print0 2>/dev/null)

    if [[ ! -s "$TMPFILE" ]]; then
        echo "All assumptions are validated (or no ASSUMES edges exist)."
        exit 0
    fi

    printf "%-20s %-20s %s\n" "NODE" "UNVALIDATED ASM" "ASSUMPTION TITLE"
    printf "%-20s %-20s %s\n" "--------------------" "--------------------" "-----"

    while IFS='|' read -r node assumption; do
        title=$(get_node_title "$assumption")
        if [[ ${#title} -gt 35 ]]; then
            title="${title:0:32}..."
        fi
        printf "%-20s %-20s %s\n" "$node" "$assumption" "$title"
    done < "$TMPFILE"

    echo ""
    echo "Found $(wc -l < "$TMPFILE" | tr -d ' ') unvalidated assumption(s)"
}

# Query: Find orphan artifacts (no incoming traceability edges)
query_orphans() {
    echo "Artifacts with no incoming traceability edges:"
    echo ""

    # Get all artifact IDs
    TMPFILE_ARTIFACTS=$(mktemp)
    TMPFILE_TARGETS=$(mktemp)
    trap 'rm -f "$TMPFILE_ARTIFACTS" "$TMPFILE_TARGETS"' EXIT

    get_all_artifacts | sort -u > "$TMPFILE_ARTIFACTS"
    get_all_trace_targets | sort -u > "$TMPFILE_TARGETS"

    # Find artifacts not in targets
    orphans=$(comm -23 "$TMPFILE_ARTIFACTS" "$TMPFILE_TARGETS")

    if [[ -z "$orphans" ]]; then
        echo "All artifacts have incoming traceability edges."
        exit 0
    fi

    printf "%-15s %s\n" "ID" "TITLE"
    printf "%-15s %s\n" "---------------" "-----"

    count=0
    while IFS= read -r id; do
        [[ -z "$id" ]] && continue
        title=$(get_node_title "$id")
        if [[ ${#title} -gt 50 ]]; then
            title="${title:0:47}..."
        fi
        printf "%-15s %s\n" "$id" "$title"
        ((count++)) || true
    done <<< "$orphans"

    echo ""
    echo "Found $count orphan artifact(s)"
}

# Query: What does this node depend on?
query_deps() {
    local target="$1"

    if [[ -z "$target" ]]; then
        echo "Error: deps query requires a target ID" >&2
        exit 1
    fi

    echo "Dependencies for: $target"
    echo "Title: $(get_node_title "$target")"
    echo ""

    # Find DEPENDS_ON edges from this node
    local deps=()
    while IFS= read -r dep; do
        [[ -n "$dep" ]] && deps+=("$dep")
    done < <(find_edges_from "$target" "DEPENDS_ON")

    if [[ ${#deps[@]} -eq 0 ]]; then
        echo "No DEPENDS_ON edges found from this node."
    else
        echo "Found ${#deps[@]} dependency(ies):"
        echo ""
        printf "%-20s %s\n" "DEPENDENCY" "TITLE"
        printf "%-20s %s\n" "--------------------" "-----"
        for d in "${deps[@]}"; do
            title=$(get_node_title "$d")
            if [[ ${#title} -gt 50 ]]; then
                title="${title:0:47}..."
            fi
            printf "%-20s %s\n" "$d" "$title"
        done
    fi
}

# Dispatch query
case "$QUERY_TYPE" in
    validated)
        query_validated "$TARGET"
        ;;
    assumptions)
        query_assumptions "$TARGET"
        ;;
    satisfies)
        query_satisfies "$TARGET"
        ;;
    tests)
        query_tests "$TARGET"
        ;;
    unvalidated)
        query_unvalidated
        ;;
    orphans)
        query_orphans
        ;;
    deps)
        query_deps "$TARGET"
        ;;
    *)
        echo "Unknown query type: $QUERY_TYPE" >&2
        echo "Run 'graph-trace.sh' without arguments for help." >&2
        exit 1
        ;;
esac
