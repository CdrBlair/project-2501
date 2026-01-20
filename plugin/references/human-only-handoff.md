# Human-Only Handoff Mechanism

**Document Type**: REF (Reference)
**Status**: ACTIVE
**Version**: 1.0
**References**: DEC-20260120-174641

---

## Purpose

This document defines the operational mechanism for **Human-Only** collaboration pattern steps. When a process step requires Human-Only execution, the AI must exit the dialogue entirely and create a blocking handoff that pauses the process until the human returns with required output.

This mechanism distinguishes Human-Only from Human-Led:

| Pattern | AI Presence | AI Activity | Process State |
|---------|-------------|-------------|---------------|
| **Human-Led** | Present | Records, structures, supports | Continues |
| **Human-Only** | Exits | None | Pauses |

---

## When to Use Human-Only

Human-Only is appropriate when:

1. **External activities required**: Workshops, meetings, interviews that happen outside the AI dialogue
2. **Social interaction needed**: Face-to-face stakeholder engagement, team discussions
3. **Accountability must be explicit**: Executive sign-offs, formal approvals
4. **AI presence would inhibit**: Sensitive conversations, conflict resolution
5. **No formalised criteria exist**: Novel situations requiring pure human judgement

Human-Only is **not** appropriate when:
- AI could usefully record or structure human input (use Human-Led)
- AI could provide information to support human decision (use Human-Led)
- The activity happens within the AI dialogue session (use Human-Led)

---

## Blocking Task Structure

When AI encounters a Human-Only step, it creates a blocking task with the following structure:

```yaml
# Blocking task for Human-Only handoff
id: "<generated-id>"
title: "<step name> - Human-Only"
status: BLOCKED_PENDING_HUMAN
created: "<timestamp>"
type: HANDOFF

# Who is responsible
responsible_party:
  role: "<role or specific person>"
  contact: "<optional contact info>"

# What is needed
required_output:
  description: "<what the human must produce>"
  format: "<expected format of output>"
  acceptance_criteria:
    - "<criterion 1>"
    - "<criterion 2>"

# How - expected activities
expected_activities:
  - activity: "<activity description>"
    participants: ["<who should be involved>"]
    duration_estimate: "<optional duration>"

# What this blocks
downstream_dependencies:
  process_id: "<PROC-X.Y>"
  blocked_steps:
    - "<step id that cannot proceed>"
  impact: "<what happens if delayed>"

# Where to resume
re_entry:
  step_id: "<step to resume at>"
  context_needed:
    - "<what context AI needs to continue>"

# When
timeline:
  requested_by: "<optional deadline>"
  sla_hours: <optional SLA>
  escalation_path: "<who to escalate to if overdue>"

# Process context
process_context:
  instance_id: "<process instance if applicable>"
  completed_steps: ["<list of completed steps>"]
  state_snapshot: "<relevant state at handoff>"
```

---

## AI Behaviour at Human-Only Steps

When AI reaches a Human-Only step:

### 1. Announce the Handoff

```
This step requires Human-Only execution: [step name]

I need to hand off to you for [activity description].

What's needed:
- [required output description]

Expected activities:
- [activity 1]
- [activity 2]

This blocks: [downstream steps/processes]

I'll create a task to track this and pause here until you return with [output].
```

### 2. Create the Blocking Task

Create a task file in `.dialogue/tasks/` with the blocking task structure.

### 3. Exit the Process

The process pauses. AI should:
- Confirm the task was created
- Provide any context the human needs to complete the activity
- Indicate how to signal completion
- Not proceed with subsequent steps

### 4. Do Not Simulate Completion

AI must **never**:
- Generate output that should come from the human activity
- Assume what the human decided or discovered
- Skip the step because it "seems straightforward"

---

## Re-Entry Mechanism

### Human Signals Completion

The human signals completion by:

1. **Updating the task status**: Change `status: BLOCKED_PENDING_HUMAN` to `status: COMPLETED`
2. **Providing the output**: Add the required output to the task or reference where it's stored
3. **Resuming dialogue**: Return to the AI dialogue and indicate readiness to continue

### Resumption Prompt

Human returns with:
```
[Task X] is complete. Here's the output: [output or reference]

Ready to continue with [process name].
```

### AI Validates and Continues

AI should:
1. Read the completed task
2. Validate the output meets acceptance criteria
3. Resume at the specified re-entry step
4. Incorporate the human-provided output into the process

If output is incomplete:
```
The output from [step] doesn't fully meet the acceptance criteria:
- [criterion]: [status]

Should we:
1. Proceed with partial information
2. Return to complete [missing aspect]
```

---

## Example Human-Only Steps

### Example 1: Stakeholder Workshop

**Process**: PROC-1.2 Stakeholder Alignment
**Step**: Conduct stakeholder workshop

