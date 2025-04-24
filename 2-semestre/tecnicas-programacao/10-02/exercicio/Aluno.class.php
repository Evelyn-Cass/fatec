<?php
class Aluno extends Pessoa
{
    public function __construct(
        private string $restricoes = "",
        private string $dataNascimento = "",
        private array $aparelhos = array(),
        string $nome = "",
        string $cpf = "",
        string $ddd = "",
        string $numero = "",
        $pessoa = null,
    ) {
        parent::__construct($nome,$cpf,$ddd,$numero,$pessoa);
    }

    public function getRestricoes(): string
    {
        return $this->restricoes;
    }

    public function getDataNascimento(): string
    {
        return $this->dataNascimento;
    }

    public function getAparelhos(): array
    {
        return $this->aparelhos;
    }

    public function setRestricoes(string $restricoes)
    {
        $this->restricoes = $restricoes;
    }

    public function setDataNascimento(string $dataNascimento)
    {
        $this->dataNascimento = $dataNascimento;
    }

    public function setAparelhos(Aparelho $aparelho)
    {
        $this->aparelhos[] = $aparelho;
    }
}
