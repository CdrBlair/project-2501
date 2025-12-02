# Key Reference Concept 5: Actor Model

## Definition

The Actor Model reconceptualises who performs work in software development by treating all participants—human and AI—as actors who provide information services through specific capabilities. An actor is defined not by job title, organisational position, or nature (human vs artificial) but functionally: by what capabilities they can provide and what knowledge enables those capabilities. This abstraction enables more precise reasoning about task allocation than traditional role-based thinking. Rather than asking "should developers or AI handle this?" the model asks "what capabilities does this activity require, and which actors can provide them effectively?" This functional approach dissolves confusion about AI's role in development—AI isn't a "developer" or "tester" but rather an actor that can provide capabilities when operating on formal knowledge, while being unable to provide them when tacit knowledge access is required. The determining factor is knowledge type, not capability category. The fundamental insight is that humans and AI are both actors providing capabilities, distinguished not by role categories but by asymmetric access to different knowledge types and complementary strengths and limitations.

## Actor Characteristics: Human vs AI

| Characteristic | Human Actor | AI Actor |
|----------------|-------------|----------|
| **Knowledge source** | Experience (accumulated through practice), formal education (structured learning), social learning (from colleagues and communities) | Training data (patterns in millions of examples), fine-tuning (specialisation on specific domains), context/prompts (immediate situational information) |
| **Knowledge access** | Recall (retrieving from memory), intuition (pattern recognition developed through experience), embodied understanding (knowledge integrated across experiences) | Vector similarity (statistical pattern matching), attention mechanisms (focusing on relevant input), in-context learning (adapting to immediate patterns) |
| **Unique strengths** | Novel situations (handling unprecedented problems), value judgements (weighing competing goods with no objective answer), theory building (developing coherent understanding enabling intelligent evolution) | Pattern matching at scale (recognising similarities across millions of examples), consistency (applying rules uniformly without fatigue), tireless execution (continuous operation without degradation) |
| **Critical limitations** | Cognitive load (finite working memory and attention), availability (limited hours, need rest), bias (systematic judgement distortions), knowledge silos (individual knowledge not shared) | No genuine understanding (pattern matching without comprehension), cannot build theory (lacks coherent understanding of why systems work), no persistent memory (each interaction starts fresh without accumulated context) |
| **Theory relationship** | Can build theory through engagement with problems—developing understanding that enables intelligent system evolution | Cannot build theory—produces outputs based on statistical patterns without the understanding necessary for intelligent adaptation |
| **Tacit knowledge** | Can develop, hold, and apply tacit knowledge through experience—"we know more than we can tell" | Cannot access tacit knowledge—requires all knowledge to be formalised in training data or prompts |


## Actor Suitability Factors

## Actor Suitability Factors

Actor suitability for a capability instance is determined by multiple factors:

| Factor | Description | Human-suited | AI-suited |
|--------|-------------|--------------|-----------|
| **Knowledge type** | Formal, tacit, or emergent | All three | Formal only |
| **Source type** | Systems, documents, humans, observations | All sources | Systems, documents |
| **Interaction mode** | Structured query/response vs. negotiated/exploratory | Both | Structured |
| **Trust/context requirements** | Whether source yields information only through relationship or shared context | High trust contexts | Low trust contexts |

The fundamental asymmetry remains knowledge type, but source and interaction characteristics determine whether tacit knowledge is actually in play. Eliciting from an API is formal regardless of domain complexity; eliciting from a stakeholder involves tacit knowledge regardless of how structured the questions.

## Actors vs Roles: The Critical Distinction

Traditional software organisations structure around roles: developers, testers, architects, analysts, project managers. These roles bundle responsibilities based on organisational convenience and historical convention. The actor model makes a fundamental distinction between roles (organisational constructs) and actors (functional capability providers).

**Roles** are organisational positions with job titles, reporting structures, and conventional scopes. A "Software Architect" role typically includes responsibility for technical vision, design decisions, and standards enforcement. Roles persist regardless of who fills them and accumulate expectations over time.

**Actors** are functional—entities providing specific capabilities in specific contexts. The same person filling the architect role might function as multiple actors across different activities: providing synthesis capability when developing architectural vision, decision capability when evaluating alternatives, validation capability when reviewing implementations, and elicitation capability when understanding stakeholder concerns.

**Why this matters for AI integration**: AI cannot fill a role in the organisational sense—it has no job title, reports to no one, holds no authority, and accepts no accountability. But AI can provide specific capabilities as an actor. Rather than debating whether AI is a "developer" or "tester" (role questions with no clear answer), we ask which specific capabilities AI can provide effectively (functional questions with clearer answers based on knowledge requirements).

**Why this matters for task allocation**: Role-based thinking bundles capabilities in ways that may not be optimal. The architect role bundles synthesis, decision, validation, and elicitation because organisations find it convenient to assign all to senior technical positions. However, these capabilities could be distributed differently based on actual ability to provide them effectively. Making bundling explicit through the actor lens enables flexible organisation.

## Key Implications

