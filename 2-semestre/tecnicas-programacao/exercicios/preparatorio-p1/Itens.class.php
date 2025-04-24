<?php

class Itens
{

    public function __construct(
        private string $dataDevolucao = "",
        private $livro = null
    ) {}

    public function getDataDevolucao(): string
    {
        return $this->dataDevolucao;
    }

    public function setDataDevolucao(string $dataDevolucao): void
    {
        $this->dataDevolucao = $dataDevolucao;
    }

    public function getLivro()
    {
        return $this->livro;
    }

    public function setLivro($livro): void
    {
        $this->livro = $livro;
    }
}
