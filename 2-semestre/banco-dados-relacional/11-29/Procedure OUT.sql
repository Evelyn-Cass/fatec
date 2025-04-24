/*=================================
Exemplo: utilizando parametro OUT
==================================*/


-- distinct - mostra somente uma vez o id - eliminando repetição

#rh_empresa#
/* Exemplo1-Criar uma Procedure para calcular a soma 
dos salários dos funcionarios de uma determinada unidade 
da empresa identificando o nome da unidade.
Entrada : codigo da unidade
saida   : nome da unidade e o valor da folhaPagto*/

DELIMITER //
DROP PROCEDURE IF EXISTS proc_calculafp_unidade //
CREATE PROCEDURE proc_calculafp_unidade  
  (IN codu INT, OUT nomeu VARCHAR(100), OUT folhau DECIMAL(8,2))
BEGIN
  ### Corpo da Procedure ##
  IF (codu IN (SELECT id_empresa FROM empresas)) THEN
   IF (codu IN (SELECT  DISTINCT(id_empresa) FROM funcionarios)) THEN
     SELECT e.descritivo,SUM(f.salario) INTO nomeu, folhau 
     FROM empresas e INNER JOIN funcionarios f
     ON (e.id_empresa=f.id_empresa)
     WHERE codu = e.id_empresa;
   ELSE
    SELECT "Unidade não possui funcionarios" AS msg;
   END IF;  
  ELSE
   SELECT "Unidade não cadastrada" AS msg;
  END IF;
END
//
DELIMITER ;

#Aplicação
CALL proc_calculafp_unidade(3,@nunid,@tfp);

## teste de verificação das informações na memória
SELECT  @nunid "Unidade da empresa", 
        @tfp "Folha de pagamento da unidade"



# faculdade #
/* Exemplo2 -Criar uma procedure que calcula a mensalidade 
que um determinado aluno vai pagar indicando o nome do aluno 
e o valor da mensalidade.
Entrada : codigo do aluno.
Saida   : nome do aluno e o valor da mensalidade*/

DELIMITER //
DROP PROCEDURE IF EXISTS proc_boleto_mensalidade //
CREATE PROCEDURE proc_boleto_mensalidade
 (IN coda INT, OUT nomea VARCHAR(100),OUT mensalidade DECIMAL(8,2))
BEGIN
 IF (coda IN (SELECT id_aluno FROM alunos)) THEN 
   IF (coda IN (SELECT id_aluno FROM matriculas)) THEN 
    SELECT a.nome,SUM(d.valor) INTO nomea, mensalidade
    FROM alunos a INNER JOIN matriculas ad
    ON (a.id_aluno=ad.id_aluno) INNER JOIN disciplinas d
    ON (ad.id_disciplina=d.id_disciplina)
    WHERE coda = a.id_aluno;
   ELSE
    SELECT "Aluno não possui disciplinas " AS msg;
   END IF;
 ELSE
  SELECT "Aluno não cadastrado " AS msg;
 END IF;
END//
DELIMITER ; 

CALL proc_boleto_mensalidade(1,@naluno,@maluno);

CALL proc_boleto_mensalidade(2,@naluno,@maluno);

CALL proc_boleto_mensalidade(3,@naluno,@maluno);

CALL proc_boleto_mensalidade(4,@naluno,@maluno);

SELECT @naluno "Nome do aluno", 
 CONCAT("R$ ",FORMAT(@maluno,2,"de_DE")) "Valor da Mensalidade";

