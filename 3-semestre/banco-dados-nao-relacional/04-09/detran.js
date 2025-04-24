// use detran;

db.estados.insertMany([
    { "_id": 1, "sigla": "SP", "nome": "São Paulo" },
    { "_id": 2, "sigla": "MG", "nome": "Minas Gerais" },
    { "_id": 3, "sigla": "PR", "nome": "Paraná" }
]);

db.cidades.insertMany([
    { "_id": 1, "nome": "Mococa", "estado_id": 1 },
    { "_id": 2, "nome": "Cajuru", "estado_id": 1 },
    { "_id": 3, "nome": "Guaxupé", "estado_id": 2 },
    { "_id": 4, "nome": "Curitiba", "estado_id": 3 }
]);


db.sexos.insertMany([
    {
        "_id": 1,
        "inicial": 'M',
        "nome": "Masculino"
    },
    {
        "_id": 2,
        "inicial": 'F',
        "nome": "Feminino"
    }
])

db.agentes.insertMany([
    {
        "_id": 1,
        "matricula": "123",
        "nome": "Jão",
        "contratacao": "CLT"
    },
    {
        "_id": 2,
        "matricula": "456",
        "nome": "Zé",
        "contratacao": "CLT"
    },
    {
        "_id": 3,
        "matricula": "789",
        "nome": "Toin",
        "contratacao": "CLT"
    }
])

db.infracoes.insertMany([
    {
        "_id": 1,
        "descricao": "Transitar em velocidade superior à máxima permitida em até 20%",
        "valor": 85.15,
        "pontos": 5
    },
    {
        "_id": 2,
        "descricao": "Avançar o sinal vermelho do semáforo ou a parada obrigatória",
        "valor": 293.47,
        "pontos": 7
    },
    {
        "_id": 3,
        "descricao": "Falta do cinto de segurança",
        "valor": 195.32,
        "pontos": 5
    }
])

db.marcas.insertMany([
    { "_id": 1, "nome": "Volkswagen" },
    { "_id": 2, "nome": "Chevrolet" },
    { "_id": 3, "nome": "Fiat" },
    { "_id": 4, "nome": "Ford" },
    { "_id": 5, "nome": "Peugeot" },
    { "_id": 6, "nome": "Renault" }
]);

db.modelos.insertMany([
    { "_id": 1, "nome": "Polo", "marca_id": 1 },
    { "_id": 2, "nome": "Fusca", "marca_id": 1 },
    { "_id": 3, "nome": "Gol", "marca_id": 1 },
    { "_id": 4, "nome": "Chevette", "marca_id": 2 },
    { "_id": 5, "nome": "Opala", "marca_id": 2 },
    { "_id": 6, "nome": "Palio", "marca_id": 3 },
    { "_id": 7, "nome": "Ká", "marca_id": 4 }
]);

db.cores.insertMany([
    {
        "_id": 1,
        "nome": "Vermelho"
    },
    {
        "_id": 2,
        "nome": "Branco"
    },
    {
        "_id": 3,
        "nome": "Azul"
    },
    {
        "_id": 4,
        "nome": "Verde"
    },
    {
        "_id": 5,
        "nome": "Preto"
    }
])

db.proprietarios.insertOne({
    "_id": 1,
    "cidade_id": 2,
    "sexo_id": 1,
    "nome": "Prof. Tiago",
    "cpf": "12345678998",
    "logradouro": "Rua dos Professores",
    "numero": "666",
    "complemento": "Casa",
    "bairro": "Centro",
    "cep": "14240000"
})

db.veiculos.insertMany([
    {
        "_id": 1,
        "modelo_id": 1,
        "proprietario_id": 1,
        "cor_id": 2,
        "placa": "EVA4960",
        "cadastro": "do Prof"
    },
    {
        "_id": 2,
        "modelo_id": 2,
        "proprietario_id": 1,
        "cor_id": 2,
        "placa": "BLD7764",
        "cadastro": "do Prof"
    },
    {
        "_id": 3,
        "modelo_id": 6,
        "proprietario_id": 1,
        "cor_id": 3,
        "placa": "CFU0412",
        "cadastro": "do Prof"
    },
    {
        "_id": 4,
        "modelo_id": 7,
        "proprietario_id": 1,
        "cor_id": 5,
        "placa": "EVA4960",
        "cadastro": "do Prof"
    }
])

