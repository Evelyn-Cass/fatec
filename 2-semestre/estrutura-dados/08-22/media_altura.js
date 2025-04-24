//node 08-22/media_altura.js
const prompt = require('prompt-sync')();
jogadores = parseInt(prompt("Informe o número de jogadores:"));

let somaAltura = 0;
for (let i = 1; i <= jogadores; i++) {
    altura = parseFloat(prompt("Informe a altura do " + i + "º jogador:"));
    somaAltura += altura;
}
mediaAltura = somaAltura / jogadores;

console.log("A média das alturas dos jogadores é " + mediaAltura.toFixed(2));