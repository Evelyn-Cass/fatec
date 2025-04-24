<?php

class Autor extends Pessoa
{

    public function __construct(
        private string $nacionalidade = "",
        string $nome = "",
        private array $livros = array()
    ) {
        parent::__construct($nome);
    }

    public function getNacionalidade(): string
    {
        return $this->nacionalidade;
    }

    public function setNacionalidade(string $nacionalidade): void
    {
        $this->nacionalidade = $nacionalidade;
    }

    public function getLivros(): array
    {
        return $this->livros;
    }

    public function setLivros($livro): void
    {
        $this->livros[] = $livro;
    }
}
