# nrb2026 — ISUNARABE 合同演習2026

ISUNARABE 合同演習2026を対象としてGitHub Actions で継続的にベンチマークを実行するためのリポジトリです。

## クイックスタート

1. プログラムを変更する
2. git commit する
3. git push する
4. GitHub Actions でベンチマークが自動実行される

## GitHub Actions

| 項目 | 内容 |
|---|---|
| ワークフロー | `.github/workflows/bench.yml` |
| トリガー | `push` または手動 (`workflow_dispatch`) |
| 実行内容 | fixtures 準備 → イメージビルド → サービス起動 → bench 実行 → スコア表示 |

## 詳細

- 作問ドキュメント: [docs/README.md](docs/README.md)
- ローカル開発ループ (Docker 不使用): [docs/authoring/dev-loop.md](docs/authoring/dev-loop.md)
- Docker Compose 定義: [compose.yaml](compose.yaml)
