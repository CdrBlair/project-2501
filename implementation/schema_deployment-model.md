# Schema: Deployment Model

**Document Type**: SPC (Specification)
**Temporal Class**: Standing
**Scope**: Project
**Status**: DRAFT
**Version**: 1

---

## Purpose

This schema defines what constitutes a framework deployment versus framework source, establishing the boundary between what is distributed to projects and what remains in the framework repository.

**Related documents**:
- [Information Reference Schema](./schema_information-reference.md) — Reference ID patterns
- [Resolver Interface](./schema_resolver-interface.md) — Content retrieval
- [ADR-002](../decisions/ADR-002-hybrid-approach-for-existing-artifact-treatment.md) — Artifact treatment approach

---

## The Problem

The framework contains three categories of content with different deployment characteristics:

1. **Framework source** — Documentation explaining the framework (concepts, papers, research)
2. **Deployment artifacts** — Tooling that projects use (.claude/, .dialogue/ infrastructure)
3. **Project artifacts** — Content created by projects using the framework (decisions, observations)

The resolver script initially hardcoded paths to framework source (e.g., `concepts/`), but deployed projects won't have access to that directory. This schema clarifies what goes where.

---

## Three-Tier Artifact Model

### Tier 1: Framework Source (NOT Deployed)

Content that explains the framework but is not distributed with deployments.

| Directory | Content | Purpose |
|-----------|---------|---------|
| `concepts/` | Foundation, concept, integration, guidance, example documents | Theoretical grounding |
| `papers/` | Academic source PDFs and companion analyses | Evidence base |
| `research/` | Reference materials, exploratory work | Background research |
| `implementation/` | Schemas, registries, manual (this project only) | Framework generation inputs |

**Reference patterns**: `F-N`, `C-N`, `I-N`, `G-N`, `E-N`, `O-N`

**Resolver behaviour**: Returns `NOT_SUPPORTED` status with note directing to framework documentation.

**Access model**:
- Web documentation (future): Published to documentation site
- Direct reference: Users can clone framework repository for full access
- Not bundled: Too large and changes independently of deployments

### Tier 2: Deployment Artifacts (Distributed)

Tooling and infrastructure that projects copy/install to use the framework.

| Directory | Content | Purpose |
|-----------|---------|---------|
| `.claude/` | Skills, agents, commands, hooks | AI assistant integration |
| `.dialogue/` | Scripts, schemas, README | Logging and tracking infrastructure |
| `decisions/` | (empty or template) | ADR storage location |

**What gets deployed**:
```
.claude/
├── skills/
│   ├── dialogue-log-decision/
│   ├── dialogue-log-observation/
│   ├── dialogue-create-adr/
│   ├── dialogue-resolve-reference/
│   ├── dialogue-structured-elicit/
│   ├── dialogue-verify-logging-compliance/
│   └── build-only-validate-capability-flow/
├── agents/
│   └── process-architect.md
├── commands/
│   └── (project-specific)
└── CLAUDE.md (template, project customises)

.dialogue/
├── scripts/
│   ├── log-decision.sh
│   └── log-observation.sh
├── config.yaml (template)
├── work-items.yaml (empty template)
└── README.md

decisions/
└── (empty, or ADR-000-template.md)
```

**Distribution mechanism**:
- Git template repository
- Package manager (future): npm/pip package with scaffolding command
- Manual copy: Clone and copy relevant directories

### Tier 3: Project Artifacts (Created at Runtime)

Content created by projects using the framework.

| Location | Content | Created By |
|----------|---------|------------|
| `.dialogue/logs/decisions.yaml` | Decision records | `log-decision.sh` |
| `.dialogue/logs/observations.yaml` | Observation records | `log-observation.sh` |
| `.dialogue/work-items.yaml` | Project work items | Manual or AI |
| `decisions/ADR-*.md` | Architecture Decision Records | `create-adr.sh` |
| `docs/` or custom | THY, REF, STR documents | Project team |

**Reference patterns**: `THY-NNN`, `REF-NNN`, `STR-NNN`, `ADR-NNN`, `DEC-*`, `OBS-*`, `SH-NNN`, `CD-NNN`, `FW-NNN`

**Resolver behaviour**: Fully resolved from configured locations.

---

## Configuration Mechanism

### Resolver Configuration File

Projects configure artifact locations via `.dialogue/config.yaml`:

