postgres:
	docker run --name postgres-ob -e POSTGRES_USER=root -e POSTGRES_PASSWORD=1234 -p 5432:5432 -d postgres 

creatdb:
	docker exec -it postgres-ob createdb --username=root --owner=root only_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:1234@localhost:5432/only_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:1234@localhost:5432/only_bank?sslmode=disable" -verbose down

dropdb:
	docker exec -it postgres-ob dropdb only_bank

.PHONY: postgres creatdb dropdb migrateup migratedown