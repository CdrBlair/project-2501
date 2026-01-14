# Schema: Environment Capability Registry

*Schema definition for documenting AI tool environment capabilities, enabling framework instantiation across different tools.*

---

## Purpose

The Environment Capability Registry provides a standardised schema for documenting what an AI development environment can do. This enables:

1. **Framework instantiation**: Applying the AI-Augmented SDLC Framework to specific tools
2. **Capability comparison**: Systematic comparison across tools (Claude Code, Copilot, Cursor, etc.)
3. **Gap analysis**: Identifying where tools fall short of framework requirements
4. **Evolution tracking**: Documenting capability changes over time

---

## Schema Overview

An Environment Capability Registry document describes a single AI tool environment's capabilities against framework concepts.

```
Environment Capability Registry
├── Identity
│   ├── Environment name
│   ├── Version / date
│   └── Vendor / source
│
├── Tool Access (what the AI can do)
│   ├── File operations
│   ├── Execution capabilities
│   ├── External integrations
│   └── Communication channels
│
├── Context Provision (what information reaches the AI)
│   ├── Standing context mechanisms
│   ├── Dynamic context mechanisms
│   └── Context limitations
│
├── Collaboration Support (how human-AI interaction works)
│   ├── Interaction modes
│   ├── Approval mechanisms
│   └── Escalation support
│
├── Configuration Mechanisms (how behaviour is customised)
│   ├── Project-level
│   ├── User-level
│   └── Organisation-level
│
├── Extension Points (how capabilities can be added)
│   ├── Plugin / skill systems
│   ├── Custom commands
│   └── Integration protocols
│
├── Generation Support (how to create correct artifacts)
│   ├── Validation tooling
│   ├── Creation assistance
│   ├── Canonical formats
│   └── Common pitfalls
│
└── Framework Mapping (how this maps to framework concepts)
    ├── Capability coverage
    ├── Collaboration pattern support
    └── 3S2P context provision
```

---

## Detailed Schema

### Identity Section

```yaml
identity:
  name: string                    # Tool name (e.g., "Claude Code")
  vendor: string                  # Vendor/organisation
  version: string                 # Version identifier or "as of YYYY-MM-DD"
  registry_version: string        # Schema version used (e.g., "0.1")
  last_updated: date              # When this registry was last verified
  documentation_url: string       # Official documentation reference
```

### Tool Access Section

Documents what operations the AI can perform.

```yaml
tool_access:
  file_operations:
    read:
      supported: boolean
      scope: enum [all | configured | none]
      notes: string
    write:
      supported: boolean
      scope: enum [all | configured | none]
      requires_approval: boolean
      notes: string
    search:
      supported: boolean
      mechanisms: list[string]    # e.g., ["glob", "grep", "semantic"]
      notes: string

  execution:
    shell_commands:
      supported: boolean
      sandboxed: boolean
      requires_approval: boolean
      timeout_configurable: boolean
      background_execution: boolean
      notes: string
    code_execution:
      supported: boolean
      languages: list[string]
      sandboxed: boolean
      notes: string

  external_integrations:
    web_access:
      supported: boolean
      mechanisms: list[string]    # e.g., ["fetch", "search"]
      restrictions: string
    api_calls:
      supported: boolean
      protocols: list[string]     # e.g., ["REST", "GraphQL", "MCP"]
      notes: string
    database_access:
      supported: boolean
      mechanisms: list[string]
      notes: string

  communication:
    user_questions:
      supported: boolean          # Can AI ask user questions?
      structured_options: boolean # Can present multiple choice?
      notes: string
    notifications:
      supported: boolean
      mechanisms: list[string]
      notes: string
```

### Context Provision Section

Documents how information reaches the AI.

```yaml
context_provision:
  standing_context:
    project_instructions:
      supported: boolean
      file_locations: list[string]  # e.g., ["CLAUDE.md", ".claude/CLAUDE.md"]
      inheritance: boolean          # Can inherit from parent directories?
      notes: string
    user_instructions:
      supported: boolean
      file_locations: list[string]
      notes: string
    organisation_policies:
      supported: boolean
      mechanism: string
      notes: string

  dynamic_context:
    file_inclusion:
      supported: boolean
      mechanisms: list[string]      # e.g., ["@file", "read tool", "auto-include"]
      size_limits: string
      notes: string
    conversation_history:
      preserved: boolean
      summarisation: boolean
      limit: string                 # e.g., "200k tokens" or "unlimited via compaction"
      notes: string
    external_resources:
      supported: boolean
      mechanisms: list[string]      # e.g., ["MCP resources", "web fetch"]
      notes: string

  context_limitations:
    max_context_size: string        # e.g., "200k tokens"
    truncation_behaviour: string
    priority_mechanisms: string     # How is relevance determined?
    notes: string
```

