
// function exibirSaudacao() {
//     console.log("Bem vindo ao meu programa!");
// };

// exibirSaudacao();

// // SobreCarga da Função
// function exibirSaudacao(nome) {
//     console.log("Olá", nome, "! Seja Bem-vindo!")
// }

// var texto = prompt("Qual é o seu nome?");
// exibirSaudacao(texto);

function calcularMedia(notas) {
    var media = 0;
    notas.forEach(nota => {   
        media += nota;
    });
    return media / notas.lenght;
}

console.log(calcularMedia([10,10,10]));

var notas = [];
do {
    var nota = parseFloat(prompt("Digite um nota:"));
    notas.push(nota);
    var continuar = parseInt(prompt("Deseja adicionar mais notas?\n 1- Sim\n 0-Não"));
} while (continuar > 0);

console.log("Média Final: ", calcularMedia(notas));