export GO111MODULE := off

DBNAME:=image_db
DATASOURCE:=root:password@tcp(127.0.0.1:3306)/$(DBNAME)

install:
	which goose || GO111MODULE=off go get -u github.com/pressly/goose/cmd/goose

mysql:
	mysql -u root -h localhost --protocol tcp -p $(DBNAME)

migrate/init:
	mysql -u root -h localhost --protocol tcp -e "create database \`$(DBNAME)\`" -p

migrate/status:
	@goose -dir migrations mysql "$(DATASOURCE)" status

migrate/up:
	@goose -dir migrations mysql "$(DATASOURCE)" up

__migrate/down:
	@goose -dir migrations mysql "$(DATASOURCE)" down

docke-compose/up:
	docker-compose up -d

docker-compose/down:
	docker-compose down

init: install docke-compose/up migrate/init migrate/up
