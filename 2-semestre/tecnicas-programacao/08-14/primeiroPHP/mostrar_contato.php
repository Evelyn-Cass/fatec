<?php
//echo "<h1 style='color:blue'>O nome é " . $_GET["nome"] . "</h1><br>";

//echo "O Sobrenome é {$_GET["sobrenome"]}<br>";

if ($_GET) {



	require_once("Cliente.class.php");

	$obj = new Cliente();

	$obj->nome = $_GET["nome"];
	$obj->sobrenome = $_GET["sobrenome"];
	$obj->cpf = $_GET["cpf"];

	$obj->inserir();
	echo "<pre>";
	var_dump($obj);
	echo "</pre>";
} else {
	header("location:index.html");	
}
