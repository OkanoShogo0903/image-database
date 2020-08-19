DBNAME:=image_db
DOCKER_DNS:=$(HOST_IP)
export DATABASE_DATASOURCE:=root:password@tcp($(DOCKER_DNS):3306)/$(DBNAME)

export GO111MODULE := off
install:
	which goose || GO111MODULE=off go get -u github.com/pressly/goose/cmd/goose

mysql:
	mysql -u root -h localhost --protocol tcp -p $(DBNAME)

migrate/init:
	mysql -u root -h localhost --protocol tcp -e "create database \`$(DBNAME)\`" -p

migrate/status:
	goose -dir db/migrations mysql "$(DATABASE_DATASOURCE)" status

migrate/up:
	goose -dir db/migrations mysql "$(DATABASE_DATASOURCE)" up

__migrate/down:
	goose -dir db/migrations mysql "$(DATABASE_DATASOURCE)" down

init: install docke-compose/up migrate/init migrate/up

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
	docker-compose up

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

api/local/put_registe:
	curl -v -X PUT \
		http://localhost:8080/registe?character=daigo?primary=daigo&secondary=undefined&tertiary=undefined

api/local/put_fav:
	curl -v -X PUT http://localhost:8080/fav -d '{"image_id": 4, "is_fav": true}'
