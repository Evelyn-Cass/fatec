<?php

class Editora extends Pessoa
{

    public function __construct(
        private string $cnpj = "",
        string $nome = "",
        string $dataPublicacao = "",
        string $titulo = "",
        $editora = null,
        private array $Publicacoes = array()
    ) {
        parent::__construct($nome);
        $this->Publicacoes[] = new Publicacoes($dataPublicacao, $titulo, $editora);
    }

    public function getCnpj(): string
    {
        return $this->cnpj;
    }

    public function setCnpj(string $cnpj): void
    {
        $this->cnpj = $cnpj;
    }

    public function getPublicacoes(): array
    {
        return $this->Publicacoes;
    }

    public function setPublicacoes($dataPublicacao, $titulo, $editora): void
    {
        $this-> Publicacoes[] = new Publicacoes($dataPublicacao, $titulo, $editora);
    }
}
