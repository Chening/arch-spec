#!/usr/bin/env bash
# query.sh — Research against the knowledge base
#
# Usage:
#   ./scripts/query.sh "What patterns apply to multi-country invoicing?"
#   ./scripts/query.sh "Compare event-driven vs orchestration" --format slides
#   ./scripts/query.sh "Summarize L2 layer" --format chart
#
# Outputs to stdout by default, or to output/ with --format flag.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

if [ $# -eq 0 ]; then
  echo "Usage: ./scripts/query.sh \"your question\" [--format md|slides|chart]"
  exit 1
fi

QUESTION="$1"
FORMAT="${3:-md}"

echo "=== arch-spec query ==="
echo "Q: $QUESTION"
echo "Format: $FORMAT"
echo ""

OUTPUT_INSTRUCTION=""
case "$FORMAT" in
  slides)
    OUTPUT_INSTRUCTION="Output as a Marp-compatible markdown slide deck. Save to output/slides/ with a descriptive filename."
    ;;
  chart)
    OUTPUT_INSTRUCTION="Output as a structured data visualization description. Save to output/charts/ with a descriptive filename."
    ;;
  *)
    OUTPUT_INSTRUCTION="Output as markdown to stdout."
    ;;
esac

# Invoke Claude Code as the research agent
claude --print \
  "You are the arch-spec research agent. Read AGENTS.md for context.

Your task: answer the following question by researching the wiki knowledge base.

Question: $QUESTION

Steps:
1. Read wiki/index.md to find relevant articles
2. Read wiki/_meta/glossary.md for term definitions
3. Read wiki/_meta/backlinks.json to follow cross-references
4. Read the relevant wiki articles (follow links as needed)
5. Synthesize an answer that:
   - Cites specific articles and sections
   - Includes both classical and AI-augmented perspectives
   - Uses the bilingual convention (English primary, Chinese distillation)
6. $OUTPUT_INSTRUCTION

If the knowledge base doesn't contain enough information to answer fully,
say what's known, what's missing, and suggest which raw sources could fill the gap."

echo ""
echo "=== query complete ==="
