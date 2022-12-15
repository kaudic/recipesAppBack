-- Deploy recipesApp:user_table to pg

BEGIN;

CREATE TABLE "user" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "login" TEXT UNIQUE NOT NULL, 
    "password" TEXT NOT NULL, 
    "role" TEXT NOT NULL --admin
);

COMMIT;
