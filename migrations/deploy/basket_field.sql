-- Deploy recipesApp:basket_field to pg

BEGIN;

ALTER TABLE "recipe"
    ADD COLUMN "basket" BOOLEAN DEFAULT false;

COMMIT;
