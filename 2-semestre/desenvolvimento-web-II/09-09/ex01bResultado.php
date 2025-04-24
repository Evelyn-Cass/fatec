<link rel="stylesheet" type="text/css" href="assets/styles/style.css">

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $n1 = $_POST["num1"];
    $n2 = $_POST["num2"];
    $soma =  $n1 + $n2;
    echo "<div><h2>Resultado do exercício 1</h2><br>";
    echo "A soma de $n1 + $n2 é $soma";
}
?>

<br>
<br>
<a href="ex01b.php" class="button">Voltar</a>
</div>