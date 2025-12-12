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

# Convert all Markdown under content/ to HTML under dist/ using pandoc defaults.
find content -name "*.md" -type f | while read -r src; do
  rel="${src#content/}"
  base="${rel%.md}"
  out="dist/${base}.html"
  out_dir="$(dirname "$out")"
  mkdir -p "$out_dir"
  run_pandoc --defaults pandoc/pandoc.yaml -o "$out" "$src"
done

