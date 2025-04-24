<?php
require_once "Pessoa.class.php";
require_once "Aluno.class.php";
require_once "Autor.class.php";
require_once "Editora.class.php";
require_once "Publicacoes.class.php";
require_once "Livro.class.php";
require_once "Revista.class.php";
require_once "Genero.class.php";
require_once "Emprestimo.class.php";
require_once "Itens.class.php";

$aluno = new Aluno("123456789", "Evelyn");
$autor1 = new Autor("Brasileiro", "Henrique");
$autor2 = new Autor("Brasileira", "Vânia");
$editora = new Editora("9875-89", "Rocco");

$genero1 = new Genero("Programação Orientada a Objetos");
$genero2 = new Genero("Tecnologia da Informação");

$livro1 = new Livro("Novos Padrões em PHP", "978-3-16-148410-0", array($autor1, $autor2), array($genero2), "05/05/1994", "PHP 5.4.14", $editora);

$livro2 = new Livro("Orientação a Objetos em PHP", "978-3-16-897410-3", array($autor2), array($genero1, $genero2), "15/12/2024", "PHP 8.3 POO", $editora);

$revista = new Revista("5.5", "975-857-859", "07/10/2024", "Revista do Joven Programador", $editora);

$emprestimo = new Emprestimo("10/10/2024", $aluno, "20/10/2024", $livro1);

$emprestimo->setItens("10/10/2024", $livro2);

echo "
    <main>
    <h2>Emprestimo</h2>
    <b>Aluno:</b> {$emprestimo->getAluno()->getNome()}<br>
    <b>RA:</b> {$emprestimo->getAluno()->getRA()}<br>
    <b>Data de emprestimo:</b> {$emprestimo->getDataEmprestimo()}<br>
    
    <b>Itens:</b><br>
    <hr>
    ";

foreach ($emprestimo->getItens() as $item) {
    echo "
        <b>Livro:</b> {$item->getLivro()->getTitulo()}<br>
        <b>Data Devolução:</b> {$item->getDataDevolucao()}<br>
        <b>Sinopse:</b> {$item->getLivro()->getSinopse()}<br>
        <b>Data de Publicação:</b> {$item->getLivro()->getDataPublicacao()}<br>
        <b>ISBN:</b> {$item->getLivro()->getIsbn()}<br>
        <b>Editora:</b> {$item->getLivro()->getEditora()->getNome()} ({$item->getLivro()->getEditora()->getCnpj()})<br>
        <b>Gênero(s): </b>
    ";

    $qtd = count($item->getLivro()->getGeneros());
    $i = 0;
    foreach ($item->getLivro()->getGeneros() as $genero) {
        $i++;
        echo "{$genero->getDescritivo()}";
        if ($i < $qtd) {
            echo ", ";
        }
        else {
            echo ".<br>";
        }
    }
    
    echo "<b>Autor(s): </b>";
    $qtd = count($item->getLivro()->getAutores());
    $i = 0;
    foreach ($item->getLivro()->getAutores() as $autor) {
        $i++;
        echo "{$autor->getNome()}";
        if ($i < $qtd) {
            echo ", ";
        }
        else {
            echo ".<br>";
        }
    }
    echo "<hr>";
}


?>

<style>
</style>