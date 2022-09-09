-- Deploy recipesApp:alter_img_name to pg

BEGIN;

ALTER TABLE "recipe"
    DROP CONSTRAINT recipe_img_name_key;

ALTER TABLE "recipe"
    ALTER COLUMN "img_name" SET DEFAULT 'noimage.jpg';

COMMIT;
