<?php

class Pessoa
{

    public function __construct(
        private string $nome = "",
        private string $cpf = "",
        string $logradouro = "",
        string $numero = "",
        string $cep = "",
        $pessoa = null 
    ) {
        $this->endereco[] = new Endereco($logradouro,$numero,$cep,$pessoa);
    }

    public function getNome(): string
    {
        return $this->nome;
    }

    public function getCpf(): string
    {
        return $this->cpf;
    }

    public function getEndereco(): array{
        return $this->endereco;
    }

    public function setNome(string $nome): void
    {   
        $this->nome = $nome;
    }

    public function setCpf(string $cpf): void
    {
        $this->cpf = $cpf;
    }

    public function setEndereco($logradouro,$numero,$cep, $pessoa = null){
        $this->endereco[] = new Endereco($logradouro,$numero,$cep,$pessoa);
    }
}
