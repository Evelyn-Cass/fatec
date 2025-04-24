// -1 Decremental, 0 No change, 1 Incremental 

db.usuarios.createIndex({ email: 1 }) 

db.usuarios.find({
    email:
        "joao@email.com"
}).explain("executionStats")

db.usuarios.dropIndex("email_1")

db.usuarios.getIndexes()

db.pedidos.find({ email: "joao@email.com" }).hint({ cliente: 1, status: 1 }).explain("executionStats")

db.pedidos.createIndex({ cliente: 1, status: 1 })

db.usuarios.totalIndexSize()

db.produtos.createIndex({ descricao: "text" }) 
// Criar um índice para busca textual: