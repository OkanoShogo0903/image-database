## 本番環境の手動goose操作
```
$ heroku config | grep DATABASE_URL
$ cd ./db && goose -dir migrations mysql "DATABASE_URLを抽出したもの" up
```

## 備忘録：サービスデプロイの流れ
```
$ heroku login
$ heroku apps:create go-api-server --buildpack heroku/go
$ git init
$ heroku git:remote -a go-api-server
$ heroku addons:add cleardb
$ heroku config | grep CLEARDB_DATABASE_URL
CLEARDB_DATABASE_URL: mysql://38faf8fefeaaef:dfefe44@us-cdbr-iron-east-093823.cleardb.net/heroku_8cfefedfgcd6a?reconnect=true
// 出力された`CLEARDB_DATABASE_URL`の値を`DATABASE_URL`に格納
$ heroku config:set DATABASE_URL='mysql://38faf8fefeaaef:dfefe44@us-cdbr-iron-east-093823.cleardb.net/heroku_8cfefedfgcd6a?reconnect=true'
// mysql://、?reconnect=trueを取り除く。そして、Host部分をtcp()で囲む。また末尾に?parseTime=trueを追加。
$ git push heroku master
```
