<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 04</title>
</head>

<body>

    <h1>Exercício 04</h1>
    <p><b>Enunciado:</b>Dados os valores 1, 2 e 3 dentro do vetor números, crie um novo vetor com o nome invertido e imprima ele na tela. Utilize print_r($invertido) para exibir o valor do vetor.<br>
    Vetor: [1, 2, 3] </p>

    <a href="../index.html">Voltar</a>
    <form action="#" method="POST">
        <input type="submit" value="Gerar" name="Gerar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $numeros = array(1, 2, 3);
        
        $invertido = array_reverse($numeros);

        echo "<div class='resultado'>Invertido: ";
        print_r($invertido);
        echo "</div>";
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

    p {
        width: 50%;
    }
</style>