# Key Reference Concept 7: Five Collaboration Patterns

## Definition

The Five Collaboration Patterns describe how human and AI actors work together to provide capabilities in software development activities. These patterns range from complete human responsibility (Human-Only) through varying degrees of collaboration (Human-Led, Partnership, AI-Led) to complete AI autonomy (AI-Only). Pattern selection depends on three factors: the information composition of the activity (what knowledge types it requires), the capability requirements (which capabilities must be provided), and the actors' differential strengths and limitations (what each actor type can provide effectively). Rather than debating whether entire activities like "requirements" or "implementation" should be human or AI, the patterns enable precise allocation at the capability instance level—an activity may involve Human-Only elicitation, Partnership analysis, and AI-Led transformation in sequence. This granular approach respects that most activities require multiple capabilities, each potentially benefiting from different collaboration patterns based on knowledge requirements.

## The Five Collaboration Patterns

| Pattern | Description | When Appropriate | Human Role | AI Role |
|---------|-------------|------------------|------------|---------|
| **Human-Only** | Humans provide capability; AI not involved | Activities requiring social interaction, value judgement, theory building, or accountability; or where formalised criteria do not exist | Complete responsibility for providing capability | None—AI cannot contribute effectively |
| **Human-Led** | Human provides core capability with AI analytical/informational support | Activities dominated by tacit knowledge but benefiting from AI data processing | Drives activity, makes judgements, interprets results | Provides information, analysis, suggestions for human consideration |
| **Partnership** | Both actors contribute substantively; neither dominates | Activities with mixed knowledge types where both actors provide complementary capabilities | Provides tacit understanding, contextual interpretation, final judgement | Provides pattern recognition, consistency checking, formal transformations |
| **AI-Led** | AI executes capability with human oversight and exception handling | Activities dominated by formal knowledge with clear success criteria | Reviews outputs, handles escalations, makes final approval, provides feedback for criteria refinement | Executes capability, applies rules consistently, generates outputs |
| **AI-Only** | AI provides capability autonomously; human not involved | Activities operating purely on formal knowledge with mechanical verification and monitoring-based exception detection | None—human oversight adds no value | Complete autonomous execution applying formal rules |

## Capability-to-Pattern Mapping

Different capability instances have typical patterns based on the knowledge type they operate upon. The patterns below represent common cases for each capability's most characteristic use; actual instances may require different patterns depending on source type, knowledge type, and interaction mode.

| Capability | Typical Pattern | Knowledge Required | Human Strength | AI Strength | Rationale |
|------------|----------------|-------------------|----------------|-------------|-----------|
| **Elicit** | Varies by source | Depends on source: technical knowledge for systems, social skills for stakeholders | Reading social cues, building trust, probing unstated assumptions | Querying systems, extracting from documents, structured information gathering | Pattern depends on source: AI-suited for systems/documents, Human-Only for tacit stakeholder knowledge |
| **Analyse** | Human-Led to Partnership | Analytical frameworks, domain models, heuristics | Contextual interpretation, recognising significance, judging importance | Pattern recognition at scale, consistency checking, classification | Both contribute—AI finds patterns, humans interpret meaning |
| **Synthesise** | Varies by output | Systems thinking, integration patterns, holistic view | Creative combination, theory building, seeing emergent properties | Aggregating structured information, generating summaries from formal inputs | Theory-building synthesis requires humans; structured aggregation suits AI |
| **Transform** | Partnership to AI-Led | Source/target formats, mapping rules, validation criteria | Judging semantic equivalence, handling ambiguity | Applying formal transformations consistently | Formal transformations enable AI; semantic judgement needs humans |
| **Validate** | Partnership to AI-Led | Quality criteria, domain constraints, verification methods | Judging fitness for purpose, assessing stakeholder satisfaction | Checking formal correctness, testing against specifications | Formal validation enables AI; purpose judgement needs humans |
| **Decide** | Varies by criteria | Value frameworks for judgements; formal rules for selections | Making value judgements, accepting accountability, navigating uncertainty | Applying rule-based selection criteria, optimising against formal objectives | Value-laden decisions require humans; rule-based selections suit AI |
| **Generate** | Partnership to AI-Led | Templates, patterns, domain knowledge | Creating novel solutions, ensuring intent is captured | Producing consistent artifacts at scale | Generation from specs enables AI; novelty needs humans |
| **Preserve** | Partnership to AI-Led | Storage mechanisms, retrieval requirements, retention policies | Judging what matters, capturing rationale and context | Mechanically storing and organising artifacts | Mechanical preservation enables AI; rationale capture needs humans |

