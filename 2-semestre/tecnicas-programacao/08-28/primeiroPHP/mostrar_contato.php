<?php
//echo "<h1 style='color:blue'>O nome é " . $_GET["nome"] . "</h1><br>";

//echo "O Sobrenome é {$_GET["sobrenome"]}<br>";

if ($_GET) {

	require_once("Cliente.class.php");

	// $obj = new Cliente($_GET["nome"], $_GET["sobrenome"], $_GET["cpf"]);

	$obj = new Cliente(
		cliente_nome: $_GET["cliente_nome"],
		cliente_sobrenome: $_GET["cliente_sobrenome"],
		cliente_cpf: $_GET["cliente_cpf"]
	);

	$conect = $obj->conexao();
	// $obj->nome = $_GET["nome"];
	// $obj->sobrenome = $_GET["sobrenome"];
	// $obj->cpf = $_GET["cpf"];

	$msg = $obj->inserir($conect);

	// echo $msg;

	header("location:index.php?msg=$msg");
	die();

	// $obj->inserir();
	// echo "<pre>";
	// var_dump($obj);
	// echo "</pre>";
} else {
	header("location:form_cliente.html");
	die();
}
