<?php
class Notas
{
    public function __construct(
        private float $nota = 0.0,
        private $disciplina = null
    ) {}

    public function getNota(): float {
        return $this->nota;
    }

    public function setNota($nota): void{
        $this->nota = $nota;
    }

    public function getDisciplina()
    {
        return $this->disciplina;
    }

    public function setDisciplina($disciplina): void
    {
        $this->disciplina = $disciplina;
    }
}
