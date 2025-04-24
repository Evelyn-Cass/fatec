<?php
class Filme
{
    public function __construct(
        private string $nome = ""
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
