<?php
class Treino
{
    public function __construct(
        private string $series = "",
        private string $repeticoes = "",
        private $instrutor = null,
        private $aluno = null,
        private $aparelho = null
    ) {}

    public function getSeries(): string
    {
        return $this->series;
    }

    public function getRepeticoes(): string
    {
        return $this->repeticoes;
    }

    public function getInstrutor()
    {
        return $this->instrutor;
    }

    public function getAluno()
    {
        return $this->aluno;
    }

    public function getAparelho()
    {
        return $this->aparelho;
    }

    public function setSeries(string $series)
    {
        $this->series = $series;
    }

    public function setRepeticoes(string $repeticoes)
    {
        $this->repeticoes = $repeticoes;
    }

    public function setInstrutor(Instrutor $instrutor)
    {
        $this->instrutor = $instrutor;
    }

    public function setAluno(Aluno $aluno)
    {
        $this->aluno = $aluno;
    }

    public function Aparelho(Aparelho $aparelho)
    {
        $this->aparelho = $aparelho;
    }
}
