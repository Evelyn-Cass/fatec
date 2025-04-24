<?php

class Publicacoes
{

    public function __construct(
        private string $dataPublicacao = "",
        private string $titulo = "",
        private $editora = null
    ) {}


    public function getDataPublicacao(): string
    {
        return $this->dataPublicacao;
    }

    public function setDataPublicacao(string $dataPublicacao): void
    {
        $this->dataPublicacao = $dataPublicacao;
    }

    public function getTitulo(): string
    {
        return $this->titulo;
    }

    public function setTitulo(string $titulo): void
    {
        $this->$titulo = $titulo;
    }

    public function getEditora()
    {
        return $this->editora;
    }

    public function setEditora($editora): void
    {
        $this->editora = $editora;
    }
}
