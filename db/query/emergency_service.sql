--- name: GetEmergencyService :one
SELECT * FROM emergency_service
WHERE id = $1 LIMIT 1;

-- name: ListEmergencyService :many
SELECT * FROM emergency_service
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateEmergencyService :one
INSERT INTO emergency_service (
  service_name,
  contact_detail
) VALUES (
  $1, $2
) RETURNING *;


-- name: DeleteEmergencyService :exec
DELETE FROM emergency_service WHERE id =$1;