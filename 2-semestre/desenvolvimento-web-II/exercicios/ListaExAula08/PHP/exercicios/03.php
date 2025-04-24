<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 03</title>
</head>

<body>

    <h1>Exercício 03</h1>
    <p><b>Enunciado:</b> Multiplicação de Elementos por um Número. Crie o vetor números com os valores 1 e 2 e crie uma variável multiplicador com valor igual a 3. Imprima o resultado de cada valor do vetor pelo seu multiplicador, exibindo na saída cada posição do vetor igual ao seu resultado da mutilplicação. Utilize a função print_r() para imprimir a saída desse vetor.<br>
    Vetor: [1, 2]</p>

    <a href="../index.html">Voltar</a>
    <form action="#" method="POST">
        <input type="submit" value="Gerar" name="Gerar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $numeros = array(1, 2);
        $multiplicador = 3;
        echo "<div class='resultado'> ";

        foreach ($numeros as $indice => $valor) {
            $numeros[$indice] = $valor * $multiplicador;
        }

        print_r($numeros);

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
    p{
        width: 50%;
    }
</style>