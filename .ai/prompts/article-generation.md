# Article Generation Prompt Template

> Use this template when generating a new article for the Software Knowledge Base series.
> Fill in the variables below, then pass the entire prompt to the AI.

---

## Pre-Generation Checklist

Before generating, ensure you have:
1. Read `.ai/target-profiles.md` — which transformation does this layer drive?
2. Read `plan/series-plan.html` — source books, AI angles, tags for this article
3. Read the golden template `articles/L0-code-craft/0.1-craft-spectrum.html`
4. Read `templates/article-base.css` for canonical CSS
5. Read the previous article in sequence for continuity

---

## Prompt Variables

```
ARTICLE_ID       = {e.g., 1.2}
ARTICLE_TITLE    = {English title}
ARTICLE_TITLE_CN = {Chinese title}
LAYER_NUM        = {0-4}
LAYER_NAME       = {Code Craft / Design Thinking / Architecture / Infrastructure / Engineering Culture}
LAYER_NAME_CN    = {代码工艺层 / 设计思维层 / 架构决策层 / 基础设施层 / 工程文化层}
READ_TIME        = {~15-20 min}
SOURCE_BOOKS     = {list of 3-4 books with author, year, tier}
AI_ANGLES        = {list of 4 angles with classical principle + AI extension}
PREV_ARTICLE     = {filename of previous article, e.g., 0.1-craft-spectrum.html}
NEXT_ARTICLE     = {filename of next article}
PREV_TITLE       = {title of previous article}
NEXT_TITLE       = {title of next article}
NRS_CASE         = {if applicable: NRS running example for this article, else "N/A"}
```

---

## Generation Prompt

```
You are generating Article {ARTICLE_ID} for the Software Knowledge Base series.

## Article Identity
- Title: {ARTICLE_TITLE}
- Chinese Title: {ARTICLE_TITLE_CN}
- Layer: L{LAYER_NUM} {LAYER_NAME} · {LAYER_NAME_CN}
- Reading time: {READ_TIME}
- Source Books: {SOURCE_BOOKS count} books × 4 AI angles

## Structure — Follow the Six-Section Skeleton EXACTLY

### §01 Core Insight + Hero Diagram
- One big idea in 60 seconds
- The mental model shift for this article
- Insight box with "The Reframing" in both languages
- Hero Diagram: SVG, viewBox ~800px wide, CSS variables with fallbacks
  e.g., fill="var(--cyan,#22d3ee)"

### §02 Classical Foundation — Source Books
- {SOURCE_BOOKS count} book-cards in .bookshelf grid
- Each: .book-title, .book-author, .book-desc, .book-tag
- tier1 books get .tier1 class (cyan left border)
- tier2 books get .tier2 class (purple left border)
- Synthesis paragraph connecting all books
- .cn-note after each English paragraph

### §03 AI Co-Evolution — Four Angles
For each of the 4 angles:
- h3 with "Angle {A/B/C/D} · {English title} — {Chinese title}"
- <strong>Classical principle:</strong> — cite the specific book and chapter
- <strong>AI extension:</strong> — how AI reshapes this principle
- <strong>Concrete example:</strong> — code block, diagram, or real-world case
- .cn-note after each angle's content

Include at least:
- 1 code-block with data-lang attribute and syntax highlighting spans
- 1 evolution-steps OR additional diagram-container with SVG

### §04 Decision Table
- table.decision-table with 6-8 rows
- Headers: Scenario 场景 | CLASSIC Classical Approach | AI+ AI-Augmented Approach
- Use .col-scenario, .col-classic, .col-ai classes
- Include .classic-badge and .ai-badge in headers

### §05 Practical Checklist
- div.checklist grid (2 columns)
- 10-12 .check-item elements
- Each tagged with .check-stage at appropriate maturity level:
  S2 = orange, S3 = yellow, S4 = cyan, S5 = purple, S6 = green
- Ordered by dependency — don't skip stages

### §06 Architect's Takeaway
- Close the loop back to §01 thesis
- Reinforce "both/and" message (classical + AI)
- .insight-box teasing next article: {NEXT_TITLE}
- .cn-note after each paragraph

## Technical Requirements
- Inline CSS from templates/article-base.css (copy from golden template)
- Single-file HTML, self-contained
- Google Fonts link for JetBrains Mono, IBM Plex Sans, Noto Serif SC
- Every English paragraph followed by .cn-note (Chinese distillation)
- Tables and code blocks: English-only
- All SVGs: CSS variables with hex fallbacks
- Nav links: prev → {PREV_ARTICLE}, next → {NEXT_ARTICLE}
- Footer: Article {ARTICLE_ID} of 20
- Responsive: works at ≤640px
- Print stylesheet included in CSS

## Bilingual Convention
- English: full argument, technical precision
- Chinese .cn-note: compressed essence, not translation
  Never duplicate; distill the core insight in fewer words

## NRS Running Example (if applicable)
{NRS_CASE}
Use this real-world case in at least one AI angle and one decision table row.

## Quality Gate
Before finalizing, verify:
□ All 6 sections present and non-empty
□ Book-card count matches SOURCE_BOOKS
□ 4 AI angles in §03
□ Decision table ≥ 6 rows
□ Checklist ≥ 10 items with stage tags
□ Every EN paragraph has .cn-note
□ All SVGs use CSS variables + fallback
□ Nav links correct
□ §06 teases next article
```

---

## Example: Article 1.2 Variables

```
ARTICLE_ID       = 1.2
ARTICLE_TITLE    = DDD Meets AI — Bounded Contexts as AI Service Boundaries
ARTICLE_TITLE_CN = DDD遇见AI：限界上下文作为AI服务边界
LAYER_NUM        = 1
LAYER_NAME       = Design Thinking
LAYER_NAME_CN    = 设计思维层
READ_TIME        = ~18 min
SOURCE_BOOKS     = Domain-Driven Design (Evans, 2003, tier1), Implementing DDD (Vernon, 2013, tier1), DDD Distilled (Vernon, 2016, tier2)
AI_ANGLES        = Ubiquitous Language as AI training data, ACL as AI guardrail, Domain Events as AI triggers, Context Maps for multi-agent systems
PREV_ARTICLE     = 1.1-design-patterns-revisited.html
NEXT_ARTICLE     = 1.3-api-design.html
PREV_TITLE       = Design Patterns Revisited
NEXT_TITLE       = API Design as First-Class Decision
NRS_CASE         = NRS multi-country invoicing: Chilean SII, Greek AADE, Brazilian NF-e — each country as bounded context with its own ubiquitous language, ACL at integration boundaries
```
