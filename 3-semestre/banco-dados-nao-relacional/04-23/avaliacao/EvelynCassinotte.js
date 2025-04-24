//Evelyn Cassinotte
// use avaliacao1

db.filmes.insertMany(
  [
    {
      "titulo": "Oppenheimer", "ano": 2023, "genero": ["Drama",
        "Histórico"], "avaliacao": 8.9, "diretor": "Christopher Nolan",
      "duracao": 180, "premiado": true
    },
    {
      "titulo": "A Origem", "ano": 2010, "genero": ["Ação", "Ficção"],
      "avaliacao": 8.8, "diretor": "Christopher Nolan", "duracao": 148,
      "premiado": false
    },
    {
      "titulo": "Matrix", "ano": 1999, "genero": ["Ação", "Ficção"],
      "avaliacao": 8.7, "diretor": "Wachowski", "duracao": 136, "premiado":
        true
    }
  ]);

db.usuarios.insertMany(
  [
    {
      "nome": "Ana", "idade": 24, "email": "ana@email.com", "compras":
        [120, 85], "vip": true
    },
    {
      "nome": "Pedro", "idade": 40, "email": "pedro@email.com",
      "compras": [300, 100], "vip": false
    },
    {
      "nome": "João", "idade": 35, "email": "joao@email.com", "compras":
        [], "vip": false
    }
  ]
)

//1) Liste todos os filmes: 

// a) com avaliação entre 8.5 e 9.0 (inclusive) 

