-- select_queries.sql
-- Consulta para listar todas as receitas disponíveis
SELECT * FROM Recipes;

-- Consulta para obter os ingredientes de uma receita específica (ex: Burrito)
SELECT i.name, ri.quantity, i.unit 
FROM Recipe_Ingredients ri
JOIN Ingredients i ON ri.ingredient_id = i.id
WHERE ri.recipe_id = (SELECT id FROM Recipes WHERE title = 'Burrito');

-- Consulta para encontrar as receitas mais curtidas
SELECT r.title, COUNT(rt.likes) AS total_likes 
FROM Ratings rt
JOIN Recipes r ON rt.recipe_id = r.id
WHERE rt.likes = TRUE
GROUP BY r.title
ORDER BY total_likes DESC;

-- Consulta para encontrar as receitas mais bem avaliadas
SELECT r.title, AVG(rt.rating) AS avg_rating 
FROM Ratings rt
JOIN Recipes r ON rt.recipe_id = r.id
GROUP BY r.title
ORDER BY avg_rating DESC;

-- Consulta para obter o número total de receitas por tipo de cozinha
SELECT cuisine_type, COUNT(*) AS total_recipes 
FROM Recipes
GROUP BY cuisine_type;

-- Consulta para listar os contribuidores e suas receitas
SELECT c.first_name, c.last_name, r.title 
FROM Contributors c
JOIN Recipes r ON c.id = r.contributor_id;

-- Consulta para listar os usuários que avaliaram receitas
SELECT u.email, r.title, rt.rating, rt.likes 
FROM Ratings rt
JOIN Users u ON rt.user_id = u.id
JOIN Recipes r ON rt.recipe_id = r.id
ORDER BY rt.rating DESC;