db.multas.insertMany([
    {
        "_id": 1,
        "agente_id": 3,
        "veiculo_id": 1,
        "cidade_id": 3,
        "infracao_id": 2,
        "lancamento": "Condutor sem vergonha",
        "data_multa": ISODate("2018-12-30T00:22:00"),
        "local_multa": "Praça do Centro"
    }, {
        "_id": 2,
        "agente_id": 1,
        "veiculo_id": 1,
        "cidade_id": 2,
        "infracao_id": 3,
        "lancamento": "Com camisa do vasco",
        "data_multa": ISODate("2018-12-31T08:15:00"),
        "local_multa": "Avenida do Rio"
    }, {
        "_id": 3,
        "agente_id": 2,
        "veiculo_id": 1,
        "cidade_id": 1,
        "infracao_id": 3,
        "lancamento": "Tocando música que machuca o coração",
        "data_multa": ISODate("2018-12-31T11:30:00"),
        "local_multa": "Praça do Vale da Sofrência"
    }
])

db.proprietarios.insertMany([
    {
        "_id": 2,
        "cidade_id": 1,
        "sexo_id": 1,
        "nome": "Joazim",
        "cpf": "12343678998",
        "logradouro": "Rua dos Multados",
        "numero": "2",
        "complemento": "Casa",
        "bairro": "Centro",
        "cep": "11240000"
    },
    {
        "_id": 3,
        "cidade_id": 2,
        "sexo_id": 1,
        "nome": "Juquinha",
        "cpf": "12345228998",
        "logradouro": "Rua José Bonifácio",
        "numero": "89",
        "complemento": "Comércio",
        "bairro": "Centro",
        "cep": "14340000"
    },
    {
        "_id": 4,
        "cidade_id": 3,
        "sexo_id": 2,
        "nome": "Mariazinha",
        "cpf": "12343378998",
        "logradouro": "Av. José Santos",
        "numero": "66",
        "complemento": "Casa",
        "bairro": "Centro",
        "cep": "14230000"
    },
    {
        "_id": 5,
        "cidade_id": 4,
        "sexo_id": 1,
        "nome": "Zezinho",
        "cpf": "12345178998",
        "logradouro": "Rua Antonio dos Santos",
        "numero": "100",
        "complemento": "Casa",
        "bairro": "Quebrada",
        "cep": "142400200"
    }
])

db.veiculos.insertMany([
    {
        "_id": 5,
        "modelo_id": 3,
        "proprietario_id": 2,
        "cor_id": 1,
        "placa": "YDX5892",
        "cadastro": "do Prof"
    },
    {
        "_id": 6,
        "modelo_id": 4,
        "proprietario_id": 3,
        "cor_id": 2,
        "placa": "KYN0169",
        "cadastro": "Licenciado"
    },
    {
        "_id": 7,
        "modelo_id": 5,
        "proprietario_id": 4,
        "cor_id": 5,
        "placa": "OKY0101",
        "cadastro": "Licenciado"
    },
    {
        "_id": 8,
        "modelo_id": 1,
        "proprietario_id": 5,
        "cor_id": 4,
        "placa": "YAG0101",
        "cadastro": "Licenciado"
    }
])

