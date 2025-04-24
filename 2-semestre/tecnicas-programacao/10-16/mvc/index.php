<?php

if ($_GET) {
    //outras rotas http://localhost/10-16/mvc/index.php?controle=usuarioController&metodo=listar

    $controller = $_GET['controle'];
    $metodo = $_GET['metodo'];

    require_once "controllers/{$controller}.class.php";

    $obj = new $controller();
    $obj->$metodo();

} else {
    //rota inicial http://localhost/10-16/mvc/index.php

    require_once "controllers/inicioController.class.php";

    $controller = new InicioController();
    $controller->index();
}
