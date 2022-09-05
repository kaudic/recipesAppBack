-- Revert recipesApp:detailed_recipe from pg

BEGIN;

DROP VIEW detailed_recipe;

COMMIT;
