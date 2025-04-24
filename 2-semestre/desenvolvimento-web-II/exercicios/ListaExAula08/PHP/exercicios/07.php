<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 07</title>
</head>

<body>
    <main>
        <h1>Exercício 07</h1>
        <p><b>Enunciado: </b>Dado o array chamado numeros contêm os valores: 10 e 20, filtrar os números maiores que
            o valor dado como limite igual a 15. Utilize a variável filtrados para filtrar o vetor numeros e
            o seu limite. Utilize a função print_r() para imprimir o resultado da variável filtrados.<br>
            Vetor: [10, 20] </p>

        <a href="../index.html">Voltar</a>
        <form action="#" method="POST">
            <input type="submit" value="Gerar" name="Gerar">
            </div>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $numeros = array(10, 20);
            $limite = 15;

            $filtrados = array_filter($numeros, function ($numero) use ($limite) {
                return $numero > $limite;
            });

            echo "<div class='resultado'>Filtrados: ";
            print_r($filtrados);
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