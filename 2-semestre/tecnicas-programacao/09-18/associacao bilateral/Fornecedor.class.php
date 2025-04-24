<?php
class Fornecedor
{

    public function __construct(
        private string $razaoSocial = "",
        private string $cnpj = "",
        private string $telefone = "",
        private array $produto = array()
    ) {}

    public function getRazaoSocial()
    {
        return $this->razaoSocial;
    }

    public function getCnpj()
    {
        return $this->cnpj;
    }
    public function getTelefone()
    {
        return $this->telefone;
    }
    public function getProduto()
    {
        return $this->produto;
    }

    public function setRazaoSocial(string $razaoSocial)
    {
        $this->razaoSocial = $razaoSocial;
    }
    
    public function setCnpj(string $cnpj)
    {
        $this->cnpj = $cnpj;
    }
    public function setTelefone(string $telefone)
    {
        $this->telefone = $telefone;
    }

    public function setProduto(Produto $produto)
    {
        $this->produto[] = $produto; //descobre o indice do array sozinho
    }

}
