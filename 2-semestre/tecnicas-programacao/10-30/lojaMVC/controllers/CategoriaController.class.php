<?php
class CategoriaController
{
    public function listar()
    {
        $categoriaDAO = new CategoriaDAO();
        $retorno = $categoriaDAO->listar();
        require_once "views/listarCategoria.php";
    }

    public function inserir()
    {
        $msg = "";
        if ($_POST) {
            if (empty($_POST["descritivo"])) {
                $msg = "Preencha o campo descritivo para continuar";
            } else {

                $categoria = new Categoria(descritivo: $_POST["descritivo"]);

                // Salvar no banco
                $categoriaDAO = new CategoriaDAO();
                $retorno = $categoriaDAO->inserir($categoria);

                header("Location:../lojaMVC/categoria");
            }
        }
        require_once "views/formCategoria.php";
    }
}
