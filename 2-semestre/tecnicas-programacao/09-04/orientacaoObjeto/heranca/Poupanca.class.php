<?php
class Poupanca extends Conta{
    public function __construct(
        private int $aniversario = 0,
        //Herança - parametros
        string $agencia,
        string $numero,
        string $titular,
        float $saldo
    ){
        parent:: __construct($agencia, $numero, $titular, $saldo);
    }

    public function setAniversario(int $aniversario){
        $this->aniversario = $aniversario;
    }

    public function getAniversario(){
        return $this->aniversario;
    }
}