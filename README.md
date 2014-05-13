sinatra-async
=============

Sinatraで1プロセスでバックグラウンドジョブっぽいことをする


## 概要

herokuでworker dynoを使わずに1dyno（=無料で使える範囲）で非同期に処理を走らせたかった。


## 注意点

* Webサーバに使えるのは（確認できているのは）thinのみ
* 非同期で実行する処理でIOアクセス（ファイル, ネットワーク）を行う場合はEventMachineを使う必要がある


## 使い方

```bash
bundle install --path vendor/bundle
bundle exec rackup
```

[http://localhost:9292/](http://localhost:9292/) を開く。
