// Exibe um alerta na tela
alert("Olá Mundo!");

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

if (numeroTexto === 10) {
  alert("São Iguais");
} else {
  alert("Não são iguais");
}

var notasSemestre = [10, 8, 5, 4];

var mediaSemestre = 0;
for (let i = 0; i < notasSemestre.length; i++) {
  mediaSemestre += notasSemestre[i];
}
mediaSemestre = mediaSemestre / notasSemestre.length;

alert("Média: " + mediaSemestre);

