<?php

require_once "Produto.class.php";

$produto = new produto();

$connect = $produto->conexao();

$resultado = $produto->consultarProdutos($connect);

if ($_GET) {
    echo "<p class='msg'>{$_GET["msg"]}</p>";
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <br>
    <a href="form_produto.html"> &#x2b; Novo Produto</a>
    <br>
    <h1>Produtos</h1>
    <br>
    <table border=1>
        <thead>
            <tr>
                <th>Nome</th>
                <th>Preço</th>
                <th>Descrição</th>
            </tr>
        </thead>
        <tbody>
            <?php
                foreach ($resultado as $dados) {
                    echo "<tr>
                    <td>{$dados->produto_nome}</td>
                    <td>{$dados->produto_preco}</td>
                    <td>{$dados->produto_descricao}</td>
                    </tr>";
                }
            ?>
        </tbody>
    </table>
    
</body>
</html>