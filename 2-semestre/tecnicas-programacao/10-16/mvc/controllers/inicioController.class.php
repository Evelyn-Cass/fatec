<?php 
class InicioController {
    public function index() {
        echo "Estou na classe InicioController e executei o método index";
        require_once "views/menu.html";
    }
}