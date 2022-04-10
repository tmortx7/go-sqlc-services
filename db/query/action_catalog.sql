--- name: GetActionCatalog :one
SELECT * FROM action_catalog
WHERE id = $1 LIMIT 1;

-- name: ListActionCatalog :many
SELECT * FROM action_catalog
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: CreateActionCatalog :one
INSERT INTO action_catalog (
  action_name
) VALUES (
  $1
) RETURNING *;

-- name: UpdateActionCatalog :one
UPDATE action_catalog
SET action_name = $2
WHERE id = $1
RETURNING *;

-- name: DeleteActionCatalog :exec
DELETE FROM action_catalog WHERE id =$1;