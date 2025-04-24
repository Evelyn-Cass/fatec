<?php
class UsuarioController {
    public function listar() {
        echo "Estou na classe UsuarioController e executei o método listar";
        require_once "models/usuario.class.php";

        $usuario = new Usuario();
        $retorno = $usuario->buscarTodosUsuarios();

        require_once "views/listar_usuario.php";
    }

    public function inserir() {
        echo "Estou na classe UsuarioController e executei o método inserir";
    }

    public function alterar() {
        echo "Estou na classe UsuarioController e executei o método alterar";
    }

    public function excluir() {
        echo "Estou na classe UsuarioController e executei o método excluir";
    }
}