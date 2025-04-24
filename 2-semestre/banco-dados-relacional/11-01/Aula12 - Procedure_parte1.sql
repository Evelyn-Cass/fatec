#==================================================
#Criação de PROCEDURE (Stored Procedures) - Parte 1
#===================================================*/
#Programas armazenados no servidor.
#Pré-compilados.
#Chamados de forma explícita para executar 
#alguma lógica de manipulação de dados.
#Podendo retornar ou não algum valor.

#Sintaxe#

DELIMITER //  ##Muda o delimitador de ; para //
DROP PROCEDURE IF EXISTS nome // #Deleta da Procedure se ela já existir
CREATE PROCEDURE nome (param IN, param OUT)
BEGIN
   *** corpo da PROCEDURE ***;
   ... querys.. ;
   SELECT * FROM funcionarios;
END //
DELIMITER ;  #Volta o delimitador para ;

#Executar uma procedure

CALL nome(parametros);

#Apagar uma procedure
DROP PROCEDURE IF EXISTS nome;
 

/*Exemplo1:

Criar uma procedure para listar todas as 
informações dos clientes da empresa de acordo 
com o critério abaixo:

1.(NULL)....Todos os clientes.
2.(Codigo)..Somente o cliente especificado pelo 
usuario. */;

DELIMITER //
DROP PROCEDURE IF EXISTS proc_tabela_clientes //
CREATE PROCEDURE  proc_tabela_clientes (IN cod INT)
BEGIN
  IF (cod IS NULL) THEN
     SELECT * FROM clientes;
  ELSE
   IF (cod IN (SELECT id_cliente FROM clientes)) THEN
     SELECT * FROM clientes WHERE id_cliente = cod;
   ELSE
     SELECT CONCAT("Cliente ",cod," não cadastrado!!")  AS MSG;
   END IF;   
  END IF;     
END 
//
DELIMITER ;

#aplicação;

CALL proc_tabela_clientes(788);
 
CALL proc_tabela_clientes(NULL);;


/*Exemplo1.2:

Criar uma procedure para listar todas as 
informações dos clientes da empresa de acordo 
com o critério abaixo:
1.(NULL)   Todos os clientes.
2.(Codigo) Somente o cliente especificado pelo 
usuario. 
obs: verificar se o cliente esta cadastrado
*/


/*Exemplo 2: 
Criar uma query para montar uma tabela 
de preços de produtos:
opção1:com custo (1)
Codigo - Descritivo -Custo -Venda

opção2:sem custo (2)
Codigo - Descritivo - Venda
*/

DELIMITER //
DROP PROCEDURE IF EXISTS proc_preco//
CREATE PROCEDURE proc_preco (IN cod INT)
BEGIN
	IF (cod = 1) THEN
		SELECT id_produto "Código",
			descritivo "Descritivo",
			custo "Custo",
			venda "Venda"
		FROM produtos;
	ELSE 
		IF (cod = 2) THEN
			SELECT id_produto "Código",
				descritivo "Descritivo",
				venda "Venda"
			FROM produtos;
		ELSE
			SELECT "ERRO: Necessário definir uma opção." AS MSG;
		END IF;
	END IF;

END //
DELIMITER ;

CALL proc_preco(NULL);
CALL proc_preco(1);
CALL proc_preco(2);

### Lista de exercicios ###
#=========================#

/*1) Criar uma procedure que liste todos os 
dependentes de um determinado funcionarios
informado pelo usuario.
Obs:A procedure deverá verificar : 
a)Se o funcionario não esta cadastrado.
b)Se o funcionario não tem dependentes*/

#Codigo  Nomefuncionario  Nomedependente	

