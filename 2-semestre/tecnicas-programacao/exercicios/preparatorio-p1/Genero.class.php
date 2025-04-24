<?php

class Genero
{

    public function __construct(
        private string $descritivo = ""
    ) {}


    public function getDescritivo(): string
    {
        return $this->descritivo;
    }

    public function setDescritivo(string $descritivo): void
    {
        $this->descritivo = $descritivo;
    }

}
