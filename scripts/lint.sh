#!/usr/bin/env bash
# lint.sh — Health check the wiki knowledge base
#
# Usage:
#   ./scripts/lint.sh              # Full lint
#   ./scripts/lint.sh --quick      # Quick check (links only)
#
# Outputs a lint report to wiki/_meta/lint-report.md

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

MODE="${1:---full}"

echo "=== arch-spec lint ($MODE) ==="
echo ""

if [ "$MODE" = "--quick" ]; then
  CHECKS="broken internal links only"
else
  CHECKS="all checks: broken links, contradictions, stale content (90+ days), missing connections, coverage gaps"
fi

# Invoke Claude Code as the linter
claude --print \
  "You are the arch-spec knowledge base linter. Read AGENTS.md for context.

Your task: run a health check on wiki/ and output a lint report.

Checks to perform ($MODE): $CHECKS

Steps:
1. Read AGENTS.md for the wiki schema and linking rules
2. Load all wiki/ articles and _meta/ files
3. For each check:
   - Broken internal links: verify every [link](path) resolves to an existing file
   - Contradictions: flag where two articles make conflicting claims about the same concept
   - Stale content: articles with last_compiled > 90 days ago
   - Missing connections: articles that share 3+ tags but don't link to each other
   - Coverage gaps: raw/ sources listed in manifest with status != 'compiled'
4. Write the report to wiki/_meta/lint-report.md
5. Print a summary to stdout

Report format:
  ## Lint Report — {date}
  ### Critical (broken links, contradictions)
  ### Warnings (stale, missing connections)
  ### Info (coverage gaps, suggestions)
  ### Stats (total articles, total links, total raw sources)"

echo ""
echo "=== lint complete ==="
echo "Report: wiki/_meta/lint-report.md"
