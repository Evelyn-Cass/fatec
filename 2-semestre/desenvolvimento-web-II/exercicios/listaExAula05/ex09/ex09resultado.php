<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 09</title>
</head>

<body>
    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $texto = $_POST["texto"];

        $palavras = explode(",", $texto);
        echo "<div class='resultado'>";
        for ($i = 0; $i < count($palavras); $i++) {
            echo " O tamanho da palavra \"" . $palavras[$i] . "\" é " . strlen($palavras[$i]) . " caracteres<br>";
        }
        echo "</div>";
    }
    ?>
    <button><a href="ex09.php">Voltar</a></button>
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