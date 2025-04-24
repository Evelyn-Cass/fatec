//node 08-22/vetor.js

const prompt = require('prompt-sync')();

let nomes = [];

let alunos = parseInt(prompt("Quantos alunos tem na turma?"));

for (let i = 0; i < alunos; i++) {
    nomes[i] = prompt("Digite o nome da " + (i + 1) + "º aluno:");
}

// for (let i = 0; i < nomes.length; i++) {
//     console.log("O nome do " + (i + 1) + "º aluno é " + nomes[i]);
// }

nomes.forEach(ordem => console.log("O nome do aluno é " + ordem));