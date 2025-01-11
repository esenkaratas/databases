CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Ingredients (
    ingredient_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Recipes (
    recipe_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    is_vegetarian BOOLEAN,
    is_vegan BOOLEAN
);

CREATE TABLE RecipeCategories (
    recipe_id INT REFERENCES Recipes(recipe_id),
    category_id INT REFERENCES Categories(category_id),
    PRIMARY KEY (recipe_id, category_id)
);

CREATE TABLE RecipeIngredients (
    recipe_id INT REFERENCES Recipes(recipe_id),
    ingredient_id INT REFERENCES Ingredients(ingredient_id),
    quantity VARCHAR(100),
    PRIMARY KEY (recipe_id, ingredient_id)
);

CREATE TABLE RecipeSteps (
    step_id SERIAL PRIMARY KEY,
    recipe_id INT REFERENCES Recipes(recipe_id),
    step_order INT NOT NULL,
    description TEXT NOT NULL,
    UNIQUE (recipe_id, step_order)
);


INSERT INTO Categories (name) VALUES 
('Cake'), ('No-Bake'), ('Vegetarian'), ('Vegan'), ('Gluten-Free'), ('Japanese');


INSERT INTO Ingredients (name) VALUES 
('Condensed milk'), ('Cream Cheese'), ('Lemon Juice'), ('Pie Crust'), 
('Cherry Jam'), ('Brussels Sprouts'), ('Sesame seeds'), 
('Macaroni'), ('Butter'), ('Flour'), ('Shredded Cheddar cheese'), 
('Eggs'), ('Soy sauce'), ('Sugar'), ('Olive oil');


INSERT INTO Recipes (name, description, is_vegetarian, is_vegan) VALUES 
('No-Bake Cheesecake', 'Delicious no-bake cheesecake', TRUE, FALSE),
('Roasted Brussels Sprouts', 'Oven-roasted vegan brussels sprouts', FALSE, TRUE),
('Mac & Cheese', 'Classic vegetarian macaroni and cheese', TRUE, FALSE),
('Tamagoyaki Japanese Omelette', 'Japanese omelette with soy sauce and sugar', TRUE, FALSE);


INSERT INTO RecipeCategories (recipe_id, category_id) VALUES 
(1, 1), (1, 2), (1, 3),  
(2, 4), (2, 5),         
(3, 3),                  
(4, 3), (4, 6);          


INSERT INTO RecipeSteps (recipe_id, step_order, description) VALUES 
(1, 1, 'Beat Cream Cheese'),
(1, 2, 'Add condensed Milk and blend'),
(1, 3, 'Add Lemon Juice and blend'),
(1, 4, 'Add the mix to the pie crust'),
(1, 5, 'Spread the Cherry Jam'),
(1, 6, 'Place in refrigerator for 3 hours'),

(2, 1, 'Preheat the oven'),
(2, 2, 'Mix the ingredients in a bowl'),
(2, 3, 'Spread the mix on baking sheet'),
(2, 4, 'Bake for 30 minutes'),

(3, 1, 'Cook Macaroni for 8 minutes'),
(3, 2, 'Melt butter in a saucepan'),
(3, 3, 'Add flour, salt, pepper and mix'),
(3, 4, 'Add Milk and mix until smooth'),
(3, 5, 'Add cheddar cheese and stir until melted'),
(3, 6, 'Mix macaroni into the sauce'),

(4, 1, 'Beat the eggs'),
(4, 2, 'Add soy sauce, sugar, and salt'),
(4, 3, 'Heat oil in a saucepan'),
(4, 4, 'Add some egg mixture and cook for 1 minute'),
(4, 5, 'Fold the cooked eggs into layers and repeat process');


SELECT * FROM Recipes;


SELECT r.name FROM Recipes r
JOIN RecipeCategories rc ON r.recipe_id = rc.recipe_id
JOIN Categories c ON rc.category_id = c.category_id
WHERE c.name = 'Vegetarian';


SELECT DISTINCT r.name FROM Recipes r
JOIN RecipeIngredients ri ON r.recipe_id = ri.recipe_id
JOIN Ingredients i ON ri.ingredient_id = i.ingredient_id
WHERE i.name = 'Potatoes' AND r.is_vegetarian = TRUE;


SELECT r.name FROM Recipes r
JOIN RecipeCategories rc ON r.recipe_id = rc.recipe_id
JOIN Categories c ON rc.category_id = c.category_id
WHERE c.name = 'Cake' AND c.name = 'No-Bake';


SELECT r.name FROM Recipes r
JOIN RecipeCategories rc ON r.recipe_id = rc.recipe_id
JOIN Categories c ON rc.category_id = c.category_id
WHERE r.is_vegan = TRUE OR c.name = 'Japanese';
