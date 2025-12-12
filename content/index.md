# ドキュメント概要 {#overview}

このサイトはPandocを用いてMarkdownから生成されたHTMLドキュメントです。セクション構造、図、表が安定して出力されることを確認するため、代表的なサンプルをフィクスチャとして用意しています。

## 目次 {#toc}

- セクションの例: `fixtures/src/sections.md`
- 図の例: `fixtures/src/figures.md`
- 表の例: `fixtures/src/tables.md`

## ガイドライン {#guidelines}

- Markdownには見出しにIDを付与して、安定したアンカーを生成してください。
- 図や表にはキャプションを付け、必要に応じてIDを付けてください。
- 本番コンテンツは `content/` 配下に配置し、`npm run build:docs` で `dist/` にHTMLを出力します。

