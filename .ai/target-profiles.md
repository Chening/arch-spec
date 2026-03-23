# Target Engineer Profiles — Series North Star

> This document defines what each layer of the series transforms in the reader.
> Every article's content, decision tables, checklists, and diagrams must drive
> toward the specific transformation defined here. If an article doesn't change
> how the reader thinks or acts, it has failed.

---

## The Complete Architect (Series-Level Target)

The full 20-article series produces an architect who can:

1. **Zoom** from a variable name to a team topology without losing coherence
2. **Ground** every decision in established engineering principles (book knowledge)
3. **Leverage** AI as the most powerful tool in their kit — without mistaking it for a replacement of their own judgment
4. **Translate** technical trade-offs into business language that product managers, engineering directors, and executives understand
5. **Lead** the transition from human-only engineering to human-AI collaborative engineering

---

## Layer 0 — Code Craft: The Engineer Who Sees Code as Infrastructure

### Transformation

- **Before**: "Clean code is good practice — I do it because Martin said so."
- **After**: "Clean code is infrastructure that enables or disables AI leverage."

### Core Shift

From treating code quality as a **virtue** (intrinsic, aesthetic, done for its own sake) to treating it as **leverage** (instrumental, measurable, done because it multiplies team capability).

### Observable Behaviors

1. **Dual-lens review**: Evaluates every PR through "Is this readable to me?" AND "Can an AI agent reason about this?" — leading to specific demands: typed DTOs, explicit error types, OpenAPI annotations.
2. **Context engineering**: Creates and maintains `.ai/` directory as a strategic asset, not optional documentation. Writes ADRs knowing they'll be read by AI agents thousands of times.
3. **Business case for quality**: Can articulate why two sprints of cleanup improves AI-assisted review throughput — in language a product manager accepts.

### What This Engineer Is NOT

Not someone who obsesses over formatting while ignoring architecture. The "infrastructure" framing means investing in code quality *proportionally to its impact*.

---

## Layer 1 — Design Thinking: The Engineer Who Designs for Two Audiences

### Transformation

- **Before**: "I know GoF patterns and DDD. I use them for maintainability."
- **After**: "Every boundary I draw is consumed by two audiences: humans AND AI agents."

### Core Shift

From designing boundaries for **human comprehension** to designing for **human + machine comprehension**, where the machine consumer demands even more explicitness because it cannot infer unstated context.

### Observable Behaviors

1. **Context-aware boundaries**: Draws bounded contexts knowing each may host its own AI agent with context-specific vocabulary (e.g., Chilean SII terminology vs. Greek AADE terminology).
2. **API as prompt**: Designs API contracts with awareness that the OpenAPI spec IS the prompt AI agents use to generate integrations.
3. **ACL as guardrail**: Uses Anti-Corruption Layer not just for legacy isolation but as AI guardrail — validating and sanitizing AI-generated data before it enters the domain model.
4. **Dual-purpose glossaries**: Writes domain glossaries per bounded context, understanding they serve both human onboarding AND AI agent training.

### What This Engineer Is NOT

Not an "AI-first" designer who abandons domain modeling rigor. DDD's strategic patterns become MORE important, not less — they provide the structure AI agents need to operate reliably.

---

## Layer 2 — Architecture: The Engineer Who Quantifies Trade-offs

### Transformation

- **Before**: "I pick an architecture style based on experience and defend it."
- **After**: "I quantify trade-offs, document decisions, and design for AI-assisted evolution."

### Core Shift