## Escalation: The Dynamic Mechanism

Collaboration patterns are not static assignments. **Escalation** is the mechanism that enables AI actors to operate autonomously within defined competence envelopes while ensuring human engagement when uncertainty exceeds acceptable thresholds.

### Escalation Definition

Escalation is the structured handoff from AI to human actor when:
- Confidence in classification falls below threshold
- Input falls outside known patterns
- Criteria are incomplete or conflicting
- Consequences of error exceed acceptable risk

Effective escalation requires:
1. **Trigger definition**: What conditions cause escalation
2. **Context packaging**: What information accompanies the handoff
3. **Recommendation provision**: AI's assessment despite uncertainty (where appropriate)
4. **Feedback capture**: How human decisions inform future automation

### Pattern-Specific Escalation Characteristics

| Pattern | Escalation Characteristic |
|---------|---------------------------|
| **Human-Only** | No escalation mechanism—human is already the primary actor |
| **Human-Led** | AI support may flag concerns or anomalies for human attention |
| **Partnership** | Bidirectional—AI escalates uncertainty to human; human may delegate bounded subtasks back to AI |
| **AI-Led** | Defined escalation triggers with structured handoff; human handles exceptions and edge cases |
| **AI-Only** | Implicit escalation via monitoring, alerting, and exception handling systems |

### Automation Boundary Dynamics

The boundary between patterns is dynamic, not fixed. As organisations invest in formalising tacit knowledge:

1. **Preserve captures rationale**: When humans make escalated decisions, the Preserve capability captures reasoning
2. **Criteria accumulate**: Captured rationale becomes formalised decision criteria
3. **AI envelope expands**: More instances shift from Human-Led → Partnership → AI-Led
4. **Escalation rate decreases**: For stable domains, fewer cases require human intervention

This creates a virtuous cycle: `Escalated Decision → Human Judgement → Preserve Rationale → Formalise Criteria → Expand AI Envelope`

The cycle explains why the Preserve capability has strategic importance beyond mere documentation—it is the mechanism through which today's human judgements become tomorrow's automation.

### Escalation Quality

Poor escalation design undermines collaboration effectiveness:

- **Under-escalation**: AI proceeds when it should not, causing errors that erode trust
- **Over-escalation**: AI escalates excessively, providing little value and creating human bottlenecks
- **Context-poor escalation**: Human receives insufficient information to decide efficiently, negating the benefit of AI processing

Escalation design should be treated as a first-class concern when establishing AI-Led and Partnership patterns.

## Key Patterns in the Mapping

**Instances requiring tacit knowledge lean toward human**: When Elicit, Synthesise, or Decide instances operate on tacit knowledge (social understanding, creative synthesis, value judgement), they strongly favour Human-Only or Human-Led patterns. However, these same capabilities can involve AI when operating on formal knowledge — AI can elicit from systems, synthesise structured summaries, and decide based on explicit criteria.

**Capabilities operating on formal knowledge enable AI**: Transform, Generate (from specifications), Preserve (mechanical storage), and portions of Validate operate on formal artifacts with explicit rules, enabling Partnership or AI-Led patterns. AI can provide these capabilities effectively because the required knowledge can be formalised.

**Analysis bridges tacit and formal**: Analyse involves both pattern recognition (where AI excels through processing vast examples) and contextual interpretation (where humans excel through experience and understanding). This makes it suitable for Human-Led or Partnership patterns depending on how much context matters for the specific analysis.

**Context determines actual patterns**: The "typical" patterns are starting points. Actual appropriate patterns depend on knowledge availability (is necessary knowledge formalised?), risk level (high-stakes decisions require more human involvement), trust level (teams build toward more AI participation over time), context stability (novel situations require more human leadership), and escalation maturity (well-designed escalation enables more AI-Led patterns).

## Key Implications

**For activity decomposition and allocation**: Rather than allocating entire activities atomically ("requirements is human," "testing is AI"), decompose activities into capability sequences and allocate each capability to the appropriate pattern. Requirements elicitation involves Human-Only elicitation, Partnership analysis, AI-Led transformation, Human-Only prioritisation—different patterns for different capabilities within the same activity.

