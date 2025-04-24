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