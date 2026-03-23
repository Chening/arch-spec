# Visual Design System — Style Guide

> This document describes the design system used across all 20 articles.
> The canonical CSS implementation lives in `templates/article-base.css`.

## Aesthetic

**Industrial terminal meets editorial.** The dark terminal foundation (black bg, monospace, cyan accents) signals serious infrastructure thinking. The editorial layer (IBM Plex Sans body, generous line-height, 860px max-width) makes it readable as long-form content. The combination says: rigorous content, presented with care.

## Semantic Color System

Every color maps to a meaning that stays consistent across all 20 articles. Readers develop intuition for information types before consciously processing them.

| Token | Hex | Meaning |
|-------|-----|---------|
| `--cyan` | `#22d3ee` | AI-era concepts, forward-looking, new |
| `--purple` | `#a78bfa` | Design thinking, patterns, abstraction |
| `--orange` | `#f97316` | Architecture decisions, trade-offs, warnings |
| `--green` | `#10b981` | Production-ready, actionable, proven |
| `--yellow` | `#eab308` | Classical, transitional, bridge zone |
| `--rose` | `#f43f5e` | Anti-patterns, problems, the "before" state |
| `--text-secondary` | `#94a3b8` | Secondary text, baseline, context |

Layer header colors:
- L0 Code Craft = cyan
- L1 Design Thinking = purple
- L2 Architecture = orange
- L3 Infrastructure = green
- L4 Engineering Culture = rose

## Typography

| Font | Role | Usage |
|------|------|-------|
| JetBrains Mono | Engineer's handwriting | Titles, code, labels, metadata, badges |
| IBM Plex Sans | Professional body | Body text, descriptions, table cells |
| Noto Serif SC | Chinese anchor | `.cn-note` elements only. Italic. |

Two font sizes for body: 15.5px (paragraphs), 14px (cn-note).
Headings: h2 = 22px, h3 = 16px, both JetBrains Mono.

## Reusable Components

| Component | CSS Class | Purpose | Per Article |
|-----------|-----------|---------|-------------|
| Diagram container | `.diagram-container` | Hosts SVG diagrams, gradient top-border | 3-5 |
| Book card | `.book-card.tier{1,2}` | Source book with left-border color tier | 3-4 |
| Decision table | `.decision-table` | Scenario / Classical / AI-Augmented | 1 |
| Evolution steps | `.evolution-steps` | Timeline with gradient connector | 0-1 |
| Insight box | `.insight-box` | Key takeaway with ⚡ icon | 1-2 |
| Code block | `.code-block` | Syntax-highlighted code | 1-3 |
| Checklist | `.checklist` | Stage-tagged action items grid | 1 |
| Chinese note | `.cn-note` | Bilingual comprehension anchor | After every EN ¶ |

## SVG Rules

- All SVGs use CSS custom properties with fallbacks: `fill="var(--bg-card,#141b2d)"`
- This ensures theme consistency when CSS vars are available, and graceful fallback when not
- ViewBox width matches container (~800px for article-width diagrams)
- No hardcoded colors without fallback pattern
- Fonts in SVG: `font-family:'JetBrains Mono',monospace`

## Bilingual Convention

- English paragraphs: full argument, technical precision
- Chinese `.cn-note`: compressed essence, comprehension anchor
- CSS treatment: `border-left: 2px`, italic, smaller font, dimmer color
- Chinese visually subordinated so English primary flow is uninterrupted
- Tables and code blocks: English-only

## Output Formats

| Channel | Format | Style |
|---------|--------|-------|
| A (Primary) | HTML | Dark terminal, self-contained single-file |
| B (Presentations) | PPTX | White bg (#F8FAFC), blue header (#1B6CA8), Calibri + Courier New |
| C (RAG-ready) | Markdown | In Git, for AI agent consumption |

## Print Stylesheet

`@media print` flips to light theme: white bg, dark text, hidden decorative elements. Semantic colors remapped to darker, ink-friendly values.
