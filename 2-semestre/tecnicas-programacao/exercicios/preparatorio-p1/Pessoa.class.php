<?php

class Pessoa
{

    public function __construct(
        protected string $nome = ""
    ) {}

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }
}
