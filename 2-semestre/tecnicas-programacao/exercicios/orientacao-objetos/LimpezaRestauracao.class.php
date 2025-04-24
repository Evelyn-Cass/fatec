<?php
class LimpezaRestauracao extends Servico
{
    public function __construct(
        private string $materialUsado = "",
        private string $denteTratado = "",
        string $descricao = "",
        float $preco = 0
    ) {
        parent::__construct($descricao, $preco);
    }

    public function getMaterialUsado()
    {
        return $this->materialUsado;
    }
    public function getDenteTratado(){
        return $this->denteTratado;
    }

    public function setMaterialUsado($materialUsado)
    {
        $this->materialUsado = $materialUsado;
    }
    public function setDenteTratado($denteTratado){
        $this->denteTratado = $denteTratado;
    }
}
