# Schema: Context Graph

**Document Type**: SPC (Specification)
**Temporal Class**: Standing
**Scope**: Project
**Status**: DRAFT
**Version**: 1

---

## Purpose

This schema defines the Context Graph—an operational implementation of Transactive Memory System (TMS) concepts for human-AI collaboration, extended with traceability relationships for tracking validation chains. The graph externalises "who knows what" and "what proves/satisfies what" as a queryable structure.

**Related documents**:
- [Information Reference Schema](../claude-plugin-evo/references/schema_information-reference.md) — Node identifiers
- [Resolver Interface](../claude-plugin-evo/references/schema_resolver-interface.md) — Node content retrieval
- [Transactive Memory Foundation](../concepts/foundation_transactive-memory.md) — Theoretical basis
- [Actor Model](../concepts/concept_actor-model.md) — Actor node types

---

## Design Principles

### 1. TMS Alignment

The graph operationalises Wegner's TMS constructs:

| TMS Component | Graph Equivalent |
|---------------|------------------|
| Directory | Node registry + metadata |
| Allocation | Store routing (where to write) |
| Retrieval | Resolution + fetch |
| Credibility | Actor reliability metadata |
| Specialisation | Actor capability profiles |

### 2. Location Agnosticism

Nodes can reference content in any store:
- Local filesystem
- Enterprise systems (Confluence, Jira, GitHub)
- External sources (standards, vendor docs)
- Graph databases (future evolution)

The graph tracks *what exists* and *how things relate*—resolution handles *where things live*.

### 3. Actor as Knowledge Source

Nodes include actors, not just artifacts. A human expert and a document are both knowledge sources—the graph models both and their relationships.

---

## Node Schema

### Core Node Structure

```yaml
ContextNode:
  id: string              # Reference ID (per Information Reference Schema)
  node_type: NodeType     # ARTIFACT | ACTOR_HUMAN | ACTOR_AI | SYSTEM
  metadata: NodeMetadata  # Type-specific metadata
  created: timestamp
  updated: timestamp
  status: NodeStatus      # ACTIVE | ARCHIVED | STALE | UNKNOWN
```

### Node Types

#### ARTIFACT

Information artifacts—documents, decisions, observations, tasks.

```yaml
ArtifactNode:
  id: "THY-001"
  node_type: ARTIFACT
  metadata:
    artifact_type: DOCUMENT | DECISION | OBSERVATION | WORK_ITEM | ADR | ASSUMPTION | REQUIREMENT | TEST | IMPLEMENTATION
    temporal_class: Standing | Dynamic | Ephemeral
    content_type: "text/markdown"
    title: "Framework Theory"
    summary: "Integrated understanding of framework concepts"
    location_hint: "implementation/theory_framework.md"  # For resolution
  status: ACTIVE
```

#### ACTOR_HUMAN

Human participants with expertise and responsibilities.

```yaml
ActorHumanNode:
  id: "human:pidster"
  node_type: ACTOR_HUMAN
  metadata:
    name: "pidster"
    roles: [DEVELOPER, ARCHITECT, DOMAIN_EXPERT]
    expertise_domains:
      - domain: "framework-design"
        confidence: HIGH
      - domain: "tms-theory"
        confidence: MEDIUM
    availability: AVAILABLE | LIMITED | UNAVAILABLE
    contact_method: "github:pidster"
  status: ACTIVE
```

#### ACTOR_AI

AI actors with capability profiles.

```yaml
ActorAINode:
  id: "ai:claude"
  node_type: ACTOR_AI
  metadata:
    name: "Claude"
    model_id: "claude-opus-4-5-20251101"
    capability_profile:
      training_profile: GENERAL
      tool_access: [FILE_OPS, EXECUTION, INTEGRATIONS]
      reasoning_profile: BALANCED
    context_window_size: 200000
    current_context: []  # References to what's currently loaded
    reliability_metrics:
      overall: 0.92
      by_capability:
        Generate: 0.95
        Analyse: 0.90
        Decide: 0.85
  status: ACTIVE
```

