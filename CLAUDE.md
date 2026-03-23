# arch-spec — Project Context

## What This Is

A 20-article illustrated knowledge base for software architects.
Dual axis: classical book foundations × AI co-evolution.
5 layers, 30+ source books, 10-month production cycle.

Repo: https://github.com/Chening/arch-spec

## Series North Star

Every article drives toward transforming one dimension of the reader's capability.
See `.ai/target-profiles.md` for the five target engineer profiles — this is the
single most important reference file. All content decisions flow from it.

## Article Structure (every article follows this skeleton)

```
§01  Core Insight + Hero Diagram     — one big idea in 60 seconds
§02  Classical Foundation            — 3-4 source books as book-cards
§03  AI Co-Evolution (4 angles)     — each: classical principle → AI extension → example
§04  Decision Table                  — Scenario | Classical | AI-Augmented
§05  Practical Checklist             — tagged by maturity stage, HTML grid
§06  Architect's Takeaway            — close the loop + tease next article
```

## Design System

- Canonical CSS: `templates/article-base.css` (single source of truth)
- Articles inline the CSS for self-contained distribution
- Dark terminal aesthetic: bg `#0a0e17`, text `#e2e8f0`
- Semantic colors: cyan=AI, purple=design, orange=architecture, green=production, yellow=classical, rose=anti-pattern
- Fonts: JetBrains Mono (titles/code), IBM Plex Sans (body), Noto Serif SC (Chinese)
- SVGs use CSS variables with fallbacks: `fill="var(--bg-card,#141b2d)"`
- Single-file HTML articles, no external deps beyond Google Fonts

## Bilingual Convention

- English paragraphs carry the full argument
- Chinese as `.cn-note` after each EN paragraph: italic, compressed, anchor-role
- Never duplicate; distill
- Tables and code blocks are English-only

## File Locations

```
.ai/                    ← series north star, style guide, prompts
plan/                   ← production plan HTML
templates/              ← shared CSS (article-base.css)
articles/L{n}-{name}/   ← article HTML files
diagrams/               ← standalone SVG extracts
decks/                  ← PowerPoint outputs
```

## Key Reference Files

- `.ai/target-profiles.md`     — the five target engineer profiles (READ FIRST)
- `.ai/style-guide.md`         — design system documentation
- `plan/series-plan.html`      — full 20-article map with descriptions
- `articles/L0-code-craft/0.1-craft-spectrum.html` — the golden template
- `templates/article-base.css` — canonical shared CSS

## When Generating a New Article

1. Read `.ai/target-profiles.md` — which transformation does this layer drive?
2. Read `plan/series-plan.html` — what are the article's source books and AI angles?
3. Read the golden template `articles/L0-code-craft/0.1-craft-spectrum.html`
4. Follow the six-section skeleton exactly
5. Inline CSS from `templates/article-base.css`
6. Use CSS variables in all SVGs
7. Save to the correct `articles/L{n}-{name}/` directory
