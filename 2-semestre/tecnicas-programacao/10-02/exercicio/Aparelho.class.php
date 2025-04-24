<?php
class Aparelho
{
    public function __construct(
        private string $descritivo = "",
        private array $aluno = array()
    ) {}

    public function getDescritivo(): string
    {
        return $this->descritivo;
    }

    public function setDescritivo(string $descritivo)
    {
        $this->descritivo = $descritivo;
    }

    public function getAluno(): array
    {
        return $this->aluno;
    }

    public function setAluno(Aluno $aluno)
    {
        $this->aluno[] = $aluno;
    }
}
