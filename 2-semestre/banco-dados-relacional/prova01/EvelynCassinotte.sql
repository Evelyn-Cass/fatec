## Aluna: Evelyn Cassinotte

#1. Criar uma query para listar as vendas realizadas de todos os produtos das categorias (1, 2 e 3) de acordo com o layout abaixo. 
#Classificar a listagem em ordem decrescente da data de emissão. O produto pode constar em várias notas, portanto,
#ele poderá ser listado várias vezes. (2.0)
#Código  Descritivo  Categoria    NroNF    Emissão       Vendedor    Cliente  
#              descritivo                dd/mm/AAAA      nome            nome

SELECT p.id_produto "Código",
	p.descritivo "Descritivo",
	c.descritivo "Categoria",
	nfv.id_nfv "NroNF",
	DATE_FORMAT(nfv.emissao,"%d/%m/%Y") "Emissão",
	v.nome "Vendedor",
	cli.nome "Cliente"
FROM categorias c
INNER JOIN produtos p ON (p.id_categoria = c.id_categoria)
INNER JOIN itens_nfv infv ON (infv.id_produto = p.id_produto)
INNER JOIN nf_vendas nfv ON (nfv.id_nfv = infv.id_nfv)
INNER JOIN vendedores v ON (v.id_vendedor = nfv.id_vendedor)
INNER JOIN clientes cli ON (cli.id_cliente = nfv.id_cliente)
WHERE c.id_categoria BETWEEN 1 AND 3
ORDER BY nfv.emissao DESC;

#2. Criar uma query para listar a quantidade total de produtos cadastrados em cada categoria. 
#Somente devem ser listadas as categorias que tiverem uma quantidade de produtos acima de 3. (2.0)
#Código    		 Descritivo      	 Quantidade_Produtos


SELECT c.id_categoria "Código",
	c.descritivo "Descritivo",
	COUNT(c.id_categoria) "Quantidade_Produtos"
FROM produtos p
INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)
GROUP BY c.id_categoria
HAVING COUNT(c.id_categoria) > 3;


#3.Criar uma query para listar todos os vendedores do sexo feminino que ainda não realizaram nenhuma venda na loja. 
#A listagem deverá vir classificada em ordem alfabética. (2.0)
#Código   	     Nome   	          	 Comissão  	  	       Salario_Fixo
#                                                  XX%                         R$ 0.000,00                   


SELECT v.id_vendedor "Código",
	v.nome "Nome",
	CONCAT(v.comissao,"%") "Comissão",
	CONCAT("R$ ",FORMAT(salario_fixo,2,"de_DE")) "Salario_Fixo"
FROM vendedores v 
LEFT JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
WHERE nfv.id_nfv IS NULL AND v.sexo = 'F'
ORDER BY v.nome;

ALTER TABLE vendedores ADD sexo ENUM('F','M');


#4.Criar uma VIEW que liste os totais vendidos por todos os vendedores do sexo masculino. 
#A listagem deverá indicar o percentual vendido pelo vendedor em relação ao valor total geral vendido pela loja. (2.0)
#%vendido do total = (total vendido pelo vendedor/ total geral vendido) *100
#Código 	   Nome             ValorTotalVendido            %Vendido_do_Total
#                                   R$ 0.000,00                          XX%

SELECT SUM(valor)
FROM nf_vendas;

CREATE OR REPLACE VIEW vw_vendasM AS
	SELECT v.id_vendedor "Código",
		v.nome "Nome",
		CONCAT("R$ ",FORMAT(SUM(nfv.valor),2,'de_DE')) "ValorTotalVendido",
		CONCAT(FORMAT((SUM(nfv.valor)/(SELECT SUM(valor) FROM nf_vendas)*100),'de'),"%") "Vendido_do_Total"
	FROM vendedores v
	INNER JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
	WHERE v.sexo = "M"
	GROUP BY v.id_vendedor;

SELECT * FROM vw_vendasM;


#5.Aumentar em 2% a comissão de todos os vendedores que bateram a meta de venda de R$ 7.000,0.
#Aumentar em 2% é somar 2 no campo comissão do vendedor, por exemplo, 
#se o vendedor bateu a meta de vendas e ganha 10% de comissão, ele passará a ganhar 12%. (2.0)


UPDATE vendedores 
SET comissao = comissao + 2
WHERE id_vendedor IN (SELECT v.id_vendedor
			FROM vendedores v
			INNER JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
			GROUP BY v.id_vendedor
			HAVING SUM(nfv.valor) >= 7000);


SELECT v.id_vendedor
FROM vendedores v
INNER JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
GROUP BY v.id_vendedor
HAVING SUM(nfv.valor) >= 7000;

