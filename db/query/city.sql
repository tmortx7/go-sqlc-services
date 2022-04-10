-- name: GetCity :one
SELECT * FROM city
WHERE id = $1 LIMIT 1;

-- name: ListCities :many
SELECT * FROM city
ORDER BY id
LIMIT $1
OFFSET $2;


-- name: CreateCity :one
INSERT INTO city (
  city_name
) VALUES (
  $1
) RETURNING *;

-- name: UpdateCity :one
UPDATE city
SET city_name = $2
WHERE id = $1
RETURNING *;

-- name: DeleteCity :exec
DELETE FROM city WHERE id = $1;