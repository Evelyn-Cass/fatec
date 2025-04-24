<?php
class Professor extends Pessoa
{
    public function __construct(
        private $titulacao = null,
        string $nome = "",
        int $ddd = 0,
        string $telefone = "",
        $pessoa = null,
        private array $alunos = array()
    ) {
        parent::__construct($nome, $ddd, $telefone, $pessoa);
    }

    public function getTitulacao()
    {
        return $this->titulacao;
    }

    public function setTitulacao($titulacao): void
    {
        $this->titulacao = $titulacao;
    }

    public function getAlunos()
    {
        return $this->alunos;
    }

    public function setAlunos($alunos): void
    {
        $this->alunos[] = $alunos;
    }
}
