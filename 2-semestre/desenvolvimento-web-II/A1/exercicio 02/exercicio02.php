<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 02</title>
</head>

<body>
    <a href="../index.html">Voltar</a>
    <h1>Média Simples</h1>
    <form action="#" method="POST">

        <label for="prova1"><B>Primeira Prova:</B></label>
        <input type="number" id="prova1" name="prova1" step="0.01" required>

        <label for="prova2"><B>Segunda Prova</B></label>
        <input type="number" id="prova2" name="prova2" step="0.01" required>
        <div class="buttons">
            <input type="submit" value="Calcular Média" name="Somar">
            <input type="reset" value="Limpar" name="Limpar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $n1 = $_POST["prova1"];
        $n2 = $_POST["prova2"];
        $media =  ($n1 + $n2) / 2;
        echo "<div class='resultado'> A média é " . number_format($media,2,",",".")."</div>";
        if ($media >= 7) {
            echo "<div class='resultado'> Aprovado</div>";
        } else {
            echo "<div class='resultado'> Reprovado</div>";
        }
    }
    ?>

</body>

</html>



<style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    a {
        position: fixed;
        left: 0;
        top: 0;
        margin: 10px;
        padding: 10px;
        text-decoration: none;
        color: cadetblue;
        border: 3px solid cadetblue;
        background-color: transparent;
        border-radius: 30px;
    }

    a:hover {
        background-color: cadetblue;
        color: white;
    }

    form {
        width: 30%;
        display: flex;
        flex-direction: column;
    }

    label {
        margin-top: 10px;
    }

    .buttons {
        margin: 10px 0 0 auto;
    }

    .resultado {
        border: 3px solid limegreen;
        border-radius: 30px;
        padding: 20px;
        margin: 10px 0 0 0;
        font-size: 32px;
    }
</style>