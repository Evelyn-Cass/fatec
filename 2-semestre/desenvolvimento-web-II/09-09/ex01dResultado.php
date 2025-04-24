<link rel="stylesheet" type="text/css" href="assets/styles/style.css">
<?php
// if ($_GET) {
if ($_SERVER["REQUEST_METHOD"] == "GET") {
    if (!empty($_GET["num1"]) && !empty($_GET["num2"])) {

        $n1 = $_GET["num1"];
        $n2 = $_GET["num2"];
        $soma =  $n1 + $n2;
        echo "<h2>Resultado do exercício 1</h2><br>";
        echo "A soma de $n1 + $n2 é $soma";
    }
}
// }
?>
<br>
<br>

<a href="ex01d.php" class="button">Voltar</a>
</div>