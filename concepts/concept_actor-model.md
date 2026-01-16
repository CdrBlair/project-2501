# Key Reference Concept 5: Actor Model

## Definition

The Actor Model reconceptualises who performs work in software development by treating all participants—human and AI—as actors who provide information services through specific capabilities. An actor is defined not by job title, organisational position, or nature (human vs artificial) but functionally: by what capabilities they can provide and what knowledge enables those capabilities. This abstraction enables more precise reasoning about task allocation than traditional role-based thinking. Rather than asking "should developers or AI handle this?" the model asks "what capabilities does this activity require, and which actors can provide them effectively?" This functional approach dissolves confusion about AI's role in development—AI isn't a "developer" or "tester" but rather an actor that can provide capabilities when operating on formal knowledge, while being unable to provide them when tacit knowledge access is required. The determining factor is knowledge type, not capability category. The fundamental insight is that humans and AI are both actors providing capabilities, distinguished not by role categories but by asymmetric access to different knowledge types and complementary strengths and limitations.

## Actor Characteristics: Human vs AI

| Characteristic | Human Actor | AI Actor |
|----------------|-------------|----------|
| **Knowledge source** | Experience (accumulated through practice), formal education (structured learning), social learning (from colleagues and communities) | Training data (patterns in millions of examples), fine-tuning (specialisation on specific domains), context/prompts (immediate situational information) |
| **Knowledge access** | Recall (retrieving from memory), intuition (pattern recognition developed through experience), embodied understanding (knowledge integrated across experiences) | Vector similarity (statistical pattern matching), attention mechanisms (focusing on relevant input), in-context learning (adapting to immediate patterns) |
| **Unique strengths** | Novel situations (handling unprecedented problems), value judgements (weighing competing goods with no objective answer), theory building (developing coherent understanding enabling intelligent evolution) | Pattern matching at scale (recognising similarities across millions of examples), consistency (applying rules uniformly without fatigue), tireless execution (continuous operation without degradation) |
| **Critical limitations** | Cognitive load (finite working memory and attention), availability (limited hours, need rest), bias (systematic judgement distortions), knowledge silos (individual knowledge not shared) | Whether AI has "genuine understanding" is contested; produces outputs without the persistent explanatory model that enables humans to maintain systems over time; no accumulated context across sessions |
| **Theory relationship** | Can build theory through engagement with problems—developing understanding that enables intelligent system evolution | Whether AI builds anything analogous to "theory" (Naur's sense) is an open question. Current AI produces outputs based on learned patterns; whether this constitutes understanding or enables intelligent adaptation is debated. |
| **Tacit knowledge** | Can develop, hold, and apply tacit knowledge through experience—"we know more than we can tell" | Accesses tacit knowledge through dialogue—AI can elicit articulation from humans, process those articulations, and present understanding back for refinement. The relationship is mediated rather than direct. |

## Actor Suitability Factors

Actor suitability for a capability instance is determined by multiple factors:

| Factor | Description | Human-suited | AI-suited |
|--------|-------------|--------------|-----------|
| **Knowledge type** | Formal, tacit, or emergent | All three directly | Formal directly; tacit/emergent through dialogue |
| **Source type** | Systems, documents, humans, observations | All sources | Systems, documents; humans through structured interaction |
| **Interaction mode** | Structured query/response vs. negotiated/exploratory | Both | Primarily structured; iterative dialogue extends range |
| **Trust/context requirements** | Whether source yields information only through relationship or shared context | High trust contexts | Lower trust contexts; extended dialogue can build working context |

The fundamental asymmetry remains knowledge type, but source and interaction characteristics determine whether tacit knowledge is actually in play. Eliciting from an API is formal regardless of domain complexity; eliciting from a stakeholder involves tacit knowledge regardless of how structured the questions.

## Actors vs Roles: The Critical Distinction

Traditional software organisations structure around roles: developers, testers, architects, analysts, project managers. These roles bundle responsibilities based on organisational convenience and historical convention. The actor model makes a fundamental distinction between roles (organisational constructs) and actors (functional capability providers).

**Roles** are organisational positions with job titles, reporting structures, and conventional scopes. A "Software Architect" role typically includes responsibility for technical vision, design decisions, and standards enforcement. Roles persist regardless of who fills them and accumulate expectations over time.

**Actors** are functional—entities providing specific capabilities in specific contexts. The same person filling the architect role might function as multiple actors across different activities: providing synthesis capability when developing architectural vision, decision capability when evaluating alternatives, validation capability when reviewing implementations, and elicitation capability when understanding stakeholder concerns.

**Why this matters for AI integration**: AI cannot fill a role in the organisational sense—it has no job title, reports to no one, holds no authority, and accepts no accountability. But AI can provide specific capabilities as an actor. Rather than debating whether AI is a "developer" or "tester" (role questions with no clear answer), we ask which specific capabilities AI can provide effectively (functional questions with clearer answers based on knowledge requirements).

**Why this matters for task allocation**: Role-based thinking bundles capabilities in ways that may not be optimal. The architect role bundles synthesis, decision, validation, and elicitation because organisations find it convenient to assign all to senior technical positions. However, these capabilities could be distributed differently based on actual ability to provide them effectively. Making bundling explicit through the actor lens enables flexible organisation.

## AI Actor Differentiation Model

While the actor model treats human actors as differentiated (individuals with distinct experiences, expertise, and context), it initially treated AI actors as relatively homogeneous. This section addresses that gap by providing a formal model for representing differentiation among AI actors in multi-agent architectures.

### Why AI Actor Differentiation Matters

Multi-agent systems involve AI actors with varying competencies. Effective AI-AI transactive memory—routing queries to the appropriate AI—requires understanding how AI actors differ. The differentiation model enables:

- **Capability matching**: Routing work to AI actors suited to handle it
- **Orchestration design**: Designing multi-agent systems with appropriate specialisation
- **Performance optimisation**: Selecting AI actors based on speed/quality tradeoffs
- **Context management**: Understanding what knowledge an AI actor currently holds

### Four Differentiation Dimensions

AI actors can be characterised along four dimensions that determine their competencies:

| Dimension | Definition | Persistence | Examples |
|-----------|------------|-------------|----------|
| **Training Profile** | Underlying model capabilities shaped by training data, fine-tuning, and architectural choices | Permanent (within model version) | General-purpose LLM vs. code-specialised model; model fine-tuned on legal documents |
| **Tool Access** | External capabilities available through tool integrations | Configured (stable within deployment) | File system access, web search, database queries, code execution |
| **Context State** | Information currently in the AI's context window | Ephemeral (changes per invocation) | Project codebase loaded, conversation history, retrieved documents |
| **Reasoning Profile** | Speed/depth tradeoffs and problem-solving approach | Configured or invocation-specific | Fast heuristic responses vs. deliberate multi-step reasoning; chain-of-thought enabled |

### Training Profile: Underlying Competencies

Training profile captures the foundational capabilities an AI actor possesses regardless of current context or configuration:

**Training specialisation types**:
- **General-purpose**: Broad training across domains; versatile but may lack domain depth
- **Domain-specialised**: Training emphasising specific domains (code, legal, medical, scientific)
- **Task-specialised**: Fine-tuned for specific tasks (code review, summarisation, translation)
- **Organisation-specialised**: Fine-tuned on organisational data (internal conventions, proprietary patterns)

**Competency implications**:
- Domain-specialised actors have stronger pattern recognition within their domain
- Task-specialised actors may outperform general actors on narrow tasks
- General-purpose actors provide flexibility for unexpected requirements

**Limitations of training profile alone**: Training profile establishes potential competence but not current competence. An AI actor with strong training in security may still produce poor security analysis if provided inadequate context about the specific system.

### Tool Access: Extended Capabilities

Tool access determines what actions an AI actor can take beyond text generation:

**Tool categories**:
- **Information retrieval**: File reading, database queries, web search, API calls
- **Information creation**: File writing, code execution, system commands
- **Communication**: Sending messages, triggering notifications, invoking other agents
- **Validation**: Running tests, linters, type checkers, security scanners

**Competency implications**:
- Tool access extends capability range beyond pure reasoning
- Tool access creates accountability boundaries (what systems can be affected)
- Tool access often determines the collaboration pattern appropriate for an AI actor

**Tool access as trust indicator**: What tools an AI actor can access reflects the trust level accorded to it. Restricted tool access indicates lower trust or higher risk tolerance; broad tool access indicates established reliability in the deployment context.

### Context State: Ephemeral Expertise

Context state represents what an AI actor currently "knows"—the information loaded into its context window:

**Context components**:
- **System instructions**: Standing guidance about behaviour, constraints, conventions
- **Conversation history**: Prior exchanges in the current interaction
- **Retrieved information**: Documents, code, or data loaded for the current task
- **Working state**: Intermediate results, decisions made, actions taken

**Competency implications**:
- Context state is ephemeral—it changes between invocations and degrades over long sessions
- An AI actor's effective expertise depends as much on context as on training
- Context state must be managed explicitly (unlike human memory which is persistent)

**Context as transactive memory challenge**: In AI-AI transactive memory, routing decisions must consider not just what an AI actor *could* know (training) but what it *currently* knows (context). An AI actor that previously analysed a codebase has different effective competency than one starting fresh.

### Reasoning Profile: Quality/Speed Tradeoffs

Reasoning profile captures how an AI actor approaches problems:

**Reasoning characteristics**:
- **Depth**: Single-pass response vs. multi-step deliberation
- **Verification**: Self-checking and validation steps
- **Exploration**: Breadth of alternatives considered
- **Explanation**: Transparency of reasoning process

**Configuration options**:
- Fast/shallow reasoning for routine tasks
- Deep/deliberate reasoning for complex problems
- Explicit chain-of-thought for auditability
- Iterative refinement for quality-critical outputs

**Competency implications**:
- Same underlying model can produce different quality at different speeds
- Task complexity should inform reasoning profile selection
- Quality-critical tasks warrant deeper reasoning even at speed cost

### AI Actor Capability Profile

Combining these dimensions yields an **AI Actor Capability Profile**—a specification of what an AI actor can reliably do:

```
AI Actor Capability Profile:
  Identity: [unique identifier]
  Training Profile:
    Model: [model identifier and version]
    Specialisation: [general | domain | task | organisation]
    Domain strengths: [list of domains where training is strong]
    Known limitations: [identified weaknesses or gaps]
  Tool Access:
    Retrieval: [list of information sources accessible]
    Creation: [list of artifacts that can be created]
    Communication: [messaging and delegation capabilities]
    Validation: [testing and verification tools]
  Context State:
    Current context: [summary of loaded information]
    Context capacity: [tokens or equivalent measure]
    Context freshness: [when context was last updated]
  Reasoning Profile:
    Mode: [fast | deliberate | iterative]
    Verification: [none | self-check | external validation]
    Explanation: [opaque | summarised | transparent]
  Competency Boundaries:
    Reliable for: [task types where performance is established]
    Uncertain for: [task types with variable performance]
    Not suitable for: [task types outside competency]
```

### AI Actor Differentiation in Orchestration

The capability profile enables orchestration decisions:

**Routing logic**: Match task requirements to AI actor capability profiles
- Task requiring domain expertise → route to domain-specialised actor
- Task requiring specific tool access → route to actor with that access
- Task requiring prior context → route to actor with relevant context loaded
- Quality-critical task → route to actor with deliberate reasoning profile

**Load balancing**: Distribute work across actors with overlapping competencies
- Fast reasoning actors handle routine high-volume work
- Deliberate reasoning actors handle complex low-volume work
- Specialised actors handle domain-specific work

**Fallback chains**: Define escalation when primary actor cannot complete
- Actor A attempts → confidence below threshold → escalate to Actor B
- Actor A lacks required tool access → delegate to Actor B with access
- All AI actors uncertain → escalate to human actor

### Relationship to Human Actor Differentiation

Human actors are also differentiated, though through different mechanisms:

| Aspect | Human differentiation | AI differentiation |
|--------|----------------------|-------------------|
| **Expertise source** | Experience, education, practice | Training data, fine-tuning |
| **Persistence** | Long-term memory, career trajectory | Context window, model version |
| **Adaptability** | Learning from single examples | Requires retraining or prompt engineering |
| **Self-assessment** | Calibrated through experience | Requires external validation |
| **Communication** | Social cues, implicit knowledge | Explicit capability declarations |

Key insight: Human differentiation evolves continuously through experience; AI differentiation is configured through training and deployment choices. Human actors develop new competencies organically; AI actor competencies must be deliberately constructed.

### Relationship to Extended Transactive Memory

The AI actor differentiation model enables AI-AI transactive memory (see [Extended Transactive Memory](./foundation_transactive-memory.md#extended-transactive-memory-multi-actor-systems)):

- **Directory knowledge**: Capability profiles provide the "who knows what" for AI actors
- **Credibility mechanism**: Performance history on similar tasks establishes reliability
- **Coordination method**: Routing logic operationalises the TMS directory

Without differentiation, all AI actors appear equivalent and routing becomes arbitrary. With differentiation, orchestration can route queries to the AI actor most likely to succeed.

### Validation Status for Differentiation Model

- ⚠ **Dimensional completeness**: The four dimensions (training, tools, context, reasoning) capture major differentiation factors but may not be exhaustive; emerging multi-agent patterns may reveal additional dimensions
- ⚠ **Profile operationalisation**: The capability profile schema is conceptual; operational implementation requires validation against actual multi-agent systems
- ⚠ **Routing effectiveness**: Whether capability-based routing outperforms simpler approaches (random, round-robin) is empirically untested
- ⚠ **Context state tracking**: Mechanisms for tracking and communicating AI actor context state across invocations are not standardised

## Key Implications

**For understanding AI capabilities and limitations**: Whether AI develops anything analogous to Naur's "theory" is an open question—Naur wrote in 1985 before modern AI existed. What is observable: AI produces outputs based on learned patterns; humans maintain systems over time through accumulated understanding. This shapes collaboration design: activities requiring persistent understanding across modifications benefit from human leadership. The framework takes no position on AI's long-term trajectory but provides guidance for current (2024-2025) practice. Regardless of how the "understanding" debate resolves, organisations should preserve human engagement where accumulated understanding matters for system evolution.

**For task allocation decisions**: Actors should be selected based on capability requirements, not role conventions. Activities requiring theory building must have human actors regardless of whether AI could technically perform the mechanics. Activities operating on formal knowledge with clear success criteria can leverage AI actors. Activities with mixed requirements benefit from multiple actors collaborating, each providing capabilities matching their strengths. Additionally, skill maintenance must be considered: cognitive research on automation (Bainbridge, 1983) demonstrates that skills degrade without regular practice, and that operators who have monitored automated systems may lack the skills needed when manual intervention is required. This supports deliberate human engagement even in activities AI could handle, to maintain the capability for intervention when needed.

**For skill development**: Rather than training people for roles, identify which capabilities individuals need to develop. A junior developer might need to strengthen analysis capability (recognising code patterns), validation capability (testing judgement), and synthesis capability (designing coherent modules). This capability-specific development is more targeted than generic "junior developer training."

**For addressing cognitive load**: Distributing capabilities across multiple actors (human and AI) can reduce individual cognitive load. Rather than one architect holding all architectural knowledge, distribute synthesis across team members, use AI for consistency checking and pattern suggestion, and have humans focus on high-level theory building and critical decisions. This requires explicit recognition that capabilities can be distributed.

**For recognising accountability requirements**: While capabilities can be provided by either human or AI actors, accountability rests with humans. Even when AI executes decisions within defined envelopes, a human remains accountable for outcomes—including the decision to delegate and the adequacy of escalation criteria. This means AI-Led patterns require human accountability for the automation design, not just exception handling.

**For multi-agent orchestration**: When multiple AI actors participate in development, orchestration design must consider actor differentiation. The AI Actor Differentiation Model provides a framework for capability matching—routing work to AI actors best suited to handle it based on their training profile, tool access, context state, and reasoning profile. This enables more effective AI-AI transactive memory than treating all AI actors as equivalent.

## Integration with Other Concepts

- [**Information Composition Taxonomy**](./concept_information-taxonomy.md): Human actors can process all three knowledge types (formal, tacit, emergent) directly. AI actors process formal knowledge directly and access tacit/emergent knowledge through dialogue with humans. Activities with high tacit composition benefit from human leadership with AI support; activities with high formal composition can be AI-led with human oversight.
- [**Theory-Building Principle**](./foundation_theory-building.md): Naur (1985) defined theory-building in terms of human cognition. Whether AI develops analogous understanding is contested. What matters for practice: humans must build theory about systems they maintain. Collaboration design should preserve human engagement at theory-building moments regardless of whether AI assists with artifact production.
- [**Transactive Memory Systems**](./foundation_transactive-memory.md): Wegner (1986) defined transactive memory for human groups. AI participates asymmetrically—as a queryable knowledge source rather than a full social participant. In multi-agent architectures, AI-AI transactive memory emerges as a coordination challenge requiring explicit orchestration. See Extended Transactive Memory section in the foundation document.
- [**Agent Context Model (3S2P)**](./concept_agent-context-model.md): For AI actors to participate effectively—including in transactive memory systems—they require contextual awareness across five dimensions: Scope, Situation, System, Phase, and Process. The System dimension is essential for TMS participation.
- [**Eight-Capability Taxonomy**](./concept_capability-model.md): Capabilities operate bidirectionally—AI can use capabilities to acquire information from humans through dialogue, not just process formal inputs. AI can elicit from humans (prompting articulation), synthesise (proposing for human refinement), validate (presenting understanding for correction). The capability taxonomy identifies what operation is needed; dialogue design determines how actors collaborate to provide it.
- [**Seven-Phase SDLC Model**](./concept_seven-phase-sdlc.md): Different phases have different capability requirements and information compositions, thus benefiting from different actor mixes. Early phases require predominantly human actors due to high tacit content. Later phases enable more AI actor participation due to higher formal content.
- [**Five Collaboration Patterns**](./concept_collaboration-patterns.md): Concept 7 defines how human and AI actors work together. The patterns (Human-Only, Human-Led, Partnership, AI-Led, AI-Only) operationalise the actor model's insights about when each actor type should lead, support, or refrain from participation.
- **Escalation Mechanisms**: Concept 7 defines escalation as the mechanism enabling AI participation in activities involving tacit knowledge. When AI operates within formalised criteria and escalates uncertain cases to humans, the actor model's knowledge-access constraints are respected while enabling broader AI participation.
- [**Phase-Specific Information Composition**](./integration_phase-specific-composition.md): Phase composition determines appropriate actor mix—tacit-heavy phases need human actors, formal-heavy phases enable AI actors.
- [**Work Coordination**](./concept_work-coordination.md): Actors receive and execute tasks through coordination mechanisms. Actor profiles specify capabilities and availability; capability matching algorithms route work to appropriate actors based on task requirements.

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
- ⚠ **AI actor differentiation**: Addressed through the AI Actor Differentiation Model (see section above). The four-dimension model (training, tools, context, reasoning) provides a framework but requires validation against actual multi-agent implementations.

---

*The Actor Model provides the conceptual foundation for understanding who can provide what capabilities in software development. By characterising human and AI actors through their knowledge access and processing rather than roles or labels, the model enables systematic reasoning about appropriate task allocation throughout the SDLC. The patterns of how actors collaborate are defined separately in Concept 7.*
