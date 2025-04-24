<?php
class produto
{
    public function __construct(
        public int $produto_id = 0,
        public string $produto_nome = "",
        public string $produto_descricao = "",
        public float $produto_preco = 0
    ) {}

    public function conexao()
    {
        $parametros = "mysql:host=localhost;dbname=estudo;charset=utf8mb4";
        $conexao = new PDO($parametros, "root", "");
        return $conexao;
    }

    public function inserirProduto($conexao) {
        $sql = "INSERT INTO PRODUTO (produto_nome, produto_descricao, produto_preco) VALUES (?,?,?)";
        $stm = $conexao->prepare($sql);
        $stm->bindValue(1, $this->produto_nome);
        $stm->bindValue(2, $this->produto_descricao);
        $stm->bindValue(3, $this->produto_preco);
        $stm->execute();
        return "Produto inserido com sucesso!";
    }

    public function consultarProdutos($conexao){
        $sql = "SELECT * FROM produto";
        $stm = $conexao->prepare($sql);
        $stm->execute();
        return $stm->fetchAll(PDO::FETCH_OBJ);
    }
}
