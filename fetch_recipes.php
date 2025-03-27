<?php
// fetch_recipes.php

// Define o cabeçalho para indicar que a resposta será em formato JSON
header('Content-Type: application/json');

// Conexão com o banco de dados MySQL
$conn = new mysqli('localhost', 'root', '', 'virtual_kitchen');

// Verifica se a conexão foi bem-sucedida
if ($conn->connect_error) {
    // Se a conexão falhar, retorna um erro em formato JSON e encerra o script
    die(json_encode([
        'status' => 'error',
        'message' => 'Connection failed: ' . $conn->connect_error
    ]));
}

// Consulta SQL para buscar todas as receitas na tabela "Recipes"
$sql = "SELECT * FROM Recipes";

// Executa a consulta no banco de dados
$result = $conn->query($sql);

// Verifica se a consulta retornou resultados
if ($result->num_rows > 0) {
    // Inicializa um array para armazenar as receitas
    $recipes = [];

    // Itera sobre cada linha do resultado e adiciona ao array de receitas
    while ($row = $result->fetch_assoc()) {
        $recipes[] = $row;
    }

    // Retorna as receitas em formato JSON
    echo json_encode([
        'status' => 'success',
        'data' => $recipes
    ]);
} else {
    // Se não houver receitas, retorna um array vazio em formato JSON
    echo json_encode([
        'status' => 'success',
        'data' => []
    ]);
}

// Fecha a conexão com o banco de dados
$conn->close();
?>