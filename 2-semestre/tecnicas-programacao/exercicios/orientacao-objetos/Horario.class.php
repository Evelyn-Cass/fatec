<?php
class Horario
{
    public function __construct(
        private string $data = "",
        private string $hora = ""
    ) {}

    public function getData()
    {
        return $this->data;
    }

    public function getHora(){
        return $this->hora;
    }

    public function setHora($hora){
        $this->hora = $hora;
    }

    public function setData($data){
        $this->data = $data;
    }
}