### Collaboration Support Section

Documents how human-AI interaction works.

```yaml
collaboration_support:
  interaction_modes:
    synchronous_chat:
      supported: boolean
      notes: string
    asynchronous_tasks:
      supported: boolean            # Can work while human is away?
      mechanisms: list[string]      # e.g., ["background agents", "queued tasks"]
      notes: string
    multi_agent:
      supported: boolean
      coordination: string          # How agents coordinate
      notes: string

  approval_mechanisms:
    tool_use_approval:
      supported: boolean
      granularity: enum [all | dangerous | configured | none]
      notes: string
    output_review:
      supported: boolean
      mechanisms: list[string]
      notes: string
    batch_approval:
      supported: boolean
      notes: string

  escalation_support:
    explicit_escalation:
      supported: boolean            # Can AI explicitly escalate to human?
      mechanism: string
      notes: string
    confidence_thresholds:
      supported: boolean            # Can configure when to escalate?
      notes: string
    audit_trail:
      supported: boolean            # Are escalations logged?
      notes: string
```

### Configuration Mechanisms Section

Documents how behaviour is customised.

```yaml
configuration:
  project_level:
    files: list[string]             # Config file locations
    format: string                  # e.g., "markdown", "yaml", "json"
    hot_reload: boolean             # Changes take effect immediately?
    notes: string

  user_level:
    files: list[string]
    format: string
    notes: string

  organisation_level:
    supported: boolean
    mechanism: string
    notes: string

  hierarchy:
    override_model: string          # How levels interact
    notes: string
```

### Extension Points Section

Documents how capabilities can be added.

```yaml
extensions:
  plugins:
    supported: boolean
    mechanism: string               # e.g., "plugin.json manifest"
    capabilities: list[string]      # What can plugins add?
    notes: string

  custom_commands:
    supported: boolean
    format: string                  # e.g., "markdown with frontmatter"
    location: string
    notes: string

  custom_agents:
    supported: boolean
    format: string
    isolation: string               # How are agents isolated?
    notes: string

  skills:
    supported: boolean
    format: string
    trigger_mechanism: string
    notes: string

  hooks:
    supported: boolean
    events: list[string]            # Available hook events
    implementation: string          # e.g., "shell script", "prompt-based"
    notes: string

  integration_protocols:
    mcp:
      supported: boolean
      server_types: list[string]    # e.g., ["stdio", "sse", "http"]
      notes: string
    other_protocols: list[string]
```

### Generation Support Section

Documents tooling and guidance available to help create correct artifacts for this tool. This meta-capability affects generation quality.

```yaml
generation_support:
  validation_tooling:
    available: boolean
    tools:
      - name: string                # e.g., "plugin-dev:plugin-validator"
        type: enum [validator | reviewer | linter]
        targets: list[string]       # What it validates: ["skills", "agents", "plugins"]
        invocation: string          # How to invoke it
        notes: string
    notes: string

  creation_assistance:
    available: boolean
    tools:
      - name: string                # e.g., "plugin-dev:agent-creator"
        type: enum [generator | wizard | template]
        targets: list[string]       # What it creates
        invocation: string
        notes: string
    notes: string

  canonical_formats:
    documentation_url: string       # Official format documentation
    examples_available: boolean
    example_locations: list[string]
    notes: string

  common_pitfalls:
    - issue: string                 # e.g., "Wrong file naming"
      correct: string               # e.g., "Must be SKILL.md in directory"
      incorrect: string             # e.g., "skill-name.md in skills/"
      detection: string             # How to detect this error
    notes: string
```

### Framework Mapping Section

Documents how this environment maps to framework concepts.

```yaml
framework_mapping:
  capability_coverage:
    elicit:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]      # How this capability is supported
      gaps: list[string]            # What's missing
      notes: string
    analyse:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    synthesise:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    transform:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    validate:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    decide:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    generate:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string
    preserve:
      support_level: enum [full | partial | minimal | none]
      mechanisms: list[string]
      gaps: list[string]
      notes: string

  collaboration_pattern_support:
    human_only:
      implementable: boolean
      mechanism: string             # How to enforce no AI involvement
      notes: string
    human_led:
      implementable: boolean
      mechanism: string
      notes: string
    partnership:
      implementable: boolean
      mechanism: string
      notes: string
    ai_led:
      implementable: boolean
      mechanism: string
      notes: string
    ai_only:
      implementable: boolean
      mechanism: string
      notes: string

  context_model_3s2p:
    scope:
      provision_mechanism: string   # How scope context is provided
      notes: string
    situation:
      provision_mechanism: string
      notes: string
    system:
      provision_mechanism: string
      notes: string
    phase:
      provision_mechanism: string
      notes: string
    process:
      provision_mechanism: string
      notes: string

  decision_observation_support:
    decision_logging:
      supported: boolean
      mechanism: string             # e.g., "custom hooks", "built-in"
      notes: string
    observation_logging:
      supported: boolean
      mechanism: string
      notes: string
    provenance_tracking:
      supported: boolean
      granularity: string
      notes: string
```

