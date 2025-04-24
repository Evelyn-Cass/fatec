<?php
class Agenda
{
    public function __construct(
        private string $ano = ""
    ) {}

    public function getAno(){
        return $this->ano;
    }

    public function setAno($ano){
        $this->ano = $ano;
    }
}
