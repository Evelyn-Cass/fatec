<?php
class Chef
{
    public function __construct(
        private int $id_chefe = 0,
        private string $nome = "",
        private string $especialidades = ""
    ) {}
    public function getId_chefe(): int
    {
        return $this->id_chefe;
    }
    public function getNome(): string
    {
        return $this->nome;
    }
    public function getEspecialidades(): string
    {
        return $this->especialidades;
    }
} //fim da classe