**For progressive automation**: Teams can increase AI participation over time by shifting patterns as trust builds. Start with Human-Led code generation (human writes logic, AI suggests completions), evolve to Partnership (iterative refinement), and eventually AI-Led (AI generates with human review) for well-understood domains. This respects that pattern appropriateness includes trust as a factor.

**For document automation**: Document lifecycle class provides default pattern guidance. Standing documents (L2-L3) warrant Human-Led patterns—AI assists structure while humans provide rationale. Dynamic documents (L3-L4) enable AI-Led generation with human interpretation. Ephemeral documents (L3-L4) benefit from AI capture with human meaning-addition at creation. See [Document Lifecycle Classification](./concept_information-taxonomy.md#document-lifecycle-classification).

**For understanding automation boundaries**: Human-Only and Human-Led patterns identify activities that currently require human-centric approaches due to tacit knowledge requirements or insufficient formalisation. These boundaries shift as organisations formalise criteria and develop mature escalation mechanisms. However, activities central to theory building warrant deliberate preservation of human engagement even when automation becomes technically feasible, to prevent skill atrophy and maintain human understanding.

**For monitoring effectiveness in AI-Led patterns**: Human monitoring of AI execution faces inherent cognitive constraints. Vigilance research shows humans cannot maintain effective attention to low-event information sources for extended periods (Bainbridge, 1983). This means AI-Led patterns should not rely solely on human monitoring to catch rare AI errors; they require designed escalation triggers, automated anomaly detection, or periodic active engagement rather than passive oversight.

**For team skill development**: As AI handles more AI-Led capabilities, humans must develop skills in AI-dependent capabilities (Elicit, Synthesise, Decide) and in partnership capabilities where humans provide tacit understanding while AI handles formal manipulation. Training programmes should target capability-specific skills rather than generic roles.

**For measuring collaboration effectiveness**: Different patterns have different success indicators. Human-Only effectiveness depends on expert performance. Partnership effectiveness depends on integration quality—how well human understanding combines with AI processing. AI-Led effectiveness depends on exception rate—how often humans must intervene. These pattern-specific indicators enable better assessment than generic "AI adoption" metrics.

**For escalation design**: When establishing AI-Led or Partnership patterns, explicitly design escalation mechanisms. Define triggers (confidence thresholds, pattern novelty, policy gaps), specify context to package (relevant inputs, AI assessment, uncertainty source), establish feedback loops (how human decisions refine future automation), and monitor escalation rates as a health metric.

**For event response**: Phase transitions are event-triggered (see Phase Dynamics in concept_seven-phase-sdlc.md). When backward events occur—such as `REQUIREMENT_MISSED` or `DESIGN_FLAW`—they typically require Human-Led investigation regardless of what patterns were being used. AI can help detect anomalies that trigger events, but interpreting what the discovery means and deciding how to respond involves tacit judgement. Design collaboration approaches that can shift patterns dynamically when events require human investigation.

**For orchestrating capability instances**: A single capability step within an activity typically requires multiple instances with different actor assignments and patterns. Requirements elicitation might involve AI-Led extraction from existing documentation, Partnership analysis of system logs, and Human-Only elicitation of stakeholder concerns — three instances of Elicit with three different patterns. Completion criteria for capability steps — determining when sufficient information has been gathered — typically require human judgement even when individual instances were AI-executed.

## Integration with Other Concepts

- [**Information Composition Taxonomy**](./concept_information-taxonomy.md): Tacit and emergent knowledge (Concept 1) are disproportionately lost at transitions; formal knowledge survives better. Document lifecycle classification (standing/dynamic/ephemeral) determines preservation opportunity—standing documents retain 30-40% of original understanding; ephemeral documents lose unrecorded knowledge entirely.

- [**Theory-Building Principle**](./foundation_theory-building.md): Activities that build theory must use Human-Only or Human-Led patterns even if AI could technically perform them, because theory building requires human engagement that AI pattern matching cannot replicate.
- [**Eight-Capability Taxonomy**](./concept_capability-model.md): Pattern selection applies to capability instances, not capability categories. The mapping combines Concept 3's capability definitions with the knowledge-type and source-type factors that determine which pattern suits each specific instance.
- [**Seven-Phase SDLC Model**](./concept_seven-phase-sdlc.md): Patterns shift systematically across phases. Early tacit-heavy phases (Initiation, Planning) favour Human-Only/Human-Led. Later formal-heavy phases (Implementation, Testing) enable Partnership/AI-Led. Pattern selection should also consider event response: backward events (triggered by discovered issues) often require Human-Led investigation regardless of the phase's typical pattern, because the discovery involves tacit interpretation of what went wrong.
- [**Actor Model**](./concept_actor-model.md): The patterns operationalise Concept 5's actor characteristics. Human and AI strengths and limitations determine which patterns are appropriate for which capabilities.
- [**Agent Context Model (3S2P)**](./concept_agent-context-model.md): For AI actors to participate effectively in collaboration patterns, they require contextual awareness. The Phase dimension of 3S2P enables agents to understand which collaboration pattern is appropriate; the System dimension enables participation in the pattern through awareness of other actors and escalation pathways.
- [**Phase-Specific Information Composition**](./integration_phase-specific-composition.md): Concept 6's phase compositions predict pattern distributions—Initiation (75% tacit) will predominantly use Human-Only/Human-Led patterns; Implementation (55% formal) enables more Partnership/AI-Led patterns. Phase composition also predicts transactive memory requirements, which affects how actors locate and access distributed expertise within collaboration patterns.
- [**Information Loss at Transitions**](./concept_transitions-info-loss.md): Pattern selection affects information loss. Human-Only patterns preserve tacit knowledge through direct engagement; AI-Only patterns risk losing rationale and context.
- [**Phase-Aware Measurement**](./concept_phase-aware-measurement.md): Different patterns require different measurement approaches. Human-Only: expert performance metrics. Partnership: integration quality. AI-Led: exception rate, escalation rate, and post-escalation accuracy. AI-Only: monitoring alert rates and exception handling effectiveness.
- [**Decision and Observation Tracking**](./concept_decision-observation-tracking.md): Collaboration patterns determine how decisions are made and who is accountable. The actor_pattern field in Decision records captures which collaboration pattern was active at decision time, enabling analysis of pattern effectiveness.
- [**Work Coordination**](./concept_work-coordination.md): Collaboration patterns inform coordination paradigm selection. Interactive coordination suits Human-Led and Partnership patterns requiring dialogue; queue-based coordination suits AI-Led and AI-Only patterns with well-defined work items.

## Evidence Base

Worker preference studies showing 50-30-20 distribution preferences (50% partnership, 30% human-led, 20% AI-led) with strong rejection of replacement scenarios. GitHub Copilot productivity studies showing 55% faster task completion for routine coding (AI-Led pattern) but higher defect rates on complex logic (requiring human leadership). Research on automation in aviation and process control (Bainbridge, 1983) showing that over-automation leads to skill degradation—particularly the "irony" that operators monitoring automated systems lose the very skills needed for emergency intervention—validating need to preserve Human-Only/Human-Led patterns for critical capabilities. Studies of pair programming and mob programming validating partnership patterns where human-human collaboration succeeds. Knowledge management research showing tacit knowledge requires social learning (Human-Only pattern for elicitation), while explicit knowledge supports automation (AI-Led pattern for transformation).

## Validation Status

- ✓ **Pattern descriptions**: Practitioners recognise these patterns and find them useful for reasoning about collaboration
- ✓ **Worker preferences**: Empirically validated through large-scale surveys showing preference distribution
- ⚠ **Capability-to-pattern mappings**: Conceptually coherent but require validation through studies of actual practice effectiveness
- ⚠ **Context factors**: The factors determining pattern shifts (risk, trust, stability) are reasonable but need empirical validation
- ⚠ **Pattern effectiveness**: Comparative studies showing which patterns work better for which activities would strengthen the framework
- ⚠ **Optimal pattern distribution**: Whether the emerging pattern distributions (more Partnership/AI-Led over time) represent optimal allocation needs longitudinal validation
- ⚠ **Instance-level pattern selection**: The capability-to-pattern mapping represents typical cases; actual allocation occurs at the instance level based on knowledge type, source type, and interaction mode. Validation needed for how practitioners navigate instance-level pattern decisions.
- ⚠ **Escalation mechanism effectiveness**: The escalation model is conceptually coherent but requires validation through studies of escalation design practices and their impact on collaboration effectiveness


---

*The Five Collaboration Patterns provide the operational framework for human-AI collaboration throughout the SDLC. By defining how actors work together based on capability requirements and knowledge composition, the patterns enable systematic allocation decisions that respect both human and AI strengths while acknowledging their complementary limitations.*
