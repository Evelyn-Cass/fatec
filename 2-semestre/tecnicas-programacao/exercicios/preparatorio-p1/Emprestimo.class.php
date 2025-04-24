<?php

class Emprestimo
{

    public function __construct(
        private string $dataEmprestimo = "",
        private $aluno = null,
        string $dataDevolucao = "",
        $livro = null,
        private array $itens = array()
    ) {
        $this->itens[] = new Itens($dataDevolucao, $livro);
    }

    public function getDataEmprestimo(): string
    {
        return $this->dataEmprestimo;
    }

    public function setDataEmprestimo(string $dataEmprestimo): void
    {
        $this->dataEmprestimo = $dataEmprestimo;
    }

    public function getAluno()
    {
        return $this->aluno;
    }

    public function setAluno($aluno): void
    {
        $this->$aluno = $aluno;
    }

    public function getItens()
    {
        return $this->itens;
    }

    public function setItens($dataDevolucao, $livro): void
    {
        $this->itens[] = new Itens($dataDevolucao, $livro);
    }

}
