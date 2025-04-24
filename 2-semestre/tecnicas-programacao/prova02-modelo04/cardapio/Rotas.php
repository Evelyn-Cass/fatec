<?php
	class Rotas
	{
		public array $rotas = [];
		
		public function get(string $nome_rota, array $dados)
		{
			$this->rotas["GET"][$nome_rota] = $dados;
		}
		
		public function post(string $nome_rota, array $dados)
		{
			$this->rotas["POST"][$nome_rota] = $dados;
		}
		
		public function verificar_rota($metodo, $nome_rota)
		{
			if(isset($this->rotas[$metodo][$nome_rota]))
			{
				$dados = $this->rotas[$metodo][$nome_rota];
				$method = $dados[1];
				$obj = new $dados[0]();
				return $obj->$method();
			}
			exit("Rota é inválida");
		}
	}//fim da classe

	// //instanciar um objeto classe Rotas
	$route = new Rotas();
	$route->get("/",[InicioController::class,"inicio"]);

	// Receitas
	$route->get("/receitas",[ReceitasController::class,"listar"]);
	$route->get("/receitas/adicionar",[ReceitasController::class,"adicionar"]);
	$route->post("/receitas/adicionar",[ReceitasController::class,"adicionar"]);
