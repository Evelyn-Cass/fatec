<?php
require_once "header.php";
?>

<div class="content">
    <div class="container">
        <form action="../lojaMVC/alterarCategoria" method="POST">
            <br>

            <input type="hidden" name="idcategoria" value="<?php echo $retorno[0]->id_categoria; ?>">

            <div class=" input-group mb-3">
                <span class="input-group-text" id="inputGroup-sizing-default">Descritivo</span>
                <input type="text" name="descritivo" id="descritivo" class="form-control" value="<?php echo $retorno[0]->descritivo; ?>">
                <br>
            </div>



            <div style="color: red;">
                <?php
                echo "$msg";
                ?>
            </div>
            <br>
            <div class="d-grid gap-2 col-6 mx-auto">
                <input type="submit" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>