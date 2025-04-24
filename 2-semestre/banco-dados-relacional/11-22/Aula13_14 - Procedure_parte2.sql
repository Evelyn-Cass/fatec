#### Lista de procedure ###
#=========================#

/*** Procedure para inserir - atualizar - deletar

/*4)Criar uma query para inserir um vendedor no sistema.
campos da tabela vendedor : 
nome,comissao,salario_fixo, sexo*/

DELIMITER //
DROP PROCEDURE IF EXISTS pro_inserir_vendedor //
CREATE PROCEDURE pro_inserir_vendedor (IN nome VARCHAR(100),
					comissao INT,
					salario DECIMAL(8,2),
					sexo CHAR(1))
BEGIN
   INSERT INTO vendedores (nome,
			   comissao,
			   salario_fixo,
			   sexo)
   VALUES (nome, comissao, salario, sexo);
END //
DELIMITER ;
CALL pro_inserir_vendedor("José Eduardo",10,1200.00,"M");


/*5)Criar uma PROCEDURE que atualize os produtos 
da empresa em X%.A atualização será feita por 
categoria.*/

DELIMITER //
DROP PROCEDURE IF EXISTS pro_preco_por_categoria //
CREATE PROCEDURE pro_preco_por_categoria (IN cod INT,
					  perc INT)
BEGIN
    IF (cod IN(SELECT id_categoria FROM categorias)) THEN
        IF (cod IN (SELECT id_categoria FROM produtos)) THEN
           UPDATE produtos 
           SET venda = venda + ( venda * perc / 100)
           WHERE cod = id_categoria;
        ELSE
	   SELECT CONCAT("Categoria: ",cod," não possui produtos associados!") AS MSG;
        END IF;
    ELSE
       SELECT CONCAT("Categoria: ",cod," não encontrada!") AS MSG;
    END IF;
END //
DELIMITER ;

CALL pro_preco_por_categoria(10,10);
CALL pro_preco_por_categoria(5,0);
CALL pro_preco_por_categoria(1,10);


/*6)Criar uma QUERY que DELETE um produto do 
cadastro da empresa.*/
#1 - VERIFICAR O CADASTRO DO PRODUTO
#2 - VERIFICAR SE O PRODUTO POSSUI VINCULOS
#2.1 - ITENS_NFV
#2.2 - ITENS_NFC 

DELIMITER //
DROP PROCEDURE IF EXISTS pro_apaga_produto//
CREATE PROCEDURE pro_apaga_produto(IN cod INT)
BEGIN
IF (cod IN (SELECT id_produto FROM produtos)) THEN
	IF (cod NOT IN (SELECT id_produto FROM itens_nfv)) THEN
		IF (cod NOT IN (SELECT id_produto FROM itens_nfc)) THEN
			DELETE FROM produtos
			WHERE cod = id_produto;
		ELSE
			SELECT CONCAT("Produto: ",cod," possui vinculos de compras.") AS MSG;
		END IF;
	ELSE
		SELECT CONCAT("Produto: ",cod," possui vinculos de vendas.") AS MSG;
	END IF;
ELSE
	SELECT CONCAT("Produto: ",cod," não encontrado!") AS MSG;
END IF;
END//
DELIMITER ;

CALL pro_apaga_produto(25);
CALL pro_apaga_produto(13); #excluido
CALL pro_apaga_produto(14); #vinculo 



/*7)Criar uma procedure para listar todos os 
imoveis locados num determinado periodo indicado 
pelo usuario.
Datai - data inicial
Dataf - data final
A procedure deverá receber o periodo a ser 
pesquisado*/
##Codigo Descritivo Proprietario Inquilino Aluguel

DELIMITER //
DROP PROCEDURE IF EXISTS pro_imoveis_periodo //
CREATE PROCEDURE pro_imoveis_periodo (IN datai DATE, dataf DATE)
BEGIN
IF (EXISTS (SELECT * FROM locacao l WHERE l.data_locacao BETWEEN datai AND dataf )) THEN
	SELECT i.id_imovel "Código",
	       i.descritivo "Descritivo",
	       p.nome "Proprietário",
	       inq.nome "Inquilino",
	       CONCAT("R$ ",FORMAT(i.aluguel,2,"DE_de")) "Aluguel"
	FROM imoveis i
	INNER JOIN locacao l ON (l.id_imovel = i.id_imovel)
	INNER JOIN proprietarios p ON (p.id_proprietario = i.id_proprietario)
	INNER JOIN inquilinos inq ON (inq.id_inquilino = l.id_inquilino)
	WHERE l.data_locacao BETWEEN datai AND dataf;
