<?php
class ProdutoDAO extends Conexao
{
    public function __construct()
    {
        parent::__construct();
    }

    public function inserir(Produto $produto)
    {
        $sql = "INSERT INTO produtos (nome, descricao, preco, imagem, situacao, id_categoria)
                VALUES (?,?,?,?,?,?)";
        try {
            $stm = $this->db->prepare($sql);
            $stm->bindValue(1, $produto->getNome());
            $stm->bindValue(2, $produto->getDescricao());
            $stm->bindValue(3, $produto->getPreco());
            $stm->bindValue(4, $produto->getImagem());
            $stm->bindValue(5, $produto->getSituacao());
            $stm->bindValue(6, $produto->getCategoria()->getId());
            $stm->execute();
            $this->db = null; // Fecha a conexão
            return "Produto inserido com sucesso!";
        } catch (PDOException $e) {
            echo "Código: " . $e->getCode();
            echo " .Mensagem: " . $e->getMessage();
        }
    }

    public function alterar($produto) {
        // $sql = "UPDATE produtos set descritivo = ? where id_produto = ?";
        // try {
        //     $stm = $this->db->prepare($sql);
        //     $stm->bindValue(1,$produto->getDescritivo());
        //     $stm->bindValue(2, $produto->getID());
        //     $stm->execute();
        //     $this->db=null;
        //     return "produto alterada com sucesso!";
        // } catch (PDOException $e) {
        //     echo "Código: " . $e->getCode();
        //     echo " .Mensagem: " . $e->getMessage();
        // }
    }

    public function excluir($produto)
    {
        // $sql = "DELETE FROM produtos where id_categoria = ?";
        // try {
        //     $stm = $this->db->prepare($sql);
        //     $stm->bindValue(1, $produto->getID());
        //     $stm->execute();
        //     $this->db=null;
        //     return "produto excluído com sucesso!";
        // } catch (PDOException $e) {
        //     echo "Código: " . $e->getCode();
        //     echo " .Mensagem: " . $e->getMessage();
        // }
    }

    public function listar()
    {
        $sql = "SELECT p.*, c.descritivo 
                FROM produtos p
                INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)";
        try {
            $stm = $this->db->prepare($sql);
            $stm->execute();
            $this->db = null; // Fecha a conexão
            return $stm->fetchAll(PDO::FETCH_OBJ);
        } catch (PDOException $e) {
            echo "Código: " . $e->getCode();
            echo " .Mensagem: " . $e->getMessage();
            die();
        }
    }

    public function pesquisarPorId($produto) {
        // $sql = "SELECT * FROM produtos WHERE id_categoria = ?";
        // try {
        //     $stm = $this->db->prepare($sql);
        //     $stm->bindValue(1, $produto->getId());
        //     $stm->execute();
        //     $this->db = null; // Fecha a conexão
        //     return $stm->fetchAll(PDO::FETCH_OBJ);
        // } catch (PDOException $e) {
        //     echo "Código: " . $e->getCode();
        //     echo " .Mensagem: " . $e->getMessage();
        //     die();
        // }
    }
}
