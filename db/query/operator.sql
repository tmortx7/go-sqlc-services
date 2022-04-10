--- name: GetOperator :one
SELECT * FROM operator
WHERE id = $1 LIMIT 1;

-- name: ListOperator :many
SELECT * FROM operator
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateOperator :one
INSERT INTO operator (
  operator_code,
  operator
) VALUES (
  $1, $2
) RETURNING *;


-- name: DeleteOperator :exec
DELETE FROM operator WHERE id =$1;