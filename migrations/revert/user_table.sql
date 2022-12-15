-- Revert recipesApp:user_table from pg

BEGIN;

DROP TABLE "user";

COMMIT;
