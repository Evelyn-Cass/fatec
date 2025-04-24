<?php
class ReceitasController
{
	public function listar()
	{
		$receitaDAO = new ReceitaDAO();
		$receitas = $receitaDAO->listar();
		require_once "views/receitaListar.php";
	}
	public function adicionar()
	{
		$mensagem = "";
		$retorno = "";
		if ($_POST) {
			if (!isset($_POST["chef"]) || ($_POST["chef"] == 0)) {
				$mensagem = "Escolha um chef para continuar.";
			} else {
				$chef = new Chef($_POST["chef"]);
				$receita = new Receita(
					nome: $_POST["nome"],
					descricao: $_POST["descricao"],
					chef: $chef
				);

				$receitaDAO = new ReceitaDAO();
				$retorno = $receitaDAO->adicionar($receita);

				if ($retorno) {
					header("location:/cardapio/receitas?mensagem=Receita adcionada com sucesso!");
					die();
				}
			}
		}
		$chefDAO = new ChefDAO();
		$chefs = $chefDAO->listar();
		require_once "views/receitaAdicionar.php";
	}
} //fim da classe
