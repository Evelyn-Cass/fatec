<?php
require_once "Cliente.class.php";

$cliente = new Cliente();

$connect = $cliente->conexao();

$resultado = $cliente->buscar_todos_clientes($connect);

// echo "<pre>";
// var_dump($resultado);
// echo "</pre>";

if ($_GET) {
    echo "<p class='msg'>{$_GET["msg"]}!</p>";
}
?>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <title>Lista de Clientes</title>
    <link rel="stylesheet" href="assets/styles/styleIndex.css">
</head>

<body>
    <a href="form_cliente.html">&#x2b; Novo Cliente</a>
    <h1>Lista de Clientes</h1>

    <br>
    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($resultado as $dado) {
                echo "<tr>
                    <td>{$dado->cliente_nome} {$dado->cliente_sobrenome}</td>
                    <td>{$dado->cliente_cpf}</td>
                    </tr>";
            }
            ?>
        </tbody>
    </table>
</body>


</html>