# Companion Analysis: Identifying Factors Contributing to Bad Days for Software Developers

## 1. Bibliographic Information

**Full Citation:**
Obi, I., Butler, J., Haniyur, S., Hassan, B., Storey, M.-A., & Murphy, B. (2024). Identifying Factors Contributing to Bad Days for Software Developers: A Mixed Methods Study. *arXiv preprint arXiv:2410.18379*. (Accepted to ICSE 2025 SEIP)

**Publication Date:** October 24, 2024 (arXiv); ICSE 2025 (April-May 2025)

**Authors:**
- Ike Obi - Microsoft
- Jenna Butler - Microsoft
- Sankeerti Haniyur - Microsoft
- Brian Hassan - Microsoft
- Margaret-Anne Storey - University of Victoria (co-creator of SPACE framework)
- Brendan Murphy - Microsoft

**Publication Type:** Conference paper (peer-reviewed)

**Publication Venue:** 
- arXiv preprint (2410.18379)
- ICSE 2025 Software Engineering in Practice (SEIP) track
- Top-tier SE venue

**Quality Tier: T1** - Peer-reviewed empirical research at top SE venue (ICSE)

**Justification:** Accepted to ICSE 2025 SEIP (premier SE conference), mixed-methods design with triangulation, Microsoft Research authorship (leading empirical SE group), large-scale study with multiple data sources, directly complements Meyer et al. (2019) "Good Days" research, co-authored by Margaret-Anne Storey (SPACE framework co-creator).

---

## 2. Source Classification

**Primary Type:**
- [x] Empirical study (mixed methods)
- [x] Applied research (software development context)

**Nature of Work:**
- Mixed-methods empirical investigation
- Interviews, surveys, diary studies, and telemetry analysis
- Identifies factors causing "bad days" for developers
- Validates subjective experience with objective metrics
- Complements Meyer et al. (2019) "Good Days" research

**Key Contribution:**
Systematically identifies factors contributing to bad days for software developers through triangulated evidence (interviews, surveys, diary study, telemetry). Key finding: bad days have measurable impact on productivity (PR dwell +48.84%) and create vicious cycles affecting sleep and subsequent days.

---

## 3. Methodology Assessment

### Study Design

**Type:** Mixed-methods with four data sources

**Data Sources:**
1. **Interviews**: N=22 developers across different levels and roles
2. **Survey**: N=214 developers capturing perceptions
3. **Diary Study**: N=79 developers over 30 days (real-time capture)
4. **Telemetry Analysis**: N=131 consenting participants (objective validation)

**Setting:** Microsoft Corporation

**Analysis Methods:**
- Qualitative coding of interviews and diary entries
- Statistical analysis of survey responses
- Telemetry correlation analysis
- Triangulation across methods

### Validity Measures

**Construct Validity:**
- Multiple data sources triangulate findings
- Both subjective (self-report) and objective (telemetry) measures
- Real-time diary captures reduce recall bias

**Internal Validity:**
- Mixed methods enable cross-validation
- Telemetry provides objective grounding
- Multiple researcher involvement

**External Validity:**
- Single organisation (Microsoft) - generalisation caveat
- Large tech company context
- Diverse roles within that context

**Reliability:**
- Multiple coders for qualitative data
- Statistical methods for quantitative
- Replicable telemetry approach

---

## 4. Key Findings

| Finding | Evidence Strength | Confidence |
|---------|-------------------|------------|
| 35% of developers experienced a bad day in last month (survey) | Strong | High |
| 20% of days rated as bad in diary study (real-time) | Strong | High |
| PR delays top factor causing bad days (4.22/5 severity) | Strong | High |
| Feeling unproductive second highest factor (4.20/5) | Strong | High |
| Slow laptop/tooling third factor (4.15/5) | Strong | High |
| Bad days correlate with +48.84% PR dwell time | Strong | High |
| Bad days correlate with +26.32% build time | Strong | High |
| Bad days cause vicious cycles (sleep → fatigue → next day) | Moderate | Medium-High |
| Good days ≠ absence of bad day factors (asymmetry) | Strong | High |

**Quantified Findings:**

**Prevalence:**
- **35%** experienced bad day in last month (retrospective survey)
- **20%** of days rated bad in diary study (real-time)
- Discrepancy suggests recall bias or definition differences

**Top Bad Day Factors (severity rating /5):**
1. PR delays: 4.22
2. Feeling unproductive: 4.20
3. Slow laptop: 4.15
4. Being blocked: ~4.1
5. Process inefficiencies: ~4.0

**Telemetry Validation:**
- PR dwell time: **+48.84%** on bad days (p<0.01)
- Build time: **+26.32%** on bad days
- Demonstrates subjective experience correlates with objective metrics

**Vicious Cycle Evidence:**
- Bad days → sleep issues
- Sleep issues → fatigue
- Fatigue → next day unproductive
- Compounding negative effects

---

## 5. Framework Integration

### Connection to Meyer et al. (2019) "Good Days"

- **Complementary research**: Meyer studied good days; Obi studies bad days
- **Key insight**: Good days ≠ absence of bad day factors (asymmetry)
- **Combined understanding**: 
  - Good days need *positive* factors (progress, social, flow)
  - Bad days come from *specific blockers* (tooling, process, team)
- **Implication**: Must actively create good conditions AND remove bad

### Connection to Developer Thriving (Hicks et al. 2024)

