<?php

class Revista extends Publicacoes
{

    public function __construct(
        private string $numero = "",
        private string $issn = "",
        string $dataPublicacao = "",
        string $titulo = "",
        $editora = null
    ) {
        parent::__construct($dataPublicacao, $titulo, $editora);
    }


    public function getNumero(): string
    {
        return $this->numero;
    }

    public function setNumero(string $numero): void
    {
        $this->numero = $numero;
    }

    public function getIssn(): string
    {
        return $this->issn;
    }

    public function setIssn(string $issn): void
    {
        $this->$issn = $issn;
    }
}
