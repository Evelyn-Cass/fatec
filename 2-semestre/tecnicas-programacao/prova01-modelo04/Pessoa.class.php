<?php
class Pessoa
{
    public function __construct(
        protected string $nome = "",
        int $ddd = 0,
        string $telefone = "",
        $pessoa = null
    ) {
        $this->telefones[] = new Telefone($ddd, $telefone, $pessoa);
    }

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }

    public function getTelefones()
    {
        return $this->telefones;
    }

    public function setTelefones($ddd = "", $telefone = "", $pessoa = null): void
    {
        $this->telefones[] = new Telefone($ddd, $telefone, $pessoa);
    }
}
