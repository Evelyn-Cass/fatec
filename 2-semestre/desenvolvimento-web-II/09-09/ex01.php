<div>
<link rel="stylesheet" type="text/css" href="assets/styles/style.css">
<h1>Exercício 1 - Processando POST na mesma página PHP.</h1>
<form action="#" method="POST">
    <input type="number" name="num1" placeholder="Número 1" required>
    <input type="number" name="num2" placeholder="Número 2" required>
    <input type="submit" value="Somar" name="enviar">
    <input type="reset" name="limpar" value="Limpar">
</form>

<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $n1 = $_POST["num1"];
        $n2 = $_POST["num2"];
        $soma =  $n1 + $n2;
        echo "<hr><h2>Resultado do exercício 1</h2><br>";
        echo "A soma de $n1 + $n2 é $soma";
    }
?>
<br>
<hr>

<a href="ex01.php" class="button">Voltar</a>
</div>