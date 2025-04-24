<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 05</title>
</head>

<body>
    <main>
        <h1>Exercício 05</h1>
        <p><b>Enunciado: </b>Encontrar o maior elemento em um vetor chamado "numeros" com os valores 5, -10 e -15<br>
            Vetor: [5, -10, -15] </p>

        <a href="../index.html">Voltar</a>
        <form action="#" method="POST">
            <input type="submit" value="Gerar" name="Gerar">
            </div>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $numeros = array(5, -10, -15);

            $maior = max($numeros);

            echo "<div class='resultado'>Maior número: ";
            print_r($maior);
            echo "</div>";
        }
        ?>
    </main>
</body>

</html>



<style>
    body {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }
    main {
        width: 50%;
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