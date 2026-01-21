#!/bin/bash
# Bootstrap a context graph node from a markdown file with YAML frontmatter
# Usage: bootstrap-node.sh <markdown-file> [artifact-type]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GRAPH_DIR="$(dirname "$SCRIPT_DIR")"
NODES_DIR="$GRAPH_DIR/nodes/artifacts"

if [ -z "$1" ]; then
    echo "Usage: $0 <markdown-file> [artifact-type]" >&2
    exit 1
fi

FILE="$1"
ARTIFACT_TYPE="${2:-DOCUMENT}"

if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE" >&2
    exit 1
fi

# Extract frontmatter (between --- markers)
FRONTMATTER=$(sed -n '/^---$/,/^---$/p' "$FILE" | sed '1d;$d')

# Extract key fields
ID=$(echo "$FRONTMATTER" | grep "^id:" | head -1 | sed 's/id: *//' | tr -d '"')
TITLE=$(echo "$FRONTMATTER" | grep "^title:" | head -1 | sed 's/title: *//')
TYPE=$(echo "$FRONTMATTER" | grep "^type:" | head -1 | sed 's/type: *//')
STATUS=$(echo "$FRONTMATTER" | grep "^status:" | head -1 | sed 's/status: *//')
CREATED=$(echo "$FRONTMATTER" | grep "^created:" | head -1 | sed 's/created: *//')
UPDATED=$(echo "$FRONTMATTER" | grep "^updated:" | head -1 | sed 's/updated: *//')
AUTHOR=$(echo "$FRONTMATTER" | grep "^author:" | head -1 | sed 's/author: *//')
TEMPORAL=$(echo "$FRONTMATTER" | grep "^temporal_class:" | head -1 | sed 's/temporal_class: *//')

if [ -z "$ID" ]; then
    echo "No id found in frontmatter" >&2
    exit 1
fi

# Default values
[ -z "$STATUS" ] && STATUS="DRAFT"
[ -z "$CREATED" ] && CREATED=$(date -u +%Y-%m-%d)
[ -z "$UPDATED" ] && UPDATED="$CREATED"
[ -z "$AUTHOR" ] && AUTHOR="unknown"
[ -z "$TEMPORAL" ] && TEMPORAL="Standing"

# Get relative path from project root
PROJECT_ROOT=$(cd "$SCRIPT_DIR/../../.." && pwd)
REL_PATH="${FILE#$PROJECT_ROOT/}"

# Generate node file
NODE_FILE="$NODES_DIR/$ID.yaml"

cat > "$NODE_FILE" << EOF
id: $ID
node_type: ARTIFACT
metadata:
  artifact_type: $ARTIFACT_TYPE
  document_type: $TYPE
  temporal_class: $TEMPORAL
  content_type: text/markdown
  title: "$TITLE"
  summary: ""
  location_hint: $REL_PATH
  status: $STATUS
  author: $AUTHOR
created: "${CREATED}T00:00:00Z"
updated: "${UPDATED}T00:00:00Z"
status: ACTIVE
EOF

echo "$ID"
