<?php
class Exame extends Servico
{
    public function __construct(
        private string $medidaPreventiva = "",
        private string $tipoExame = "",
        string $descricao = "",
        float $preco = 0
    ) {
        parent::__construct($descricao, $preco);
    }

    public function getMedidaPreventiva()
    {
        return $this->medidaPreventiva;
    }

    public function setMedidaPreventiva($medidaPreventiva)
    {
        $this->medidaPreventiva = $medidaPreventiva;
    }

    public function getTipoExame()
    {
        return $this->tipoExame;
    }

    public function setTipoExame($tipoExame)
    {
        $this->tipoExame = $tipoExame;
    }
}
