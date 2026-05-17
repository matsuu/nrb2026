# nrb2026 — ISUNARABE 合同演習2026

ISUNARABE 合同演習2026を対象としてGitHub Actions で継続的にベンチマークを実行するためのリポジトリです。

## クイックスタート

1. `gh repo fork matsuu/nrb2026 --clone`
2. KAIZEN
3. git commit
4. git push
5. GitHub Actions ベンチマーク結果を確認
6. 2-5 を繰り返す

## 注意事項

* スコアのランキング機能はありません
* ISUNARABE 合同演習2026 と環境スペックが異なるため、ベンチマークスコアはあくまで参考値として扱ってください

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
