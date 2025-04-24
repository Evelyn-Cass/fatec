<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercício 01</title>
</head>

<body>

    <h1>Exercício 01</h1>
    <p>Enunciado: Soma de elementos em um vetor com valores de 1 a 4.<br>
    Vetor: [1, 2, 3, 4]</p>

    <a href="../index.html">Voltar</a>
    <form action="#" method="POST">
            <input type="submit" value="Somar" name="Somar">
        </div>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $array = array(1,2,3,4);
        echo "<div class='resultado'> ";

        $soma = 0;
        $i = 0;
        foreach ($array as $value) {
            
            echo $value;

            if ($i != count($array) - 1) {
                echo " + ";
            }
            $i++;

            $soma += $value;
        }

        
        echo " =  $soma</div>";
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