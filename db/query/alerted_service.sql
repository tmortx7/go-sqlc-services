--- name: GetAlertedService :one
SELECT * FROM alerted_service
WHERE id = $1 LIMIT 1;

-- name: ListAlertedService :many
SELECT * FROM alerted_service
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateAlertedService :one
INSERT INTO alerted_service (
  action_required_id,
  emergency_service_id
) VALUES (
  $1, $2
) RETURNING *;


-- name: DeleteAlertedService :exec
DELETE FROM alerted_service WHERE id =$1;