/*Exercicios1: (faculdade)               
Criar uma query para listar o numero de alunos do sexo 
masculino e feminino em cada curso da faculdade*/
#Codigo    Descritivo     Homens     Mulheres   TotalAlunos
#  1       Direito          10          15         25

SELECT c.id_curso "Código", 
	c.descritivo "Decritivo",
	(SELECT COUNT(id_curso) FROM alunos WHERE sexo="M" AND id_curso = c.id_curso) "Homens",
	(SELECT COUNT(id_curso) FROM alunos WHERE sexo="F" AND id_curso = c.id_curso)"Mulheres",
	(SELECT COUNT(id_curso) FROM alunos WHERE id_curso = c.id_curso) "Total Alunos"
FROM cursos c;

SELECT COUNT(id_curso) FROM alunos WHERE sexo="M" AND id_curso = c.id_curso;
SELECT COUNT(id_curso) FROM alunos WHERE sexo="F" AND id_curso = c.id_curso;
SELECT COUNT(id_curso) FROM alunos WHERE id_curso = c.id_curso;

/*Exercicios2: (rh_empresa)
Crie uma query que liste informações dos funcionários de acordo com
o layout abaixo:*/ 
#Codigo   Nome     Salário          Filhos       Filhas      TotalFilhos    
#  1      wdson    R$ 000.00          2             0         2

SELECT COUNT(id_funcionario) FROM dependentes WHERE sexo="F" AND id_funcionario = f.id_funcionario;
SELECT COUNT(id_funcionario) FROM dependentes WHERE sexo="M" AND id_funcionario = f.id_funcionario;
SELECT COUNT(id_funcionario) FROM dependentes WHERE id_funcionario = f.id_funcionario;

SELECT f.id_funcionario "Código",
	f.nome "Nome",
	CONCAT("R$ ",FORMAT(f.salario,2,"de_DE")) "Salário",
	(SELECT COUNT(id_funcionario) FROM dependentes WHERE sexo="M" AND id_funcionario = f.id_funcionario) "Filhos",
	(SELECT COUNT(id_funcionario) FROM dependentes WHERE sexo="F" AND id_funcionario = f.id_funcionario) "Filhas",
	(SELECT COUNT(id_funcionario) FROM dependentes WHERE id_funcionario = f.id_funcionario) "Total Filhos"
FROM funcionarios f;



/*Exercicios3: (imobiliaria)
Criar uma query para listar o numero de imoveis locados e não 
locados e o total de imoveis por tipo */
#Codigo      Tipo         Locados   NãoLocados    Total imoveis
#  1       Apartamento       1          2              3
 
 SELECT t.id_tipo "Código", 
	t.descritivo "Tipo",
	(SELECT COUNT(im.id_imovel) FROM locacao l INNER JOIN imoveis im ON (im.id_imovel = l.id_imovel) WHERE im.id_tipo = t.id_tipo) "Locados",
	(SELECT COUNT(im.id_imovel) FROM imoveis im LEFT JOIN locacao l ON (l.id_imovel = im.id_imovel) WHERE l.id_locacao IS NULL AND im.id_tipo = t.id_tipo) "Não Locados",
	(SELECT COUNT(im.id_imovel) FROM imoveis im LEFT JOIN locacao l ON (l.id_imovel = im.id_imovel) WHERE im.id_tipo = t.id_tipo) "Total"
FROM tipos t
GROUP BY t.id_tipo;
 
 

 