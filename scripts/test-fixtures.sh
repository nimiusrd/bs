#!/usr/bin/env bash
set -euo pipefail

# pandoc 実行ヘルパー
# - ローカル開発環境: PATH 上の pandoc を使用（devcontainer でインストール済み）
# - CI (GitHub Actions) : pandoc/core:3.8 の Docker イメージを利用
run_pandoc() {
  if command -v pandoc >/dev/null 2>&1; then
    pandoc "$@"
  elif command -v docker >/dev/null 2>&1; then
    docker run --rm -v "$PWD:/data" -w /data pandoc/core:3.8 "$@"
  else
    echo "pandoc が見つかりません。ローカルに pandoc をインストールするか、Docker（pandoc/core:3.8）を利用してください。" >&2
    exit 1
  fi
}

mkdir -p fixtures/tmp
status=0

for src in fixtures/src/*.md; do
  [ -e "$src" ] || continue
  name="$(basename "$src" .md)"
  tmp="fixtures/tmp/${name}.html"
  expected="fixtures/expected/${name}.html"

  run_pandoc --defaults pandoc/pandoc.yaml -o "$tmp" "$src"

  if ! diff -u "$expected" "$tmp"; then
    echo "Diff detected for fixture: $name" >&2
    status=1
  fi
done

exit $status

