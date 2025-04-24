<?php

class Cliente
{
    // construtor php8
    public function __construct(
        public int $cliente_id = 0,
        public string $cliente_nome = "",
        public string $cliente_sobrenome = "",
        public string $cliente_cpf  = ""
    ) {}


    // Métodos
    public function inserir($conexao)
    {
        $sql = "INSERT INTO CLIENTE (cliente_nome, cliente_sobrenome, cliente_cpf)
        VALUES (?,?,?)";
        $stm = $conexao->prepare( $sql );
        $stm->bindValue( 1, $this->cliente_nome); 
        $stm->bindValue( 2, $this->cliente_sobrenome); 
        $stm->bindValue( 3, $this->cliente_cpf); 
        $stm->execute();
        return "Cliente inserido com sucesso";
    }

    public function conexao()
    {
        //parametros para abrir a conexão com o banco de dados utilizando classe PDO
        $parametros = "mysql:host=localhost;dbname=primeiro_php;charset=utf8mb4";

        // Instanciando um objeto classe PDO, que é um classe que vem com o PHP
        $conexao = new PDO($parametros, "root", "");

        //Retornando a conexao aberta
        return $conexao;
    }

    public function buscar_todos_clientes($conexao){

        $sql = "SELECT * FROM CLIENTE";

        $stm = $conexao->prepare($sql);
        $stm->execute();
        return $stm->fetchAll(PDO::FETCH_OBJ);

        // return $stm->fetchAll(PDO::FETCH_ASSOC); MODO DO BANCO DE DADOS
        // return $stm->fetchAll(PDO::FETCH_NUM); MODO NÚMERICO

    }

} //Fim da classe