#### SYSTEM

External systems and services.

```yaml
SystemNode:
  id: "system:github"
  node_type: SYSTEM
  metadata:
    name: "GitHub"
    system_type: VERSION_CONTROL | ISSUE_TRACKER | CI_CD | DOCUMENTATION
    endpoint: "https://github.com"
    capabilities: [READ, WRITE, QUERY]
    authentication: "oauth"
  status: ACTIVE
```

### Node Status

| Status | Meaning | TMS Implication |
|--------|---------|-----------------|
| `ACTIVE` | Available and current | Trusted for retrieval |
| `ARCHIVED` | No longer maintained | Historical reference only |
| `STALE` | May be outdated | Requires refresh before use |
| `UNKNOWN` | Status not determined | Needs verification |

---

## Edge Schema

### Core Edge Structure

```yaml
ContextEdge:
  id: string              # Auto-generated or explicit
  source: string          # Source node ID
  target: string          # Target node ID
  edge_type: EdgeType     # Relationship type
  metadata: EdgeMetadata  # Type-specific metadata
  created: timestamp
  confidence: float       # 0.0-1.0, how certain is this relationship
```

### Edge Types

#### Information Relationships

Relationships between artifacts.

| Edge Type | Semantics | Example |
|-----------|-----------|---------|
| `DERIVES_FROM` | Content synthesised from source | `ADR-001 DERIVES_FROM THY-001` |
| `REFERENCES` | Citation without derivation | `REF-001 REFERENCES F-1` |
| `SUPERSEDES` | This replaces that | `ADR-002 SUPERSEDES ADR-001` |
| `REQUIRES` | Must read/complete first | `SH-003 REQUIRES SH-002` |
| `BLOCKS` | Must complete before | `SH-002 BLOCKS SH-003` |
| `INFORMS` | Provides context for | `OBS-... INFORMS DEC-...` |

#### Traceability Relationships

Relationships for tracking validation, satisfaction, and dependency chains.

| Edge Type | Semantics | Direction | Example |
|-----------|-----------|-----------|---------|
| `VALIDATES` | Evidence supports theory/assumption | Evidence → Target | `OBS-... VALIDATES THY-001` |
| `ASSUMES` | Depends on unverified assumption | Any → ASM | `DEC-... ASSUMES ASM-001` |
| `SATISFIES` | Implementation meets requirement | Impl → Req | `src/auth.ts SATISFIES REQ-001` |
| `SPECIFIES` | Requirement derives from need | Req → Need | `REQ-001 SPECIFIES NEED-001` |
| `TESTS` | Test verifies implementation | Test → Impl | `auth.spec.ts TESTS src/auth.ts` |
| `COVERS` | Test covers requirement | Test → Req | `auth.spec.ts COVERS REQ-001` |
| `DEPENDS_ON` | Hard dependency | Any → Any | `REQ-002 DEPENDS_ON REQ-001` |

**Future extensions** (see FW-031):
- `CONTRADICTS` — Evidence challenges theory/assumption
- `RISKS` — Introduces risk to target

#### Actor-Artifact Relationships

Relationships between actors and artifacts.

| Edge Type | Semantics | Example |
|-----------|-----------|---------|
| `CREATED` | Actor produced artifact | `human:pidster CREATED THY-001` |
| `OWNS` | Actor responsible for artifact | `human:pidster OWNS ADR-001` |
| `CONTRIBUTED` | Actor participated in creation | `ai:claude CONTRIBUTED THY-001` |
| `KNOWS` | Actor has expertise about | `human:pidster KNOWS authentication` |
| `CURATES` | Actor maintains artifact | `ai:claude CURATES decisions.yaml` |

#### Actor-Actor Relationships

Relationships between actors (TMS coordination).

