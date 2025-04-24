## Evelyn Cassinotte
## 1.(rh_empresa) Criar uma procedure para apagar um determinado projeto da tabela de projetos da empresa. 
## Efetuar todas as validações necessárias para que a tarefa seja realizada. A procedure deverá receber o código do projeto. (2.5)
## Verificar se o projeto está cadastrado. Se sim, ir para o próximo passo, senão, reportar a seguinte mensagem “Projeto não cadastado”.
## Verificar se o projeto está associado a algum funcionário. Se sim, reportar a seguinte mensagem 
## “Projeto não pode ser apagado, pois possui vínculos com funcionários”, senão, apagar o projeto.

DELIMITER //
DROP PROCEDURE IF EXISTS pro_apagar_projeto //
CREATE PROCEDURE pro_apagar_projeto (IN cod INT)
BEGIN
IF (cod IN (SELECT id_projeto FROM projetos)) THEN
  IF (cod NOT IN (SELECT id_projeto FROM funcionarios_projetos)) THEN
   DELETE FROM projetos WHERE id_projeto = cod;
  ELSE
    SELECT CONCAT("Projeto[cod: ",cod,"] não pode ser apagado, pois possui vínculos com funcionários.") AS msg;
  END IF;
ELSE
  SELECT CONCAT("Projeto[cod: ",cod,"] não cadastrado.") AS msg; 
END IF;

END //
DELIMITER ;

CALL pro_apagar_projeto(1); ##saida esperada: Projeto[cod: 1] não pode ser apagado, pois possui vínculos com funcionários.
CALL pro_apagar_projeto(25); ## saida esperada: Projeto[cod: 25] não cadastrado.
INSERT INTO projetos (id_projeto,descritivo, bonus) VALUES (5, "teste", 5);
CALL pro_apagar_projeto(5); ##saida esperada: exclusão dos dados do projeto id_projeto = 5


## 2.(faculdade) Criar uma procedure para calcular e apresentar a mensalidade que um aluno irá pagar pelas disciplinas nas quais está matriculado,
## bem como o curso que o mesmo faz. A procedure deverá receber o código do aluno e verificar: (2,5)
##· Verificar se o aluno está cadastrado no sistema. Se sim, ir para o próximo passo, senão, reportar a seguinte mensagem “Aluno não cadastrado”.
##· Verificar se o aluno está matriculado em alguma disciplina. Se sim, calcular a mensalidade, senão, 
## reportar a seguinte mensagem “Aluno não possui disciplinas associadas a ele”.
# Código_Aluno Nome_Aluno Curso_Aluno Valor_Mensalidade


DELIMITER //
DROP PROCEDURE IF EXISTS pro_mensalidade //
CREATE PROCEDURE pro_mensalidade (IN cod INT)
BEGIN
IF (cod IN (SELECT id_aluno FROM alunos)) THEN
  IF (cod IN (SELECT id_aluno FROM matriculas)) THEN
    SELECT a.id_aluno "Código_Aluno", a.nome "Nome_Aluno", c.descritivo "Curso_Aluno", CONCAT("R$ ",FORMAT(SUM(d.valor),2,"de_DE")) "Valor_Mensalidade" 
    FROM alunos a INNER JOIN matriculas m ON (m.id_aluno = a.id_aluno) INNER JOIN disciplinas d ON (d.id_disciplina = m.id_disciplina) INNER JOIN cursos c ON (c.id_curso = d.id_curso)
    WHERE a.id_aluno = cod;
  ELSE
    SELECT CONCAT("Aluno[cod: ",cod,"] não possui disciplinas associadas a ele.") AS msg;
  END IF;
ELSE
  SELECT CONCAT("Aluno[cod: ",cod,"] não cadastrado.") AS msg;
END IF;
END //
DELIMITER ;

CALL pro_mensalidade(5); ##Saida esperada: R$ 2.650,00
CALL pro_mensalidade(16); ##Saida esperada: R$ 3.650,00
CALL pro_mensalidade(1); ##Saida esperada: Aluno[cod: 1] não possui disciplinas associadas a ele.
CALL pro_mensalidade(101); ##Saida esperada: Aluno[cod: 101] não cadastrado.


## 3.(empresa_sa) Criar uma Trigger que identifique, no momento da venda para um cliente,
## o número de notas fiscais já emitidas para o mesmo, ou seja, quantas vezes o cliente já comprou na loja.
## Se o cliente já comprou na loja, conceder um desconto no valor da nota fiscal de venda de acordo com os critérios da tabela abaixo. (2.5)
## Tabela de descontos
## >=1 e <=2 5%
##>= 3 e <= 4 8%	
## >4 10%

DELIMITER //
DROP TRIGGER IF EXISTS tr_venda_produtos //
CREATE TRIGGER tr_venda_produtos
BEFORE INSERT ON nf_vendas
FOR EACH ROW
BEGIN
  IF((SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = new.id_cliente) > 4) THEN
    SET new.valor = new.valor - (new.valor*0.10);
  ELSE
    IF((SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = new.id_cliente) >= 3) THEN
      SET new.valor = new.valor - (new.valor*0.08);
    ELSE
      IF((SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = new.id_cliente) >= 1) THEN
        SET new.valor = new.valor - (new.valor*0.05);
      END IF;
    END IF;
  END IF;
END//
DELIMITER ;

SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = 1;

SELECT COUNT(id_cliente) FROM nf_vendas WHERE id_cliente = 2;

INSERT INTO nf_vendas (emissao, valor, id_vendedor,id_cliente, id_fp) 
VALUES (DATE(NOW()),100,1,1,1), ##Cliente 1 possui 3 compras sendo assim o desconto esperado é 8% ficando o valor 92
       (DATE(NOW()),100,1,1,1), ##Cliente 1 possui 4 compras sendo assim o desconto esperado é 8% ficando o valor 92
       (DATE(NOW()),100,1,1,1); ##Cliente 1 possui 5 compras sendo assim o desconto esperado é 10% ficando o valor 90

INSERT INTO nf_vendas (emissao, valor, id_vendedor,id_cliente, id_fp) 
VALUES (DATE(NOW()),100,1,2,1); ##Cliente 2 possui 1 compras sendo assim o desconto esperado é 5% ficando o valor 95

## 4) (rh_empresa). Criar as seguintes concessões para o usuário Antonio: (2.5)
## a) Conceder o privilégio de CONSULTAR os seguintes campos da tabela de funcionários: id_funcionario, nome, sexo, data de admissão e salário.
	GRANT SELECT (id_funcionario,nome,sexo,admissao,salario)
	ON rh_empresa.funcionarios
	TO Antonio@localhost 
	IDENTIFIED BY '123';
## b) Conceder o privilégio de ATUALIZAR somente os campos nome e data de admissão da tabela de funcionários.

GRANT UPDATE (nome,admissao)
ON rh_empresa.funcionarios
TO Antonio@localhost;

## c) Mostrar os privilégios concedidos ao usuário Antonio.

SHOW GRANTS FOR Antonio@localhost;

## d) Revogar o privilégio de atualização dos campos do item b)

REVOKE UPDATE (nome,admissao) 
ON rh_empresa.funcionarios
FROM Antonio@localhost;

## e) Deletar o usuário do sistema.

DROP USER Antonio@localhost;