//Comentado
db.filmes.find( //Busca no coleção filmes
  {
    $and: [ //documentos que atendão todas as condições
      { avaliacao: { $lte: 9 } }, //campo avaliação menor ou igual a 9
      { avaliacao: { $gte: 8.5 } } //campo avaliação maior ou igual a 8.5
    ]
  }
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.filmes.find(
  {
    $and: [
      { avaliacao: { $lte: 9 } },
      { avaliacao: { $gte: 8.5 } }
    ]
  }
).pretty();

// b) lançados após 2000 

//Comentado
db.filmes.find( //Busca na coleção filmes
  { ano: { $gt: 2000 } } //documentos que possuam o campo ano maior que 2000
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.filmes.find(
  { ano: { $gt: 2000 } }
).pretty();

// c) cujo gênero seja “Ficção” e “Ação” 

//comentado
db.filmes.find( //Busca na coleção filmes
  {
    genero: { $all: ["Ação", "Ficção"] } //verifica se o campo genero contém TODOS os campos informados
  }
).pretty(); //formata a saída para melhor visualização

//Sem Comentários
db.filmes.find(
  {
    genero: { $all: ["Ação", "Ficção"] }
  }
).pretty();

// d) e que não tenham sido premiados

db.filmes.find( //Busca na coleção filmes
  { premiado: false } //documentos que possuam o campo premiado igual a false
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.filmes.find(
  { premiado: false }
).pretty();

// 2) Liste os usuários:
// a) com idade entre 25 e 40

db.usuarios.find( //Busca na coleção usuarios
  {
    $and: [  //documentos que atendão todas as condições
      { idade: { $lt: 40 } }, //campo idade menor que 40
      { idade: { $gt: 25 } } //campo idade maior que 25
    ]
  }
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.usuarios.find(
  {
    $and: [
      { idade: { $lt: 40 } },
      { idade: { $gt: 25 } }
    ]
  }
).pretty();

// b) que não são VIPs

db.usuarios.find( //Busca na coleção usuários
  { vip: false } //documentos que possuam o campo vip igual a false
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.usuarios.find(
  { vip: false }
).pretty();

// c) que possuem pelo menos uma compra registrada

db.usuarios.find( //Busca na coleção usuários
  {
    compras: { //documentos que possuam o campo compras
      $not: { $size: 0 } //que NÃO tenham o tamanho igual a 0, ou seja não estejam vazios
    }
  }
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.usuarios.find( //Busca na coleção usuários
  {
    compras: {
      $not: { $size: 0 }
    }
  }
).pretty();

// d) Liste os usuários que possuem pelo menos uma compra maior que 100 e
// menor que 200.

db.usuarios.find( //Busca na coleção usuários
  {
    compras: { //documentos que possuam o campo compras
      $elemMatch: { //verifica se existe pelo menos um elemento que atenda as condições
        $gt: 100, //compra maior que 100
        $lt: 200  //compra menor que 200
      }
    }
  }
).pretty(); //formata a saída para melhor visualização

//Sem comentários
db.usuarios.find( //Busca na coleção usuários
  {
    compras: {
      $elemMatch: {
        $gt: 100,
        $lt: 200
      }
    }
  }
).pretty();

// 3) Atualize todos os filmes dirigidos por “Christopher Nolan” para:
// a) Acrescentar o campo classico: true se o filme for anterior a 2015

db.filmes.updateMany( //Busca na coleção filmes os documentos 
  { //condições que os documentos deve atender
    diretor: "Christopher Nolan", //O diretor deve ser igual a Christopher Nolan
    ano: { $lt: 2015 } // o ano menor que 2015
  },
  { //o que deve ser atualizado nos documentos
    $set: { //adicionar
      classico: true //campo classico igual true
    }
  }
);

//Sem comentários
db.filmes.updateMany(
  {
    diretor: "Christopher Nolan",
    ano: { $lt: 2015 }
  },
  {
    $set: {
      classico: true
    }
  }
);

// b) Adicionar 0.2 à avaliação

db.filmes.updateMany( //Busca na coleção filmes os documentos
  { //condições que os documentos deve atender
    diretor: "Christopher Nolan", //O diretor deve ser igual a Christopher Nolan
    ano: { $lt: 2015 } // o ano menor que 2015
  },
  { //o que deve ser atualizado nos documentos
    $inc: { //incrementar
      avaliacao: 0.2 //campo avaliação mais 0.2
    }
  }
);

//Sem comentários
db.filmes.updateMany(
  {
    diretor: "Christopher Nolan",
    ano: { $lt: 2015 }
  },
  {
    $inc: {
      avaliacao: 0.2
    }
  }
);

// 4) Para os usuários com o campo vip: false: adicione uma compra fictícia de valor 50
// somente se o array de compras estiver vazio

db.usuarios.updateMany( //Busca na coleção usuários os documentos
  { //condições que os documentos deve atender
    vip: false, //O campo vip deve ser igual a false
    compras: { $size: 0 } // Verifica se o tamanho do array compras é 0, se sim significa que ele está vazio
  },
  {
    $push: {
      compras: 50 // Adiciona o valor 50 ao array de compras
    }
  }
);

//Sem comentários
db.usuarios.updateMany(
  {
    vip: false,
    compras: { $size: 0 }
  },
  {
    $push: {
      compras: 50
    }
  }
);

// 5) Crie uma agregação que retorne, para cada diretor:
// a) Quantidade de filmes

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por diretor
      _id: "$diretor", // Campo pelo qual será agrupado
      filmes: { $sum: 1 } // Soma a quantidade de filmes por diretor, toda vez que um filme for encontrado adiciona mais 1
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  {
    $group: {
      _id: "$diretor",
      filmes: { $sum: 1 }
    }
  }
]).pretty();

// b) Média de avaliação

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por diretor
      _id: "$diretor", // Campo pelo qual será agrupado
      media_avaliacao: { $avg: "$avaliacao" } // Calcula a média de avaliação dos filmes por diretor
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  {
    $group: {
      _id: "$diretor",
      media_avaliacao: { $avg: "$avaliacao" }
    }
  }
]).pretty();

// c) Duração total de todos os filmes

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por diretor
      _id: "$diretor", // Campo pelo qual será agrupado
      duracao_total: { $sum: "$duracao" } // Soma a duração total dos filmes por diretor
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  {
    $group: {
      _id: "$diretor",
      duracao_total: { $sum: "$duracao" }
    }
  }
]).pretty();

// d) Ordene do diretor com mais filmes para o com menos.

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por diretor
      _id: "$diretor", // Campo pelo qual será agrupado
      filmes: { $sum: 1 } // Soma a quantidade de filmes por diretor
    }
  },
  { $sort: { filmes: -1 } } // Ordena os diretores em ordem decrescente de quantidade de filmes
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  {
    $group: {
      _id: "$diretor",
      filmes: { $sum: 1 }
    }
  },
  { $sort: { filmes: -1 } }
]).pretty();