| Edge Type | Semantics | Example |
|-----------|-----------|---------|
| `DELEGATES_TO` | Actor routes work to another | `human:pidster DELEGATES_TO ai:claude` |
| `ESCALATES_TO` | Actor escalates decisions to | `ai:claude ESCALATES_TO human:pidster` |
| `COLLABORATES_WITH` | Actors work together | `human:pidster COLLABORATES_WITH ai:claude` |
| `SUPERVISES` | Actor oversees another | `human:pidster SUPERVISES ai:process-architect` |

#### System Relationships

Relationships involving systems.

| Edge Type | Semantics | Example |
|-----------|-----------|---------|
| `STORED_IN` | Artifact persisted in system | `THY-001 STORED_IN system:filesystem` |
| `INTEGRATES` | Actor connects to system | `ai:claude INTEGRATES system:github` |
| `MIRRORS` | System replicates from another | `system:docs MIRRORS system:confluence` |

### Edge Metadata

Type-specific metadata extends edges:

```yaml
# For CREATED edges
CreatedEdgeMetadata:
  timestamp: "2026-01-13T10:00:00Z"
  collaboration_pattern: Human-Led
  provenance_id: "DEC-20260113-100000"

# For KNOWS edges
KnowsEdgeMetadata:
  confidence: HIGH | MEDIUM | LOW
  evidence: ["created THY-001", "reviewed ADR-001"]
  last_demonstrated: "2026-01-14"

# For DELEGATES_TO edges
DelegatesToEdgeMetadata:
  scope: ["code-generation", "documentation"]
  constraints: ["requires-approval", "max-autonomy:AI-Led"]
  since: "2026-01-01"

# For VALIDATES edges
ValidatesEdgeMetadata:
  evidence_type: OBSERVATION | DECISION | TEST_RESULT
  strength: STRONG | MODERATE | WEAK
  notes: "Observation confirms predicted behaviour"

# For ASSUMES edges
AssumesEdgeMetadata:
  criticality: HIGH | MEDIUM | LOW  # Impact if assumption proves false
  validation_status: UNVALIDATED | VALIDATING | VALIDATED | INVALIDATED
  accepted_by: "human:pidster"
  accepted_date: "2026-01-21"

# For SATISFIES edges
SatisfiesEdgeMetadata:
  coverage: FULL | PARTIAL  # If partial, notes explain gaps
  notes: "Core functionality implemented; edge cases deferred"
  verified_by: "human:pidster"
```

---

## TMS Operations

The graph supports six TMS-aligned operations:

### locate(query) → Node[]

**TMS Function**: Directory lookup—find who/what knows about a topic.

```yaml
# Query: Find nodes related to "authentication"
locate:
  query:
    type: KEYWORD | NODE_TYPE | RELATIONSHIP
    value: "authentication"
  filters:
    node_types: [ARTIFACT, ACTOR_HUMAN, ACTOR_AI]
    status: [ACTIVE]
  limit: 10

# Returns: Matching nodes with relevance scores
```

**Implementation**: Text search on node metadata, edge traversal from query terms.

### route(new_info) → Node

**TMS Function**: Allocation—determine where new information should be stored.

```yaml
# Query: Where should a new ADR be stored?
route:
  content_type: ADR
  domain: "decision-logging"
  author: "human:pidster"

# Returns: Target node (store/location) with routing rationale
```

**Implementation**: Match content type to store conventions, consider actor ownership.

### retrieve(node_id) → Content

**TMS Function**: Retrieval—fetch content from a node.

```yaml
# Query: Get content of THY-001
retrieve:
  node_id: "THY-001"
  format: full | metadata | path

# Returns: Resolved content (delegates to resolver interface)
```

**Implementation**: Delegates to `resolve-reference.sh` (SH-002).

### refresh(node_id) → Status

**TMS Function**: Maintenance—update stale information.

