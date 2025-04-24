<?php
class Receita
{
    public function __construct(
        private int $id_receita = 0,
        private string $nome = "",
        private string $descricao = "",
        private $chef = null

    ) {}
    public function getId_receita(): int
    {
        return $this->id_receita;
    }
    public function getNome(): string
    {
        return $this->nome;
    }
    public function getDescricao(): string
    {
        return $this->descricao;
    }
    public function getChef(): Chef
    {
        return $this->chef;
    }
} //fim da classe
