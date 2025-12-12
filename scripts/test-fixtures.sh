#!/usr/bin/env bash
set -euo pipefail

mkdir -p fixtures/tmp
status=0

for src in fixtures/src/*.md; do
  [ -e "$src" ] || continue
  name="$(basename "$src" .md)"
  tmp="fixtures/tmp/${name}.html"
  expected="fixtures/expected/${name}.html"

  pandoc --defaults pandoc/pandoc.yaml -o "$tmp" "$src"

  if ! diff -u "$expected" "$tmp"; then
    echo "Diff detected for fixture: $name" >&2
    status=1
  fi
done

exit $status

