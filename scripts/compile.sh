#!/usr/bin/env bash
# compile.sh — Process new raw material into wiki articles
#
# Usage:
#   ./scripts/compile.sh                  # Process all unindexed raw sources
#   ./scripts/compile.sh raw/notes/foo.md # Process a specific source
#
# This script invokes Claude Code with the right context to act as
# the knowledge compiler defined in AGENTS.md.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"

# Determine what to compile
if [ $# -eq 0 ]; then
  echo "Scanning raw/ for unindexed sources..."
  SOURCES=$(find raw/ -type f ! -name '.gitkeep' ! -name '.*' 2>/dev/null || true)
  if [ -z "$SOURCES" ]; then
    echo "No raw sources found. Add files to raw/ first."
    exit 0
  fi
  SOURCE_ARG="all unindexed files in raw/"
else
  SOURCE_ARG="$1"
  if [ ! -f "$SOURCE_ARG" ]; then
    echo "Error: $SOURCE_ARG not found"
    exit 1
  fi
fi

echo "=== arch-spec compile ==="
echo "Source: $SOURCE_ARG"
echo ""

# Invoke Claude Code as the knowledge compiler
claude --print \
  "You are the arch-spec knowledge compiler. Read AGENTS.md for your full specification.

Your task: compile the following raw source(s) into wiki/ articles.

Source to process: $SOURCE_ARG

Steps:
1. Read AGENTS.md for compilation rules
2. Read the source material
3. Read wiki/_meta/manifest.json to check what's already compiled
4. Read wiki/index.md and relevant existing wiki articles
5. Compile: create or update wiki articles following the six-section skeleton
6. Update manifest.json, backlinks.json, changelog.md, and index.md
7. Update glossary.md if new terms are introduced

Follow AGENTS.md sections 4 (Compilation Rules) and 10 (Agent Boundaries) exactly."

echo ""
echo "=== compile complete ==="
