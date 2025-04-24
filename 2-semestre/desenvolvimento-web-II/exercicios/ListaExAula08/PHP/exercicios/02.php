<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 02</title>
</head>

<body>

    <h1>Exercício 02</h1>
    <p><b>Enunciado:</b> Contagem de números Pares e Ímpares com valores de 1 a 4  dentro do vetor números.<br>
    Vetor: [1, 2, 3, 4]</p>

    <a href="../index.html">Voltar</a>
    <form action="#" method="POST">
            <input type="submit" value="Contar" name="contar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $array = array(1,2,3,4);
        $pares = array();
        $impares = array();
        $quantidadePar = 0;
        $quantidadeImpar = 0;
        foreach ($array as $value) {

            if ($value % 2 == 0) {
                $pares[] = $value;
                $quantidadePar++;
            }
            else {
                $impares[] = $value;
                $quantidadeImpar++;
            }
        }

        
        echo "
        <div class='resultado'>
        <b>Pares:</b>
        "; 
        $i=0;
        foreach ($pares as $value) {

            $i++;
            if (count($pares) == $i) {
                echo $value;
            }
            else {
                echo $value . ",";
            }

        }
        echo "
        <br>
        <b>Quantidade de números pares:</b> $quantidadePar
        
        <br>
        <b>Impares:</b>
        "; 
        $i=0;
        foreach ($impares as $value) {
            $i++;
            if (count($impares) == $i) {
                echo $value;
            }
            else {
                echo $value . ",";
            }
        }
        echo "
        <br>
        <b>Quantidade de números ímpares:</b> $quantidadeImpar
        </div>";
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
</style>