DELIMITER //
DROP PROCEDURE IF EXISTS proc_dependentes//
CREATE PROCEDURE proc_dependentes (IN cod INT)
BEGIN
	IF ((cod NOT IN (SELECT id_funcionario FROM funcionarios))) THEN
		SELECT "ERRO: Funcionário não cadastrado." AS MSG;
	ELSE
		IF ((cod IN (SELECT id_funcionario FROM dependentes))) THEN
			SELECT f.id_funcionario "Código",
				f.nome "Nome Funcionário",
				d.nome "Nome Dependente"
			FROM funcionarios f
			INNER JOIN dependentes d ON (d.id_funcionario = f.id_funcionario)
			WHERE f.id_funcionario = cod;
		ELSE 
			SELECT "ERRO: Funcionário não possui dependentes." AS MSG;
		END IF;
	END IF;

END //
DELIMITER ;

CALL proc_dependentes(1);
CALL proc_dependentes(9);
CALL proc_dependentes(999);


/*2)Criar uma procedure que liste o total vendido por 
um determinado vendedor.Entrada: Codigo do vendedor
Obs:A procedure deverá verificar : 
a)Se o vendedor esta cadastrado.
b)Se o vendedor não realizou vendas deve vir com total zero*/

#Codigo    	Nome    	TotalVendido 
	 
DELIMITER //
DROP PROCEDURE IF EXISTS proc_vendas//
CREATE PROCEDURE proc_vendas (IN cod INT)
BEGIN
	IF (cod NOT IN (SELECT id_vendedor FROM vendedores)) THEN
		SELECT CONCAT("ERRO: Vendedor ",cod," não está cadastrado.") AS MSG;
	ELSE
		SELECT v.id_vendedor "Código",
			v.nome "Nome",
			CONCAT("R$ ",FORMAT(IFNULL(SUM(nfv.valor),0),2,"de_DE")) "Total Vendido"
		FROM vendedores v
		LEFT JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
		WHERE v.id_vendedor = cod;
	END IF;

END //
DELIMITER ;	 

CALL proc_vendas(1);
CALL proc_vendas(7);
CALL proc_vendas(9);


/*3)Criar uma procedure que liste o total 
vendido de um determinado produto em um periodo 
determinado pelo usuario.
Entrada: Codigo do produto
	 Data inicial
	 Data Final
	 
Codigo   Descritivo    Total     Datai    Dataf	*/

DELIMITER //
DROP PROCEDURE IF EXISTS proc_vendas_produto//
CREATE PROCEDURE proc_vendas_produto(IN cod INT,IN datainicial DATE, IN datafinal DATE)
BEGIN

	IF (cod IN (SELECT id_produto FROM produtos)) THEN
		IF (cod IN (SELECT id_produto FROM itens_nfv)) THEN
			IF (cod IN (SELECT infv.id_produto FROM itens_nfv infv INNER JOIN nf_vendas nfv ON (nfv.id_nfv = infv.id_nfv) WHERE nfv.emissao BETWEEN datainicial AND datafinal)) THEN
				SELECT p.id_produto "Código",
					p.descritivo "Descritivo",
					CONCAT("R$ ",FORMAT(SUM(infv.venda * infv.quantidade),2,"de_DE")) "Total",
					datainicial "Data Inicial",
					datafinal "Data Final"
				FROM produtos p
				LEFT JOIN itens_nfv infv ON (infv.id_produto = p.id_produto)
				LEFT JOIN nf_vendas nfv ON (nfv.id_nfv = infv.id_nfv)
				WHERE p.id_produto = cod AND nfv.emissao BETWEEN datainicial AND datafinal;
			ELSE
				SELECT "ERRO: Não existem vendas do produto nesse período." AS MSG;
			END IF;
		ELSE
			SELECT "ERRO: Produto não possui vendas." AS MSG;
		END IF;
	ELSE
		SELECT "ERRO: Produto não está cadastrado." AS MSG;
	END IF;

END //
DELIMITER ;

CALL proc_vendas_produto(1,'2024-02-12','2024-10-01');
CALL proc_vendas_produto(1,'2024-02-12','2024-03-01');

CALL proc_vendas_produto(2,'2024-02-12','2024-10-01');
CALL proc_vendas_produto(2,'2024-02-12','2024-03-01');

CALL proc_vendas_produto(19,'2024-02-12','2024-10-01');
