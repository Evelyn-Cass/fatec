<?php
require_once "header.php";
?>

<div class="content">
    <div class="container">
        <form action="../lojaMVC/inserirProduto" method="POST" enctype="multipart/form-data">
            <br>
            <h1 style="text-align: center;">Cadastrar Produto</h1>
            <br>
            <div class="input-group mb-3" style="margin-bottom:0 !important; margin-top: 10px;">
                <span class="input-group-text" id="inputGroup-sizing-default" style="width: 142px;display:flex;align-items:center;justify-content:center;">Nome</span>
                <input type="text" name="nome" id="nome" class="form-control">
                <br>
            </div>
            <div style="color:red;font-size:11px;"><?php echo $msg[0] ?></div>

            <div class="input-group mb-3" style="margin-bottom:0 !important; margin-top: 10px;">
                <span class="input-group-text" id="inputGroup-sizing-default" style="width: 142px;display:flex;align-items:center;justify-content:center;">Descricao</span>
                <textarea class="form-control" id="descricao" name="descricao" rows="3" style="resize: none;"></textarea>
                <br>
            </div>
            <div style="color:red;font-size:11px;"><?php echo $msg[1] ?></div>

            <div class="input-group mb-3" style="margin-bottom:0 !important; margin-top: 10px;">
                <span class="input-group-text" id="inputGroup-sizing-default" style="width: 142px;display:flex;align-items:center;justify-content:center;">Preço</span>
                <input type="number" step="0.01" name="preco" id="preco" class="form-control">
            </div>
                <div style="color:red;font-size:11px;"><?php echo $msg[2] ?></div>

            
                <div class="input-group mb-3" style="margin-bottom:0 !important; margin-top: 10px;">
                <label class="input-group-text" for="inputGroupSelect01" style="width: 142px;display:flex;align-items:center;justify-content:center;">Categoria</label>
                <select class="form-select" id="inputGroupSelect01" name='categoria'>
                    <option value="0">Escolha uma categoria</option>
                    <?php
                    foreach ($retorno as $dado) {
                        echo "
                                <option value='{$dado->id_categoria}'>
                                    {$dado->descritivo}
                                </option>
                            ";
                    }
                    ?>
                </select>
                <br>
            </div>
            <div style="color:red;font-size:11px;"><?php echo $msg[3] ?></div>

            <div class="input-group mb-3" style="margin-bottom:0 !important; margin-top: 10px;">
                <input type="file" name="imagem" id="imagem" class="form-control" onchange="mostrar(this)">
                <br>
            </div>
            <div style="display:flex;justify-content:center">
                <img src="" id="img" style="display:none;border: 1px solid #E9ECEF;border-radius:10px">
            </div>
            <div style="color:red;font-size:11px;"><?php echo $msg[4] ?></div>

            <br>

            <div class="d-grid gap-2 col-6 mx-auto">
                <input type="submit" class="btn btn-primary">
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
    function mostrar(img) {
        if (img.files && img.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#img')
                    .attr('src', e.target.result)
                    .width(170)
                    .height(100)
                    .css('display', 'block').css('important', 'true');
            };
            reader.readAsDataURL(img.files[0]);
        }
    }
</script>