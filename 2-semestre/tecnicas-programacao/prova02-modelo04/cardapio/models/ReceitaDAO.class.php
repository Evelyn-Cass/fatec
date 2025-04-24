<?php
class ReceitaDAO extends Conexao
{
	public function __construct()
	{
		parent::__construct();
	}

	public function adicionar(Receita $receita)
	{
		$sql = "INSERT INTO receita (nome, descricao, idchef)
				VALUES(?,?,?)";
		try {
			$stm = $this->db->prepare($sql);
			$stm->bindValue(1, $receita->getNome());
			$stm->bindValue(2, $receita->getDescricao());
			$stm->bindValue(3, $receita->getChef()->getId_chefe());
			$stm->execute();
			$this->db = null;
			return true;
		} catch (PDOException $e) {
			echo $e->getCode();
			echo $e->getMessage();
			die();
		}
	}

	public function listar()
	{
		$sql = "SELECT r.nome, r.descricao, c.nome 'chef_nome', c.especialidade
				FROM receita r
				INNER JOIN chef c ON (c.idchef	 = r.idchef)";
		try {
			$stm = $this->db->prepare($sql);
			$stm->execute();
			$this->db = null;
			return $stm->fetchAll(PDO::FETCH_OBJ);
		} catch (PDOException $e) {
			echo $e->getCode();
			echo $e->getMessage();
			die();
		}
	}
	
} //fim da classe
