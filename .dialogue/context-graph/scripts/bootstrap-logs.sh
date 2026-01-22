#!/usr/bin/env bash
# shellcheck shell=bash
# bootstrap-logs.sh — Bootstrap existing decision/observation logs as graph nodes
# Part of the Context Graph (FW-028)
#
# Usage: bootstrap-logs.sh [--dry-run]
#   --dry-run   Show what would be created without creating files

set -euo pipefail

PROJECT_ROOT="${CLAUDE_PROJECT_DIR:?CLAUDE_PROJECT_DIR must be set}"
DECISIONS_DIR="${PROJECT_ROOT}/.dialogue/logs/decisions"
OBSERVATIONS_DIR="${PROJECT_ROOT}/.dialogue/logs/observations"
GRAPH_NODES_DIR="${PROJECT_ROOT}/.dialogue/context-graph/nodes/artifacts"
GRAPH_EDGES_DIR="${PROJECT_ROOT}/.dialogue/context-graph/edges/actor-artifact"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
    DRY_RUN=true
    echo "DRY RUN - no files will be created"
    echo ""
fi

# Counters
nodes_created=0
nodes_skipped=0
edges_created=0
edges_skipped=0

# Helper: Extract YAML field value (handles quoted and unquoted, takes first line only)
yaml_field() {
    local file="$1"
    local field="$2"
    local value
    value=$(grep -E "^${field}:" "$file" 2>/dev/null | head -1 | sed "s/^${field}:[[:space:]]*//" | tr -d '"')
    # If value is | or > (multiline indicator), return empty
    if [[ "$value" == "|" || "$value" == ">" ]]; then
        # Try to get first content line after the indicator
        value=$(awk "/^${field}:/{found=1; next} found && /^[^ ]/{exit} found && /^  [^ ]/{gsub(/^  /, \"\"); print; exit}" "$file" 2>/dev/null)
    fi
    echo "$value"
}

# Helper: Extract first actor from potentially comma-separated list
first_actor() {
    local actors="$1"
    echo "$actors" | cut -d',' -f1 | xargs
}

# Ensure directories exist
if [[ "$DRY_RUN" != "true" ]]; then
    mkdir -p "$GRAPH_NODES_DIR" "$GRAPH_EDGES_DIR"
fi