```yaml
# Resolver Configuration
# Defines where project artifacts are located

version: "1.0"

# Project document locations
artifacts:
  theory:
    directory: "docs"           # Where THY-NNN documents live
    pattern: "theory_*.md"      # Filename pattern

  reference:
    directory: "docs"
    pattern: "ref_*.md"

  strategy:
    directory: "docs"
    pattern: "str_*.md"

  adr:
    directory: "decisions"
    pattern: "ADR-*.md"

# Log locations (rarely changed)
logs:
  decisions: ".dialogue/logs/decisions.yaml"
  observations: ".dialogue/logs/observations.yaml"

# Work items
work_items: ".dialogue/work-items.yaml"
```

### Default Locations

When no configuration exists, the resolver uses sensible defaults:

| Artifact Type | Default Location |
|---------------|------------------|
| THY documents | `docs/theory_*.md` |
| REF documents | `docs/ref_*.md` |
| STR documents | `docs/str_*.md` |
| ADR documents | `decisions/ADR-*.md` |
| Decision log | `.dialogue/logs/decisions.yaml` |
| Observation log | `.dialogue/logs/observations.yaml` |
| Work items | `.dialogue/work-items.yaml` |

### Framework Development Override

This project (framework source) uses non-default locations because:
- `implementation/` contains schemas and theory documents
- The project is developing the framework, not just using it

Framework development configuration:
```yaml
artifacts:
  theory:
    directory: "implementation"
    pattern: "theory_*.md"
  reference:
    directory: "implementation"
    pattern: "ref_*.md"
  strategy:
    directory: "implementation"
    pattern: "str_*.md"
```

---

## Deployment Scenarios

### Scenario 1: New Project Using Framework

1. Copy deployment artifacts (Tier 2) to project
2. Customise `.claude/CLAUDE.md` for project
3. Create `.dialogue/config.yaml` (or use defaults)
4. Begin creating project artifacts (Tier 3)

**Framework source access**: Via web documentation or separate clone.

### Scenario 2: Framework Development

1. Full repository with all tiers
2. Custom resolver config pointing to `implementation/`
3. Framework source (Tier 1) available locally
4. Creating both framework source and project artifacts

### Scenario 3: Enterprise Deployment

1. Framework deployment artifacts in shared location
2. Project-specific configuration per repository
3. Enterprise documentation system for framework source
4. Centralised tooling management

---

## Reference Resolution by Tier

| Reference Pattern | Tier | Resolution |
|-------------------|------|------------|
| `F-N`, `C-N`, `I-N`, `G-N`, `E-N`, `O-N` | 1 (Source) | `NOT_SUPPORTED` — framework docs |
| Skills, agents, commands | 2 (Deployment) | Direct filesystem access |
| `THY-NNN`, `REF-NNN`, `STR-NNN` | 3 (Project) | Configured location |
| `ADR-NNN` | 3 (Project) | Configured location |
| `DEC-*`, `OBS-*` | 3 (Project) | Log files |
| `SH-NNN`, `CD-NNN`, `FW-NNN` | 3 (Project) | Work items file |
| `human:<id>`, `ai:<id>` | N/A | Metadata only |
| `https://...` | N/A | External (WebFetch) |

---

## Framework Documentation Access

### Current State

Framework source documentation (concepts/, papers/) is only available by:
1. Cloning the framework repository
2. Reading source files directly

### Future Options

| Option | Pros | Cons |
|--------|------|------|
| **Web documentation** | Always available, searchable | Requires hosting, versioning |
| **Bundled subset** | Offline access | Increases deployment size |
| **Reference links** | Lightweight | Requires connectivity |

**Recommended approach**: Web documentation with reference links in deployment artifacts.

---

## Validation Rules

### Deployment Package Validation

A valid deployment package must contain:
- [ ] `.claude/skills/` with core skills
- [ ] `.claude/CLAUDE.md` template
- [ ] `.dialogue/` infrastructure scripts
- [ ] `decisions/` directory (may be empty)

### Configuration Validation

Valid resolver configuration must:
- [ ] Specify existing directories for artifacts
- [ ] Use valid glob patterns
- [ ] Point to readable file locations

---

## Migration Path

### Existing Projects

Projects already using the framework can adopt configuration:

1. Create `.dialogue/config.yaml`
2. Set paths to match current document locations
3. No document moves required

### Gradual Adoption

Projects can adopt incrementally:
1. Start with logging only (no config needed)
2. Add ADRs (default location works)
3. Add THY/REF/STR documents (configure if non-default location)

---

## Validation Status

- ✓ **Three-tier model**: Clear separation of concerns
- ✓ **Configuration schema**: Defined with defaults
- ✓ **Deployment contents**: Enumerated
- ⚠ **Config parsing**: Resolver currently uses hardcoded values (TODO)
- ⚠ **Web documentation**: Future work
- ⚠ **Package manager distribution**: Future work

---

*The deployment model separates framework source from deployment artifacts from project artifacts. Configuration makes the resolver adaptable to different project structures.*
