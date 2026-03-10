up:
	docker compose up -d --build --wait

down:
	docker compose down

logs:
	docker compose logs -f

sh:
	docker compose exec firebase sh
