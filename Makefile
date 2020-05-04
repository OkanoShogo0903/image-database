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

api/local/get:
	curl -v -X GET \
		http://localhost:8080/images?primary=flatter

api/local/put:
	curl -v -X PUT \
		http://localhost:8080/registe \
		-H 'content-type: application/json' \
		-d '{ "background": 0, "plant_ids": [0, 3, 6], "creature_ids": [1, 2, 3, 4, 5]}'