db.multas.insertMany([
    {
        "_id": 4,
        "agente_id": 1,
        "veiculo_id": 2,
        "cidade_id": 1,
        "infracao_id": 1,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2019-02-28T00:22:00"),
        "local_multa": "Praça do Rua"
    }, {
        "_id": 5,
        "agente_id": 2,
        "veiculo_id": 2,
        "cidade_id": 1,
        "infracao_id": 1,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2018-05-30T13:25:00"),
        "local_multa": "Avenida"
    }, {
        "_id": 6,
        "agente_id": 1,
        "veiculo_id": 3,
        "cidade_id": 3,
        "infracao_id": 3,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2019-05-30T14:33:00"),
        "local_multa": "Praça do Centro"
    }, {
        "_id": 7,
        "agente_id": 1,
        "veiculo_id": 4,
        "cidade_id": 3,
        "infracao_id": 2,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2017-03-14T15:30:00"),
        "local_multa": "Praça José Gomes "
    },
    {
        "_id": 8,
        "agente_id": 3,
        "veiculo_id": 5,
        "cidade_id": 4,
        "infracao_id": 2,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2017-12-23T17:18:00"),
        "local_multa": "Rua"
    }, {
        "_id": 9,
        "agente_id": 3,
        "veiculo_id": 1,
        "cidade_id": 4,
        "infracao_id": 3,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2016-08-19T09:26:00"),
        "local_multa": "Estacionamento"
    }, {
        "_id": 10,
        "agente_id": 1,
        "veiculo_id": 1,
        "cidade_id": 3,
        "infracao_id": 1,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2018-11-15T10:34:00"),
        "local_multa": "Praça da Matriz"
    }, {
        "_id": 11,
        "agente_id": 3,
        "veiculo_id": 1,
        "cidade_id": 3,
        "infracao_id": 3,
        "lancamento": "Agente Rodoviário",
        "data_multa": ISODate("2019-01-28T15:23:00"),
        "local_multa": "Praça do Pedágio"
    }
])

// 1) Qual modelo de carro tem mais multas?

db.veiculos.aggregate([
    {
        $lookup:
        {
            from: "multas",
            localField: "_id",
            foreignField: "veiculo_id",
            as: "multas"
        }
    },
    { $unwind: "$multas" },
    {
        $lookup:
        {
            from: "modelos",
            localField: "modelo_id",
            foreignField: "_id",
            as: "modelos"
        }
    },
    { $unwind: "$modelos" }, {
        $group: {
            _id: "$modelos._id",
            modelo: { $first: "$modelos.nome" },
            multas: { $sum: 1 }
        }
    },
    { $sort: { multas: -1 } },
    { $limit: 1 }
])

// 2) Quantas multas por cidade?

db.multas.aggregate([
    {
        $lookup:
        {
            from: "cidades",
            localField: "cidade_id",
            foreignField: "_id",
            as: "cidades"
        }
    },
    { $unwind: "$cidades" },
    {
        $group: {
            _id: "$cidades._id",
            cidade: { $first: "$cidades.nome" },
            multas: { $sum: 1 }
        }
    }, {
        $sort: { multas: -1 }
    }
])

// 3) Qual é a infração mais aplicada?

db.multas.aggregate([
    {
        $lookup:
        {
            from: "infracoes",
            localField: "infracao_id",
            foreignField: "_id",
            as: "infracoes"
        }
    },
    { $unwind: "$infracoes" },
    {
        $group: {
            _id: "$infracoes._id",
            infracao: { $first: "$infracoes.descricao" },
            quantidade: { $sum: 1 }
        }
    },
    {
        $sort: { quantidade: -1 }
    },
    { $limit: 1 }
])

// 4) Qual mês do ano tem mais multas?

db.multas.aggregate([
    {
        $group: {
            _id: { $month: "$data_multa" },
            quantidade: { $sum: 1 }
        }
    },
    {
        $sort: { quantidade: -1 }
    },
    { $limit: 1 },
    {
        $project: {
            mes: "$_id",
            quantidade: 1,
            _id: 0
        }
    }
])

// 5) Qual é a cor de veículo mais multada?

db.multas.aggregate([
    {
        $lookup:
        {
            from: "veiculos",
            localField: "veiculo_id",
            foreignField: "_id",
            as: "veiculos"
        }
    },
    { $unwind: "$veiculos" },
    {
        $lookup:
        {
            from: "cores",
            localField: "veiculos.cor_id",
            foreignField: "_id",
            as: "cores"
        }
    },
    { $unwind: "$cores" },
    {
        $group: {
            _id: "$cores._id",
            cor: { $first: "$cores.nome" },
            nro_multas: { $sum: 1 }
        }
    }, {
        $sort: { nro_multas: -1 }
    },
    { $limit: 1 },
])

// 6) Qual agente aplica mais multas?

