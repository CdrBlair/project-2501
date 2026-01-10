# Planning: Future Work

This document tracks potential future development directions for the AI-Augmented SDLC Framework. Items here represent ideas under consideration, not committed work.

---

## Active Considerations

### 1. Executable Framework Manifestation

**Description**: Develop the framework beyond documentation into an executable form—potentially as tooling, templates, or structured guidance that can be applied directly to software projects.

**Prior exploration**: We have previously discussed creating more detail on software engineering processes and manifesting the framework in executable form.

**Potential approaches**:
- Process templates aligned with the seven-phase model
- Capability flow specifications as executable workflows
- Collaboration pattern checklists or decision trees
- Integration with existing tooling (IDE plugins, CI/CD hooks, project management)
- Structured prompts or context documents for AI assistants

**Open questions**:
- What form would be most useful? (Documentation? Tooling? Both?)
- Which parts of the framework are mature enough to operationalise?
- How to maintain alignment between executable artifacts and evolving framework concepts?

**Status**: Under consideration

---

### 2. Framework as Analytical Lens for Other Frameworks

**Description**: Use the AI-Augmented SDLC Framework as an analytical tool to evaluate other executable frameworks, methodologies, and tools—assessing how well they address tacit knowledge, theory-building, collaboration patterns, and information transitions.

**Potential applications**:
- Analyse existing methodologies (Agile, SAFe, DevOps) through the framework's concepts
- Evaluate AI coding assistants against collaboration pattern expectations
- Assess project management tools for information loss at transitions
- Compare CI/CD pipelines against phase-specific composition requirements
- Review documentation tools for standing/dynamic/ephemeral document support

**Value proposition**:
- Demonstrates framework's practical utility
- Identifies gaps in existing tools and methodologies
- Provides structured critique grounded in empirical research
- May reveal where the framework itself needs refinement

**Open questions**:
- Which frameworks/tools would be most valuable to analyse first?
- What format should analyses take? (Companion-style documents? Comparative tables?)
- How to handle frameworks that use different terminology for similar concepts?

**Status**: Under consideration

---

### 3. Framework Self-Reference and Bootstrapping

**Description**: Investigate whether the framework can achieve properties analogous to a self-hosting compiler—a compiler capable of compiling itself. This represents a notable milestone in compiler development (bootstrapping), demonstrating that the system is sufficiently complete and coherent to operate on its own constructs.

**Dimensions to explore**:

- **Self-referencing**: Can the framework's concepts describe the framework itself? (Already partially achieved via CLAUDE.md "Meta-Application Principle")
- **Self-validation**: Can the framework's validation approaches be applied to validate the framework's own claims?
- **Self-generation**: Could the framework guide an AI assistant in generating or extending framework documents according to its own principles?

**Theoretical significance**:
- A self-hosting compiler proves the language is powerful enough to express its own implementation
- A self-referencing framework would demonstrate conceptual completeness—all concepts needed to describe human-AI collaboration are present
- Self-validation would demonstrate internal consistency and falsifiability
- Self-generation would demonstrate operational maturity

**Current state**:
- CLAUDE.md already applies framework principles to framework development (partial self-reference)
- Companion analyses use consistent structure (partial self-generation template)
- Validation status sections acknowledge what's validated vs. requiring validation (partial self-validation awareness)

**Open questions**:
- What would "complete" self-reference look like? Is there a formal test?
- Can we articulate the framework's information composition (formal/tacit/emergent) for framework development itself?
- What collaboration patterns are we using to develop the framework, and do they match the framework's own recommendations?
- Could an AI generate a new concept document that meets framework standards, guided only by the framework itself?

**Risks**:
- Self-reference can lead to circular reasoning or infinite regress
- The framework may be incomplete in ways that self-reference cannot detect
- Over-focus on self-reference may distract from practical utility

**Status**: Under consideration

---

### 4. AI Configuration and Integration Registry

**Description**: Create a comprehensive document cataloguing the emerging ecosystem of AI configuration and integration mechanisms—the various files, protocols, and patterns through which humans configure and interact with AI development assistants.

**Elements to document**:

*Configuration files:*
- `CLAUDE.md` — Claude Code project/user instructions
- `AGENTS.md` — Multi-agent configuration
- `copilot-instructions.md` — GitHub Copilot customisation
- `.cursorrules` — Cursor editor AI rules
- Custom system prompts and persona definitions

*Integration protocols:*
- MCP (Model Context Protocol) — tool and resource integration
- Agent skills and capabilities
- Custom slash commands
- Hooks and callbacks
- Context injection patterns

*Emerging patterns:*
- Project-level vs user-level vs organisation-level configuration
- Standing instructions vs dynamic context
- Capability declarations vs behavioural constraints
- Trust boundaries and permission models

**Value proposition**:
- Provides reference for practitioners configuring AI tools
- Identifies commonalities and divergences across tools
- Informs framework guidance on AI-Led and Partnership patterns
- Documents how "context engineering" manifests in practice
- Supports Item 2 (analytical lens) by cataloguing what exists

**Connection to framework**:
- These configuration mechanisms are how humans specify collaboration patterns in practice
- Maps to escalation design, capability allocation, and trust calibration
- Represents formalisation of tacit knowledge about desired AI behaviour
- Standing vs dynamic configuration maps to document lifecycle classification

**Open questions**:
- How rapidly is this ecosystem evolving? (Risk of obsolescence)
- Should this be a living document or point-in-time snapshot?
- What level of detail is useful without becoming tool documentation?

**Status**: Under consideration

---

## Parking Lot

*Items noted but not yet developed into full considerations*

---

## Completed Items

*Items that have been addressed and can be referenced*

---

*Document created: 10 January 2026*
*Purpose: Track future development directions for the framework*
