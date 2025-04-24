<?php
class Rotas
{
    public array $rotas = array();

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
        if (isset($this->rotas[$metodo][$nome_rota])) {
            $dados = $this->rotas[$metodo][$nome_rota];
            $method = $dados[1];
            $obj = new $dados[0]();
            return $obj->$method();
        } else {
            exit("Rota não encontrada");
        }
    }
}

$route = new Rotas();
$route->get("/", array(InicioController::class, "inicio"));

$route->get("/categoria", array(CategoriaController::class, "listar"));
$route->get("/inserirCategoria", array(CategoriaController::class, "inserir"));
$route->post("/inserirCategoria", array(CategoriaController::class, "inserir"));

$route->get("/produto", array(ProdutoController::class, "listar"));

// echo "<pre>";
// var_dump($route);
// echo "</pre>";