```yaml
# Query: Refresh status of external reference
refresh:
  node_id: "system:github/issue/123"
  force: false  # Re-fetch even if not stale

# Returns: Updated node status, new content if changed
```

**Implementation**: Check source for updates, update metadata.

### discover(actor, domain) → Edge[]

**TMS Function**: Learning—find what an actor knows about a domain.

```yaml
# Query: What does pidster know about TMS?
discover:
  actor: "human:pidster"
  domain: "tms-theory"

# Returns: KNOWS edges with confidence and evidence
```

**Implementation**: Traverse KNOWS, CREATED, OWNS edges; aggregate evidence.

### invalidate(node_id) → void

**TMS Function**: Staleness—mark information as potentially outdated.

```yaml
# Command: Mark document as stale
invalidate:
  node_id: "REF-001"
  reason: "Source document updated"
  cascade: true  # Also mark dependents as stale

# Effect: Sets status to STALE, optionally cascades
```

**Implementation**: Update node status, optionally traverse DERIVES_FROM edges.

---

## Graph Queries

Common query patterns for TMS operations:

### "Who knows about X?"

```
MATCH (a)-[:KNOWS|:CREATED|:OWNS]->(n)
WHERE n.metadata.summary CONTAINS "X"
  OR n.id = "X"
RETURN a, type(r), n
```

### "What informs this decision?"

```
MATCH (d:DECISION)<-[:INFORMS*]-(source)
WHERE d.id = "DEC-20260114-..."
RETURN source, length(path)
```

### "What depends on this document?"

```
MATCH (d:DOCUMENT)<-[:DERIVES_FROM|:REFERENCES*]-(dependent)
WHERE d.id = "THY-001"
RETURN dependent
```

### "Who should review this?"

```
MATCH (a:ACTOR_HUMAN)-[:OWNS|:KNOWS]->(related)
WHERE related.metadata.domain = target_domain
RETURN a, count(related) as relevance
ORDER BY relevance DESC
```

### Traceability Queries

#### "Is this theory validated?"

```
MATCH (t:ARTIFACT {id: "THY-001"})<-[:VALIDATES]-(evidence)
RETURN evidence, count(evidence) as validation_count
```

#### "What assumptions does this decision depend on?"

```
MATCH (d:ARTIFACT {id: "DEC-..."})-[:ASSUMES]->(a:ARTIFACT)
WHERE a.metadata.artifact_type = "ASSUMPTION"
RETURN a, a.status
```

#### "Is this requirement satisfied and tested?"

```
MATCH (r:ARTIFACT {id: "REQ-001"})
OPTIONAL MATCH (impl)-[:SATISFIES]->(r)
OPTIONAL MATCH (test)-[:COVERS]->(r)
RETURN r, collect(impl) as implementations, collect(test) as tests
```

#### "What has unvalidated assumptions?"

```
MATCH (n)-[:ASSUMES]->(a:ARTIFACT)
WHERE a.metadata.artifact_type = "ASSUMPTION"
  AND NOT exists((evidence)-[:VALIDATES]->(a))
RETURN n, a
```

---

## Storage Considerations

### Current Implementation: Filesystem + YAML

Per SH-4 decision and DEC-20260121-133941, initial implementation uses filesystem storage with directory + instance file pattern (one file per node/edge) to reduce merge collisions in multi-user workflows:

```
.dialogue/
├── context-graph/
│   ├── nodes/
│   │   ├── artifacts/
│   │   │   ├── THY-001.yaml
│   │   │   ├── REQ-001.yaml
│   │   │   ├── ASM-001.yaml
│   │   │   └── ...
│   │   ├── actors/
│   │   │   ├── human-pidster.yaml
│   │   │   ├── ai-claude.yaml
│   │   │   └── ...
│   │   └── systems/
│   │       ├── github.yaml
│   │       └── ...
│   ├── edges/
│   │   ├── information/
│   │   │   └── {edge-id}.yaml
│   │   ├── traceability/
│   │   │   └── {edge-id}.yaml
│   │   ├── actor-artifact/
│   │   │   └── {edge-id}.yaml
│   │   ├── actor-actor/
│   │   │   └── {edge-id}.yaml
│   │   └── system/
│   │       └── {edge-id}.yaml
│   └── index.yaml            # Optional: quick lookup cache
```

