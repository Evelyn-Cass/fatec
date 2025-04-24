<?php
require_once "Pessoa.class.php";
require_once "Endereco.class.php";

// Endereço -> Pessoa

$pessoa1 = new Pessoa("Maria Oliveira", "321.456.876-01");
$endereco1 = new Endereco("Rua XV de Novembro", "201", "17801-101", $pessoa1);
$endereco2 = new Endereco("Avenida das Neves", "121", "17801-120", $pessoa1);
// echo "<pre>";
// var_dump($endereco1);
// echo "</pre>";

echo "<div class='container'>";
echo "<h3>Endereço</h3>";
echo "<b>Logradouro:</b> {$endereco1->getLogradouro()}<br>";
echo "<b>Número:</b> {$endereco1->getNumero()}<br>";
echo "<b>CEP:</b> {$endereco1->getCep()}<br>";
echo "<hr>";
echo "<h4>Morador</h4>";
echo "<b>Nome:</b> {$endereco1->getPessoa()->getnome()}<br>";
echo "<b>CPF:</b> {$endereco1->getPessoa()->getCpf()}<br>";
echo "</div>";

// Pessoa -> Endereco

$pessoa2 = new Pessoa("Henrique Zechi", "987.456.123-74", "Rua Aziz Chidid", "55", "17250-010");

$pessoa2->setEndereco("Rua Ramos Pedro", "234", "19875-210");

echo "<div class='container'>";
echo "<h3>Pessoa</h3>";
echo "<b>Nome:</b> {$pessoa2->getNome()}<br>";
echo "<b>CPF:</b> {$pessoa2->getCpf()}<br>";
echo "<hr>";
echo "<h4>Endereços</h4>";
foreach ($pessoa2->getEndereco() as $endereco) {
    echo "<b>Logradouro:</b> {$endereco->getlogradouro()}<br>";
    echo "<b>Número:</b> {$endereco->getNumero()}<br>";
    echo "<b>CEP:</b> {$endereco->getCep()}<br>";
    echo "<br>";
}
echo "</div>";


?>

<style>
    * {
        margin: 0 0 0 10px;
        padding: 0;
    }

    .container {
        width: 30%;
        border: 2px solid cadetblue;
        border-radius: 10px;
        padding-bottom: 10px;
        margin-top: 10px;
    }

    h3,
    h4,
    hr {
        margin: 10px;
        text-transform: capitalize;
    }
</style>