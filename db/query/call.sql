--- name: GetCall :one
SELECT * FROM call
WHERE id = $1 LIMIT 1;

-- name: ListCall :many
SELECT * FROM call
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateCall :one
INSERT INTO call (
  operator_id,
  phone_number_id,
  city_id,
  notes
) VALUES (
  $1, $2, $3, $4
) RETURNING *;


-- name: DeleteCall :exec
DELETE FROM call WHERE id =$1;