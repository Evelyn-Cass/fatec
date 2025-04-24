<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 10</title>
</head>

<body>
    <main>
        <h1>Exercício 10</h1>
        <p><b>Enunciado: </b>Dada uma matriz contendo dois arrays, sendo uma arrary com valor igual a 1 e outro array
            com valor igual a 2 crie uma matriz transposta. Com uso de foreach percorra a matriz pela
            linha e a linha pelo seu indice apontando para seu valor. Dentro do laço utilize a variável
            transposta informando o índice e o valor atribuído a esse índice. Utilize a função print_r()
            para imprimir a matriz transposta.<br>
            Vetor: [[1], [2]] </p>

        <a href="../index.html">Voltar</a>
        <form action="#" method="POST">
            <input type="submit" value="Gerar" name="Gerar">
            </div>
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $matriz = [[1], [2]];

            $matrizTransposta = [];
            echo "<div class='resultado' style='text-align: center'> ";

            
            $i = count($matriz);

            for ($j = 0; $j < count($matriz); $j++) {
                $matrizTransposta[$j] = $matriz[$i - $j - 1];
            }

            print_r($matrizTransposta);
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