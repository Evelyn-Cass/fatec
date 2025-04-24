<?php
class Telefone
{
    public function __construct(
        private int $ddd = 0,
        private string $telefone = "",
        private $pessoa = null
    ) {}

    public function getDdd(): int
    {
        return $this->ddd;
    }

    public function getTelefone(): string
    {
        return $this->telefone;
    }

    public function getPessoa()
    {
        return $this->pessoa;
    }

    public function setDdd(int $ddd): void
    {
        $this->ddd = $ddd;
    }

    public function setTelefone(string $telefone): void
    {
        $this->telefone = $telefone;
    }

    public function setPessoa($pessoa): void
    {
        $this->pessoa = $pessoa;
    }
}