ELSE
	SELECT "Não existem imóveis locados nesse intervalo"  AS MSG;
END IF;
END//
DELIMITER ;

CALL pro_imoveis_periodo("2023-07-10","2024-09-10");
CALL pro_imoveis_periodo("2026-07-10","2027-09-10");
 

/*8)Criar uma procedure para apagar um determinado 
imovel do cadastro.
Obs: 
* Um imovel somente pode ser apagado se existir.
Portanto, caso o imovel não esteja cadastrado, 
o sistema deverá reportar a seguinte mensagem 
para o usuario:
"Imovel não cadastrado".

*Um imovel não poder ser apagado caso esteja 
locado ou tenha sido locado anteriormente. 

Nesse caso a procedure deverá reportar uma 
mensagem para o usuario : "registro de imovel 
com vinculos!!".*/
DELIMITER //
DROP PROCEDURE IF EXISTS proc_apagar_imovel//
CREATE PROCEDURE proc_apagar_imovel (IN cod INT)
BEGIN
IF (cod IN (SELECT id_imovel FROM imoveis)) THEN

   IF (cod NOT IN (SELECT id_imovel FROM locacao)) THEN
   	DELETE FROM imoveis WHERE id_imovel = cod;
   ELSE
      SELECT "Registo de imovel com vinculos." AS msg;   
   END IF;

ELSE
   SELECT "Imovel não cadastrado" AS msg;
END IF;
END//
DELIMITER ;

CALL proc_apagar_imovel(90);

/*9)Criar uma procedure para dar um desconto de X% 
no valor dos imoveis que não estão locados.
A procedure deverá receber o percentual a ser
aplicado de desconto e realizar a operação*/

DELIMITER //
DROP PROCEDURE IF EXISTS proc_desconto_desocupados//
CREATE PROCEDURE proc_desconto_desocupados (IN porcentagem INT)
BEGIN
IF (EXISTS(SELECT COUNT(*) FROM imoveis im LEFT JOIN locacao l ON (l.id_imovel = im.id_imovel) WHERE l.id_locacao IS NULL)) THEN
	UPDATE imoveis 
	SET aluguel = aluguel - aluguel * porcentagem / 100 
	WHERE id_imovel IN (SELECT im.id_imovel FROM imoveis im LEFT JOIN locacao l ON (l.id_imovel = im.id_imovel) WHERE l.id_locacao IS NULL);
ELSE
	SELECT "Não existem imóveis desocupados." AS MSG;
END IF;
END//
DELIMITER ;

CALL proc_desconto_desocupados(10);


/*10)Criar uma procedure para listar todas as disciplinas 
de um determinado curso de acordo com o layout indicado: 
A procedure deverá receber o codigo do 
curso e reportar para o usuario
caso não haja disciplina para esse curso 
ou caso o curso não esteja cadastrado.*/
##Código	Descr. CargaHor.  Valor  Curso


DELIMITER //
DROP PROCEDURE IF EXISTS pro_disciplinas_curso//
CREATE PROCEDURE pro_disciplinas_curso(IN  cod INT)
BEGIN
IF (cod IN(SELECT id_curso FROM cursos)) THEN
	IF (cod IN (SELECT c.id_curso FROM cursos c INNER JOIN disciplinas d ON (c.id_curso = d.id_curso) WHERE c.id_curso = cod)) THEN
		SELECT d.id_disciplina "Código",
		d.descritivo "Descritivo", 
		CONCAT("R$ ",FORMAT(d.valor,2,"de_DE")) "valor",
		c.descritivo "Curso" 
		FROM cursos c INNER JOIN disciplinas d ON (c.id_curso = d.id_curso) 
		WHERE c.id_curso = cod;
	ELSE
		SELECT "Não existem disciplinas cadastradas nesse curso." AS MSG;
	END IF;

ELSE
	SELECT CONCAT("Curso: ",cod," não cadastrado.") AS MSG;
END IF;
END//
DELIMITER ;

CALL pro_disciplinas_curso(18);
CALL pro_disciplinas_curso(1);
CALL pro_disciplinas_curso(11);


