<?php

class Livro extends Publicacoes
{

    public function __construct(
        private string $sinopse = "",
        private string $isbn = "",
        private array $autores = array(),
        private array $generos = array(),
        string $dataPublicacao = "",
        string $titulo = "",
        $editora = null
    ) {
        parent::__construct($dataPublicacao, $titulo, $editora);
    }


    public function getSinopse(): string
    {
        return $this->sinopse;
    }

    public function setSinopse(string $sinopse): void
    {
        $this->sinopse = $sinopse;
    }

    public function getIsbn(): string
    {
        return $this->isbn;
    }

    public function setIsbn(string $isbn): void
    {
        $this->$isbn = $isbn;
    }

    public function getAutores(): array
    {
        return $this->autores;
    }

    public function setAutores($autor): void
    {
        $this->autores[] = $autor;
    }

    public function getGeneros(): array
    {
        return $this->generos;
    }

    public function setGeneros($genero): void
    {
        $this->generos[] = $genero;
    }
}
