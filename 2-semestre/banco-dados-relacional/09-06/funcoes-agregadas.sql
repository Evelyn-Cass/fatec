# Funções Agregadas - Agrupamento 
## SUM(param) - Soma Valores(INT, FLOAT)
## AVG(param) - Média Aritmética(INT, FLOAT)
## COUNT(param) - Contador de Registros(ID)
## MAX(param) - Maior Elemento do Grupo
## MIN(param) - Menor Elemento do Grupo

## DAY(campo) - Extrai o dia de um campo DATE
## MOTH(campo) - Extrai o més de um campo DATE
## YEAR(campo) - Extrai o ano de um campo DATE
## CURRENT_DATE() - Data do Sistema
## NOW() - DATA E HORA


## BETWEEN - pega entre e os extremos
## IN - pega entre 

SELECT COUNT(*) "Nº de médicos cadastrados"
FROM medicos
WHERE sexo = "F" AND YEAR(data_nasc) > 1990;

# Ex2 - Contar quantos atendimentos foram realizados na clinica.

SELECT COUNT(*) "Nº de atendimentos"
FROM atendimentos
WHERE data_a BETWEEN "2024-08-01" AND "2024-08-10" 
AND id_medico IN (3,4,5);

# Ex3 - Calcular a média das idades entre todos os médicos.

SELECT FORMAT(AVG(YEAR(CURRENT_DATE()) - YEAR(data_nasc)),2) "Média das idades dos médicos"
FROM medicos;

# Ex4 - Calcular a média dos valores de exames cadastrados

SELECT CONCAT("R$ ",FORMAT(AVG(valor),2,"de_DE")) "Média dos valores de exames"
FROM exames;

# Ex5 - Calcular a receita da clinica dos atendimentos
# considerando o valor da consulta padrão R$ 250,00

SELECT CONCAT("R$ ",FORMAT(COUNT(a.id_atendimento) * 250,2,"de_DE")) "Receita da Clínica"
FROM atendimentos a
INNER JOIN medicos m ON (m.id_medico = a.id_medico)
WHERE m.sexo = "F";

#Ex6 - Achar o exame com maior valor (caro)

SELECT MAX(e.valor) "Exame mais caro"
FROM exames e;

#Ex6 - Achar o exame com menor valor (barato)

SELECT MIN(e.valor) "Exame mais barato"
FROM exames e;


#Ex6 - Achar o exame com maior e menor valores (barato)

SELECT MIN(e.valor) "Exame mais barato", MAX(e.valor) "Exame mais caro"
FROM exames e;