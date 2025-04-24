<?php
class Conta{
    public function __construct(
        protected string $numero = "",
        protected string $agencia = "",
        protected string $titular = "",
        protected float $saldo = 0.00
    ){}

    //GETTERS
    public function getAgencia(){
        return $this->agencia;
    }

    public function getNumero(){    
        return $this->numero;
    }

    public function getTitular(){
        return $this->titular;
    }   

    public function getSaldo(){
        return $this->saldo;
    }

    //SETTERS
    public function setAgencia(string $agencia){
        $this->agencia = $agencia;
    }   

    public function setNumero(string $numero){    
        $this->numero = $numero;
    }

    public function setTitular(string $titular){
        $this->titular = $titular;
    }

    public function setSaldo(float $saldo){
        $this->saldo = $saldo;
    }

    //METODOS
    public function depositar(float $valor){
        $this->saldo += $valor;
    }

    public function sacar($valor){
        $this->saldo -= $valor;
    }
}