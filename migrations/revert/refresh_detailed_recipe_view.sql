-- Revert recipesApp:refresh_detailed_recipe_view from pg

BEGIN;

DROP VIEW detailed_recipe;

CREATE VIEW detailed_recipe AS

 SELECT recipe.id,
    recipe.title,
    recipe.reference,
    recipe.img_name,
    recipe.text,
    recipe.meal_qty,
    recipe.cooking_time,
    recipe.preparation_time,
    recipe.type_id,
    type.name,
    json_agg(jsonb_build_object('id', ingredient.id, 'name', ingredient.name, 'qty', recipe_ingredient.qty, 'unitId', unit.id, 'unitName', unit.name, 'unitShortName', unit.short_name)) AS ingredients
   FROM recipe
     LEFT JOIN type ON recipe.type_id = type.id
     LEFT JOIN recipe_ingredient ON recipe.id = recipe_ingredient.recipe_id
     LEFT JOIN ingredient ON recipe_ingredient.ingredient_id = ingredient.id
     LEFT JOIN unit ON unit.id = recipe_ingredient.unit_id
  GROUP BY recipe.id, type.name;

COMMIT;
