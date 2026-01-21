#!/bin/bash
# Bootstrap a context graph node from a concept markdown file (no frontmatter)
# Usage: bootstrap-concept.sh <markdown-file>

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GRAPH_DIR="$(dirname "$SCRIPT_DIR")"
NODES_DIR="$GRAPH_DIR/nodes/artifacts"

if [ -z "$1" ]; then
    echo "Usage: $0 <markdown-file>" >&2
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE" >&2
    exit 1
fi

# Extract filename without path and extension
BASENAME=$(basename "$FILE" .md)

# Generate ID from filename pattern
# concept_information-taxonomy.md -> C-1
# foundation_theory-building.md -> F-1
# integration_*.md -> INT-*
# guidance_*.md -> GD-*
# example_*.md -> EX-*

PREFIX=$(echo "$BASENAME" | cut -d'_' -f1)

# Map prefix to ID prefix
case "$PREFIX" in
    concept) ID_PREFIX="C" ;;
    foundation) ID_PREFIX="F" ;;
    integration) ID_PREFIX="INT" ;;
    guidance) ID_PREFIX="GD" ;;
    example) ID_PREFIX="EX" ;;
    *) ID_PREFIX="DOC" ;;
esac

# Extract title from first # heading
TITLE=$(grep -m1 "^# " "$FILE" | sed 's/^# //')

# Extract summary from Definition section if present
SUMMARY=$(sed -n '/^## Definition$/,/^##/p' "$FILE" | head -5 | tail -3 | tr '\n' ' ' | cut -c1-200)

# Get relative path from project root
PROJECT_ROOT=$(cd "$SCRIPT_DIR/../../.." && pwd)
REL_PATH="${FILE#$PROJECT_ROOT/}"

# Generate a sequential ID - check existing files
EXISTING=$(ls "$NODES_DIR" 2>/dev/null | grep "^${ID_PREFIX}-" | sed "s/${ID_PREFIX}-//" | sed 's/.yaml//' | sort -n | tail -1)
if [ -z "$EXISTING" ]; then
    SEQ=1
else
    SEQ=$((EXISTING + 1))
fi

ID="${ID_PREFIX}-${SEQ}"

# Generate node file
NODE_FILE="$NODES_DIR/$ID.yaml"

cat > "$NODE_FILE" << EOF
id: $ID
node_type: ARTIFACT
metadata:
  artifact_type: DOCUMENT
  document_type: CONCEPT
  temporal_class: Standing
  content_type: text/markdown
  title: "$TITLE"
  summary: "$SUMMARY"
  location_hint: $REL_PATH
  source_file: $BASENAME.md
  status: CURRENT
  author: human:pidster
created: "2026-01-13T00:00:00Z"
updated: "2026-01-21T00:00:00Z"
status: ACTIVE
EOF

echo "$ID: $TITLE"