/*11)Criar uma procedure para calcular o total 
vendido e o valor a ser pago de comissão para um 
determinado vendedor da empresa em um determinado 
período. 
A procedure deverá receber o código do vendedor e 
o período.*/
#Nome   Totalvendido  %Comissão   ValorComissão

DELIMITER //
DROP PROCEDURE IF EXISTS pro_comissao_periodo//
CREATE PROCEDURE pro_comissao_periodo(IN  cod INT, datai DATE, dataf DATE)
BEGIN
IF (cod IN (SELECT id_vendedor FROM vendedores)) THEN
  IF (cod IN (SELECT id_vendedor FROM nf_vendas WHERE emissao BETWEEN datai AND dataf)) THEN 
    SELECT v.nome Nome, CONCAT("R$",FORMAT(SUM(nfv.valor),2,"de_DE")) "Total vendido", CONCAT(v.comissao,"%") "Comissão", CONCAT("R$",FORMAT(SUM((v.comissao/100)*nfv.valor),2,"de_DE")) "ValorComissão" FROM vendedores v
    INNER JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor) WHERE v.id_vendedor = cod AND emissao BETWEEN datai AND dataf;
  ELSE
    SELECT "Não foram encontradas vendas nesse intervalo." AS msg;  
  END IF;
ELSE
  SELECT CONCAT("Vendedor ", cod," não encontrado!") AS msg;
END IF;
END//
DELIMITER ;

CALL pro_comissao_periodo(1,"2024-02-12","2024-10-01");
CALL pro_comissao_periodo(1,1,1);
CALL pro_comissao_periodo(11);

/*12) Criar uma procedure para apagar um 
determinado curso.A procedure deverá receber 
o codigo do curso e realizar as verificações 
adequadas para efetuar a ação.*/

DELIMITER //
DROP PROCEDURE IF EXISTS pro_apagar_curso//
CREATE PROCEDURE pro_apagar_curso(IN  cod INT)
BEGIN
   IF (cod IN (SELECT id_curso FROM cursos)) THEN
     IF (cod NOT IN (SELECT id_curso FROM disciplinas)) THEN
	IF (cod NOT IN (SELECT id_curso FROM professores)) THEN
	  DELETE FROM cursos WHERE id_curso = cod;
	ELSE
	   SELECT CONCAT("Existem professores relacionados com o curso: ",cod) AS msg;
	END IF;       
     ELSE
       SELECT CONCAT("Existem disciplinas relacionadas com o curso: ",cod) AS msg;
     END IF;
   ELSE
     SELECT CONCAT("Curso ",cod," não encontrado!") AS msg;
   END IF;
END//
DELIMITER ;

CALL pro_apagar_curso(18);
CALL pro_apagar_curso(1);
CALL pro_apagar_curso(11);

/*13) Criar uma procedure para listar o valor
a ser recebido por um proprietario determinado 
pelo usuario.*/
##Codigo  Nome  Valor recebido  
  #            soma dos alugueis dos imoveis
   #           locados menos o %6 da imobiliaria*/
DELIMITER //
DROP PROCEDURE IF EXISTS pro_lucro_proprietario//
CREATE PROCEDURE pro_lucro_proprietario(IN cod INT)
BEGIN
IF (cod IN (SELECT id_proprietario FROM proprietarios)) THEN
  IF (cod IN (SELECT id_proprietario FROM imoveis)) THEN
    IF (EXISTS(SELECT * FROM imoveis i INNER JOIN locacao l ON (i.id_imovel = l.id_imovel) WHERE id_proprietario =  cod)) THEN
      SELECT p.id_proprietario "Código", p.nome "Nome", CONCAT("R$ ",FORMAT((SUM(i.aluguel)*0.94),2,"de_DE")) "Valor Recebido"
      FROM proprietarios p INNER JOIN imoveis i ON (i.id_proprietario = p.id_proprietario) WHERE cod = p.id_proprietario; 
    ELSE
     SELECT CONCAT("Proprietário: ",cod," não possui imoveis alugados.") AS msg; 
    END IF;
  ELSE
    SELECT CONCAT("Proprietário: ",cod," não possui imoveis.") AS msg; 
  END IF;
ELSE
  SELECT CONCAT("Proprietário: ",cod," não encontrado.") AS msg;
END IF;
END//
DELIMITER ;

CALL pro_lucro_proprietario(18);
CALL pro_lucro_proprietario(10);
CALL pro_lucro_proprietario(8);

 
  