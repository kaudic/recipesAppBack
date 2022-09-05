-- Deploy recipesApp:detailed_recipe to pg

BEGIN;

CREATE VIEW detailed_recipe AS

SELECT 
recipe.*,
type.name,
json_AGG(jsonb_build_object('id',ingredient.id,'name',ingredient.name, 'qty',recipe_ingredient.qty,'unitId',unit.id,'unitName',unit.name,'unitShortName',unit.short_name)) as ingredients 
FROM "recipe"
LEFT JOIN "type" ON recipe.type_id = type.id
LEFT JOIN "recipe_ingredient" ON recipe.id = recipe_ingredient.recipe_id
LEFT JOIN "ingredient" ON recipe_ingredient.ingredient_id = ingredient.id
LEFT JOIN "unit" ON unit.id = recipe_ingredient.unit_id
GROUP BY recipe.id,type.name;

COMMIT;
