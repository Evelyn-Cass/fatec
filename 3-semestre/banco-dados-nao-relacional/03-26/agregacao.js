db.orders.aggregate([
    {
        $lookup:
        {
            from: 'products',
            localField: 'product_id',
            foreignField: '_id',
            as: 'product'
        }
    }
]);

db.aggregate([
    {
        $group:
        {
            _id: "$product_id", //Agrupa por produto
            total_orders: { $sum: 1 }, //Conta o número de pedidos
            total_quantity: { $sum: "$quantity" } //Soma a quantidade de cada pedido
        }
    }
])

db.collection.aggregate([
    { estago1 },
    { estago2 },
    { estago3 }
    // . . .
]);

//match
db.vendas.aggregate([
    { match: { ano: 2023 } }, //Filtrar por ano
    { $group: { _id: "$mes", total: { $sum: "$valor" } } }, //Agrupar por mês e somar o valor
    { $sort: { total: -1 } } //Ordenar por total decrescente
]);

//limit
db.vendas.aggregate([
    { $sort: { valor: -1 } },
    { $limit: 5 } //Limitar a 5 resultados
]);

//skip
db.vendas.aggregate([
    { $sort: { valor: -1 } },
    { $skip: 5 }, //Pular os 5 primeiros resultados
    { $limit: 5 } //Limitar a 5 resultados
]);

//unwind
db.pedidos.aggregate([
    { $unwind: "$itens" } //Desagrupar os itens
]);

//facet

db.vendas.aggregate([
    {
        $facet: //Executa múltiplos estágios de agregação
        {
            total: [{ $group: { _id: null, total: { $sum: "$valor" } } }],
            por_mes: [{ $group: { _id: "$mes", total: { $sum: "$valor" } } }]
        }
    }
]);

//bucket

db.vendas.aggregate([
    {
        $bucket: //Agrupa os documentos em intervalos
        {
            groupBy: "$valor",
            boundaries: [0, 100, 200, 300],
            default: "Outros",
            output: { total: { $sum: 1 }, valor_total: { $sum: "$valor" } }
        }
    }
]);

//bucketAuto

db.vendas.aggregate([
    {
        $bucketAuto: //Agrupa os documentos em intervalos
        {
            groupBy: "$valor",
            buckets: 3,
            output: { total: { $sum: 1 }, valor_total: { $sum: "$valor" } }
        }
    }
]);

//addFields

db.vendas.aggregate([
    { $addFields: { total: { $multiply: ["$valor", "$quantidade"] } } } //Adiciona um novo campo ao documento temporario
]);

//count

db.vendas.aggregate([
    { $count: "total" } //Conta o número de documentos
]);

//explain

db.vendas.aggregate([
    { $match: { ano: 2023 } },
    { $group: { _id: "$mes", total: { $sum: "$valor" } } },
    { $sort: { total: -1 } },
    { $limit: 5 }
]).explain("executionStats");   //Exibe as estatísticas de execução da agregação

//group avg

db.vendas.aggregate([
    { $group: { _id: "$mes", total: { $sum: "$valor" }, media: { $avg: "$valor" } } }
]);

//cond - se a condição for verdadeira, retorna o valor1, senão retorna o valor2
//ifnull - se o campo for nulo, retorna um valor padrão
//switch - Implementa uma séries de condições

db.createCollection("vendas");

db.vendas.insertOne({
    "_id": ObjectId("5f8b8f7b4f3b4b1b3c1d1b1a"),
    "data_venda": ISODate("2020-10-17T00:00:00Z"),
    "valor": 1500,
    "mes": 1,
    "ano": 2023
});
db.vendas.find().pretty();

db.pedidos.insertOne({
    "_id": ObjectId("5f8b8f7b4f3b4b1b3c1d1b1b"),
    "cliente_id": ObjectId("5f8b8f7b4f3b4b1b3c1d1b1c"),
    "produto": "Laptop",
    "quantidade": 2,
    "preco_unitario": 1200
});

db.pedidos.find().pretty();

db.clientes.insertOne({
    "_id": ObjectId("5f8b8f7b4f3b4b1b3c1d1b1c"),
    "nome": "Alice",
    "email": "Alice@Example.com",
    "regiao": "São Paulo"
});

db.clientes.find().pretty();

// EXERCÍCIOS
// 1) Contagem de Vendas por Cliente:
// –Objetivo: Calcular quantas vendas cada cliente realizou.
// –Dica: Use $group com cliente_id

db.pedidos.aggregate([
    {
        $group: {
            _id: "$cliente_id",
            total_vendas: { $sum: 1 }
        }
    }
]);

// 2) Média de Vendas por Produto:
// –Objetivo: Determinar a média de vendas para cada tipo de produto.
// –Dica: Agrupe por produto e utilize $avg.

db.pedidos.aggregate([
    {
        $group: {
            _id: "$produto",
            media_vendas: { $avg: "$quantidade" }
        }
    }
]);

// EXERCÍCIOS
// • Listar Clientes que Compraram Mais de 5 Produtos:
// – Objetivo: Identificar clientes que realizaram grandes pedidos.
// – Dica: Use $match após $group.

db.pedidos.aggregate([
    {
        $group: {
            _id: "$cliente_id",
            total_produtos: { $sum: "$quantidade" }
        }
    },
    {
        $match: { total_produtos: { $gt: 5 } }
    }
]);

// Top 3 Produtos Mais Vendidos:
// – Objetivo: Encontrar os produtos com maior número de vendas.
// – Dica: Agrupe por produto, some quantidade e use $sort seguido de $limit

db.pedidos.aggregate([
    {
        $group: {
            _id: "$produto",
            quantidade: { $sum: "$quantidade" }
        }
    },
    { $sort: { quantidade: -1 } },
    { $limit: 3 }
])

// Total de Vendas por Região:
// – Objetivo: Se houver um campo regiao em clientes, calcular o total de vendas por região.
// – Dica: Utilize $lookup para unir pedidos e clientes, depois agrupe por regiao

db.pedidos.aggregate([
    {
        $lookup: {
            from: "clientes",
            localField: "cliente_id",
            foreignField: "_id",
            as: "cliente_info"
        }
    },
    { $unwind: "$cliente_info" },
    {
        $group: {
            _id: "$cliente_info.regiao",
            total_vendas: { $sum: { $multiply: ["$quantidade", "$preco_unitario"] } }
        }
    }
]);