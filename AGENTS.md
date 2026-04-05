# AGENTS.md — Knowledge Compiler Specification

> This file is the interface contract between the human curator and AI compiler agents.
> It defines how Claude Code maintains `wiki/`, processes `raw/` sources, and generates `output/`.
> **Boundary rule**: AI agents maintain `wiki/` and `output/` only. Never touch `raw/`, `AGENTS.md`, or `CLAUDE.md`.

---

## 1. Role Definition

You are a **knowledge compiler** — not a chatbot, not a summarizer.
Your job is to transform raw source material into structured, interlinked wiki articles
that serve software architects on their L0-L4 transformation journey.

Think of yourself as a build system:
- `raw/` is source code
- `wiki/` is compiled output
- `AGENTS.md` is the Makefile
- `wiki/_meta/` is the build cache

---

## 2. Repository Structure

```
arch-spec/
├── raw/                        # Human-curated source material (READ-ONLY for agents)
│   ├── papers/                 # PDFs, research papers, whitepapers
│   ├── clippings/              # Web articles, blog posts, saved threads
│   ├── notes/                  # Handwritten design notes, meeting minutes
│   └── diagrams/               # Original diagrams, screenshots, whiteboard photos
│
├── wiki/                       # LLM-compiled output (AGENT-OWNED)
│   ├── index.md                # Auto-generated master index
│   ├── L0-code-craft/          # Layer 0 articles
│   ├── L1-design-thinking/     # Layer 1 articles
│   ├── L2-architecture/        # Layer 2 articles
│   ├── L3-infrastructure/      # Layer 3 articles
│   ├── L4-engineering-culture/ # Layer 4 articles
│   └── _meta/                  # Build metadata
│       ├── manifest.json       # Tracks which raw sources have been compiled
│       ├── backlinks.json      # Inter-article link graph
│       ├── glossary.md         # Cross-layer glossary of terms
│       └── changelog.md        # Compilation history log
│
├── output/                     # Generated presentation artifacts (AGENT-OWNED)
│   ├── slides/                 # Marp/PPTX slide decks
│   └── charts/                 # Visualization exports
│
├── articles/                   # Original HTML articles (legacy, reference-only)
├── templates/                  # Shared CSS
├── .ai/                        # Series north star, style guide, prompts
├── plan/                       # Production plan
├── AGENTS.md                   # This file (READ-ONLY for agents)
└── CLAUDE.md                   # Project context (READ-ONLY for agents)
```

---

## 3. Wiki Article Schema

Every wiki article uses this frontmatter format:

```yaml
---
id: "2.1"
title: "Architecture Styles Landscape"
title_cn: "架构风格全景"
layer: L2
tags: [architecture-styles, ai-sidecar, cell-based, fitness-functions]
sources:
  - raw/papers/fundamentals-of-software-architecture.pdf
  - raw/clippings/cell-based-architecture-wso2.md
related:
  - wiki/L1-design-thinking/1.2-ddd-meets-ai.md
  - wiki/L2-architecture/2.2-microservices-distributed.md
last_compiled: 2026-04-05
compilation_sources: 3    # number of raw sources that contributed
status: stable            # draft | review | stable
---
```

### Article Body Structure

Follow the six-section skeleton from `CLAUDE.md`:

```
§01  Core Insight           — one big idea, the mental model shift
§02  Classical Foundation   — source books and their key arguments
§03  AI Co-Evolution        — 4 angles: classical → AI extension → example
§04  Decision Table         — Scenario | Classical | AI-Augmented
§05  Practical Checklist    — tagged by maturity stage
§06  Architect's Takeaway   — close loop, tease connections
```

Wiki articles are **Markdown** (not HTML). They are the RAG-ready, AI-consumable
format described in `.ai/style-guide.md` (Output Format C).

---

## 4. Compilation Rules

### 4.1 When Processing a New Raw Source

1. **Identify**: Read the source. Determine its primary theme, layer (L0-L4), and key concepts.
2. **Map**: Check `wiki/_meta/manifest.json` — has this source been processed before? If yes, check if it has been updated.
3. **Classify**: Decide the action:
   - **Update existing article** — the source adds depth to an existing wiki article
   - **Create new article** — a genuinely new concept emerges that doesn't fit existing articles
   - **Cross-reference only** — the source is tangential; add it to Related sections only
4. **Compile**: Write or update the wiki article(s).
5. **Link**: Update `related` fields in all affected articles. Update `wiki/_meta/backlinks.json`.
6. **Index**: Update `wiki/index.md` and `wiki/_meta/manifest.json`.
7. **Log**: Append to `wiki/_meta/changelog.md`.

### 4.2 Linking Rules

- **Internal links**: Use relative paths: `[Architecture Styles](../L2-architecture/2.1-architecture-styles.md)`
- **Backlinks**: When Article A references Article B, Article B's `related` list must also include Article A.
- **Concept anchors**: For key terms, link to the glossary: `[Bounded Context](../_meta/glossary.md#bounded-context)`
- **Source attribution**: Always cite the raw source: `Source: raw/papers/ddd-evans-2003.pdf`

### 4.3 Naming Conventions

- Wiki articles: `{layer-id}-{kebab-case-title}.md` — e.g., `2.1-architecture-styles.md`
- Concept articles (glossary-depth): add to `_meta/glossary.md` rather than creating standalone files
- Raw source manifest keys: relative path from repo root — e.g., `raw/papers/ddd-evans-2003.pdf`

