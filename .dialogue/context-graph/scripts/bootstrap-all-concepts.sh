#!/bin/bash
# Bootstrap all framework concept nodes with canonical IDs
# Based on REF-001 concept catalogue

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GRAPH_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
NODES_DIR="$GRAPH_DIR/nodes/artifacts"
CONCEPTS_DIR="$PROJECT_ROOT/concepts"

# Function to create a node
create_node() {
    local ID="$1"
    local FILE="$2"
    local DOC_TYPE="$3"

    if [ ! -f "$CONCEPTS_DIR/$FILE" ]; then
        echo "SKIP: $FILE not found"
        return
    fi

    # Extract title from first # heading
    TITLE=$(grep -m1 "^# " "$CONCEPTS_DIR/$FILE" | sed 's/^# //')

    # Extract summary from Definition section if present (first paragraph after ## Definition)
    SUMMARY=$(sed -n '/^## Definition$/,/^$/p' "$CONCEPTS_DIR/$FILE" | tail -n +3 | head -1 | cut -c1-200 | tr -d '\n')
    [ -z "$SUMMARY" ] && SUMMARY=""

    NODE_FILE="$NODES_DIR/$ID.yaml"

    cat > "$NODE_FILE" << EOF
id: $ID
node_type: ARTIFACT
metadata:
  artifact_type: DOCUMENT
  document_type: $DOC_TYPE
  temporal_class: Standing
  content_type: text/markdown
  title: "$TITLE"
  summary: "$SUMMARY"
  location_hint: concepts/$FILE
  status: CURRENT
  author: human:pidster
created: "2026-01-13T00:00:00Z"
updated: "2026-01-21T00:00:00Z"
status: ACTIVE
EOF

    echo "Created: $ID - $TITLE"
}

echo "=== Bootstrapping Foundation Documents ==="
create_node "F-1" "foundation_theory-building.md" "FOUNDATION"
create_node "F-2" "foundation_transactive-memory.md" "FOUNDATION"
create_node "F-3" "foundation_socio-technical-systems.md" "FOUNDATION"
create_node "F-4" "foundation_sts-meta-analysis.md" "FOUNDATION"
create_node "F-5" "foundation_iso-12207-processes.md" "FOUNDATION"

echo ""
echo "=== Bootstrapping Core Concepts ==="
create_node "C-1" "concept_information-taxonomy.md" "CONCEPT"
create_node "C-2" "concept_capability-model.md" "CONCEPT"
create_node "C-3" "concept_seven-phase-sdlc.md" "CONCEPT"
create_node "C-4" "concept_actor-model.md" "CONCEPT"
create_node "C-5" "concept_collaboration-patterns.md" "CONCEPT"
create_node "C-6" "concept_transitions-info-loss.md" "CONCEPT"
create_node "C-7" "concept_phase-aware-measurement.md" "CONCEPT"
create_node "C-8" "concept_document-type-classification.md" "CONCEPT"

echo ""
echo "=== Bootstrapping Operational Concepts ==="
create_node "O-1" "concept_process-capability-flow.md" "OPERATIONAL"
create_node "O-2" "concept_decision-observation-tracking.md" "OPERATIONAL"
create_node "O-3" "concept_work-coordination.md" "OPERATIONAL"
create_node "O-4" "concept_agent-context-model.md" "OPERATIONAL"

echo ""
echo "=== Bootstrapping Integrations ==="
create_node "I-1" "integration_framework-architecture.md" "INTEGRATION"
create_node "I-2" "integration_phase-specific-composition.md" "INTEGRATION"
create_node "I-3" "integration_naur-wegner.md" "INTEGRATION"

echo ""
echo "=== Bootstrapping Guidance ==="
create_node "G-1" "guidance_architecture.md" "GUIDANCE"
create_node "G-2" "guidance_implementation.md" "GUIDANCE"
create_node "G-3" "guidance_performance-measures.md" "GUIDANCE"

echo ""
echo "=== Bootstrapping Examples ==="
create_node "E-1" "example_document-type-registry.md" "EXAMPLE"
create_node "E-2" "example_capability-flow-specifications.md" "EXAMPLE"

echo ""
echo "=== Done ==="
ls -la "$NODES_DIR" | wc -l
echo "node files in $NODES_DIR"
