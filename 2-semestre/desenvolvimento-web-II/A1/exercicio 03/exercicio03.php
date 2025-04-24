<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 03</title>
</head>

<body>
    <a href="../index.html">Voltar</a>
    <h1>Maior e Menor Número</h1>
    <form action="#" method="POST">

        <label for="numero1"><B>Primeiro Número:</B></label>
        <input type="number" id="numero1" name="numero1" step="1" required>

        <label for="numero2"><B>Segundo Número</B></label>
        <input type="number" id="numero2" name="numero2" step="1" required>
 
        <label for="numero3"><B>Terceiro Número</B></label>
        <input type="number" id="numero3" name="numero3" step="1" required>

        <label for="numero4"><B>Quarto Número</B></label>
        <input type="number" id="numero4" name="numero4" step="1" required>

        <label for="numero5"><B>Quinto Número</B></label>
        <input type="number" id="numero5" name="numero5" step="1" required>

        <div class="buttons">
            <input type="submit" value="Verificar" name="Verificar">
            <input type="reset" value="Limpar" name="Limpar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $n1 = $_POST["numero1"];
        $n2 = $_POST["numero2"];
        $n3 = $_POST["numero3"];
        $n4 = $_POST["numero4"];
        $n5 = $_POST["numero5"];

        echo "<br>Números inseridos: $n1, $n2, $n3, $n4, $n5";

        if ($n1 >= $n2 && $n1 >= $n3 && $n1 >= $n4 && $n1 >= $n5) {
            echo "<div class='resultado'>O maior número é $n1</div>";
        } elseif ($n2 >= $n1 && $n2 >= $n3 && $n2 >= $n4 && $n2 >= $n5) {
            echo "<div class='resultado'>O maior número é $n2</div>";
        } elseif ($n3 >= $n1 && $n3 >= $n2 && $n3 >= $n4 && $n3 >= $n5) {
            echo "<div class='resultado'>O maior número é $n3</div>";
        } elseif ($n4 >= $n1 && $n4 >= $n2 && $n4 >= $n3 && $n4 >= $n5) {
            echo "<div class='resultado'>O maior número é $n4</div>";
        } elseif ($n5 >= $n1 && $n5 >= $n2 && $n5 >= $n3 && $n5 >= $n4) {
            echo "<div class='resultado'>O maior número é $n5</div>";
        }

        if ($n1 <= $n2 && $n1 <= $n3 && $n1 <= $n4 && $n1 <= $n5) {
            echo "<div class='resultado'>O menor número é $n1</div>";
        } elseif ($n2 <= $n1 && $n2 <= $n3 && $n2 <= $n4 && $n2 <= $n5) {
            echo "<div class='resultado'>O menor número é $n2</div>";
        } elseif ($n3 <= $n1 && $n3 <= $n2 && $n3 <= $n4 && $n3 <= $n5) {
            echo "<div class='resultado'>O menor número é $n3</div>";
        } elseif ($n4 <= $n1 && $n4 <= $n2 && $n4 <= $n3 && $n4 <= $n5) {
            echo "<div class='resultado'>O menor número é $n4</div>";
        } elseif ($n5 <= $n1 && $n5 <= $n2 && $n5 <= $n3 && $n5 <= $n4) {
            echo "<div class='resultado'>O menor número é $n5</div>";
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