From **pattern matching** (I've seen this before, here's the pattern) to **decision engineering** (here are three options, here's the trade-off analysis, here's why I recommend this one, and here's the fitness function that tells us if we were right).

### Observable Behaviors

1. **Trade-off ADRs**: Produces ADRs that include trade-off analysis: "We chose X over Y and Z because of these quality attribute trade-offs, and we'll know it was wrong if this fitness function degrades."
2. **Business translation**: Can say in a planning meeting: "If we use two-phase async for SII integration, we gain 3x throughput but accept 30-second staleness. If that's unacceptable, we need the synchronous path — which costs throughput but guarantees consistency."
3. **AI-assisted analysis**: Uses AI to feed system metrics, dependency graphs, and change histories into analysis tools — detecting architectural drift, predicting failure modes, suggesting optimizations.
4. **Scenario-driven evaluation**: Evaluates every integration decision (sync vs. async, orchestration vs. choreography) against concrete business scenarios, not just technical preference.

### What This Engineer Is NOT

Not a "resume-driven architect" who picks the newest technology. The key distinction is the ability to translate architectural trade-offs into business language — velocity, risk, cost, time-to-market.

---

## Layer 3 — Infrastructure: The Engineer Who Builds the Machine That Watches the Machine

### Transformation

- **Before**: "I set up CI/CD, monitoring, and alerting."
- **After**: "I build self-healing systems where AI handles the runbook and humans handle the novel."

### Core Shift

From building infrastructure **that humans operate** to building infrastructure **that AI operates under human supervision**. This is "let machines repeat, let humans evolve" made concrete at the infrastructure level.

### Observable Behaviors

1. **AI as first-class gate**: Designs CI/CD pipelines where AI verifies requirements traceability, checks architecture conformance, and scores quality across dimensions — not just running tests.
2. **Intelligent observability**: Builds stacks where the AI layer sits between data collection and human notification — filtering noise, correlating signals, escalating only genuinely novel situations.
3. **Autonomous audit**: Implements nightly headless AI quality scans that aggregate across tools, score across dimensions, and push actionable summaries — not raw reports.
4. **Predictive operations**: Designs DR/failover where AI analyzes replication lag trends, query patterns, and network telemetry to predict failures before they happen.

### What This Engineer Is NOT

Not an automation zealot who removes all human oversight. The key word is "supervision" — humans set policies and handle exceptions; AI handles high-frequency repetitive execution within those boundaries. The engineer's judgment determines WHERE the human/AI boundary sits.

---

## Layer 4 — Engineering Culture: The Engineer Who Leads the Transition

### Transformation

- **Before**: "I manage a team of 8-10 and ship features on time."
- **After**: "I lead a smaller, AI-amplified team and can explain our approach to any stakeholder."

### Core Shift

From **managing people who write software** to **leading a human-AI system that produces software**. This requires changing not just technical practices but organizational structures, metrics, and the definition of "senior engineer."

### Observable Behaviors

1. **Team topology redesign**: Restructures team to include AI enablement function — providing AI tooling, prompt libraries, model governance, and best practices to all stream-aligned teams.
2. **Metrics evolution**: Measures productivity using DORA metrics augmented with AI-specific metrics (suggestion acceptance rate, AI-generated defect rate, cost-per-inference).
3. **The leadership talk**: Can explain to executives: "Here is how we use AI to deliver more with less. Here are the metrics. Here are the risks. Here is the governance model."
4. **Learning culture**: Builds continuous development of "AI collaboration skill" — shaping context, evaluating AI output, maintaining the architectural judgment AI cannot replace.

### What This Engineer Is NOT

Not someone who blindly embraces "AI replaces developers." Not someone who fears AI and resists adoption. The pragmatic middle — AI is a force multiplier that changes HOW the team works but not WHETHER the team needs deep engineering judgment.

---

## How the Five Compose

Read bottom-up to see the dependency chain:

```
L4 Culture        → enables sustained adoption and organizational learning
  └─ L3 Infra     → enables automated quality enforcement and self-healing ops
      └─ L2 Arch   → enables principled system design with quantified trade-offs
          └─ L1 Design → enables explicit boundaries for human + AI comprehension
              └─ L0 Craft → enables the codebase quality that makes everything above possible
```

A team can't build AI-monitored pipelines (L3) without architectural decisions worth monitoring (L2). Can't make good arch decisions without well-defined boundaries (L1). Can't define boundaries if code is too messy for anyone to understand (L0). And none of it sustains without a culture that values learning and honest adaptation (L4).

---

## Usage

When writing or reviewing any article, ask:

1. Which layer is this article in?
2. What is the "Before → After" transformation for that layer?
3. Does every section of this article drive toward that transformation?
4. Does the decision table arm the reader with the specific behaviors listed above?
5. Does the checklist give concrete steps toward adopting those behaviors?

If the answer to any of these is "no," the article needs revision.
