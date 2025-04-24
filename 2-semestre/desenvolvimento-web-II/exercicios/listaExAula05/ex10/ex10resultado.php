<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 10</title>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $data = explode('/', $_POST["dia"]);
        if (count($data) != 3) {
            echo "<div class='resultado'>Data inválida</div>";
        } else {
            if (checkdate((int)$data[1], (int)$data[0], (int)$data[2])) {
                echo "<div class='resultado'>A data  [" . $data[0] . "/" . $data[1] . "/" . $data[2] . "] é válida</div>";
            } else {
                echo "<div class='resultado'>A data [" . $data[0] . "/" . $data[1] . "/" . $data[2] . "] é inválida</div>";
            }
        }
    }
    ?>
    <button><a href="ex10.php">Voltar</a></button>
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