<?php
class ChefDAO extends Conexao
{
	public function __construct()
	{
		parent::__construct();
	}

	public function listar()
	{
		$sql = "SELECT *
				FROM chef";
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
