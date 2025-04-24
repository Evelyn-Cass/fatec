<?php
require_once 'produto.class.php';

$produto1 = new Produto("Lápis Preto","Número 2",1000,2.00);
$produto2 = new Produto("Caderno","10 matérias",20,90.00);



// echo "Produto: {$produto->nome}<br>";
// echo "Descrição: {$produto->descricao} \n";

echo "<div>";
echo "Nome: ".$produto1->getNome()."<br>";
echo "Descricão: ".$produto1->getDescricao()."<br>";
echo "Estoque: ".$produto1->getEstoque()."<br>";
echo "Preço: ".$produto1->getPreco()."<br>";
echo "</div>";

$produto1->setNome("Lápis Azul");

echo "<div>";
echo "Nome: {$produto1->getNome()}<br>";
echo "Descricão: ".$produto1->getDescricao()."<br>";
echo "Estoque: ".$produto1->getEstoque()."<br>";
echo "Preço: ".$produto1->getPreco()."<br>";
echo "</div>";

?>

<style>
div{
    border-bottom: 1px solid black; 
    padding: 10px;
    width: 30%;
}
</style>