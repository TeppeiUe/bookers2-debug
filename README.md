# DMM WEBCAMP 応用課題フェーズのサンプルアプリケーション

これは、[Bookers2](https://github.com/TeppeiUe/Bookers2)に以下機能を実装したアプリケーションです。
- いいね/コメント機能
- フォロー/フォロワー機能（非同期通信）
- 検索機能
- 住所検索機能
- 新規登録時thanksメール送信機能
- DM機能（非同期通信）
- バッチ処理（1日1回メール送信機能）

## 使い方

まず、リポジトリを手元にクローンしてください。
その後、次のコマンドで必要となるGemをインストールします。

```
$ bundle
```

次に、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、Railsサーバーを立ち上げて下さい。

```
$ rails s
```