db.multas.aggregate([
    {
        $lookup:
        {
            from: "agentes",
            localField: "agente_id",
            foreignField: "_id",
            as: "agentes"
        }
    },
    { $unwind: "$agentes" },
    {
        $group: {
            _id: "$agentes._id",
            agente: { $first: "$agentes.nome" },
            nro_multas: { $sum: 1 }
        }
    }, {
        $sort: { nro_multas: -1 }
    },
    { $limit: 1 }
])

// 7) Qual sexo é mais multado?

db.multas.aggregate([
    {
        $lookup:
        {
            from: "veiculos",
            localField: "veiculo_id",
            foreignField: "_id",
            as: "veiculos"
        }
    },
    { $unwind: "$veiculos" },
    {
        $lookup:
        {
            from: "proprietarios",
            localField: "veiculos.proprietario_id",
            foreignField: "_id",
            as: "proprietarios"
        }
    },
    { $unwind: "$proprietarios" }, {
        $lookup:
        {
            from: "sexos",
            localField: "proprietarios.sexo_id",
            foreignField: "_id",
            as: "sexos"
        }
    },
    { $unwind: "$sexos" },
    {
        $group: {
            _id: "$sexos._id",
            sexo: { $first: "$sexos.nome" },
            nro_multas: { $sum: 1 }
        }
    }, {
        $sort: { nro_multas: -1 }
    },
    { $limit: 1 }
]);

// 8) Qual marca de carro os homens preferem?

db.sexos.aggregate([
    {
        $lookup:
        {
            from: "proprietarios",
            localField: "_id",
            foreignField: "sexo_id",
            as: "proprietarios"
        }
    },
    { $unwind: "$proprietarios" }, 
    {
        $lookup:
        {
            from: "veiculos",
            localField: "proprietarios._id",
            foreignField: "proprietario_id",
            as: "veiculos"
        }
    },
    { $unwind: "$veiculos" },
    {
        $lookup:
        {
            from: "modelos",
            localField: "veiculos.modelo_id",
            foreignField: "_id",
            as: "modelos"
        }
    },
    { $unwind: "$modelos" },
    {
        $lookup:
        {
            from: "marcas",
            localField: "modelos.marca_id",
            foreignField: "_id",
            as: "marcas"
        }
    },
    { $unwind: "$marcas" },
    {$match: { _id : 1}},
    {
        $group:{
            _id: "$marcas._id",
            marca: { $first: "$marcas.nome"},
            nro_carros: {$sum: 1}
        }
    },
    {
        $sort: { nro_carros: -1 }
    },
    { $limit: 1 }
])

// 9) Qual cor de carro as mulheres mais preferem?

db.sexos.aggregate([
    {$match: { _id : 2}},
    {
        $lookup:
        {
            from: "proprietarios",
            localField: "_id",
            foreignField: "sexo_id",
            as: "proprietarios"
        }
    },
    { $unwind: "$proprietarios" }, 
    {
        $lookup:
        {
            from: "veiculos",
            localField: "proprietarios._id",
            foreignField: "proprietario_id",
            as: "veiculos"
        }
    },
    { $unwind: "$veiculos" },
    {
        $lookup:
        {
            from: "cores",
            localField: "veiculos.cor_id",
            foreignField: "_id",
            as: "cores"
        }
    },
    { $unwind: "$cores"},
    {
        $group:{
            _id: "$cores._id",
            marca: { $first: "$cores.nome"},
            nro_carros: {$sum: 1}
        }
    },
    {
        $sort: { nro_carros: -1 }
    },
    { $limit: 1 }
])

// 10) Faça um ranking dos veículos mais multados, decrescente.


db.multas.aggregate([
    {
        $lookup:
        {
            from: "veiculos",
            localField: "veiculo_id",
            foreignField: "_id",
            as: "veiculos"
        }
    },
    { $unwind: "$veiculos" },
    {
        $group: {
            _id: "$veiculos._id",
            cor: { $first: "$veiculos.placa" },
            nro_multas: { $sum: 1 }
        }
    }, {
        $sort: { nro_multas: -1 }
    }
])