**Note**: The graph indexes content that lives elsewhere (decisions in `.dialogue/logs/decisions/`, tasks in `.dialogue/tasks/`, documents in `implementation/` or `concepts/`). Node files contain metadata and `location_hint`; actual content remains in its canonical location.

### Future Evolution: Graph Database

Design supports migration to graph databases:
- **Kuzu**: Embedded, MIT license, Cypher queries (preferred path)
- **Memgraph**: Multi-user enterprise scenarios

The node/edge schema maps directly to property graph models.

---

## Integration Points

### With Information Reference Schema (SH-001)

Node IDs use reference formats from SH-001. The graph provides context; references provide identity.

### With Resolver Interface (SH-002)

`retrieve()` operation delegates to the resolver. The graph knows *what* exists; the resolver knows *where* and *how* to fetch it.

### With Decision/Observation Logging

New decisions and observations create:
- ARTIFACT nodes (the record itself)
- CREATED edges (from actor to record)
- INFORMS edges (from observations to decisions they inform)

### With Collaboration Patterns

Edge metadata captures collaboration patterns used in creation. This enables queries like "what was created under AI-Led pattern?"

---

## Validation Rules

### Node Validation

1. Node ID must match known reference pattern
2. Node type must be one of: ARTIFACT, ACTOR_HUMAN, ACTOR_AI, SYSTEM
3. Status must be one of: ACTIVE, ARCHIVED, STALE, UNKNOWN
4. Required metadata fields present for node type

### Edge Validation

1. Source and target must be valid node IDs
2. Edge type must be valid for source/target node types
3. Confidence must be 0.0-1.0 if present
4. Relationship types must be from defined set

### Consistency Rules

1. SUPERSEDES edge requires both nodes same type
2. BLOCKS/REQUIRES edges create directed acyclic graph (no cycles)
3. OWNS edge requires ACTOR_* source and ARTIFACT target
4. ESCALATES_TO requires ACTOR_AI source and ACTOR_HUMAN target
5. VALIDATES edge requires target with artifact_type DOCUMENT, ASSUMPTION, or similar theory-bearing type
6. ASSUMES edge requires target with artifact_type ASSUMPTION
7. SATISFIES edge requires target with artifact_type REQUIREMENT
8. TESTS edge requires source with artifact_type TEST and target with artifact_type IMPLEMENTATION
9. COVERS edge requires source with artifact_type TEST and target with artifact_type REQUIREMENT

---

## Validation Status

- ✓ **Node types**: Aligned with actor model and artifact taxonomy
- ✓ **Edge types**: Cover TMS relationships and information dependencies
- ✓ **TMS operations**: Map to Wegner's directory, allocation, retrieval
- ✓ **Storage design**: Filesystem-first with instance-per-file pattern, graph-ready
- ✓ **Traceability edges**: VALIDATES, ASSUMES, SATISFIES, SPECIFIES, TESTS, COVERS, DEPENDS_ON
- ⚠ **Query language**: Cypher-style examples; actual implementation pending
- ⚠ **Index structure**: Schema defined; optimisation pending
- ⚠ **Cascade logic**: Invalidation cascades need implementation
- ⚠ **Negative edges**: CONTRADICTS, RISKS deferred to FW-031

---

*The Context Graph externalises transactive memory and traceability—making "who knows what" and "what proves/satisfies what" queryable. Nodes are knowledge sources; edges are relationships. TMS operations enable directory lookup, allocation routing, and retrieval coordination. Traceability edges enable validation chain queries across theories, requirements, implementations, and tests.*
