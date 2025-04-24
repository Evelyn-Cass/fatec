<?php
class Pessoa
{
    public function __construct(
        protected string $nome = "",
        protected string $cpf = "",
        string $ddd = "",
        string $numero = "",
        $pessoa = null,
        protected array $telefones = array()
    ) {
        $this->telefones[] = new Telefone($ddd, $numero, $pessoa);
    }

    public function getNome(): string
    {
        return $this->nome;
    }

    public function getCpf(): string
    {
        return $this->cpf;
    }

    public function getTelefone(): array
    {
        return $this->telefones;
    }


    public function setNome(string $nome)
    {
        $this->nome = $nome;
    }


    public function setCpf(string $cpf)
    {
        $this->cpf = $cpf;
    }

    public function setTelefone(string $ddd, string $numero, $pessoa)
    {
        $this->telefones[] = new Telefone($ddd, $numero, $pessoa);
    }
}
