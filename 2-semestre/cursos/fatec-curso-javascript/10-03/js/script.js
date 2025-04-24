// Exibe um alerta na tela
console.log("Olá Mundo!");

/* 
Aqui o comentário pode ter várias linhas
Bom para quando precisamos adicionar muitos detalhes
OU deixar marcações de versão e resposabilidade
*/

// Cria uma variavel com conteudo inicial
var nome = "Essa é uma variavel de Texto (String)";
var idade; // Cria uma variavel nula (null)
idade = 36; // Adiciona um numero inteiro na variavel (number)
var altura = 1.81; // Variavel com numero flutuante (number)
var diretor = false; // Variavel do tipo booleana (boolean)
var numeroTexto = "10";

var nota1 = 10;
var nota2 = 5;
var media = (nota1 + nota2) / 2;

var notas = []; // Tamanho 0
notas[0] = 10; // Tamanho 1
notas[1] = 5; // Tamanho 2

var mediaArray = (notas[0] + notas[1]) / notas.length;

let numero = 10;
if (numeroTexto === numero) {
  console.log("São Iguais");
} else {
  console.log("Não são iguais");
}

var notasSemestre = [10, 8, 5, 4];

console.log("======= For =======");
var mediaSemestre = 0;
let tamanho = notasSemestre.length;
for (let i = 0; i < notasSemestre.length; i++) {
  console.log(`Nota ${(i + 1)}: ${notasSemestre[i]}`)
  mediaSemestre += notasSemestre[i];
}
mediaSemestre = mediaSemestre / notasSemestre.length;
console.log("Média: " + mediaSemestre);

console.log("======= While =======");
media = 0;
tamanho = notasSemestre.length;
let i = 0;
while (i < tamanho) {
  console.log(`Nota ${(i + 1)}: ${notasSemestre[i]}`);
  media += notasSemestre[i];
  i++;
}
console.log(`Média: ${media / tamanho}`);

console.log("======= ForEach (Arrow Function) =======");
tamanho = notasSemestre.length;
media = 0;
notasSemestre.forEach((notasSemestre, i) => { //ForEach e Foreach são as mesmas funções, sendo o primeiro a nomeclatura correta
  console.log(`Nota ${(i + 1)}: ${notasSemestre}`);
  media += notasSemestre;
})
console.log(`Média: ${media / tamanho}`);


console.log("======= ForEach (Function) =======");
tamanho = notasSemestre.length;
media = 0;
notasSemestre.forEach(function (notasSemestre, i) { //ForEach e Foreach são as mesmas funções, sendo o primeiro a nomeclatura correta
  console.log(`Nota ${(i + 1)}: ${notasSemestre}`);
  media += notasSemestre;
})
console.log(`Média: ${media / tamanho}`);

console.log("======= Função dentro do Console.log =======");

console.log(`Resultado: ${() => {
  media = (10 + 20 + 30) / 3;
  return media;
}}`);
