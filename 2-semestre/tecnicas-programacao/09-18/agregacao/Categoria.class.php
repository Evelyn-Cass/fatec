<?php
class Categoria{
    public function __construct(
        private string $descritivo,
        private array $produto = array()
    ){}

    function getDescritivo(){
        return $this->descritivo;
    }

    function getProduto(){
        return $this->produto;
    }

    function setDescritivo(string $descritivo){
        $this->descritivo = $descritivo;
    }

    function setProduto(Produto $produto){
        $this->produto[] = $produto;
    }
}   