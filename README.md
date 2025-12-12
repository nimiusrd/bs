# Pandocベースドキュメント（サンプル構成）

## 前提
- 出力は HTML のみ（Pandoc 使用）。
- Markdown リポジトリに textlint を導入し、CI で必須。
- 少数のフィクスチャで Pandoc 出力の変化を検知（図・表・セクション）。

## ディレクトリ
- `content/` : 本番コンテンツ
- `fixtures/src/` : 代表的な入力 Markdown（sections / figures / tables）
- `fixtures/expected/` : 期待出力 HTML（`npm run build:fixtures` で生成）
- `pandoc/` : `pandoc.yaml`, `template.html5`, `meta.yaml`
- `assets/` : 共通スタイル（`style.css`）
- `dist/` : ビルド済み HTML

## セットアップ
```bash
npm install
```

## コマンド
- `npm run lint:text` : `content/**/*.md` と `fixtures/src/**/*.md` を textlint
- `npm run build:docs` : `content/` → `dist/` へ HTML 生成
- `npm run build:fixtures` : フィクスチャ期待出力を `fixtures/expected/` へ生成
- `npm run test:fixtures` : 期待出力との差分を確認（ライブラリ更新検知）

## CI フロー（.github/workflows/docs.yml）
1. textlint
2. test:fixtures（Pandoc diff）
3. build:docs → artifact upload（必要に応じてデプロイに差し替え）

## メモ
- 初回は `npm run build:fixtures` を実行して `fixtures/expected/*.html` を作成してください。
- Pandoc のバージョン更新やテンプレート変更で意図した差分がある場合は、`build:fixtures` で再生成してコミットします。