**For understanding AI capabilities and limitations**: AI's inability to build theory—not just current technical limitations but fundamental inability to develop coherent understanding—explains why certain activities must remain human regardless of AI advancement. Theory building requires genuine engagement with problems that AI cannot replicate through pattern matching. This is not a temporary limitation but a fundamental difference in how humans and AI access and process knowledge.

**For task allocation decisions**: Actors should be selected based on capability requirements, not role conventions. Activities requiring theory building must have human actors regardless of whether AI could technically perform the mechanics. Activities operating on formal knowledge with clear success criteria can leverage AI actors. Activities with mixed requirements benefit from multiple actors collaborating, each providing capabilities matching their strengths.

**For skill development**: Rather than training people for roles, identify which capabilities individuals need to develop. A junior developer might need to strengthen analysis capability (recognising code patterns), validation capability (testing judgement), and synthesis capability (designing coherent modules). This capability-specific development is more targeted than generic "junior developer training."

**For addressing cognitive load**: Distributing capabilities across multiple actors (human and AI) can reduce individual cognitive load. Rather than one architect holding all architectural knowledge, distribute synthesis across team members, use AI for consistency checking and pattern suggestion, and have humans focus on high-level theory building and critical decisions. This requires explicit recognition that capabilities can be distributed.

**For recognising accountability requirements**: While capabilities can be provided by either human or AI actors, accountability can only rest with humans. Even if AI could technically make release decisions or accept risk, someone human must be accountable for outcomes. This means certain decision capabilities must remain human not because AI lacks technical ability but because accountability cannot be delegated to machines.

## Integration with Other Concepts

- [**Information Composition Taxonomy**](./01_information_taxonomy.md): Human actors can process all three knowledge types (formal, tacit, emergent). AI actors can only process formal knowledge. This asymmetry is the fundamental driver of appropriate actor selection—activities with high tacit or emergent composition require human actors.
- [**Theory-Building Principle**](./02_theory_building.md): The distinction between humans building theory and AI matching patterns is the actor model's most critical asymmetry. This explains why certain activities must remain human even when AI technical capabilities advance—theory building is not a technical problem but a fundamental difference in knowledge access.
- [**Eight-Capability Taxonomy**](./03_capability_model.md): Actor suitability is determined at the capability instance level by knowledge type, source type, and interaction mode — not by capability category. AI can elicit from systems but not unstated assumptions from stakeholders. AI can synthesise structured summaries but not novel understanding from ambiguous inputs. The capability taxonomy identifies what operation is needed; the knowledge type of the specific instance determines who should provide it.
- [**Seven-Phase SDLC Model**](./04_7phase_SDLC.md): Different phases have different capability requirements and information compositions, thus benefiting from different actor mixes. Early phases require predominantly human actors due to high tacit content. Later phases enable more AI actor participation due to higher formal content.
- [**Five Collaboration Patterns**](./07_collaboration_patterns.md): Concept 7 defines how human and AI actors work together. The patterns (Human-Only, Human-Led, Partnership, AI-Led, AI-Only) operationalise the actor model's insights about when each actor type should lead, support, or refrain from participation.
- [**Phase-Specific Information Composition**](./06_phase_specific_composition.md): Phase composition determines appropriate actor mix—tacit-heavy phases need human actors, formal-heavy phases enable AI actors.

## Evidence Base

Hewitt's 1973 actor model in computer science provides computational abstraction of entities communicating through messages. Knowledge-based views of organisations establish that capabilities emerge from knowledge rather than structures. Distributed cognition research shows cognitive work distributed across agents and artifacts, validating the actor model's treatment of development as distributed work. GitHub Copilot studies showing 55% faster task completion on routine tasks validate AI strength in pattern-based generation, while higher defect rates on complex logic validate the limitation that AI lacks genuine understanding. Research on knowledge loss in teams (2-3x longer bug fix time without original authors) validates the distinction between human theory and AI pattern matching. Aviation and process control automation research provides cautionary evidence about over-automation leading to skill degradation, validating concerns about preserving human capabilities even when AI could technically perform activities.

## Validation Status

- ✓ **Conceptual coherence**: Practitioners recognise the actor vs role distinction and find it useful for reasoning about task allocation
- ✓ **Human vs AI characteristic differences**: Well-supported through capability studies and cognitive science research
- ✓ **Theory-building asymmetry**: Validated through knowledge management research and software maintenance studies
- ⚠ **Completeness of characteristics**: The six characteristics (knowledge source, access, strengths, limitations, theory relationship, tacit knowledge) capture key differences but may not be exhaustive
- ⚠ **Actor selection criteria**: The framework for choosing appropriate actors exists but hasn't been validated through controlled studies comparing actor selection approaches
- ⚠ **Capability distribution patterns**: Common patterns for distributing capabilities across actors are observed but not systematically catalogued
- ⚠ **Instance-level allocation**: Actor suitability is determined at the capability instance level, not the capability category level. A single capability step within an activity typically comprises multiple instances requiring different actors. This granularity requires validation through studies of actual allocation practices.

---

*The Actor Model provides the conceptual foundation for understanding who can provide what capabilities in software development. By characterising human and AI actors through their knowledge access and processing rather than roles or labels, the model enables systematic reasoning about appropriate task allocation throughout the SDLC. The patterns of how actors collaborate are defined separately in Concept 7.*
