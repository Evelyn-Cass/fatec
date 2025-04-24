<?php
require_once "Pessoa.class.php";
require_once "Aluno.class.php";
require_once "Aparelho.class.php";
require_once "Instrutor.class.php";
require_once "Telefone.class.php";
require_once "Treino.class.php";

$aparelho = new Aparelho("Esteira Elétrica");

$aluno = new Aluno("Hérnia de Disco", "05/09/1980", array($aparelho), "Renan Silveira", "387-985-961-01", "11", "1111-1111");
$aluno->setTelefone("14", "1212-1212", null);

$instrutor = new Instrutor("Educação Física", "Ricardo Oliveira", "123-456-789-85", "14", "4123-7896");
$instrutor->setTelefone("11", "4567-9852", null);


$treino = new Treino("1", "2", $instrutor, $aluno, $aparelho);

echo "
    <main>
        <div class='container'>
            <h2>Treino</h2>
            <div class='grid'>
                <b>Aparelho: </b>{$treino->getAparelho()->getDescritivo()}<br>
                <b>Séries: </b>{$treino->getSeries()}<br>
                <b>Repetições: </b>{$treino->getRepeticoes()}<br>
            </div>
            <hr>
            <h3>Instrutor</h3>
            <div class='grid'>   
                <b>Nome: </b>{$treino->getInstrutor()->getNome()}<br>
                <b>CPF: </b>{$treino->getInstrutor()->getCpf()}<br>
            ";

foreach ($treino->getInstrutor()->getTelefone() as $telefone) {
    echo "
        <b>Telefone:</b> ({$telefone->getDdd()}) {$telefone->getNumero()}<br>
    ";
}

echo "
    </div>
    <hr>
    <h3>Aluno</h3>
    <div class='grid'>
        <b>Nome: </b>{$treino->getAluno()->getNome()}<br>
        <b>Nascimento: </b>{$treino->getAluno()->getDataNascimento()}<br>
        <b>CPF: </b>{$treino->getAluno()->getCpf()}<br>
        <b>Restrições: </b>{$treino->getAluno()->getRestricoes()}<br>
";
foreach ($treino->getAluno()->getTelefone() as $telefone) {
    echo "
        <b>Telefone:</b> ({$telefone->getDdd()}) {$telefone->getNumero()}<br>
    ";
}


echo "
    </div>
    </div>
";

echo "
    </main>
";

?>

<style>
    * {
        margin: 0;
        padding: 0;
        font-family: 'Times New Roman', Times, serif;
    }

    main {
        display: flex;
        justify-content: center;
    }

    .container {
        border: 3px solid cadetblue;
        padding: 10px 20px;
        margin: 10px;
    }

    h1,
    h2,
    h3,
    h4,
    hr {
        margin: 10px 0;
        text-align: center;
    }
    .grid{
        display: grid;
        grid-template-columns: auto auto;
    }

    b{
        text-align: right;
        padding: 0 5px;
    }
</style>