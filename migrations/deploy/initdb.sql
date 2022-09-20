-- Deploy recipesApp:initdb to pg

BEGIN;

CREATE TABLE "type" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL --Froid,Chaud,Dessert
);

INSERT INTO "type" ("name") VALUES ('POISSON'),('VIANDE'),('VEGAN');

CREATE TABLE "recipe" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "title" TEXT UNIQUE NOT NULL,
    "reference" TEXT, -- reference to the source recipe (from book, from internet ...)
    "img_name" TEXT UNIQUE NOT NULL,
    "text" TEXT, -- how to cook the recipe, not required
    "meal_qty" REAL NOT NULL,
    "cooking_time" INTERVAL NOT NULL, -- length of time HH:MM:SS
    "preparation_time" INTERVAL NOT NULL, -- length of time HH:MM:SS
    "type_id" INT NOT NULL REFERENCES "type" ("id")
);

INSERT INTO "recipe" ("title","reference","img_name","meal_qty","cooking_time","preparation_time", "type_id","text") VALUES 
('Shrimp and Chorizo Paella','Livre Cyril Lignac ...','paella.jpg',2,'0:25','0:10',2,
'Heat 1/2 cup of the broth in a pot until simmering, add saffron and set aside for 10 minutes.
Heat oil in a (14- to 16-inch) paella pan or a large, deep skillet over medium-high heat. Add chicken, shrimp and chorizo, and cook, stirring occasionally until lightly browned, 6 to 8 minutes. Transfer shrimp to a
Add rice and stir very gently to distribute. Top with artichokes and peppers. (Discard any mussels that do not open.)'),
('Galettes de poireaux','Marmitton:  https://www.marmiton.org/recettes/recette_galettes-de-poireaux_29838.aspx','poireaux.jpg',4,'0:10','0:10',2,
'Laver et hacher les poireaux finement.
Faire une pâte à crêpe avec les oeufs, 1 cuillère soupe d''huile, sel, poivre, la farine, le lait et un peu de muscade.
Ajouter les poireaux et mélanger, rajouter du lait si nécessaire.
Faire cuire des petites crêpes de 5 mm dépaisseur dans une poêle chaude huilée, environ 5 min par face à feu doux.
Servir avec une vinaigrette, une sauce au fromage blanc ou de la sauce soja.');

CREATE TABLE "unit" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "short_name" TEXT UNIQUE NOT NULL, --UN,CS,CC,L ...
    "name" TEXT UNIQUE NOT NULL --Unité,Litre,Cuillère à soupe ...
);

INSERT INTO "unit" ("short_name","name") VALUES 
('UN','Unité'),('L','Litre'),('CS','Cuillère à soupe'),('CC','Cuillère à café'),('Kg','Kilos'),('CL','Centilitre');

CREATE TABLE "ingredient" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "name" TEXT UNIQUE NOT NULL, --Oeuf, Salade, Poulet ...
    "main_unit_id" INT NOT NULL REFERENCES "unit" ("id")
);

INSERT INTO "ingredient" ("name","main_unit_id") VALUES 
('Crevette',1),('Tomate',1),('Riz',5),('Chorizo',1),('Poireau',1),('Farine',3),('Huile',3),('Lait',6),('Oeuf',1);

CREATE TABLE "recipe_ingredient" (
    "id" INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "recipe_id" INT NOT NULL REFERENCES "recipe" ("id") ON DELETE CASCADE,
    "ingredient_id" INT NOT NULL REFERENCES "ingredient" ("id"),
    "qty" REAL NOT NULL,
    "unit_id" INT NOT NULL REFERENCES "unit" ("id")
);

INSERT INTO "recipe_ingredient" ("recipe_id","ingredient_id","qty","unit_id") VALUES 
(1,1,20,1),(1,2,6,1),(1,3,1,5),(1,4,1,1),
(2,5,4,1),(2,6,6,3),(2,7,3,3),(2,8,20,6),(2,9,2,1);

COMMIT;
