run:
	go run cmd/api/main.go

test:
	go test ./...

log:
	heroku logs -t

ps:
	heroku ps

restart:
	heroku restart

cancel:
	heroku builds:cancel

cleardb:
	heroku addons:open cleardb

docker-compose/up:
	docker-compose up -d

docker-compose/down:
	docker-compose down

api/heroku/health_check:
	curl -v -X GET \
		https://img-database.herokuapp.com/health_check

api/heroku/get:
	curl -v -X GET \
		https://img-database.herokuapp.com/images?primary=flatter

api/local/health_check:
	curl -v -X GET \
		http://localhost:8080/health_check

api/local/get_image:
	curl -v -X GET \
		http://localhost:8080/images?primary=あいさつ

api/local/get_all_image:
	curl -v -X GET \
		http://localhost:8080/all_image

api/local/get_all_charactor:
	curl -v -X GET \
		http://localhost:8080/all_charactor

api/local/get_all_category:
	curl -v -X GET \
		http://localhost:8080/all_genre

api/local/put:
	curl -v -X PUT \
		http://localhost:8080/registe?character=daigo?primary=daigo&secondary=undefined&tertiary=undefined
