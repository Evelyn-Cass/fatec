<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 07</title>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $numeros = $_POST["numeros"];

        $explode = explode(",", $numeros);
        $verificacao = true;

        for ($i = 0; $i < count($explode); $i++) {
            if (!is_numeric($explode[$i])) {
                $verificacao = false;
            };
        }

        if ($verificacao == false) {
            echo "<div class='resultado'>Os valores informados são inválidos</div>";
        } else {
            $media = 0.0;

            for ($i = 0; $i < count($explode); $i++) {
                $media += $explode[$i];
            }
            $media = $media / count($explode);

            echo "<div class='resultado'>A média dos valores é " . number_format($media, 2, ",", ".") . "</div>";
        }
    }
    ?>
    <button><a href="ex07.php">Voltar</a></button>
</body>

</html>

<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        flex-direction: column;
    }

    .resultado {
        border: 3px solid limegreen;
        border-radius: 30px;
        padding: 20px;
        margin: 10px;
        font-size: 32px;
    }

    a {
        text-decoration: none;
        color: black;
        padding: 4px;
    }
</style>