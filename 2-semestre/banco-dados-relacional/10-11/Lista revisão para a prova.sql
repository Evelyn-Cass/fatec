###====== Revisão para a prova ========###

#1.Listar todos os produtos com suas respectivas 
#categorias.Classificar a listagem pelo preço de
#do produto.
#Codigo   Descritivo   Preço_Venda  Categoria
#	               R$ 0.000,00   descritivo

SELECT p.id_produto "Código", p.descritivo "Descritivo", 
       CONCAT("R$ ",FORMAT(p.venda,2,"de_DE")) "Preço Venda", c.descritivo "Categoria" 
FROM produtos p
INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)
ORDER BY p.venda;

#2.Listar todos os produtos que ainda não tiveram
#nenhuma venda.
#Código   Descritivo   Categoria

SELECT p.id_produto "Código", p.descritivo "Descritivo", c.descritivo "Categoria"
FROM produtos p
LEFT JOIN itens_nfv nfv ON ( nfv.id_produto = p.id_produto)
INNER JOIN categorias c ON ( c.id_categoria = p.id_categoria)
WHERE nfv.id_nfv IS NULL
ORDER BY p.descritivo;

#3.Listar todos os produtos cujo estoque esteja 
#abaixo de 100 unidades e preço de venda entre 
#200.00 e 300.00.Classificar a listagem pelo 
#descritivo do produto.
#Código  Descritivo  PreçoVenda   Estoque  Categoria
#		     R$ 0.000,00           descritivo

SELECT p.id_produto "Código", p.descritivo "Descritivo", CONCAT("R$ ",FORMAT(p.venda,2,"de_DE")) "Preço Venda",
       p.estoque "Estoque", c.descritivo "Categoria"
FROM produtos p
INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)
WHERE p.estoque < 100 AND p.venda BETWEEN 200 AND 300
ORDER BY p.descritivo;


#3.1 Tranformar a query do exercicio 2 em uma visão.

CREATE OR REPLACE VIEW vw_produtos_sem_venda AS
	SELECT p.id_produto "Código", p.descritivo "Descritivo", c.descritivo "Categoria"
	FROM produtos p
	LEFT JOIN itens_nfv nfv ON ( nfv.id_produto = p.id_produto)
	INNER JOIN categorias c ON ( c.id_categoria = p.id_categoria)
	WHERE nfv.id_nfv IS NULL
	ORDER BY p.descritivo;

SELECT * 
FROM vw_produtos_sem_venda;
 
 
#4.Listar todas as notas fiscais de venda de acordo 
#com o layout abaixo.Classificar a listagem pela 
#data de emissaõ da NF.
# NroNF   Emissão     Valor        Vendedor  Cliente                 
#       dd/mm/AAAA   R$ 0.000,00     nome     nome
       
       
SELECT nfv.id_nfv "Nro NF", DATE_FORMAT(nfv.emissao,"%d/%m/%Y") "Emissão", CONCAT("R$ ",FORMAT(nfv.valor,2,"de_DE")) "Valor",
       v.nome "Vendedor", c.nome "Cliente"
FROM nf_vendas nfv
INNER JOIN vendedores v ON (v.id_vendedor = nfv.id_vendedor)
INNER JOIN clientes c ON (c.id_cliente = nfv.id_cliente)
ORDER BY nfv.emissao;
       
#4.1 Tranformar a query do exercicio 3 em uma visão.

CREATE OR REPLACE VIEW vw_estoque100_venda200e300 AS
	SELECT p.id_produto "Código", p.descritivo "Descritivo", CONCAT("R$ ",FORMAT(p.venda,2,"de_DE")) "Preço Venda",
	       p.estoque "Estoque", c.descritivo "Categoria"
	FROM produtos p
	INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)
	WHERE p.estoque < 100 AND p.venda BETWEEN 200 AND 300
	ORDER BY p.descritivo;

SELECT *
FROM vw_estoque100_venda200e300;
 
 
#5 Listar o total vendido por cada vendedor da
#loja Fatecvan.
#Código    Nome     Total_Vendido
#	            R$ 0.000,00

SELECT v.id_vendedor "Código", v.nome "Nome", CONCAT("R$ ",FORMAT(SUM(nfv.valor),2,"de_DE")) "Total Vendido"
FROM nf_vendas nfv
INNER JOIN vendedores v ON (v.id_vendedor = nfv.id_vendedor)
GROUP BY v.id_vendedor;

