<?php
class Produto
{

    public function __construct(
        private string $nome = "",
        private string $descricao = "",
        private int $estoque = 0,
        private float $preco = 0.00
    ) {}

    // Métodos GETTERS E SETTERS

    public function getNome()
    {
        return $this->nome;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function getDescricao()
    {
        return $this->descricao;
    }

    public function setDescricao($descricao)
    {
        $this->descricao = $descricao;
    }

    public function getEstoque()
    {
        return $this->estoque;
    }

    public function setEstoque($estoque)
    {
        $this->estoque = $estoque;
    }

    public function getPreco()
    {
        return number_format($this->preco, 2, '.', ',');
    }

    public function setPreco($preco)
    {
        $this->preco = $preco;
    }
} //Fim Produto