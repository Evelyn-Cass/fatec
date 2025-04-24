#=========================================#
##	      Conceito de VIEW	 	 ##
#=========================================#

/*Criação de uma Visão (view)
 * tabela virtual(visão)
 * não existe "fisicamente"
 * não pode sofrear atualizações > salvo quando 
   é formada por uma unica tabela.*/
    
## Sintaxe ##

CREATE OR REPLACE VIEW nome da visão AS
    SELECT
    FROM 
    WHERE ...;
    
    
##  Exemplo
-- Código Nome Unidade Departamento Cargo

CREATE OR REPLACE VIEW vw_imagem_funcionario AS
	SELECT f.id_funcionario "Codigo", f.nome "Nome", e.descritivo "Unidade", d.descritivo "Departamento", c.descritivo "Cargo"
	FROM funcionarios f
	INNER JOIN empresas e ON (e.id_empresa = f.id_empresa)
	INNER JOIN departamentos d ON (d.id_departamento = f.id_departamento)
	INNER JOIN cargos c ON (c.id_cargo = f.id_cargo)
	ORDER BY f.nome;
                           
### Reutilização                           
                           
SELECT * FROM vw_imagem_funcionario; 
                                                                              
SELECT nome,cargo FROM vw_imagem_funcionario;

SELECT vw.codigo, vw.nome, vw.cargo, CONCAT("R$ ",FORMAT(f.salario ,2,"de_DE"))  "Salário"
FROM vw_imagem_funcionario vw
INNER JOIN funcionarios f ON (f.id_funcionario = vw.codigo);                                                                                                     