<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 03</title>
</head>
<body>
<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $n1 = $_POST["numero"];
        if ($n1 % 2 == 0) {
            echo "<div class='resultado'> $n1 é Par!</div>";
        }
        else {
            echo "<div class='resultado'> $n1 é Impar!</div>";
        }
        
    }
    ?>
    <button><a href="ex03.php">Voltar</a></button>
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