echo "Bootstrapping decisions..."
for file in "$DECISIONS_DIR"/*.yaml; do
    [[ ! -f "$file" ]] && continue

    id=$(yaml_field "$file" "id")
    [[ -z "$id" ]] && continue

    timestamp=$(yaml_field "$file" "timestamp")
    dtype=$(yaml_field "$file" "type")
    actor_raw=$(yaml_field "$file" "actor")
    actor=$(first_actor "$actor_raw")

    # Handle both schemas: subject/outcome and title/decision
    subject=$(yaml_field "$file" "subject")
    [[ -z "$subject" ]] && subject=$(yaml_field "$file" "title")
    [[ -z "$subject" ]] && subject="(no subject)"

    outcome=$(yaml_field "$file" "outcome")
    [[ -z "$outcome" ]] && outcome=$(yaml_field "$file" "decision")
    [[ -z "$outcome" ]] && outcome="(no outcome)"

    # Escape quotes in subject and outcome for YAML
    subject="${subject//\"/\'}"
    outcome="${outcome//\"/\'}"

    # Truncate if too long
    [[ ${#subject} -gt 200 ]] && subject="${subject:0:197}..."
    [[ ${#outcome} -gt 200 ]] && outcome="${outcome:0:197}..."

    # Create node if doesn't exist
    node_file="${GRAPH_NODES_DIR}/${id}.yaml"
    if [[ -f "$node_file" ]]; then
        ((nodes_skipped++))
    else
        if [[ "$DRY_RUN" == "true" ]]; then
            echo "  Would create node: $id"
        else
            {
                echo "id: $id"
                echo "node_type: ARTIFACT"
                echo "metadata:"
                echo "  artifact_type: DECISION"
                echo "  decision_type: $dtype"
                echo "  temporal_class: Ephemeral"
                echo "  content_type: text/yaml"
                echo "  title: \"$subject\""
                echo "  summary: \"$outcome\""
                echo "  location_hint: \".dialogue/logs/decisions/${id}.yaml\""
                echo "  author: \"$actor\""
                echo "created: \"$timestamp\""
                echo "updated: \"$timestamp\""
                echo "status: ACTIVE"
            } > "$node_file"
        fi
        ((nodes_created++))
    fi

    # Create CREATED edge if doesn't exist
    # Use cleaned actor (first one if multiple)
    actor_sanitised="${actor//:/-}"
    edge_id="created-${actor_sanitised}-${id}"
    edge_file="${GRAPH_EDGES_DIR}/${edge_id}.yaml"
    if [[ -f "$edge_file" ]]; then
        ((edges_skipped++))
    else
        if [[ "$DRY_RUN" == "true" ]]; then
            echo "  Would create edge: $edge_id"
        else
            {
                echo "id: $edge_id"
                echo "source: \"$actor\""
                echo "target: $id"
                echo "edge_type: CREATED"
                echo "metadata:"
                echo "  timestamp: \"$timestamp\""
                echo "  decision_type: $dtype"
                echo "created: \"$timestamp\""
                echo "confidence: 1.0"
            } > "$edge_file"
        fi
        ((edges_created++))
    fi
done

echo "Bootstrapping observations..."
for file in "$OBSERVATIONS_DIR"/*.yaml; do
    [[ ! -f "$file" ]] && continue

    id=$(yaml_field "$file" "id")
    [[ -z "$id" ]] && continue

    timestamp=$(yaml_field "$file" "timestamp")
    otype=$(yaml_field "$file" "type")
    observer=$(yaml_field "$file" "observer")
    subject=$(yaml_field "$file" "subject")
    value=$(yaml_field "$file" "value")

    # Truncate value if too long for summary
    if [[ ${#value} -gt 200 ]]; then
        value="${value:0:197}..."
    fi

    # Create node if doesn't exist
    node_file="${GRAPH_NODES_DIR}/${id}.yaml"
    if [[ -f "$node_file" ]]; then
        ((nodes_skipped++))
    else
        if [[ "$DRY_RUN" == "true" ]]; then
            echo "  Would create node: $id"
        else
            {
                echo "id: $id"
                echo "node_type: ARTIFACT"
                echo "metadata:"
                echo "  artifact_type: OBSERVATION"
                echo "  observation_type: $otype"
                echo "  temporal_class: Ephemeral"
                echo "  content_type: text/yaml"
                echo "  title: \"$subject\""
                echo "  summary: \"$value\""
                echo "  location_hint: \".dialogue/logs/observations/${id}.yaml\""
                echo "  observer: \"$observer\""
                echo "created: \"$timestamp\""
                echo "updated: \"$timestamp\""
                echo "status: ACTIVE"
            } > "$node_file"
        fi
        ((nodes_created++))
    fi

    # Create CREATED edge if doesn't exist
    observer_sanitised="${observer//:/-}"
    edge_id="created-${observer_sanitised}-${id}"
    edge_file="${GRAPH_EDGES_DIR}/${edge_id}.yaml"
    if [[ -f "$edge_file" ]]; then
        ((edges_skipped++))
    else
        if [[ "$DRY_RUN" == "true" ]]; then
            echo "  Would create edge: $edge_id"
        else
            {
                echo "id: $edge_id"
                echo "source: \"$observer\""
                echo "target: $id"
                echo "edge_type: CREATED"
                echo "metadata:"
                echo "  timestamp: \"$timestamp\""
                echo "  observation_type: $otype"
                echo "created: \"$timestamp\""
                echo "confidence: 1.0"
            } > "$edge_file"
        fi
        ((edges_created++))
    fi
done

echo ""
echo "Summary:"
echo "  Nodes created: $nodes_created"
echo "  Nodes skipped (already exist): $nodes_skipped"
echo "  Edges created: $edges_created"
echo "  Edges skipped (already exist): $edges_skipped"
