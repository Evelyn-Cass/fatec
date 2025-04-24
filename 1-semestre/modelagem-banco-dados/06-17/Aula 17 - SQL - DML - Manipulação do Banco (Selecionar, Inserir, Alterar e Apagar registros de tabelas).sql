/* 
	------------------------------------ 
	- DML - DATA Manipulation LANGUAGE -
	------------------------------------
  
	- DATA MANIPULATION LANGUAGE
	- LINGUAGEM PARA MANIPULAÇÃO DE DADOS:
		- Inserir dados
		- Ler dados
		- Alterar Dados	
		- Apagar dadoS 	
*/



/*
   -------------------------------------------- 
   - INSERT - Inserir dados na Tabela Cliente -
   --------------------------------------------
   
   - Sintaxe: insert into tabela (atributo1,atributo2) values (1,'Nome');

*/


#INSERIR DADOS NA TABELA DE CLIENTE
#PARA ESTE EXEMPLO O CAMPO CLI_CODIGO NÃO É AUTO_INCREMENT, DEVE-SE INSEIR MANUALMENTE O CÓDIGO DO CLIENTE
INSERT 
INTO CLIENTE (cli_codigo, cli_nome, cli_telefone, cli_email, cli_obs) 
VALUES (1,'José da Silva','14999999999','josesilva@gmail.com','Teste Observação');

INSERT 
INTO CLIENTE (cli_codigo, cli_nome, cli_telefone, cli_email, cli_obs) 
VALUES (2,'Mauro José','14999999991','maurojose@gmail.com','Teste Observação');

#CASO O CAMPO DE CÓDIGO SEJA AUTO_INCREMENTE, NÃO É NECESSÁRIO REPASSAR O CÓDIGO
INSERT 
INTO CLIENTE (cli_nome, cli_telefone, cli_email, cli_obs) 
VALUES ('Mauro José','14999999991','maurojose@gmail.com','Teste Observação');



/* 
   -------------------------------- 
   Inserir dados na tabela Tecnico
   --------------------------------
*/

#PARA ESTE EXEMPLO O CAMPO CLI_CODIGO É AUTO_INCREMENT, NÃO É NECESSÁRIO REPASSAR O CÓDIGO
INSERT
INTO tecnico(tecnico_nome,tecnico_telefone)
VALUES('João Alberto','14988887777');

INSERT
INTO tecnico(tecnico_nome,tecnico_telefone)
VALUES('Nome Tecnico 2','14988887777');



/* 
   -------------------------------- 
   Inserir dados na tabela Itens
   --------------------------------
*/

INSERT
INTO itens(item_descricao,item_valor)
VALUES('Produto 1',23.10);

INSERT 
INTO itens(item_descricao,item_valor)
VALUES('Produto 2', 10);

/* 
   -------------------------------- 
   Inserir dados na tabela Serviço
   --------------------------------
*/

INSERT
INTO servico(ser_descricao,ser_horas,ser_valor)
VALUES('Troca Cooler', 1, 25 );

INSERT
INTO servico(ser_descricao,ser_horas,ser_valor)
VALUES('Troca Tela', 2, 100 );



/*

 ------------------------------------
 - SELECT - LER DADOS DE UMA TABELA -
 ------------------------------------
 
 Seleciona (lê) registros de uma tabela
 
 Sinaxe: 
	- select * from tabela;
	- select atributo1, atributo2 from tabela;
*/

#Seleciona todos os registros
SELECT * FROM tabela;

#Seleciona atributos específicos 
SELECT atributo1,atributo2; FROM tabela

#Aplica condição para seleção dos registros 
SELECT * FROM tabela WHERE atributo=condição; 


#Exemplos do modelo que estamos desenvolvendo

#Seleciona todos os atributos da tabela cliente, mas todos os clientes
#não estamos restringindo a consulta neste momento
SELECT * 
FROM cliente;



#Select com condição WHERE

#Seleciona todos os atributos quando o cliente for código =1
#Estamos restringindo, ou limitando a consulta com WHERE
SELECT * 
FROM cliente 
WHERE cli_codigo=1;




#Select com condição like

/* Seleciona todos os atributos da tabela cliente, mas somente os clientes 
que possuem no atributo email o trecho '.br' */
SELECT * 
FROM cliente
WHERE cli_email LIKE '%.br%';

/* Seleciona todos os atributos da tabela cliente, mas somente os clientes 
que possuem no atributo nome um trecho do nome como 'PAUL'*/
SELECT * 
FROM cliente
WHERE cli_nome LIKE '%Paul%';


/* Seleciona todos os equipamentos */
SELECT * FROM equipamento;

/* Seleciona todas as marcas */
SELECT * FROM marca;

/* Seleciona todos os equipamentos aonde o cliente é = 9 */
SELECT * 
FROM equipamento
WHERE fk_cli_codigo=9;

/* Conta quantos registros existem em uma tabela */
SELECT COUNT(*)
FROM cliente;


/*

 ------------------------------------------
 - UPDATE - Atualiza registros de tabelas -
 ------------------------------------------
 
 Sintaxe: 
	- update tabela set atributo=x;
	
*/


#atualizar a tabela marca. 
#Atualizar o campo marca_nome para Positivo. Mas em todos os registros */
UPDATE marca 
SET marca_nome='Positivo';

#atualizar a tabela marca
#e atualizar o campo marca_nome para DELL aonde o codigo da marca é igual a 3 */
UPDATE marca
SET marca_nome='Dell' 
WHERE marca_codigo=3;

#atualizar a tabela marca 
#atualizar o campo codigo com 1, aonde codigo é 2. 
#Para este exemplo, o comando não funcionou, porque não pode existir chave primária igual
UPDATE marca
SET marca_codigo=1
WHERE marca_codigo=2;

#atualizar a tabela cliente e atualizar o campo email para 'josesilva@gmail.com' 
#onde o codigo de cliente é 8
UPDATE cliente
SET cli_email='josesilva@gmail.com'
WHERE cli_codigo=8;

#atualizar a tabela cliente e atualizar o campo obs para 'Brasil' 
#aonde email do cliente contém .br
UPDATE cliente
SET cli_obs='Brasil'
WHERE cli_email LIKE '%.br%';

/*
  ----------------------------------------
  - DELETE - Deleta registros de tabelas -
  ----------------------------------------
 
 
 Sinaxe: 
	- delete from tabela; APAGA TODOS OS REGISTROS (CUIDADO)
	- delete from tabela where atributo=x;
*/

#apaga todos dos dados da tabela cliente
DELETE
FROM cliente; /* Cuidado ao utilizar pois elimina todos os dados da tabela*/

#apaga o registro do cliente de codigo 2
DELETE
FROM cliente 
WHERE cli_codigo=2;

#apagar da tabela cliente onde o telefone é 14999999999
DELETE
FROM cliente
WHERE cli_telefone='14999999929';


