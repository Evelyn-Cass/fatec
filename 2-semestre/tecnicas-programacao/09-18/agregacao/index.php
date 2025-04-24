<?php
require_once "Categoria.class.php";
require_once "Produto.class.php";

$categoria1 = new Categoria("Informática");

$produto1 = new Produto("Notebook 14\"", "Dell", 3560.20, 8, $categoria1);

$produto2 = new Produto("Notebook 17\"", "Samsung", 5999.99, 5, $categoria1);


$produto3 = new Produto("Caneta", "Bic", 1.99, 100);
$produto4 = new Produto("Lápis", "Faber Castell", 0.99, 100);
$categoria2 = new Categoria("Escritório", array($produto3));
$categoria2->setProduto($produto4);


echo "<div class='corpo'>";
echo "<div class='container'>";
echo "<h2> Produtos </h2>";

echo "<hr>";
echo "<b>Nome:</b> {$produto1->getNome()}<br>";
echo "<b>Descricão:</b> {$produto1->getDescricao()}<br>";
echo "<b>Preço:</b> {$produto1->getPreco()}<br>";
echo "<b>Estoque:</b> {$produto1->getEstoque()}<br>";
echo "<b>Categoria:</b> {$produto1->getCategoria()->getDescritivo()}<br>";
echo "<hr>";

echo "<b>Nome:</b> {$produto2->getNome()}<br>";
echo "<b>Descricão:</b> {$produto2->getDescricao()}<br>";
echo "<b>Preço:</b> {$produto2->getPreco()}<br>";
echo "<b>Estoque:</b> {$produto2->getEstoque()}<br>";
echo "<b>Categoria:</b> {$produto2->getCategoria()->getDescritivo()}<br>";
echo "</div>";

echo "<div class='container'>";
echo "<h2> Categorias </h2><hr>";
echo "<b>Descritivo:</b> {$categoria2->getDescritivo()}<br>";
foreach ($categoria2->getProduto() as $categoria) {
    echo "<hr><b>Nome:</b> {$categoria->getNome()}<br>";
    echo "<b>Descricão:</b> {$categoria->getDescricao()}<br>";
    echo "<b>Preço:</b> {$categoria->getPreco()}<br>";
    echo "<b>Estoque:</b> {$categoria->getEstoque()}<br>";
}
echo "</div></div>";

?>
<style>
    .corpo {
        display: flex;
    }

    .container {
        border: 3px solid cadetblue;
        width: 30%;
        padding: 10px 10;
        border-radius: 10px;
        margin: 10px;
    }
</style>