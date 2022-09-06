-- Revert recipesApp:initdb from pg

BEGIN;

DROP TABLE "recipe", "type", "ingredient", "unit","recipe_ingredient" CASCADE;

COMMIT;