- Bad days undermine thriving factors (Agency, Learning, Support, Purpose)
- Thriving = sustained resilient productivity, not just absence of bad days
- Vicious cycles show why thriving requires proactive investment

### Connection to Storey et al. (2022) SPACE/TRUCE

- Same author (Margaret-Anne Storey) involved
- Bad days affect multiple SPACE dimensions:
  - Satisfaction (obvious)
  - Performance (PR dwell +48.84%)
  - Activity (blocked, unproductive)
  - Efficiency (slow tools, build times)
- Validates need for multidimensional productivity view

### Connection to STS Theory

- Bad day factors are socio-technical:
  - **Technical**: Slow laptop, build times, tooling
  - **Social**: Team conflicts, being blocked, process inefficiencies
- Joint optimisation needed: fixing tools alone won't eliminate social blockers
- System design affects bad day prevalence

### Connection to Naur's Theory-Building

- Being blocked often means lacking knowledge
- Documentation gaps cause bad days (can't find answers)
- Supports Naur: tacit knowledge gaps create friction

---

## 6. Practical Implications

**For Tooling:**
- Slow laptops/tooling directly cause bad days
- PR review delays (4.22/5) are top factor
- Build times correlate with bad days (+26.32%)
- **Action**: Invest in developer tooling and CI/CD speed

**For Process:**
- Process inefficiencies cause bad days
- Being blocked is major factor
- **Action**: Design processes to minimise blocking, enable autonomy

**For Team Dynamics:**
- Team conflicts contribute to bad days
- Social support matters for recovery
- **Action**: Invest in team health, not just individual productivity

**For AI Integration:**
- AI should reduce bad day factors:
  - Faster code review (reduce PR delays)
  - Better documentation search (reduce being blocked)
  - Automation of tedious tasks (reduce unproductive feelings)
- AI must NOT add friction:
  - Slow AI tools could cause bad days
  - Unreliable AI could increase blocking
  - AI that breaks flow could harm productivity

**For Measurement:**
- Telemetry can validate subjective experience
- PR dwell time as objective bad day indicator
- Build times as tooling health metric
- **Action**: Build data-driven DX monitoring

---

## 7. Limitations

### Author-Acknowledged Limitations

- Single organisation (Microsoft)
- Large tech company context may not generalise
- Self-selection in diary study and telemetry consent
- Specific tooling ecosystem (Azure DevOps, etc.)

### Additional Limitations

- **Generalisability**: Microsoft-specific findings
- **Remote work**: Study conducted during/after pandemic - hybrid context
- **AI tools**: Pre-widespread Copilot adoption
- **Causation**: Correlational design (telemetry shows correlation, not causation)
- **Threshold specificity**: PR dwell >22 hours threshold may be Microsoft-specific

---

## 8. Citation Guidance

### Appropriate Uses

**STRONG - Cite with confidence:**

1. "Obi et al. (2024) found that 35% of developers experienced a bad day in the last month, with PR delays (4.22/5), feeling unproductive (4.20/5), and slow tooling (4.15/5) as top factors"

2. "Bad days correlate with measurable productivity impacts: +48.84% PR dwell time and +26.32% build time (Obi et al., 2024)"

3. "Obi et al. (2024) demonstrated that subjective developer experience correlates with objective telemetry metrics, enabling data-driven DX monitoring"

4. "Bad days create vicious cycles affecting sleep and subsequent day productivity (Obi et al., 2024)"

5. "Good days and bad days have asymmetric factors—removing bad day causes doesn't automatically create good days (Meyer et al., 2019; Obi et al., 2024)"

### Inappropriate Uses

**DO NOT cite this source for:**

1. Universal thresholds (PR dwell >22 hours is Microsoft-specific)
2. Causation claims (correlational design)
3. Non-Microsoft contexts without caveat
4. AI-specific findings (study predates mainstream AI coding assistants)

---

## 9. Related Sources

### Essential Companions

1. **Meyer et al. (2019)** - "Good Days" complementary research (N=5,971)
2. **Storey et al. (2022)** - SPACE/TRUCE framework (same author)
3. **Hicks et al. (2024)** - Developer Thriving (related factors)

### Complementary Research

- Developer experience literature
- Productivity measurement research
- Telemetry-based SE studies
- Burnout and wellbeing research

---

## 10. Project Relevance

### Direct Relevance - HIGH

**Key contributions to framework:**

1. **Empirical evidence** for bad day factors in software development
2. **Telemetry validation** linking subjective experience to objective metrics
3. **Asymmetry insight**: Good/bad days have different factor structures
4. **Vicious cycle evidence**: Bad days have compounding effects
5. **Actionable factors**: Specific targets for intervention (tooling, process, team)

### Integration Points

- **Section: Developer Experience**: Primary empirical evidence for bad days
- **Section: Measurement**: Telemetry validation approach
- **Section: AI Integration**: What AI should/shouldn't do to avoid causing bad days
- **Section: STS Application**: Socio-technical factors in bad days

---

*Analysis Generated: 13 December 2024*
*Analyst: Claude (Opus 4)*
*Version: 1.0*

---

## Document History

**Version 1.0** (13 December 2024)
- Initial companion analysis from arXiv preprint and web verification
- Bibliographic information confirmed: Obi et al., ICSE 2025 SEIP
- Key findings extracted and integrated with framework
- Positioned as complement to Meyer et al. (2019) "Good Days"

**Review Status:** Complete - based on arXiv version; verify against ICSE camera-ready when available
