<?php
require_once "Fornecedor.class.php";
require_once "Produto.class.php";

$produto1 = new Produto("Lápis Preto","Número 2",2.98,50);
$produto2 = new Produto("Caderno","10 matérias",39.90,10);
$fornecedor1 = new Fornecedor("Fornecimento Ltda","123456789","(11) 99999-9999",array($produto1,$produto2));
$produto3 = new Produto("Lápis de Colorir","12 unidades",20.20,30);
$fornecedor1->setProduto($produto3);

$fornecedor2 = new Fornecedor("Fazenda Coscia","987654321","(13) 88888-8888");
$fornecedor3 = new Fornecedor("Fazenda Lima","123479845","(41) 77777-7777");

$produto4 = new Produto("Morangos 250g","Morangos frescos",5.98,100,array($fornecedor2));
$produto4->setFornecedor($fornecedor3);

// echo "<pre>";
// var_dump($fornecedor);
// echo "</pre>";

echo "<div class='corpo'><div class='container'><h2>Fornecedor:</h2><hr>";
echo "<b>Razão Social:</b> {$fornecedor1->getRazaoSocial()}<br>";
echo "<b>CNPJ:</b> {$fornecedor1->getCnpj()}<br>";
echo "<b>Telefone:</b> {$fornecedor1->getTelefone()}<br>";
echo "<hr><h3>Produtos:</h3>";
foreach ($fornecedor1->getProduto() as $produto){
    echo "<hr><b>Nome:</b> {$produto->getNome()}<br>";
    echo "<b>Descricão:</b> {$produto->getDescricao()}<br>";
    echo "<b>Preço:</b> R$ ".number_format($produto->getPreco(),'2',',','.')."<br>";
    echo "<b>Estoque:</b> {$produto->getEstoque()}<br>";
}
echo "</div>";

echo "<div class='container'><h2>Produto:</h2><hr>";
echo "<b>Nome:</b> {$produto4->getNome()}<br>";
echo "<b>Descricão:</b> {$produto4->getDescricao()}<br>";
echo "<b>Preço:</b> R$ ".number_format($produto4->getPreco(),'2',',','.')."<br>";
echo "<b>Estoque:</b> {$produto4->getEstoque()}<br>";
echo "<hr><h3>Fornecedores:</h3>";
foreach ($produto4->getFornecedor() as $fornecedor){
    echo "<hr><b>Razão Social:</b> {$fornecedor->getRazaoSocial()}<br>";
    echo "<b>CNPJ:</b> {$fornecedor->getCnpj()}<br>";
    echo "<b>Telefone:</b> {$fornecedor->getTelefone()}<br>";
}
echo '</div></div>';
?>

<style>
    .corpo{
        display: flex;
    }
    .container{
        border: 3px solid cadetblue;
        width: 30%;
        padding: 10px 10;
        border-radius: 10px;
        margin: 10px;
    }
</style>