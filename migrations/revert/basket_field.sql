-- Revert recipesApp:basket_field from pg

BEGIN;

ALTER TABLE "recipe"
    DROP COLUMN "basket";

COMMIT;
