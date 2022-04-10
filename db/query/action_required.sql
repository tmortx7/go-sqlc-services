--- name: GetActionRequired :one
SELECT * FROM action_required
WHERE id = $1 LIMIT 1;

-- name: ListActionRequired :many
SELECT * FROM action_required
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateActionRequired :one
INSERT INTO action_required (
  notes,
  call_id,
  action_catalog_id
) VALUES (
  $1, $2, $3
) RETURNING *;


-- name: DeleteActionRequired :exec
DELETE FROM action_required WHERE id =$1;