---

## Usage Guidelines

### Creating a Registry

1. **Start with identity** — Document tool name, version, and update date
2. **Enumerate tool access** — What can the AI actually do?
3. **Document context provision** — How does information reach the AI?
4. **Assess collaboration support** — How do humans and AI interact?
5. **List configuration mechanisms** — How is behaviour customised?
6. **Identify extension points** — How can capabilities be added?
7. **Map to framework** — How well does this support framework concepts?

### Validation Approach

For each section:
- **Verify against documentation** — Check official vendor docs
- **Test empirically** — Confirm capabilities work as documented
- **Note version sensitivity** — Capabilities change rapidly
- **Flag uncertainty** — Mark unverified claims

### Comparison Across Tools

When comparing registries:
- Focus on **framework mapping** section for conceptual comparison
- Use **tool access** for capability comparison
- Check **extension points** for customisation potential
- Consider **collaboration support** for workflow fit

---

## Example: Claude Code Registry (Partial)

```yaml
identity:
  name: "Claude Code"
  vendor: "Anthropic"
  version: "as of 2026-01-13"
  registry_version: "0.1"
  last_updated: 2026-01-13
  documentation_url: "https://docs.anthropic.com/claude-code"

tool_access:
  file_operations:
    read:
      supported: true
      scope: all
      notes: "Read tool can access any file with appropriate permissions"
    write:
      supported: true
      scope: all
      requires_approval: false  # Configurable via settings
      notes: "Write and Edit tools available"
    search:
      supported: true
      mechanisms: ["glob", "grep"]
      notes: "Glob for file patterns, Grep for content search"

  execution:
    shell_commands:
      supported: true
      sandboxed: true  # Configurable
      requires_approval: true  # By default for destructive commands
      timeout_configurable: true
      background_execution: true
      notes: "Bash tool with configurable sandboxing"

# ... continued ...

framework_mapping:
  capability_coverage:
    elicit:
      support_level: full
      mechanisms: ["Read tool", "Grep tool", "WebFetch", "AskUserQuestion"]
      gaps: ["No direct stakeholder interview support"]
      notes: "Strong for system/document elicitation; human interaction via questions"
    generate:
      support_level: full
      mechanisms: ["Write tool", "Edit tool", "code generation"]
      gaps: []
      notes: "Core strength of the tool"
    preserve:
      support_level: partial
      mechanisms: ["Write tool", "custom logging scripts"]
      gaps: ["No built-in decision tracking", "No automatic rationale capture"]
      notes: "Can be extended via hooks and skills"
```

---

## Schema Evolution

### Version 0.1 (Current)

Initial schema covering:
- Core tool capabilities
- Context provision mechanisms
- Collaboration support
- Framework concept mapping

### Planned Extensions

- **Performance characteristics** — Latency, throughput, cost
- **Security model** — Trust boundaries, data handling
- **Team features** — Multi-user, shared context
- **Audit and compliance** — Logging, retention, access control

---

## Connection to Framework Concepts

| Schema Section | Framework Concept | Relationship |
|----------------|-------------------|--------------|
| Tool Access | Actor Model (AI capabilities) | Defines what AI actors can do |
| Context Provision | 3S2P Context Model | How context dimensions are populated |
| Collaboration Support | Collaboration Patterns | Which patterns the tool can implement |
| Extension Points | Executable Framework | How framework tooling integrates |
| Framework Mapping | All concepts | Direct assessment of framework support |

---

## Validation Status

- ✓ **Schema structure**: Comprehensive coverage of capability dimensions
- ✓ **Framework alignment**: Maps to core framework concepts
- ⚠ **Field completeness**: Some edge cases may require additional fields
- ⚠ **Practical validation**: Schema not yet applied to multiple tools
- ⚠ **Comparison utility**: Cross-tool comparison workflow not validated

---

*This schema enables systematic documentation of AI tool environments, supporting framework instantiation across the diverse and evolving ecosystem of AI development assistants.*
