<div>
    <link rel="stylesheet" type="text/css" href="assets/styles/style.css">
    <h1>Exercício 1 - Processando GET na mesma página PHP.</h1>
    <form action="#" method="GET">
        <input type="number" name="num1" placeholder="Número 1" required>
        <input type="number" name="num2" placeholder="Número 2" required>
        <input type="submit" value="Somar" name="enviar">
        <input type="reset" name="limpar" value="Limpar">
    </form>

    <?php
    // if ($_GET) {
    if ($_SERVER["REQUEST_METHOD"] == "GET") {
        if (!empty($_GET["num1"]) && !empty($_GET["num2"])) {

            $n1 = $_GET["num1"];
            $n2 = $_GET["num2"];
            $soma =  $n1 + $n2;
            echo "<hr><h2>Resultado do exercício 1</h2><br>";
            echo "A soma de $n1 + $n2 é $soma";
        }
    }
    // }
    ?>
    <br>
    <hr>

    <a href="ex01c.php" class="button">Voltar</a>
</div>