// 6) Com a coleção usuários, faça:
// a) Calcule para cada usuário o total gasto e a média de compra

db.usuarios.aggregate([ // Realiza uma agregação na coleção usuários
  {
    $project: { // Projeta os campos desejados
      _id: 1, // Inclui o campo _id
      total_gasto: { $sum: "$compras" }, // Calcula o total gasto somando os valores do array compras
      media_gasto: { $avg: "$compras" } // Calcula a média de gasto com base nos valores do array compras
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.usuarios.aggregate([ // Realiza uma agregação na coleção usuários
  {
    $project: {
      _id: 1,
      total_gasto: { $sum: "$compras" },
      media_gasto: { $avg: "$compras" }
    }
  }
]).pretty();

// b) Classifique os usuários como "Alto", "Médio" ou "Baixo" gasto, baseado no
// total:
// • Alto: ≥ 200
// • Médio: 100 a 199
// • Baixo: < 100

db.usuarios.aggregate([ // Realiza uma agregação na coleção usuários
  {
    $project: { // Projeta os campos desejados, criando novos campos
      _id: 1, // Inclui o campo _id
      nome: 1, // Inclui o campo nome
      total_gasto: { $sum: "$compras" }, // Calcula o total gasto somando os valores do array compras
      classificacao: { // Classifica os usuários com base no total gasto
        $switch: { // Define as condições para classificação
          branches: [
            { case: { $gte: [{ $sum: "$compras" }, 200] }, then: "Alto" }, // Caso o total seja maior ou igual a 200
            { case: { $and: [{ $gte: [{ $sum: "$compras" }, 100] }, { $lt: [{ $sum: "$compras" }, 200] }] }, then: "Médio" }, // Caso o total esteja entre 100 e 199
            { case: { $lt: [{ $sum: "$compras" }, 100] }, then: "Baixo" } // Caso o total seja menor que 100
          ],
          default: "Não classificado" // Valor padrão caso nenhuma condição seja atendida
        }
      }
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.usuarios.aggregate([
  {
    $project: {
      _id: 1,
      nome: 1,
      total_gasto: { $sum: "$compras" },
      classificacao: {
        $switch: {
          branches: [
            { case: { $gte: [{ $sum: "$compras" }, 200] }, then: "Alto" },
            { case: { $and: [{ $gte: [{ $sum: "$compras" }, 100] }, { $lt: [{ $sum: "$compras" }, 200] }] }, then: "Médio" },
            { case: { $lt: [{ $sum: "$compras" }, 100] }, then: "Baixo" }
          ],
          default: "Não classificado"
        }
      }
    }
  }
]).pretty();

// 7) Agrupe os filmes por década e mostre:
// a) Quantidade de filmes por década

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por década
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] }, // Extrai os três primeiros dígitos do ano e concatena com "0"
      quantidade: { $sum: 1 } // Soma a quantidade de filmes por década
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  {
    $group: {
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] },
      quantidade: { $sum: 1 }
    }
  }
]).pretty();

// b) Média de avaliação

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: { // Agrupa os documentos por década
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] }, // Extrai os três primeiros dígitos do ano e concatena com "0"
      media_avaliacao: { $avg: "$avaliacao" } // Calcula a média de avaliação dos filmes por década
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  {
    $group: {
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] },
      media_avaliacao: { $avg: "$avaliacao" }
    }
  }
]).pretty();

// c) Gêneros distintos combinados (sem repetição) 

db.filmes.aggregate([ // Realiza uma agregação na coleção filmes
  { $unwind: "$genero" }, // Desmembra o array genero em múltiplos documentos
  {
    $group: { // Agrupa os documentos por década
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] }, // Extrai os três primeiros dígitos do ano e concatena com "0"
      generos_distintos: { $addToSet: "$genero" } // Adiciona os gêneros distintos em um array sem repetição
    }
  }
]).pretty(); // Formata a saída para melhor visualização

//Sem comentários
db.filmes.aggregate([
  { $unwind: "$genero" }, {
    $group: {
      _id: { $concat: [{ $substr: [{ $toString: "$ano" }, 0, 3] }, "0"] },
      generos_distintos: { $addToSet: "$genero" }
    }
  }
]).pretty();

