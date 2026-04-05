# Andrej Karpathy — Building a Personal Knowledge Base with LLMs

> Source: Karpathy's public talks and blog posts (2024-2025)
> Topic: Using LLMs as "knowledge compilers" for personal wikis
> Relevance: L4 Engineering Culture — Personal Knowledge Systems

---

## Core Idea

Karpathy advocates treating your LLM not as a Q&A chatbot but as a **compiler**
that transforms raw, messy source material into structured, interlinked knowledge.

The key metaphor: your notes are **source code**, the LLM is the **compiler**,
and the wiki is the **compiled binary**. You don't edit the binary — you edit
the source and recompile.

## The Two-Tier Architecture

```
raw/   →  human-curated, messy, authentic
wiki/  →  LLM-compiled, structured, interlinked
```

**raw/** contains:
- Papers you've read (with highlights)
- Blog posts and articles you've clipped
- Meeting notes and design discussions
- Screenshots, diagrams, whiteboard photos

**wiki/** contains:
- Structured articles with consistent format
- Auto-generated backlinks and cross-references
- A master index organized by topic
- A glossary of recurring terms

The human **never edits wiki/ directly**. All changes flow through raw/ → compile → wiki/.

## Why This Matters for Engineers

1. **Compounding knowledge**: Every source you add makes the entire wiki smarter.
   The LLM can find connections between a paper you read in January and meeting
   notes from March that a human would miss.

2. **Queryable memory**: Instead of searching through scattered notes, you query
   the compiled wiki. The LLM follows internal links and synthesizes answers.

3. **Team scalability**: Multiple contributors add to raw/. The compiler
   maintains consistency across all contributions. No "wiki gardener" needed.

4. **AI-native format**: The compiled wiki is already in a format that AI agents
   can consume — structured markdown with explicit relationships. This makes it
   a natural context source for coding agents, review agents, and planning agents.

## The Three Operations

### compile
Process new raw material. The compiler:
1. Reads the new source
2. Identifies which existing wiki articles relate
3. Updates or creates articles
4. Maintains the link graph and index

### lint
Health-check the wiki:
- Broken internal links
- Contradictions between articles
- Stale content not updated recently
- Missing connections (articles that should link but don't)

### query
Research against the compiled knowledge:
- Natural language questions
- Cross-reference synthesis
- Output as markdown, slides, or structured data

## Connection to Software Architecture

This pattern mirrors several classical architecture concepts:

- **Separation of concerns**: raw (input) vs wiki (output) vs scripts (process)
- **Single source of truth**: raw/ is authoritative; wiki/ is derived
- **Immutable input**: raw sources are append-only; you add, never modify
- **Idempotent compilation**: re-running compile on the same raw/ produces the same wiki/
- **Eventually consistent**: the wiki may lag behind raw/ but converges after compile

For software architects specifically, this becomes a **decision journal** — every
ADR, every trade-off discussion, every post-mortem gets compiled into a searchable,
cross-referenced knowledge base that grows more valuable over time.

## Anti-Patterns to Avoid

- **Editing wiki/ directly**: Breaks the compilation model. Changes get overwritten on next compile.
- **Perfectionist raw/**: Don't clean up your notes before adding. The compiler handles messy input. The whole point is low friction on the input side.
- **Skipping attribution**: Every wiki claim must trace back to a raw source. Without this, you lose the "why" and can't verify claims.
- **Over-structuring raw/**: Don't impose a rigid taxonomy on raw/. Just use broad buckets (papers, notes, clippings). Let the compiler do the organizing.

## Quotes

> "The best personal knowledge system is one where adding new information is
> trivially easy and finding old information is surprisingly powerful."

> "Your LLM is not your oracle. It's your librarian — it organizes, it connects,
> it retrieves. You're still the one who decides what to read."

---

## Metadata

- **Primary layer**: L4 — Engineering Culture
- **Secondary layers**: L0 (code as knowledge artifact), L2 (architecture of the system itself)
- **Related concepts**: ADR (Architecture Decision Records), Second Brain, Zettelkasten, Conway's Law applied to knowledge systems
- **Potential wiki articles**: 4.3-personal-knowledge-system.md, cross-reference with 4.1-lean-engineering-manifesto.md
