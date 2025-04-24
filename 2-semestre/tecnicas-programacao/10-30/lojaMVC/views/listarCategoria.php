<?php
require_once "header.php";
?>

<div class="content">
    <div class="container">
        <h1>Categorias <a href="../lojaMVC/inserirCategoria" class="btn btn-success">+</a></h1>

        
        <table class="table table-striped">
            <tr>
                <th>
                    Descritivo
                </th>
                <th>
                    Ações
                </th>
            </tr>
            <?php

            foreach ($retorno as $categoria) {
                echo "<tr>
                <td>
                    $categoria->descritivo
                </td>
                <td>
                    <a href='' class='btn btn-outline-warning'>Editar</a>
                    <a href='' class='btn btn-outline-danger'>Excluir</a>
                </td>
                ";
            }
            ?>

        </table>
    </div>
</div>