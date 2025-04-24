<?php
require_once "Fornecedor.class.php";
require_once "Produto.class.php";

$produto1 = new Produto("Lápis Preto","Número 2",2.98,50);
$produto2 = new Produto("Caderno","10 matérias",19.90,10);
$fornecedor = new Fornecedor("Fornecimento Ltda","123456789","(11) 99999-9999",array($produto1,$produto2));

echo "<pre>";
var_dump($fornecedor);
echo "</pre>";