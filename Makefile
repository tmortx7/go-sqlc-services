DB_URL=postgres://root:root@localhost:5432/c_services?sslmode=disable

postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:14-alpine

mysql:
	docker run --name mysql8 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:8

createdb:
	docker exec -it postgres14 createdb --username=root --owner=root c_services

dropdb:
	docker exec -it postgres14 dropdb c_services

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

server:
	go run main.go

.PHONY: postgres createdb dropdb migrateup migratedown sqlc server