<?php
require_once "Ator.class.php";
require_once "Filme.class.php";
require_once "Papel.class.php";

$ator = new Ator("Luana Gomes");
$filme = new Filme("Deu a Louca nos Gatos");

$papel = new Papel("Louca dos Gatos",$filme,$ator);

// echo "<pre>";
// var_dump($papel);
// echo "</pre>";

echo "
    <div class='container'>
    <b>Nome do Papel:</b> {$papel->getNome()}<br>
    <b>Nome do Ator:</b> {$papel->getAtor()->getNome()}<br>
    <b>Nome do Filme:</b> {$papel->getFilme()->getNome()}<br>
    </div>
";

?>
<style>
    .container{
        width: 23%;
        display: grid;
        grid-template-columns: auto auto;
        border: 3px solid cadetblue;
        border-radius: 10px;
        padding: 10px;
    }
    b{
        text-align: right;
        margin: 0 10px 0 0;
    }
</style>