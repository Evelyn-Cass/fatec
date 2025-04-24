#======================================#
###    Subquery´s - select aninhados ###
#======================================#
#Regras para a construção de Subqueries:
#======================================#
/*Podem ser muito úteis quando é preciso selecionar 
dados de uma tabela com uma condição que dependa da 
própria tabela ou de outras.

É possível utilizar uma subquery em várias 
cláusulas: SELECT, WHERE, HAVING e FROM.
Operadores pode ser de 2 tipos:	
	*Operadores de Uma Linha (=, >, >=, <, <=, <>).
	*Operadores de Múltiplas Linhas (IN). */
======================================================

SELECT campo1, campo2, (subquery), ....
FROM tabela1 INNER JOIN (subquery)
WHERE campox IN (subquery) AND campoy >= (subquery)
GROUP BY
HAVING campo < (subquery)

======================================================;


#Exemplos#

#Ex1-Quais funcionários tem o salário maior do que o 
#salário do funcionário cujo codigo = 1.
#Código     Nome      Salário   

-- Achar o salário do funcionario = 1
SELECT f.salario
FROM funcionarios f
WHERE f.id_funcionario = 1;

-- Principal

SELECT id_funcionario "Código", nome "Nome", salario "Salário"
FROM funcionarios
WHERE salario > (SELECT salario
		FROM funcionarios
		WHERE id_funcionario = 1);


#Ex2-Quais funcionários tem o salário maior do que o 
#salário do funcionário cujo codigo = 1 e que participam 
#do projeto cujo codigo = 3.
-- Código       Nome        Salário 

SELECT f.id_funcionario "Código", f.nome "Nome", f.salario "Salário"
FROM funcionarios f
INNER JOIN funcionarios_projetos fp ON (f.id_funcionario = fp.id_funcionario)
WHERE salario > (SELECT salario
		FROM funcionarios
		WHERE id_funcionario = 1)
AND fp.id_projeto = 3;


SELECT f.id_funcionario "Código", f.nome "Nome", CONCAT("R$ ",FORMAT(f.salario,2,"DE_de")) "Salário"
FROM funcionarios f
WHERE salario > (SELECT salario
		FROM funcionarios
		WHERE id_funcionario = 1)
AND f.id_funcionario IN (SELECT id_funcionario
			FROM funcionarios_projetos
			WHERE id_projeto = 3);


-- achando funcionarios que trabalham no projeto 3
SELECT id_funcionario
FROM funcionarios_projetos
WHERE id_projeto = 3;

#Ex3-Listar os funcionários cujo valor do salário é igual 
#ao menor salário cadastrado na empresa.*/

-- Código    Nome      Sexo  Cargo     Salário

-- menor Salario
SELECT MIN(salario)
FROM funcionarios ;

SELECT f.id_funcionario "Código", f.nome "Nome", f.sexo "Sexo",c.descritivo "Cargo", CONCAT("R$ ",FORMAT(f.salario,2,"DE_de")) "Salário"
FROM funcionarios f
INNER JOIN cargos c ON (c.id_cargo = f.id_cargo)
WHERE f.salario = (SELECT MIN(salario)
FROM funcionarios);




#Ex4-Listar todos os funcionários que possuem salários 
#abaixo da média dos salários entre todos os funcionários 
#da empresa 
	
-- Código     Nome     Salário     Departamento(descritivo)
                                    
SELECT f.id_funcionario "Código", f.nome "Nome", CONCAT("R$ ",FORMAT(f.salario,2,"DE_de")) "Salário", d.descritivo "Departamento"
FROM funcionarios f
INNER JOIN departamentos d ON (d.id_departamento = f.id_departamento)
WHERE f.salario < (SELECT AVG(salario)
		   FROM funcionarios);


-- media de salario

SELECT AVG(salario)
FROM funcionarios;


#Ex6-Criar uma query para reajustar em 10% o salario de 
#todos os funcionarios com numero de dependentes maior 
#do que 2.

SELECT f.id_funcionario "Código", f.nome "Nome", COUNT(d.id_dependente) "Dependentes",
	CONCAT("R$ ",FORMAT(f.salario,2,"DE_de")) "Salário", 
	CONCAT("R$ ",FORMAT((f.salario * 1.10),2,"DE_de"))  "Novo Salário"
FROM funcionarios f
INNER JOIN dependentes d ON (d.id_funcionario = f.id_funcionario)
GROUP BY f.id_funcionario
HAVING COUNT(id_dependente) > 2;


-- só funcionarios com > 2 dependentes
SELECT id_funcionario
FROM dependentes
GROUP BY id_funcionario
HAVING COUNT(id_dependente)>2;

SELECT f.id_funcionario "Código", f.nome "Nome",
	CONCAT("R$ ",FORMAT(f.salario,2,"DE_de")) "Salário", 
	CONCAT("R$ ",FORMAT((f.salario * 1.10),2,"DE_de"))  "Novo Salário"
FROM funcionarios f
WHERE f.id_funcionario IN (SELECT id_funcionario
FROM dependentes
GROUP BY id_funcionario
HAVING COUNT(id_dependente)>2);


UPDATE funcionarios
SET salario = salario * 1.1
WHERE id_funcionario IN (SELECT id_funcionario
			 FROM dependentes
                         GROUP BY id_funcionario
                         HAVING COUNT(id_dependente)>2);


#Ex7-Liste todos os dependentes que possuem idade maior 
#ou igual a idade média de todos os dependentes cadastrados 
#na empresa.

-- Código     Nome     Sexo     Idade     Média_Idades

	
-- media de idade de dependentes

SELECT AVG(YEAR(CURRENT_DATE) - YEAR(datan))
FROM dependentes;

SELECT id_dependente "Código", nome "Nome", sexo "Sexo", 
	YEAR(CURRENT_DATE) - YEAR(datan) "Idade", 
	FORMAT((SELECT AVG(YEAR(CURRENT_DATE) - YEAR(datan)) FROM dependentes),0) "media_idade"
FROM dependentes
WHERE (YEAR(CURRENT_DATE) - YEAR(datan)) >= (SELECT AVG(YEAR(CURRENT_DATE) - YEAR(datan)) FROM dependentes);

#Ex08 - Listar os departamentos que possuem 2 ou mais funcionarios
-- Código Descritivo

SELECT d.id_departamento
FROM departamentos d
INNER JOIN funcionarios f ON (f.id_departamento = d.id_departamento)
GROUP BY d.id_departamento
HAVING COUNT(d.id_departamento) >= 2;


SELECT id_departamento "Código", descritivo "Departamento"
FROM departamentos
WHERE id_departamento IN (SELECT d.id_departamento
			 FROM departamentos d
			 INNER JOIN funcionarios f ON (f.id_departamento = d.id_departamento)
			 GROUP BY d.id_departamento
			 HAVING COUNT(d.id_departamento) >= 2);