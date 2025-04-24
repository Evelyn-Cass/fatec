<?php
require_once "Pessoa.class.php";
require_once "Telefone.class.php";
require_once "Aluno.class.php";
require_once "Professor.class.php";
require_once "Disciplina.class.php";
require_once "Notas.class.php";
require_once "Pessoa.class.php";


$aluno1 = new Aluno("123", "João Silveira", 14, "9874-5632");
$aluno1->setTelefones(11, "7519-9534");
$aluno2 = new Aluno("124", "Maria Antonia", 11, "3214-5698");

$professor1 = new Professor("Doutor", "Henrique", 14, "6548-7852");
$professor2 = new Professor("Professora", "Jandira", 14, "9512-3578");
$professor2->setTelefones(12,"7412-9632");

$disciplina1 = new Disciplina("Biologia", 80, $professor1, $aluno1);
$disciplina2 = new Disciplina("Português", 79, $professor1, $aluno2);
$disciplina3 = new Disciplina("Inglês", 40, $professor2, $aluno1);
$disciplina4 = new Disciplina("Matemática", 79, $professor2, $aluno2);

$nota1 = new Notas(8.50, $disciplina1);
$nota2 = new Notas(6.90, $disciplina2);
$nota3 = new Notas(10.00, $disciplina3);
$nota4 = new Notas(3.30, $disciplina4);

// echo "<pre>";
// var_dump($nota1);
// echo "</pre>";

echo "
    <main>
    <div>
    <h2> Nota 1 </h2>
    <b>Pontuação: </b>".number_format($nota1->getNota(),'2',',','.')."<br>

    <h3>Disciplina</h3>
    <b>Nome: </b>{$nota1->getDisciplina()->getNome()}<br>
    <b>Carga Horária: </b>{$nota1->getDisciplina()->getCargaHoraria()} horas<br>

    <h3>Aluno</h3>
    <b>Nome: </b>{$nota1->getDisciplina()->getAluno()->getNome()}<br>
    <b>RA: </b>{$nota1->getDisciplina()->getAluno()->getRa()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota1->getDisciplina()->getAluno()->getTelefones());
foreach ($nota1->getDisciplina()->getAluno()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    <h3>Professor</h3>
    <b>Nome: </b>{$nota1->getDisciplina()->getProfessor()->getTitulacao()} {$nota1->getDisciplina()->getProfessor()->getNome()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota1->getDisciplina()->getProfessor()->getTelefones());
foreach ($nota1->getDisciplina()->getProfessor()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    </div>
";


//nota 2

echo "
    <main>
    <div>
    <h2> Nota 2</h2>
    <b>Pontuação: </b> ".number_format($nota2->getNota(),'2',',','.')."<br>

    <h3>Disciplina</h3>
    <b>Nome: </b>{$nota2->getDisciplina()->getNome()}<br>
    <b>Carga Horária: </b>{$nota2->getDisciplina()->getCargaHoraria()} horas<br>

    <h3>Aluno</h3>
    <b>Nome: </b>{$nota2->getDisciplina()->getAluno()->getNome()}<br>
    <b>RA: </b>{$nota2->getDisciplina()->getAluno()->getRa()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota2->getDisciplina()->getAluno()->getTelefones());
foreach ($nota2->getDisciplina()->getAluno()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    <h3>Professor</h3>
    <b>Nome: </b>{$nota2->getDisciplina()->getProfessor()->getTitulacao()} {$nota2->getDisciplina()->getProfessor()->getNome()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota2->getDisciplina()->getProfessor()->getTelefones());
foreach ($nota2->getDisciplina()->getProfessor()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    </div>
";

//nota 3

echo "
    <main>
    <div>
    <h2> Nota 3</h2>
    <b>Pontuação: </b>".number_format($nota3->getNota(),'2',',','.')."<br>

    <h3>Disciplina</h3>
    <b>Nome: </b>{$nota3->getDisciplina()->getNome()}<br>
    <b>Carga Horária: </b>{$nota3->getDisciplina()->getCargaHoraria()} horas<br>

    <h3>Aluno</h3>
    <b>Nome: </b>{$nota3->getDisciplina()->getAluno()->getNome()}<br>
    <b>RA: </b>{$nota3->getDisciplina()->getAluno()->getRa()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota3->getDisciplina()->getAluno()->getTelefones());
foreach ($nota3->getDisciplina()->getAluno()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    <h3>Professor</h3>
    <b>Nome: </b>{$nota3->getDisciplina()->getProfessor()->getTitulacao()} {$nota3->getDisciplina()->getProfessor()->getNome()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota3->getDisciplina()->getProfessor()->getTelefones());
foreach ($nota3->getDisciplina()->getProfessor()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    </div>
";

//nota 4

echo "
    <main>
    <div>
    <h2> Nota 4</h2>
    <b>Pontuação: </b>".number_format($nota1->getNota(),'2',',','.')."<br>

    <h3>Disciplina</h3>
    <b>Nome: </b>{$nota4->getDisciplina()->getNome()}<br>
    <b>Carga Horária: </b>{$nota4->getDisciplina()->getCargaHoraria()} horas<br>

    <h3>Aluno</h3>
    <b>Nome: </b>{$nota4->getDisciplina()->getAluno()->getNome()}<br>
    <b>RA: </b>{$nota4->getDisciplina()->getAluno()->getRa()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota4->getDisciplina()->getAluno()->getTelefones());
foreach ($nota4->getDisciplina()->getAluno()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    <h3>Professor</h3>
    <b>Nome: </b>{$nota4->getDisciplina()->getProfessor()->getTitulacao()} {$nota4->getDisciplina()->getProfessor()->getNome()}<br>
    <b>Telefone(s): </b>
";
$count = 0;
$tamanho = count($nota4->getDisciplina()->getProfessor()->getTelefones());
foreach ($nota4->getDisciplina()->getProfessor()->getTelefones() as $telefone) {
    $count++;
    $texto = "";
    if ($count != $tamanho) {
        $texto = ", ";
    }
    echo "
        ({$telefone->getDdd()}) {$telefone->getTelefone()}$texto
    ";
}
echo "
    <br>
    </div>
";


?>

<style>
    main{
        display: flex;
    }
    div{
        border: 2px solid cadetblue;
        padding: 0 20px 10px 20px;
        margin:5px;
    }
</style>