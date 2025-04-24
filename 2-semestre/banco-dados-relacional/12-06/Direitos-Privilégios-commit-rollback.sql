/*============================================
# Privilégios para manipular os dados dos BDs#
==============================================*/

Privilégio	Descrição
==========  ==============================
INSERT	    #Inserir dados em uma tabela
UPDATE	    #Atualizar dados em uma tabela
DELETE	    #Excluir dados de uma tabela
EXECUTE	    #Executar procedimentos armazenados
SELECT	    #Efetuar consultas em uma tabela

/*========================================
Privilégios para modificar a estrutura do 
banco de dados:
==========================================*/

Privilégio	Descrição
==========  ==========================================
CREATE	      #Criar tabela ou banco de dados
ALTER	      #Modificar uma tabela
DROP	      #Excluir uma tabela ou um banco de dados
CREATE VIEW   #Criar exibições
TRIGGER	      #Criar ou excluir um trigger em uma tabela
CREATE ROUTINE#Criar uma um procedimento armazenado
ALTER ROUTINE #Alterar ou excluir procedimento armazenado

/*==============================
/* Privilégios Administrativos 
================================*/

Privilégio	Descrição
==========   ==================================
SHUTDOWN     #Desligar o servidor

ALL	     #Todos os privilégios disponíveis em um 
             #determinado nível,exceto GRANT OPTION
GRANT OPTION #Permite dar privilégios a outros usuários

/*==========================
## Níveis dos privilégios ##
============================*/

#No MySQL os privilégios são atribuídos em quatro 
#níveis diferentes:

GLOBAL 	 –#O usuário tem acesso a todas as tabelas 
          #de todos os bancos de dados.
           
DATABASE –#Esse privilégio dá ao usuário acesso a 
          #todas as tabelas de um banco de dados 
          #específico.
           
TABLE    –#O usuário tem acesso a todas as colunas 
	  #de uma tabela específica em um banco de 
	  #dados.
           
COLUMN   –#O usuário possui acesso apenas a colunas 
	  #especificadas em uma determinada tabela.

#============================#
##     Criando um usuario   ##
#============================#

CREATE USER nome_do_usuario@servidor 
IDENTIFIED BY 'senha'
dbfunc
/*#Exemplo# 

#Criar o usuario com o nome fulano no servidor 
localhost */

CREATE USER fulano@localhost 
IDENTIFIED BY '123';

SHOW GRANTS FOR fulano@localhost;

## apagando um usuario
DROP USER nome_do_usuario@servidor;

#Exemplo
DROP USER fulano@localhost;

/*=============================
Conceder e revogar Privilégios 
          GRANT - REVOKE
==============================*/

#Conceder#
GRANT <privilégios> [colunas] 
ON <*.* | db.* | db.tabela> 
TO usuario 
[IDENTIFIED BY PASSWORD 'senha']

#Revogar# 
REVOKE <tipo_previlegio>
ON <tipo_objeto nivel_priv>
FROM usuario

#==========================================#

/*Exemplo1 – Conceder acesso a um usuário de 
nome carlos,sem privilégios:*/

GRANT USAGE ON *.*
TO carlos@localhost 
IDENTIFIED BY '123';

/*Visualizar os privilégios do usuário carlos*/ 
SHOW GRANTS FOR carlos@localhost;

/*Visualizar os privilégios do usuário root*/ 
SHOW GRANTS FOR root@localhost;

/*Apagar o usuário carlos da tabela de usuários*/
DROP USER carlos@localhost;
#================================================

/*Exemplo2 -Conceder privilégios globais a um 
usuário de nome user1*/

GRANT ALL ON *.* 
TO user1@localhost
IDENTIFIED BY '123' 
WITH GRANT OPTION; 

SHOW GRANTS FOR user1@localhost;

/*Revogar os direitos concedidos para o user1*/

REVOKE ALL ON *.* 
FROM user1@localhost;

SHOW GRANTS FOR user1@localhost;

DROP USER user1@localhost;
#============================================

/*Exemplo3-Conceder todos os previlégios 
para execução de comandos DML em todas as 
tabelas do banco imobiliaria ao usuário 
user2 */ 

GRANT SELECT, INSERT, UPDATE, DELETE 
ON imobiliaria.*
TO user2@localhost
IDENTIFIED BY '123';

SHOW GRANTS FOR user2@localhost;

/*Revogar os direitos concedidos para o user2*/
REVOKE DELETE ON imobiliaria.* 
FROM user2@localhost;

DROP USER user2@localhost ;
#============================================

/*Exemplo4 - Conceder privilégio de consultar 
a tabela alunos do banco de dados faculdade 
ao usuário user3:*/ 

GRANT SELECT ON faculdade_wds.alunos
TO user3@localhost
IDENTIFIED BY '123';

SHOW GRANTS FOR user3@localhost;

GRANT DELETE ON faculdade_wds.alunos
TO user3@localhost
IDENTIFIED BY '123';

/*Revogar os direitos concedidos para o user3*/
REVOKE DELETE ON faculdade_wds	.alunos
FROM user3@localhost;

DROP USER user3@localhost;
#===========================================

/*Exemplo5 - Concede previlégio somente de 
consultar as colunas id_aluno e nome da 
tabela alunos */

GRANT SELECT (id_aluno,nome) X
ON faculdade_wds.alunos
TO user4@localhost
IDENTIFIED BY '123';

SHOW GRANTS FOR user4@localhost;

/*Revogar os direitos concedidos para o user4 */
REVOKE SELECT(id_aluno,nome) 
ON faculdade_wds.alunos
FROM user4@localhost;

DROP USER user4@localhost;

#=======================================#
#==  Alterando a senha de um usuário ==##
#=======================================#

SET PASSWORD FOR 
usuario@servidor = PASSWORD('senha');

/*Exemplo6 - Alterar a senha do usuário 
wdson de 123 para user123 */

CREATE USER wdson@localhost 
IDENTIFIED BY '123'

SET PASSWORD FOR 
wdson@localhost = PASSWORD('user123');

DROP USER wdson@localhost


/*=================================
=========== Transações ============
===================================*/

COMMIT 		  #salva as informações na base 
                  #efetivamente
ROLLBACK 	  #retorna a situação anterior
SET autocommit=0; #desabilita a gravação no banco 
                  #automática

#Exemplo1:

SET autocommit=0;

INSERT INTO cursos (descritivo) 
VALUES ('Culinaria Asiática');

ROLLBACK;

COMMIT;

#Exemplo2:

SET autocommit=0;

UPDATE disciplinas SET valor = 150.00;

ROLLBACK;

COMMIT;