<?php

class Endereco
{

    public function __construct(
        private string $logradouro = "",
        private string $numero = "",
        private string $cep = "",
        private $pessoa = null
    ) {}


    public function getLogradouro(): string
    {
        return $this->logradouro;
    }

    public function getNumero(): string
    {
        return $this->numero;
    }

    public function getCep(): string
    {
        return $this->cep;
    }

    public function getPessoa(): Pessoa
    {
        return $this->pessoa;
    }

    public function setLogradouro(string $cep): void
    {
        $this->cep = $cep;
    }

    public function setNumero(string $numero): void
    {
        $this->numero = $numero;
    }

    public function setCep(string $cep): void
    {
        $this->cep = $cep;
    }

    public function setPessoa(Pessoa $pessoa): void
    {
        $this->pessoa = $pessoa;
    }
}
