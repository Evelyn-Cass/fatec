// use detran;

db.proprietario.insertMany([
    { nome: "João Silva", cpf: "123.456.789-00", endereco: "Rua A, 123" },
    { nome: "Maria Oliveira", cpf: "987.654.321-00", endereco: "Rua B, 456" },
    { nome: "Carlos Souza", cpf: "456.789.123-00", endereco: "Rua C, 789" }
]);

// 1) Exporte todos os documentos da coleção proprietario do banco 
// detran para um arquivo chamado proprietarios.json.
mongoexport --db=detran --collection=proprietario --out=proprietarios.json

// 2) Exporte os campos nome, cpf e endereco da coleção proprietario 
// para um arquivo proprietarios.csv.
mongoexport --db=detran --collection=proprietario --type=csv --fields=nome,cpf,endereco --out=proprietarios.csv;

// 3) Importe os dados do arquivo proprietarios.json para a coleção 
// paciente do banco hospital.
mongoimport --db=hospital --collection=paciente --file=proprietarios.json --jsonArray;
