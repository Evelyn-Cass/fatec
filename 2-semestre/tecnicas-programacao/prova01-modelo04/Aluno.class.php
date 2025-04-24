<?php
class Aluno extends Pessoa
{
    public function __construct(
        private string $ra = "",
        string $nome = "",
        int $ddd = 0,
        string $telefone = "",
        $pessoa = null,
        private array $professores = array()
    ) {
        parent::__construct($nome, $ddd, $telefone, $pessoa);
    }

    public function getRa(): string
    {
        return $this->ra;
    }

    public function setRa(string $ra): void
    {
        $this->ra = $ra;
    }

    public function getProfessores()
    {
        return $this->professores;
    }

    public function setProfessores($professores): void
    {
        $this->professores[] = $professores;
    }
}
