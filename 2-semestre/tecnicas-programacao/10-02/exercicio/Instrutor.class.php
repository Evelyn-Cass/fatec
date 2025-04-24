<?php
class Instrutor extends Pessoa
{
    public function __construct(
        private string $especialidade = "",
        string $nome = "",
        string $cpf = "",
        string $ddd = "",
        string $numero = "",
        $pessoa = null
    ) {
        parent::__construct($nome, $cpf, $ddd, $numero, $pessoa);
    }

    public function getEspecialidade(): string
    {
        return $this->especialidade;
    }

    public function setEspecialidade(string $especialidade)
    {
        $this->especialidade = $especialidade;
    }
}
