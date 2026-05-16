# nrb2026 — ISUNARABE 合同演習2026

Docker Compose で webapp（ISUCON 参加者に配布するアプリケーション）と bench（ベンチマーカー）をローカル実行し、負荷テストを随時行うための環境です。

## Make ターゲット一覧

```bash
make fixtures  # ベンチマーク用 fixture 画像をダウンロード (初回のみ)
make build     # Docker イメージをビルド
make up        # MySQL + webapp を起動
make bench     # bench を 1 回実行
make logs      # webapp のログを確認
make down      # 全サービスを停止
make rebuild   # build → up → bench を一括実行
```

## クイックスタート

```bash
# 0. 事前準備 (初回のみ)
make fixtures

# 1. Docker イメージをビルド
make build

# 2. MySQL + webapp を起動
make up

# 3. bench を実行
make bench

# 4. 後片付け
make down
```

## 詳細

- 作問ドキュメント: [docs/README.md](docs/README.md)
- ローカル開発ループ (Docker 不使用): [docs/authoring/dev-loop.md](docs/authoring/dev-loop.md)
- Docker Compose 定義: [compose.yaml](compose.yaml)
