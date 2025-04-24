<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 08</title>
</head>

<body>
    <a href="../index.html">Voltar</a>
    <h1>Dia da Semana</h1>
    <form action="#" method="POST">

        <label for="dia"><B>Dia da Semana (1-7):</B></label>
        <input type="number" id="dia" name="dia" step="1" required></p>
        <div class="buttons">
            <input type="submit" value="Descobrir dia" name="Somar">
            <input type="reset" value="Limpar" name="Limpar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $dia = $_POST["dia"];

        switch ($dia) {
            case 1:
                echo "<div class='resultado'> Segunda-Feira </div>";
                break;
            case 2:
                echo "<div class='resultado'> Terça-Feira </div>";
                break;
            case 3:
                echo "<div class='resultado'> Quarta-Feira </div>";
                break;
            case 4:
                echo "<div class='resultado'> Quinta-Feira </div>";
                break;
            case 5:
                echo "<div class='resultado'> Sexta-Feira </div>";
                break;
            case 6:
                echo "<div class='resultado'> Sábado </div>";
                break;
            case 7:
                echo "<div class='resultado'> Domingo </div>";
                break;

            default:
                echo "<div class='resultado'> Dia inválido </div>";
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