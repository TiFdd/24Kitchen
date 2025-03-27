<?php
// submit_rating.php

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

// Recebe os dados do formulário via POST
$user_id = isset($_POST['user_id']) ? intval($_POST['user_id']) : null;
$recipe_id = isset($_POST['recipe_id']) ? intval($_POST['recipe_id']) : null;
$rating = isset($_POST['rating']) ? intval($_POST['rating']) : null;
$likes = isset($_POST['likes']) ? 1 : 0; // Converte o checkbox para 1 (true) ou 0 (false)

// Valida os dados recebidos
if (!$user_id || !$recipe_id || !$rating || $rating < 1 || $rating > 5) {
    // Se os dados forem inválidos, retorna um erro em formato JSON e encerra o script
    echo json_encode([
        'status' => 'error',
        'message' => 'Invalid input data.'
    ]);
    exit;
}

// Prepara a query SQL para inserir a avaliação no banco de dados
$sql = "INSERT INTO Ratings (user_id, recipe_id, rating, likes) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

// Verifica se a preparação da query foi bem-sucedida
if ($stmt === false) {
    // Se a preparação falhar, retorna um erro em formato JSON e encerra o script
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to prepare the SQL statement.'
    ]);
    exit;
}

// Associa os parâmetros à query
$stmt->bind_param('iiii', $user_id, $recipe_id, $rating, $likes);

// Executa a query
if ($stmt->execute()) {
    // Se a execução for bem-sucedida, retorna uma mensagem de sucesso em formato JSON
    echo json_encode([
        'status' => 'success',
        'message' => 'Rating submitted successfully!'
    ]);
} else {
    // Se a execução falhar, retorna um erro em formato JSON
    echo json_encode([
        'status' => 'error',
        'message' => 'Failed to submit rating: ' . $stmt->error
    ]);
}

// Fecha a conexão com o banco de dados
$stmt->close();
$conn->close();
?>