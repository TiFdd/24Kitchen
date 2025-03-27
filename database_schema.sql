-- database_schema.sql
-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS virtual_kitchen;
USE virtual_kitchen;

-- Criando a tabela de contribuidores
CREATE TABLE Contributors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    bio TEXT
);

-- Criando a tabela de receitas
CREATE TABLE Recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    prep_time INT NOT NULL, -- em minutos
    cook_time INT NOT NULL, -- em minutos
    difficulty ENUM('easy', 'medium', 'hard') NOT NULL,
    cuisine_type VARCHAR(50) NOT NULL,
    contributor_id INT,
    FOREIGN KEY (contributor_id) REFERENCES Contributors(id)
);

-- Criando a tabela de ingredientes
CREATE TABLE Ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    unit VARCHAR(20) NOT NULL -- Ex: grams, cups, teaspoons
);

-- Criando a tabela de relacionamento Receita-Ingrediente
CREATE TABLE Recipe_Ingredients (
    recipe_id INT,
    ingredient_id INT,
    quantity FLOAT NOT NULL,
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id)
);

-- Criando a tabela de usuários
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Criando a tabela de avaliações e curtidas
CREATE TABLE Ratings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    recipe_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    likes BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(id)
);

-- Inserindo dados de exemplo
INSERT INTO Contributors (first_name, last_name, email, bio) VALUES
('John', 'Doe', 'john.doe@example.com', 'Professional chef and food lover.'),
('Maria', 'Silva', 'maria.silva@example.com', 'Passionate home cook from Brazil.');

INSERT INTO Recipes (title, description, prep_time, cook_time, difficulty, cuisine_type, contributor_id) VALUES
('Burrito', 'A classic Mexican burrito with beef and beans.', 15, 20, 'medium', 'Mexican', 1),
('Homemade Burger', 'A delicious homemade burger with fresh ingredients.', 10, 15, 'easy', 'American', 1),
('Coxinha de Frango', 'Brazilian chicken croquette, crispy and tasty.', 40, 30, 'hard', 'Brazilian', 2);

INSERT INTO Ingredients (name, unit) VALUES
('Ground Beef', 'grams'),
('Flour Tortilla', 'pieces'),
('Black Beans', 'cups'),
('Cheddar Cheese', 'grams'),
('Lettuce', 'leaves'),
('Chicken Breast', 'grams');

INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
(1, 1, 200),
(1, 2, 2),
(1, 3, 0.5),
(2, 1, 300),
(2, 4, 2),
(3, 6, 250);

INSERT INTO Users (email, password) VALUES
('user1@example.com', 'hashed_password1'),
('user2@example.com', 'hashed_password2');

INSERT INTO Ratings (user_id, recipe_id, rating, likes) VALUES
(1, 1, 5, TRUE),
(2, 2, 4, TRUE),
(1, 3, 5, TRUE);
