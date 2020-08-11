DBNAME:=image_db
DOCKER_DNS:=$(HOST_IP)
export DATABASE_DATASOURCE:=root:password@tcp($(DOCKER_DNS):3306)/$(DBNAME)
migrate/status:
	goose -dir migrations mysql "$(DATABASE_DATASOURCE)" status

migrate/up:
	goose -dir migrations mysql "$(DATABASE_DATASOURCE)" up

__migrate/down:
	goose -dir migrations mysql "$(DATABASE_DATASOURCE)" down


