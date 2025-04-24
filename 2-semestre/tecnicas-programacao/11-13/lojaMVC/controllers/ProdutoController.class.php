<?php
class ProdutoController
{
    public function listar()
    {
        $produtoDAO = new ProdutoDAO();
        $retorno = $produtoDAO->listar();

        require_once "views/listarProduto.php";
    }

    public function inserir()
    {
        $msg = array("", "", "", "", "");
        $erro = false;
        if ($_POST) {
            // verificar
            if ($_POST["nome"] == "") {
                $msg[0] = "*Preencha o nome do produto";
                $erro = true;
            }
            if ($_POST["descricao"] == "") {
                $msg[1] = "*Preencha a descrição do produto";
                $erro = true;
            }
            if ($_POST["preco"] == "") {
                $msg[2] = "*Preencha o preço do produto";
                $erro = true;
            }
            if ($_POST["categoria"] == '0') {
                $msg[3] = "*Preencha a categoria do produto";
                $erro = true;
            }
            if ($_FILES["imagem"]["name"] == "") {
                $msg[4] = "*Insira uma imagem para o produto";
                $erro = true;
            } else if ($_FILES["imagem"]["type"] != "image/png" && $_FILES["imagem"]["type"] != "image/jpeg") {
                $msg[4] = "*Apenas arquivos .png ou .jpg são aceitos.";
                $erro = true;
            }
            if (!$erro) {
                $categoria = new Categoria($_POST["categoria"]);
                $produto = new Produto(0,$_POST["nome"],$_POST["descricao"],$_POST["preco"],$_FILES["imagem"]["name"],"Ativa",$categoria); 
                
                $produtoDAO = new ProdutoDAO();
                $retorno = $produtoDAO->inserir($produto);
                header("location:../lojaMVC/produto?msg=$retorno");
                die();

            }
        }

        $categoriaDAO = new CategoriaDAO();
        $retorno = $categoriaDAO->listar();
        require_once "views/formProduto.php";
    }

    public function alterar() {}

    public function alterarSituacao() {}
}
