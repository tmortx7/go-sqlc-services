--- name: GetAlertService :one
SELECT * FROM alert_service
WHERE id = $1 LIMIT 1;

-- name: ListAlertService :many
SELECT * FROM alert_service
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateAlertService :one
INSERT INTO alert_service (
  action_catalog_id,
  emergency_service_id,
  always_alert
) VALUES (
  $1, $2, $3
) RETURNING *;


-- name: DeleteAlertService :exec
DELETE FROM alert_service WHERE id =$1;