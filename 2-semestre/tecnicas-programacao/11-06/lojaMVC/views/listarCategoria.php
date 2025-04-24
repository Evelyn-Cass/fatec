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

            foreach ($retorno as $dado) {
                echo "<tr>
                <td>
                    $dado->descritivo
                </td>
                <td>
                    <a href='../lojaMVC/alterarCategoria?id={$dado->id_categoria}' class='btn btn-outline-warning'>Editar</a>
                ";

            ?>

                <a href="../lojaMVC/excluirCategoria?id=<?php echo $dado->id_categoria ?>" class="btn btn-outline-danger" onclick="return confirm('Tem certeza que deseja excluir?')">Excluir</a>
                </td>
                </tr>
            <?php
            }
            ?>
        </table>
    </div>
</div>