<?php
require_once "header.php";
?>

<div class="content">
    <div class="container">
        <?php
        if (isset($_GET["msg"])) {
            echo "<div class='alert alert-success' role='alert'>
                    🛈 {$_GET['msg']}
                    </div>";
        }
        ?>
        <h1>Produtos <a href="../lojaMVC/inserirProduto" class="btn btn-success">+</a></h1>


        <table class="table table-striped">
            <tr>
                <th>
                    Nome
                </th>
                <th>
                    Preço
                </th>
                <th>
                    Categoria
                </th>
                <th>
                    Situação
                </th>
                <th>
                    Ações
                </th>
            </tr>
            <?php

            foreach ($retorno as $dado) {
                $preco = number_format($dado->preco, 2, ",", ".");
                echo "<tr>
                <td>
                    $dado->nome
                </td>
                <td>
                    $preco
                </td>
                <td>
                    $dado->descritivo
                </td>
                <td>
                    $dado->situacao
                </td>
                <td>
                    <a href='../lojaMVC/alterarProduto?id={$dado->id_produto}' class='btn btn-outline-warning'>Editar</a>
                ";
                if ($dado->situacao == "Ativa") {
                    //  inativar produto --exclusão lógica
                    echo "<a href='../lojaMVC/alterarSituacao?idProduto={$dado->id_produto}&situacao=Inativa' class='btn btn-outline-danger'>Inativar</a>";
                } else {
                
                    echo "<a href='../lojaMVC/alterarSituacao?idProduto={$dado->id_produto}&situacao=Ativa' class='btn btn-outline-danger'>Ativar</a>";
                }
                echo"
                </td>
                </tr>";
            }
            ?>
        </table>
    </div>
</div>