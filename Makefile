.PHONY: fixtures build up bench down logs ps rebuild

fixtures:
	scripts/fetch-bench-fixtures.sh

build:
	docker compose build

up:
	docker compose up -d mysql webapp

down:
	docker compose down

bench:
	docker compose run --rm bench

logs:
	docker compose logs webapp

ps:
	docker compose ps

rebuild: build up bench
