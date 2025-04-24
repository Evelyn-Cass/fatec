<?php

class Aluno extends Pessoa
{

    public function __construct(
        private string $ra = "",
        string $nome = ""
    ) {
        parent::__construct($nome);
    }

    public function getRa(): string
    {
        return $this->ra;
    }

    public function setRa(string $ra): void
    {
        $this->ra = $ra;
    }
}
