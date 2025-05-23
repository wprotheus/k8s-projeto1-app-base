<?php
$host = getenv("DB_HOST") ?: "localhost";
$user = "root";
$password = "********";
$database = "meubanco";

$link = new mysqli($host, $user, $password, $database);

// Verifica conexão
if ($link->connect_error) {
    die("Conexão falhou: " . $link->connect_error);
}

$query = "INSERT INTO tabela (coluna1, coluna2) VALUES ('valor1', 'valor2')";

if ($link->query($query) === TRUE) {
    echo "Novo registro criado com sucesso";
} else {
    echo "Erro: " . $link->error;
}

$link->close();
?>
