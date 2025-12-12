#!/usr/bin/env bash
set -euo pipefail

# Convert all Markdown under content/ to HTML under dist/ using pandoc defaults.
find content -name "*.md" -type f | while read -r src; do
  rel="${src#content/}"
  base="${rel%.md}"
  out="dist/${base}.html"
  out_dir="$(dirname "$out")"
  mkdir -p "$out_dir"
  pandoc --defaults pandoc/pandoc.yaml -o "$out" "$src"
done

