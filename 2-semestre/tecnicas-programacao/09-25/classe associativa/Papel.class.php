<?php
class Papel
{
    public function __construct(
        private string $nome = "",
        private $filme = null,
        private $ator = null
    ) {}

    public function getNome(): string
    {
        return $this->nome;
    }

    public function getFilme()
    {
        return $this->filme;
    }

    public function getAtor()
    {
        return $this->ator;
    }


    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }

    public function setFilme($filme): void
    {
        $this->filme = $filme;
    }
    public function setAtor($ator): void
    {
        $this->ator = $ator;
    }
}
