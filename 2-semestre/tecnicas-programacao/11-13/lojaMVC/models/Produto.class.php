<?php
class Produto
{
    public function __construct(
        private int $id_produto = 0,
        private string $nome = "",
        private string $descricao = "",
        private float $preco = 0.00,
        private string $imagem = "",
        private string $situacao = "",
        private $categoria = null
    ) {}

    public function getId(): int{
        return  $this->id_produto;
    }
    
    public function getNome(): string{
        return  $this->nome;
    }

    public function getDescricao(): string{
        return  $this->descricao;
    }

    public function getPreco(): float{
        return  $this->preco;
    }
    

    public function getImagem(): string{
        return  $this->imagem;
    }
    
    public function getSituacao(): string{
        return  $this->situacao;
    }

    public function getCategoria(): Categoria{
        return  $this->categoria;
    }
}
