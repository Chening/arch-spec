# arch-spec

**Classical Foundations × AI Co-Evolution — An Illustrated Knowledge Base for Software Architects**

经典基础 × AI协同进化 — 面向软件架构师的图文知识库

---

## What is this?

A 20-article illustrated series that connects classical software engineering wisdom to AI-era practice. Each article follows a dual axis: grounded in established book knowledge, extended through the lens of AI co-evolution.

The core thesis: classical software engineering books are not obsolete — they are the **foundation** that makes AI augmentation effective.

**Target audience**: Software architects, technical leads, and senior engineers with 5+ years of industry experience.

## Series Map

### Layer 0 — Code Craft `4 articles`
> *The engineer who sees code as infrastructure*

| # | Title | Source Books |
|---|-------|-------------|
| 0.1 | [The Craft Spectrum](articles/L0-code-craft/0.1-craft-spectrum.html) | Clean Code · Code Complete · Philosophy of SW Design · Art of Readable Code |
| 0.2 | [AI-Era Refactoring](articles/L0-code-craft/0.2-ai-era-refactoring.html) | Refactoring · Working with Legacy Code · Tidy First? · Your Code as a Crime Scene |
| 0.3 | [Testing Strategies](articles/L0-code-craft/0.3-testing-strategies.html) | TDD By Example · GOOS · Unit Testing |
| 0.4 | [The Developer's New Toolkit](articles/L0-code-craft/0.4-developers-toolkit.html) | Pragmatic Programmer · SW Engineering at Google |

### Layer 1 — Design Thinking `4 articles`
> *The engineer who designs for two audiences*

| # | Title | Source Books |
|---|-------|-------------|
| 1.1 | [Design Patterns Revisited](articles/L1-design-thinking/1.1-design-patterns-revisited.html) | Design Patterns (GoF) · Head First Design Patterns · PoEAA |
| 1.2 | [DDD Meets AI](articles/L1-design-thinking/1.2-ddd-meets-ai.html) | Domain-Driven Design · Implementing DDD · DDD Distilled |
| 1.3 | [API Design](articles/L1-design-thinking/1.3-api-design.html) | API Design Patterns · RESTful Web APIs · Building Microservices |
| 1.4 | [Error Handling & Observability](articles/L1-design-thinking/1.4-error-handling-observability.html) | Release It! · Observability Engineering · SRE Book |

### Layer 2 — Architecture `5 articles`
> *The engineer who quantifies trade-offs*

| # | Title | Source Books |
|---|-------|-------------|
| 2.1 | [Architecture Styles Landscape](articles/L2-architecture/2.1-architecture-styles.html) | Fundamentals of SA · Hard Parts · Clean Architecture |
| 2.2 | [Distributed Data & DR](articles/L2-architecture/2.2-microservices-distributed.html) | DDIA · Database Internals · Hard Parts |
| 2.3 | [Event-Driven & Reactive](articles/L2-architecture/2.3-event-driven-reactive.html) | EIP · Microservices Patterns |
| 2.4 | [Security & AI Attack Surface](articles/L2-architecture/2.4-security-ai-attack-surface.html) | OAuth 2 in Action · API Security in Action · Threat Modeling |
| 2.5 | [Data Architecture & Lakehouse](articles/L2-architecture/2.5-data-architecture-lakehouse.html) | DDIA · Fundamentals of Data Engineering |

### Layer 3 — Infrastructure `4 articles`
> *The engineer who builds the machine that watches the machine*

| # | Title | Source Books |
|---|-------|-------------|
| 3.1 | [CI/CD as Architecture](articles/L3-infrastructure/3.1-cicd-as-architecture.html) | Continuous Delivery · Accelerate · SW Engineering at Google |
| 3.2 | [DNS, Load Balancing & Multi-DC](articles/L3-infrastructure/3.2-dns-load-balancing.html) | SRE Book · SRE Workbook · Release It! |
| 3.3 | [Infrastructure as Code](articles/L3-infrastructure/3.3-infrastructure-as-code.html) | Infrastructure as Code · Terraform Up & Running · K8s in Action |
| 3.4 | [Observability Stack](articles/L3-infrastructure/3.4-observability-stack.html) | Observability Engineering · Distributed Systems Observability · SRE Book |

### Layer 4 — Engineering Culture `3 articles`
> *The engineer who leads the transition*

| # | Title | Source Books |
|---|-------|-------------|
| 4.1 | [The Lean Engineering Manifesto](articles/L4-engineering-culture/4.1-lean-engineering-manifesto.html) | Accelerate · Toyota Way · Phoenix Project · SW Eng at Google |
| 4.2 | [Team Topologies for AI-Augmented Orgs](articles/L4-engineering-culture/4.2-team-topologies.html) | Team Topologies · Manager's Path · An Elegant Puzzle |
| 4.3 | [Personal Knowledge System](articles/L4-engineering-culture/4.3-personal-knowledge-system.html) | Pragmatic Programmer · Staff Engineer · 201 Principles |

## Article Format

Every article follows a six-section skeleton:

```
§01  Core Insight + Hero Diagram     — one big idea in 60 seconds
§02  Classical Foundation            — 3-4 source books as book-cards
§03  AI Co-Evolution (4 angles)     — classical principle → AI extension → example
§04  Decision Table                  — Scenario | Classical | AI-Augmented
§05  Practical Checklist             — concrete actions tagged by maturity stage
§06  Architect's Takeaway            — synthesis + next article teaser
```

Bilingual: English carries the full argument, Chinese appears as italic supplementary notes after each paragraph.

## Design System

- Dark terminal aesthetic (`#0a0e17` background)
- Semantic colors: cyan=AI, purple=design, orange=architecture, green=production, yellow=classical, rose=anti-pattern
- Fonts: JetBrains Mono (titles/code), IBM Plex Sans (body), Noto Serif SC (Chinese)
- Self-contained HTML — each article inlines CSS from `templates/article-base.css`
- SVG diagrams use CSS variables with fallbacks

## Project Structure

```
.ai/                    — series north star, style guide, prompts
plan/                   — production plan HTML
templates/              — shared CSS (article-base.css)
articles/
  L0-code-craft/        — 0.1 – 0.4
  L1-design-thinking/   — 1.1 – 1.4
  L2-architecture/      — 2.1 – 2.5
  L3-infrastructure/    — 3.1 – 3.4
  L4-engineering-culture/ — 4.1 – 4.3
diagrams/               — standalone SVG panorama diagrams
decks/                  — PowerPoint outputs
```

## Panorama Diagrams

Standalone SVG diagrams for presentations and documentation, located in `diagrams/`:

| File | Content |
|------|---------|
| [`series-panorama.svg`](diagrams/series-panorama.svg) | Complete 20-article × 5-layer series map |
| [`L0-craft-spectrum.svg`](diagrams/L0-craft-spectrum.svg) | Six-stage code maturity spectrum (Spaghetti → AI-Generable) |
| [`L1-design-dual-audience.svg`](diagrams/L1-design-dual-audience.svg) | Designing for two audiences: humans AND AI agents |
| [`L2-architecture-trade-offs.svg`](diagrams/L2-architecture-trade-offs.svg) | From pattern matching to quantified decision engineering |
| [`L3-infrastructure-stack.svg`](diagrams/L3-infrastructure-stack.svg) | Four-layer infrastructure stack with AI intelligence layer |
| [`L4-culture-transformation.svg`](diagrams/L4-culture-transformation.svg) | Three-pillar culture transformation framework |

## Using as a RAG Knowledge Base

This series is designed to be consumed by AI systems. The consistent six-section structure enables precise retrieval:

```
"Give me all decision tables related to security"
"What do the classical books say about testing?"
"Compare the AI co-evolution angles across L0-L4"
```

Load the 20 HTML articles into any RAG pipeline for architectural decision support grounded in 30+ books of engineering wisdom.

## License

Content © Chening. All rights reserved.
