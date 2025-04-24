<?php
class Disciplina
{
    public function __construct(
        private string $nome = "",
        private $cargaHoraria = null,
        private $professor = null,
        private $aluno = null
    ) {}

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }

    public function getCargaHoraria()
    {
        return $this->cargaHoraria;
    }

    public function setCargaHoraria($cargaHoraria): void
    {
        $this->cargaHoraria = $cargaHoraria;
    }

    public function getAluno()
    {
        return $this->aluno;
    }

    public function setAluno($aluno): void
    {
        $this->aluno = $aluno;
    }

    public function getProfessor()
    {
        return $this->professor;
    }

    public function setProfessor($professor): void
    {
        $this->professor[] = $professor;
    }
}
