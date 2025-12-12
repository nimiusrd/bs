#!/usr/bin/env bash
set -euo pipefail

mkdir -p fixtures/expected

for src in fixtures/src/*.md; do
  [ -e "$src" ] || continue
  name="$(basename "$src" .md)"
  pandoc --defaults pandoc/pandoc.yaml -o "fixtures/expected/${name}.html" "$src"
done

