-- Revert recipesApp:alter_img_name from pg

BEGIN;

ALTER TABLE "recipe" ADD CONSTRAINT recipe_img_name_key UNIQUE ("img_name");

ALTER TABLE "recipe"
    ALTER COLUMN "img_name" DROP DEFAULT;

COMMIT;
