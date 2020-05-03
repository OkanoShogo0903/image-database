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


