
SELECT r.Name 
FROM Recipes r
JOIN Recipe_Ingredients ri ON r.RecipeID = ri.RecipeID
JOIN Ingredients i ON ri.IngredientID = i.IngredientID
JOIN Recipe_Categories rc ON r.RecipeID = rc.RecipeID
JOIN Categories c ON rc.CategoryID = c.CategoryID
WHERE i.Name LIKE '%potato%'
AND c.Name = 'Vegetarian';

SELECT r.Name 
FROM Recipes r
JOIN Recipe_Categories rc ON r.RecipeID = rc.RecipeID
JOIN Categories c ON rc.CategoryID = c.CategoryID
WHERE c.Name = 'No-Bake'
AND c.Name = 'Cake';

SELECT r.Name 
FROM Recipes r
JOIN Recipe_Categories rc ON r.RecipeID = rc.RecipeID
JOIN Categories c ON rc.CategoryID = c.CategoryID
WHERE c.Name = 'Vegan' 
AND c.Name = 'Japanese';
