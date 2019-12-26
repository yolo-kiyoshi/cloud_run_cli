# 概要

1. Docker imageをビルドし、Container Repositoryにプッシュ
1. Cloud Run にコンテナをデプロイ

# 用途
## ビルドとプッシュ
`README.md`と同一ディレクトリにて、以下を実行する。

```
./scripts/build_and_push.sh <project_name> <image_name> <tag>
```

## デプロイ

`.env`、`.param`を記載後に以下を実行する。

```
./scripts/deploy_cloud_run.sh <service_name> <project_name> <image_name> <tag>
```

### 環境変数
コンテナ実行時の環境変数は`.env`に記載する。  
`.env`に記載した環境変数は、`./scripts/deploy_cloud_run.sh`実行時に`--update-env-vars`パラメータにカンマ区切りで展開される。

### Cloud Runコマンド引数
Cloud Run実行時の引数は`.param`に記載する。  
`--cluster`などの他のパラメータを追加する場合は`./scripts/deploy_cloud_run.sh`にも合わせて追加すれば良い。