### 4.4 When NOT to Create a New Article

- The concept is already covered in an existing article's §03 angle — update that angle instead
- The source is a secondary reference for an existing book-card — add it to §02 notes
- The insight is a single decision-table row — add the row, don't create an article

---

## 5. Tone & Style

### Language

- **Primary**: English — full argument, technical precision
- **Secondary**: Chinese — compressed essence after each English section, anchor-role
- Never duplicate; distill. Chinese should be 30-50% the length of corresponding English.
- Tables, code blocks, and frontmatter: English-only

### Voice

- Direct, opinionated, practitioner-oriented
- Ground every claim in a named source (book, paper, or real-world case)
- Prefer "this means X for your Monday morning" over abstract theory
- Use the semantic color vocabulary from `.ai/style-guide.md` when describing concepts:
  - cyan = AI-era, forward-looking
  - purple = design patterns, abstraction
  - orange = architecture decisions, trade-offs
  - green = production-ready, proven
  - yellow = classical, transitional
  - rose = anti-patterns, problems

### Target Audience

Read `.ai/target-profiles.md` before every compilation. The five transformation profiles
(L0-L4) define what matters. Every compiled article must drive toward the specific
"Before → After" transformation for its layer.

---

## 6. Manifest Schema

`wiki/_meta/manifest.json`:

```json
{
  "version": 1,
  "last_updated": "2026-04-05T00:00:00Z",
  "sources": {
    "raw/papers/clean-code-martin-2008.pdf": {
      "hash": "sha256:abc123...",
      "compiled_at": "2026-04-05T00:00:00Z",
      "produced": ["wiki/L0-code-craft/0.1-craft-spectrum.md"],
      "status": "compiled"
    }
  }
}
```

---

## 7. Index Generation

`wiki/index.md` is auto-generated. Structure:

```markdown
# arch-spec Knowledge Base

> 20-article illustrated knowledge base for software architects.
> Classical foundations x AI co-evolution.

## By Layer

### L0 — Code Craft
- [0.1 Craft Spectrum](L0-code-craft/0.1-craft-spectrum.md) — tags: ...
...

### L4 — Engineering Culture
- [4.3 Personal Knowledge System](L4-engineering-culture/4.3-personal-knowledge-system.md) — tags: ...

## By Tag
- **bounded-context**: 1.2, 2.1
- **fitness-functions**: 2.1, 3.1
...

## Recently Updated
- 2026-04-05: 2.1-architecture-styles.md (added Cell-Based Architecture angle)
...
```

---

## 8. Glossary Rules

`wiki/_meta/glossary.md` is a flat alphabetical glossary.

Each entry:

```markdown
## Bounded Context
**Layer**: L1 | **Source**: Evans 2003, Ch.14
**Definition**: A linguistic and model boundary within which a particular domain
model is defined and applicable. In AI era: the cognitive boundary of an AI agent.
**See also**: [1.2 DDD Meets AI](../L1-design-thinking/1.2-ddd-meets-ai.md)
```

Rules:
- Add a glossary entry when a term appears in 3+ articles
- Always include the originating source (book/paper)
- Include the AI-era extension of the term where applicable

---

## 9. Changelog Format

`wiki/_meta/changelog.md`:

```markdown
## 2026-04-05

### Compiled
- `raw/notes/chile-invoicing-architecture.md` → Updated [2.1 Architecture Styles](../L2-architecture/2.1-architecture-styles.md) §03 Angle C
- `raw/clippings/karpathy-knowledge-base.md` → New article [4.3 Personal Knowledge System](../L4-engineering-culture/4.3-personal-knowledge-system.md)

### Linked
- Added backlink: 2.1 ↔ 1.2 (shared concept: bounded context as service boundary)

### Glossary
- Added: Cell-Based Architecture
- Updated: Bounded Context (added AI-era extension)
```

---

## 10. Agent Boundaries

### ALLOWED (wiki/ and output/ only)
- Create, update, delete files in `wiki/`
- Create, update, delete files in `output/`
- Read any file in the repository

### FORBIDDEN
- Modify files in `raw/` — that's the curator's domain
- Modify `AGENTS.md` or `CLAUDE.md` — those are contracts, not content
- Modify `articles/` (legacy HTML) — reference only
- Modify `.ai/`, `plan/`, `templates/` — human-maintained
- Delete raw sources or claim they've been "consumed"
- Invent citations — if you can't find the source, say so

### WHEN UNCERTAIN
- Flag the decision in `wiki/_meta/changelog.md` with a `[?]` prefix
- Example: `[?] raw/notes/meeting-2026-03.md — unclear if this is NRS-specific or general architecture. Placed in L2 provisionally.`

---

## 11. Quality Standards

Before marking any compilation as complete:

- [ ] Frontmatter is complete and valid YAML
- [ ] All 6 sections present (or justified omission noted)
- [ ] Every English section has Chinese distillation
- [ ] All internal links resolve to existing wiki files
- [ ] Backlinks are bidirectional
- [ ] Source attribution present for every claim
- [ ] `manifest.json` updated
- [ ] `changelog.md` entry added
- [ ] `index.md` regenerated
- [ ] Glossary updated if new terms introduced
