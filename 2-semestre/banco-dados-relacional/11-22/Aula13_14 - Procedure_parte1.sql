*/================================================
Criação de PROCEDURE (Stored Procedures) - Parte 1
==================================================*/
#Programas armazenados no servidor.
#Pré-compilados.
#Chamados de forma explícita para executar 
#alguma lógica de manipulação de dados.
#Podendo retornar ou não algum valor.

#Sintaxe#

DELIMITER //
DROP PROCEDURE IF EXISTS nome //
CREATE PROCEDURE nome (param IN, param OUT)
BEGIN
   *** corpo da PROCEDURE ***;
   ... querys.. ;
   SELECT * FROM funcionarios;
END
//
DELIMITER ;

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
usuario. */

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
     SELECT CONCAT("Cliente ",cod," não cadastrado!!")  
              AS MSG;
   END IF;   
  END IF;     
END 
//
DELIMITER ;

#aplicação
CALL proc_tabela_clientes(NULL);
CALL proc_tabela_clientes(10);
CALL proc_tabela_clientes(100);

/*Exemplo 2: 
Criar uma query para montar uma tabela 
de preços de produtos:
opção1:com custo (1)
Codigo - Descritivo -Custo -Venda
opção2:sem custo (2)
Codigo - Descritivo - Venda*/
DELIMITER //
DROP PROCEDURE IF EXISTS proc_tabela_precos //
CREATE PROCEDURE proc_tabela_precos (IN var INT)
BEGIN
 IF (var = 1) THEN
   SELECT id_produto "Codigo", Descritivo,
   CONCAT("R$ ",FORMAT(custo,2,"de_DE")) "Custo",
   CONCAT("R$ ",FORMAT(venda,2,"de_DE")) "Venda"
   FROM produtos;
 ELSE
  IF (var = 2) THEN
   SELECT id_produto "Codigo", Descritivo,
   CONCAT("R$ ",FORMAT(venda,2,"de_DE")) "Venda"
   FROM produtos;
  ELSE
   SELECT "Parâmetro de entrada inválido" AS msg;
  END IF;
 END IF;   
END//
DELIMITER ;

CALL proc_tabela_precos(1);
CALL proc_tabela_precos(2);
CALL proc_tabela_precos(3);


### Lista de exercicios ###
#=========================#

/*1) Criar uma procedure que liste todos os 
dependentes de um determinado funcionarios
informado pelo usuario.
Obs:A procedure deverá verificar : 
a)Se o funcionario não esta cadastrado.
b)Se o funcionario não tem dependentes*/

Codigo  Nomefuncionario  Nomedependente	

DELIMITER //
DROP PROCEDURE IF EXISTS proc_lista_filhos //
CREATE PROCEDURE proc_lista_filhos (IN codf INT)
BEGIN
   ## Corpo da procedure ##
   IF (codf IN (SELECT id_funcionario FROM funcionarios)) THEN
     IF (codf IN (SELECT id_funcionario FROM dependentes)) THEN
       SELECT f.id_funcionario "Código",
        f.nome "NomeFuncionario",d.nome "NomeFilho"
       FROM funcionarios f INNER JOIN dependentes d
       ON (f.id_funcionario=d.id_funcionario)
       WHERE f.id_funcionario = codf;
     ELSE
      SELECT CONCAT("O funcionario", codf, " não possui filhos") AS msg;
     END IF;
   ELSE
    SELECT CONCAT("O funcionario", codf , " não foi encontrado") AS msg;
   END IF;
END//
DELIMITER ;

CALL proc_lista_filhos(1); #tem filhos
CALL proc_lista_filhos(9); #não tem filhos
CALL proc_lista_filhos(90); #não cadastrado


/*2)Criar uma procedure que liste o total vendido por 
um determinado vendedor.Entrada: Codigo do vendedor
Obs:A procedure deverá verificar : 
a)Se o vendedor esta cadastrado.
b)Se o vendedor não realizou vendas deve vir com total zero*/
Codigo    	Nome    	TotalVendido 

DELIMITER //
DROP PROCEDURE IF EXISTS proc_Total_vendedor //
CREATE PROCEDURE proc_Total_vendedor (IN codv INT)
BEGIN
  ## Corpo da procedure ##
  IF (codv IN (SELECT id_vendedor FROM vendedores)) THEN
   SELECT v.id_vendedor "Código", v.nome "Nome",
      CONCAT("R$ ",IFNULL(SUM(nf.valor),0)) "TotalVendido"
   FROM vendedores v LEFT JOIN nf_vendas nf
   ON (v.id_vendedor=nf.id_vendedor)
   WHERE v.id_vendedor = codv;
  ELSE
   SELECT CONCAT("Vendedor ", codv, " não encontrado") AS msg;
  END IF;
END//
DELIMITER ;

CALL proc_Total_vendedor(1); #tem vendas
CALL proc_Total_vendedor(6); #não tem vendas
CALL proc_Total_vendedor(10);#não cadastrado


/*3)Criar uma procedure que liste o total 
vendido de um determinado produto em um periodo 
especificado pelo usuario.
Entrada: Codigo do produto
	 Data inicial e Data Final
# Total vendido = quantidade*valor unitario
# Verificar se o produto está cadastrado.Caso
# não esteja, reportar uma mensagem para o 
# usuário.
# verificar se tem vendas no periodo. Caso
# não tenha, reportar uma mensagem para o
# usuário */
Codigo  Descritivo  Total   DataInicio  DataFinal
DELIMITER //
DROP PROCEDURE IF EXISTS proc_total_produtos //
CREATE PROCEDURE proc_total_produtos 
               (IN codp INT, datai DATE, dataf DATE)
BEGIN
  # Corpo da procedure #
  IF (codp IN (SELECT id_produto FROM produtos)) THEN
   IF (codp IN (SELECT iv.id_produto FROM itens_nfv iv
             INNER JOIN nf_vendas nf
             ON (nf.id_nfv=iv.id_nfv)            
             WHERE nf.emissao BETWEEN datai AND dataf)) THEN
     SELECT p.id_produto "Codigo", p.descritivo,
      SUM(iv.quantidade*iv.venda) "Total",
      datai "Data Inicio",
      dataf "Data Final"
     FROM produtos p INNER JOIN itens_nfv iv
     ON (p.id_produto=iv.id_produto)
     INNER JOIN nf_vendas nf ON (nf.id_nfv=iv.id_nfv)
     WHERE p.id_produto = codp 
           AND nf.emissao BETWEEN datai AND dataf;
   ELSE
    SELECT CONCAT("Produto ", codp , 
             " não possui vendas no periodo") AS msg;
   END IF;
  ELSE
   SELECT CONCAT("Produto ", codp , " não encontrado") AS msg;
  END IF;  
END//
DELIMITER ;

CALL proc_total_produtos(1,"2024-02-12","2024-10-01");
CALL proc_total_produtos(2,"2023-02-12","2023-10-01");
CALL proc_total_produtos(20,"2023-02-12","2023-10-01");







