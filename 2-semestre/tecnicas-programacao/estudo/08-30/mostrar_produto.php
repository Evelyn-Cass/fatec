<?php
if ($_GET) {
    require_once("Produto.class.php");

    $obj = new Produto(
        produto_nome: $_GET["produto_nome"],
        produto_descricao: $_GET["produto_descricao"],
        produto_preco: (float) str_replace(",", ".", $_GET["produto_preco"])
    );

    $connect = $obj->conexao();

    $msg = $obj->inserirProduto($connect);

    header("location:index.php?msg=$msg");
    die();
} else {
    header("location:form_produto.html");
    die();
}
