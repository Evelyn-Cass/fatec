# DML - Faculdade WDS
## EX01 - Contar o número de alunos do sexo masculino da faculdade.

SELECT COUNT(*) "Nº de Alunos do sexo Masculino"
FROM alunos
WHERE sexo = "M";

##EX02 - Calcular a receita da faculdade.
##A receita da faculdade é a soma dos valores dos valores de
##todas as disciplinas que estão sendo cursadas.

SELECT CONCAT("R$ ",FORMAT(SUM(d.valor),2,"de_DE")) "Receita da Faculdade"
FROM disciplinas d
INNER JOIN matriculas m ON (d.id_disciplina = m.id_disciplina);

##EX03 - Calcular a receita da de cada curso da faculdade

SELECT c.id_curso "Código", c.descritivo "Descritivo", CONCAT("R$ ",FORMAT(SUM(d.valor),2,"de_DE")) "Receita"
FROM disciplinas d
INNER JOIN matriculas m ON (d.id_disciplina = m.id_disciplina)
INNER JOIN cursos c ON (c.id_curso = d.id_curso)
GROUP BY c.id_curso
ORDER BY SUM(d.valor) DESC
LIMIT 1;

-- 13-09 --

# Ex01 - Calcular o número de alunos do sexo feminino 
# em cada curso. Classificar a listagem em order alfabetica
# código curso nº de alunos 

SELECT c.id_curso "Código", c.descritivo "Curso", COUNT(a.id_aluno) "Nro_alunas"
FROM cursos c
INNER JOIN alunos a ON (c.id_curso = a.id_curso)
WHERE a.sexo ="F"
GROUP BY a.id_curso
HAVING COUNT(a.id_aluno) > 5
ORDER BY c.descritivo;


CREATE OR REPLACE VIEW vw_listagem_curso AS
	SELECT c.id_curso "Codigo", c.descritivo "Curso", COUNT(a.id_aluno) "Nro_alunos"
	FROM cursos c
	INNER JOIN alunos a ON (c.id_curso = a.id_curso)
	GROUP BY a.id_curso
	ORDER BY c.descritivo;

SELECT * FROM vw_listagem_curso;

#Ex02 - Calcular o número de disciplinas ministradas por cada professor. Classificar a listagem em ordem 
#alfabetica pelo nome do professor
-- Código Professor Curso Nro_disciplinas

SELECT p.id_professor "Código", p.nome "Professor", c.descritivo "Curso", COUNT(d.id_disciplina) "Nro_disciplinas"
FROM professores p
INNER JOIN disciplinas d ON (p.id_professor = d.id_professor)
INNER JOIN cursos c ON (c.id_curso = p.id_curso)
GROUP BY p.id_professor
ORDER BY p.nome;

CREATE OR REPLACE VIEW vw_professor_disciplinas AS
	SELECT p.id_professor "Codigo", p.nome "Professor", c.descritivo "Curso", COUNT(d.id_disciplina) "Nro_disciplinas"
	FROM professores p
	INNER JOIN disciplinas d ON (p.id_professor = d.id_professor)
	INNER JOIN cursos c ON (c.id_curso = p.id_curso)
	GROUP BY p.id_professor
	ORDER BY p.nome;

SELECT *
FROM vw_professor_disciplinas;

#Ex03 - Calcular o número de alunos matriculados em cada disciplina. Classificar a listagem pelo id_disciplina
-- Código Disciplina Curso Nro_alunos


SELECT d.id_disciplina "Código", d.descritivo "Disciplina", c.descritivo "Curso", COUNT(m.id_aluno) "Nro_alunos"
FROM matriculas m
INNER JOIN disciplinas d ON(d.id_disciplina = m.id_disciplina)
INNER JOIN cursos c ON (c.id_curso = d.id_curso)
GROUP BY d.descritivo
ORDER BY d.id_disciplina;

CREATE OR REPLACE VIEW vw_disciplina_alunos AS
	SELECT d.id_disciplina "Código", d.descritivo "Disciplina", c.descritivo "Curso", COUNT(m.id_aluno) "Nro_alunos"
	FROM matriculas m
	INNER JOIN disciplinas d ON(d.id_disciplina = m.id_disciplina)
	INNER JOIN cursos c ON (c.id_curso = d.id_curso)
	GROUP BY d.descritivo
	ORDER BY d.id_disciplina;

SELECT * FROM vw_disciplina_alunos;

#EX04 - Calcular a mensalidade que cada aluno paga pelas disciplinas cursadas.
# Classificar a listagem pelo nome do aluno.
-- Código Nome Curso Valor_Mensalidade(R$0.00,00)

SELECT a.id_aluno "Código", a.nome "Nome", c.descritivo "Curso", COUNT(m.id_aluno) "Nº de disciplinas" ,
CONCAT("R$ ",FORMAT(SUM(d.valor),2,"de_DE")) "Valor Mensalidade"
FROM alunos a
INNER JOIN matriculas m ON (m.id_aluno = a.id_aluno)
INNER JOIN cursos c ON (c.id_curso = a.id_curso)
INNER JOIN disciplinas d ON (d.id_disciplina = m.id_disciplina)
GROUP BY a.id_aluno
ORDER BY a.nome;

CREATE OR REPLACE VIEW vw_mensalidade AS
	SELECT a.id_aluno "Código", a.nome "Nome", c.descritivo "Curso", COUNT(m.id_aluno) "Nº de disciplinas" ,
	CONCAT("R$ ",FORMAT(SUM(d.valor),2,"de_DE")) "Valor Mensalidade"
	FROM alunos a
	INNER JOIN matriculas m ON (m.id_aluno = a.id_aluno)
	INNER JOIN cursos c ON (c.id_curso = a.id_curso)
	INNER JOIN disciplinas d ON (d.id_disciplina = m.id_disciplina)
	GROUP BY a.id_aluno
	ORDER BY a.nome;

SELECT * FROM vw_mensalidade;

#EX05 - Calcular a média das notas das disciplinas por curso,
# classificar a listagem pela média em ordem decrescente
-- Código Curso Média

SELECT c.id_curso, c.descritivo, FORMAT(SUM(m.media_final)/COUNT(m.media_final),2) "Média"
FROM matriculas m
INNER JOIN disciplinas d ON (d.id_disciplina = m.id_disciplina)
INNER JOIN cursos c ON (c.id_curso = d.id_curso)
GROUP BY c.id_curso
ORDER BY SUM(m.media_final)/COUNT(m.media_final);
