### Comandos DML ###

DELETE FROM especialidades
WHERE id_especialidade = 11;

UPDATE exames SET valor = valor * 1.10; -- aumento de 10% do valor nos exames
UPDATE exames SET valor = valor + (valor * 0.10); -- aumento de 10% do valor nos exames

UPDATE exames SET valor =  valor + (valor * 0.10)
WHERE valor < 200;


UPDATE exames SET valor =  valor + (valor * 0.10)
WHERE valor BETWEEN 10 AND 200;


UPDATE exames SET valor =  valor + (valor * 0.10)
WHERE valor IN (80,150); -- atualiza somente o 80 e 150

UPDATE pacientes SET cidade = "Rio de Janeiro",
bairro = "Ipanema", estado = "RJ"
WHERE id_paciente = 1;

SELECT id_medico "Código",  nome "Nome" -- com os sem AS
FROM medicos
WHERE id_especialidade = 1;

SELECT id_medico AS Código,  nome AS Nome 
FROM medicos
WHERE id_especialidade = 1;

### Inner Join = Junção ###

SELECT m.id_medico "Código", m.nome "Nome", e.descritivo "Especialização"
FROM medicos m INNER JOIN especialidades e
ON (m.id_especialidade = e.id_especialidade);

## Exercício 1 - Listar todas as consultas realizadas pelo médicos.
-- Date_format (campo datax, "%d/%m/%Y")
-- Código nome Data_Consulta Horário_Consulta

SELECT m.id_medico "Código", m.nome "Nome", DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta" , a.horario_a "Horário_Consulta"
FROM medicos m INNER JOIN atendimentos a
ON (m.id_medico = a.id_medico) 
ORDER BY m.id_medico;

-- ASC - ascendente - default
-- DESC - Descendente

## Exercício 2 - Listar todas as consultas realizadas pelos pacientes femininos.
-- Código Nome Sexo Data_Consulta Horário_Consulta

SELECT p.id_paciente "Código", p.nome "Nome", p.sexo "Sexo", DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta", a.horario_a "Horário_Consulta"
FROM pacientes p INNER JOIN atendimentos a
ON (p.id_paciente = a.id_paciente)
WHERE p.sexo = "F"
ORDER BY p.id_paciente;

## Exercício 3 - Listar todas as consultas realizadas pelos médicos do sexo feminino.
## Classificar a listagem em ordem Alfabetica.

SELECT m.id_medico "Código", m.nome "Nome", e.descritivo "Especialidade", 
	DATE_FORMAT(a.data_a,"%d/%m/%Y") "Data_Consulta", p.nome "Paciente"
FROM atendimentos a 
	INNER JOIN medicos m ON (m.id_medico = a.id_medico)
	INNER JOIN pacientes p ON (p.id_paciente = a.id_paciente)
	INNER JOIN especialidades e ON (m.id_especialidade = e.id_especialidade)
WHERE m.sexo = "F"
ORDER BY m.nome ASC;

## Exercício 4 - Listar todas exames realizados.
## Classificar a listagem pelo descritivo do exame em ordem DESC.
## FORMAT(valor,2,"de_DE") (campo,valores depois da virgula, troca . por ,)
##codigo descritivo valor data_exame paciente

SELECT r.id_realizae "Código", e.descritivo "Descritivo", FORMAT(e.valor,2,"de_DE") "Valor", 
	DATE_FORMAT(r.data_e,"%d/%m/%Y") "Data_Exame", p.nome "Paciente"
FROM exames e 
	INNER JOIN realiza_exames r ON (e.id_exame = r.id_exame)
	INNER JOIN pacientes p ON (r.id_paciente = p.id_paciente)
ORDER BY e.descritivo DESC;


## Exercício 5 - Listar os exames que nunca foram realizados
## Código Descritivo Valor(0.000,00) 

SELECT e.id_exame "Código",e.descritivo "Descritivo", FORMAT(e.valor,2,"de_DE") "Valor"
FROM exames e
	LEFT JOIN realiza_exames r ON (e.id_exame = r.id_exame)
	WHERE r.id_exame IS NULL;
	
	
## Exercício 6 - Listar os médicos que nunca realizaram consultas.
## Classificar a listagem em ordem de nascimento(mais velhor p/ mais novo)
## Código nome data_nascimento especialidade(descritivo)

SELECT m.id_medico "Código", m.nome "Nome", DATE_FORMAT(m.data_nasc,"%d/%m/%Y") "Data_Nascimento",
	e.descritivo "Especialidade"
FROM medicos m
	LEFT JOIN atendimentos a ON (m.id_medico = a.id_medico)
	INNER JOIN especialidades e ON (m.id_especialidade = e.id_especialidade)
WHERE a.id_atendimento IS NULL
ORDER BY m.data_nasc;

## Exercício 7 - Listar pacientes do sexo masculino que nunca realizaram exames.
## Código nome sexo

SELECT p.id_paciente "Código", p.nome "Nome", p.sexo "Sexo" 
FROM pacientes p
	LEFT JOIN realiza_exames r ON (p.id_paciente = r.id_paciente)
WHERE r.id_paciente IS NULL AND p.sexo="M";