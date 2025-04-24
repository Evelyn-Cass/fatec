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
                $msg = "Preencha o campo descritivo para continuar.";
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

    public function excluir()
    {
        if (isset($_GET["id"])) {
            $categoria = new Categoria($_GET["id"]);
            $categoriaDAO = new CategoriaDAO();
            $retorno = $categoriaDAO->excluir($categoria);
            header("Location:../lojaMVC/categoria?msg=$retorno");
        }
    }

    public function alterar() {
        $msg = "";
        if ($_POST){
            if (empty($_POST["descritivo"])) {
                $msg = "Preencha o campo descritivo para continuar.";
            } else {
                //alterar registro no banco:
                $categoria = new Categoria($_POST["idcategoria"], $_POST["descritivo"]);
                $categoriaDAO = new CategoriaDAO;
                $retorno = $categoriaDAO->alterar($categoria);
                header("Location:../lojaMVC/categoria?msg=$retorno");
            }
        }
        if (isset($_GET["id"])){
            $categoria = new Categoria($_GET["id"]);
            $categoriaDAO = new CategoriaDAO();
            $retorno = $categoriaDAO->pesquisarPorId($categoria);
        }
        require_once "views/editCategoria.php";
    }
}
