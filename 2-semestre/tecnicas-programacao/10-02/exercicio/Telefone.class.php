<?php
class Telefone
{
    public function __construct(
        private string $ddd = "",
        private string $numero = "",
        private $pessoa = null
    ) {}

    public function getDdd(): string
    {
        return $this->ddd;
    }

    public function getNumero(): string
    {
        return $this->numero;
    }

    public function getPessoa()
    {
        return $this->pessoa;
    }

    public function setDdd(string $ddd)
    {
        $this->ddd = $ddd;
    }

    public function setNumero(string $numero)
    {
        $this->numero = $numero;
    }

    public function setPessoa($pessoa)
    {
        $this->pessoa = $pessoa;
    }

}
