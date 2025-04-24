<?php
session_start();
include('config.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $telefone = $_POST['telefone'];
    $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
    $tipo_id = $_POST['tipo_id'];

    // Inserir no banco de dados
    $sql = "INSERT INTO usuario (nome, email, telefone, senha, tipo_id) VALUES ('$nome', '$email', '$telefone', '$senha', '$tipo_id')";
    
    if ($conn->query($sql) === TRUE) {
        $_SESSION['msg'] = "Registro criado com sucesso!";
        header('location: login.php');
        die();
    } else {
        echo "Erro: " . $sql . "<br>" . $conn->error;
    }
}
?>

<form method="post">
    Nome: <input type="text" name="nome" required><br>
    Email: <input type="email" name="email" required><br>
    Telefone: <input type="text" name="telefone"><br>
    Senha: <input type="password" name="senha" required><br>
    Tipo de Usuário:
    <select name="tipo_id">
        <option value="1">Admin</option>
        <option value="2">Supervisor</option>
        <option value="3">Usuário Comum</option>
    </select><br>
    <input type="submit" value="Registrar">
</form>