#6. Listar todos os produtos vendidos.Ordenar
#pelo descritivo do produto.
#Código   Descritivo    Quantidade  Preço_Venda

SELECT p.id_produto "Código", p.descritivo "Descritivo", infv.quantidade "Quantidade", CONCAT("R$ ",FORMAT(p.venda,2,"de_DE")) "Preço venda"
FROM produtos p
INNER JOIN itens_nfv infv ON (infv.id_produto = p.id_produto)
GROUP BY infv.id_produto
ORDER BY p.descritivo;

#7.Criar uma listar com a quantidade total vendida 
#de cada produto. Filtrar somente os produtos que
#somaram mais do que 2 unidades vendidas.
#Código   Descritivo   Quantidade_total

SELECT p.id_produto "Código", p.descritivo "Descritivo", SUM(infv.quantidade) "Quantidade Total"
FROM produtos p
INNER JOIN itens_nfv infv ON (infv.id_produto = p.id_produto)
GROUP BY infv.id_produto
HAVING SUM(infv.quantidade) > 2
ORDER BY SUM(infv.quantidade);


#8.Calcular o valor a ser recebido por cada
#vendedor com relação ao total vendido.
#Valor_a_Receber = salario_fixo + (comissão/100*total vendido)
#Código  Nome  Total_Vendido  Comissão  Valor_a_Receber

SELECT v.id_vendedor "Código",
       v.nome "Nome", CONCAT("R$ ",FORMAT(SUM(nfv.valor),2,"de_DE")) "Total Vendido",
       CONCAT((v.comissao),"%") "Comissão", 
       CONCAT("R$ ",FORMAT((v.salario_fixo + ((v.comissao/100)*(SUM(nfv.valor)))),2,"de_DE")) "Valor a Receber"
FROM vendedores v
INNER JOIN nf_vendas nfv ON (nfv.id_vendedor = v.id_vendedor)
GROUP BY v.id_vendedor;
 

#9.Listar todos os vendedores que tiveram a media
#de vendas maior do que a media geral de vendas 
#de toda a loja.
#Código      Nome       Media_Vendas
#			R$ 0.000,00

SELECT AVG(valor)
FROM nf_vendas;

SELECT v.id_vendedor "Código",
       v.nome "Nome",
       CONCAT("R$ ",FORMAT(AVG(nfv.valor),2,"de_DE")) "Média vendas"
FROM nf_vendas nfv
INNER JOIN vendedores v ON (v.id_vendedor = nfv.id_vendedor)
GROUP BY v.id_vendedor 
HAVING AVG(nfv.valor) > (SELECT AVG(valor)
			 FROM nf_vendas);


#10.Listar todos os produtos cujo preço de venda
#é maior do que a media entre todos os preços 
#de venda dos produtos da loja.  
#Código    Descritivo   Preço_Venda   Categoria
#                       R$ 0.000,00   descritivo           

SELECT AVG(venda)
FROM produtos;

SELECT p.id_produto "Código", p.descritivo "Descritivo", CONCAT("R$ ",FORMAT(p.venda,2,"de_DE")) "Preço venda", c.descritivo "Categoria"
FROM produtos p
INNER JOIN categorias c ON (c.id_categoria = p.id_categoria)
WHERE p.venda > (SELECT AVG(venda)
	        FROM produtos)
ORDER BY p.venda;


#11.Atualizar o preço de venda de todos os produtos
#que nunca foram vendidos. Dar um desconto de 20% 
#no preço de venda.

SELECT p.id_produto
FROM produtos p
LEFT JOIN itens_nfv nfv ON ( nfv.id_produto = p.id_produto)
INNER JOIN categorias c ON ( c.id_categoria = p.id_categoria)
WHERE nfv.id_nfv IS NULL;

UPDATE produtos
SET venda = venda * 0.80
WHERE id_produto IN (SELECT p.id_produto
		    FROM produtos p
		    LEFT JOIN itens_nfv nfv ON ( nfv.id_produto = p.id_produto)
		    INNER JOIN categorias c ON ( c.id_categoria = p.id_categoria)
		    WHERE nfv.id_nfv IS NULL);