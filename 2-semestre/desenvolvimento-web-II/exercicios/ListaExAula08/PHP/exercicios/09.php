<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 09</title>
</head>

<body>
    <main>
        <h1>Exercício 09</h1>
        <p><b>Enunciado: </b>Dada uma matriz contendo dois arrays, sendo uma arrary com valor igual a 1 e outro array
            com valor igual a 2 realize a soma de elementos contidos nessa matriz. Utilize foreach para
            percorrer a matriz pela sua linha e a linha com seu valor para somar os valores contidos na
            matriz. Imprima a saída da soma com o comando "echo".<br>
            Vetor: [[1], [2]] </p>

        <a href="../index.html">Voltar</a>
        <form action="#" method="POST">
            <input type="submit" value="Gerar" name="Gerar">
            </div>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $matriz = [[1], [2]];

            echo "<div class='resultado' style='text-align: center'>Soma:<br> ";

            $soma = 0;
            foreach ($matriz as $linha) {
                foreach ($linha as $value) {
                    $soma += $value;
                }
            }
            echo $soma;
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