```yaml
id: "HO-20260120-001"
title: "Conduct Stakeholder Alignment Workshop - Human-Only"
status: BLOCKED_PENDING_HUMAN
type: HANDOFF

responsible_party:
  role: "Project Lead"

required_output:
  description: "Workshop outcomes documenting stakeholder priorities and concerns"
  format: "Meeting notes or structured summary"
  acceptance_criteria:
    - "All key stakeholders represented"
    - "Priority rankings captured"
    - "Major concerns documented"
    - "Action items identified"

expected_activities:
  - activity: "Facilitate stakeholder workshop"
    participants: ["Project Lead", "Key Stakeholders", "Business Sponsor"]
    duration_estimate: "2-3 hours"

downstream_dependencies:
  process_id: "PROC-1.2"
  blocked_steps: ["1.2.4", "1.2.5"]
  impact: "Cannot finalise stakeholder alignment without workshop input"

re_entry:
  step_id: "1.2.4"
  context_needed:
    - "Workshop outcomes"
    - "Stakeholder priority rankings"
    - "Identified concerns and constraints"

timeline:
  requested_by: "2026-01-25"
  escalation_path: "Business Sponsor"
```

### Example 2: Executive Sign-Off

**Process**: PROC-1.4 Business Case
**Step**: Obtain executive approval

```yaml
id: "HO-20260120-002"
title: "Obtain Executive Sign-Off - Human-Only"
status: BLOCKED_PENDING_HUMAN
type: HANDOFF

responsible_party:
  role: "Business Sponsor"

required_output:
  description: "Formal approval decision with any conditions"
  format: "Signed approval or documented decision"
  acceptance_criteria:
    - "Decision is explicit (approved/rejected/conditional)"
    - "Any conditions are documented"
    - "Decision-maker is authorised"

expected_activities:
  - activity: "Present business case to executive"
    participants: ["Business Sponsor", "Executive Approver"]
  - activity: "Address questions and concerns"
    participants: ["Business Sponsor", "Project Lead"]
  - activity: "Obtain formal decision"
    participants: ["Executive Approver"]

downstream_dependencies:
  process_id: "PROC-1.4"
  blocked_steps: ["1.4.6"]
  impact: "Project cannot proceed to planning without executive approval"

re_entry:
  step_id: "1.4.6"
  context_needed:
    - "Approval decision"
    - "Any conditions or modifications required"
    - "Timeline expectations from executive"

timeline:
  sla_hours: 72
  escalation_path: "Programme Director"
```

### Example 3: Team Retrospective

**Process**: PROC-7.3 Incident Response
**Step**: Conduct blameless retrospective

```yaml
id: "HO-20260120-003"
title: "Conduct Blameless Retrospective - Human-Only"
status: BLOCKED_PENDING_HUMAN
type: HANDOFF

responsible_party:
  role: "Team Lead"

required_output:
  description: "Retrospective findings and improvement actions"
  format: "Retrospective summary document"
  acceptance_criteria:
    - "Root causes identified (not individuals blamed)"
    - "Contributing factors documented"
    - "Improvement actions proposed"
    - "Action owners assigned"

expected_activities:
  - activity: "Facilitate blameless retrospective"
    participants: ["Team Lead", "Incident Responders", "Affected Team Members"]
    duration_estimate: "1-2 hours"

downstream_dependencies:
  process_id: "PROC-7.3"
  blocked_steps: ["7.3.6"]
  impact: "Prevention planning requires retrospective input"

re_entry:
  step_id: "7.3.6"
  context_needed:
    - "Root cause analysis"
    - "Proposed improvement actions"
    - "Assigned action owners"

timeline:
  requested_by: "Within 5 business days of incident resolution"
  escalation_path: "Engineering Manager"
```

---

## Schema Constraint Clarification

Schema constraint **C1** applies to true Human-Only steps:

> **C1**: Human-Only → ai_role = "None"

This means:
- If `pattern: Human-Only`, then `ai_role: "None"` is required
- AI does not participate in the step execution
- AI's only action is creating the handoff and exiting

Steps where AI records human input use `pattern: Human-Led` with `ai_role` describing the recording function.

---

## Choosing Between Human-Only and Human-Led

| Consideration | Human-Only | Human-Led |
|---------------|------------|-----------|
| Activity location | External to dialogue | Within dialogue |
| AI can add value by recording | No | Yes |
| Multiple participants | Often | Rarely |
| Duration | Hours to days | Minutes |
| Output format | Varied | Structured |
| AI presence appropriate | No | Yes |

**Rule of thumb**: If the activity happens in a meeting room, it's Human-Only. If it happens in the AI dialogue, it's Human-Led.

---

## Integration with Process Executor

When the process executor encounters a Human-Only step:

1. **Pre-step**: Executor identifies `pattern: Human-Only`
2. **Handoff**: Executor creates blocking task with step context
3. **Pause**: Executor marks process instance as `AWAITING_HUMAN_INPUT`
4. **Resume trigger**: Human updates task to `COMPLETED`
5. **Validation**: Executor validates output against acceptance criteria
6. **Continue**: Executor proceeds to next step with human-provided output

The executor should never attempt to execute a Human-Only step itself.

---

*This mechanism ensures Human-Only truly means human-only, enabling proper separation between AI-assisted activities and external human activities.*
