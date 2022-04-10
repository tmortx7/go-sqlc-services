--- name: GetPhoneNumber :one
SELECT * FROM phone_number
WHERE id = $1 LIMIT 1;

-- name: ListPhoneNumber :many
SELECT * FROM phone_number
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreatePhoneNumber :one
INSERT INTO phone_number (
  phone_number,
  notes
) VALUES (
  $1, $2
) RETURNING *;


-- name: DeletePhoneNumber :exec
DELETE FROM phone_number WHERE id =$1;