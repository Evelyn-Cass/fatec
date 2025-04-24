//node 08-29/desafio.js

let ordemAleatoria = [1, 22, 45, 78, 9, 234, 56, 65, 234, 12];
let ordemCrescente = [];
let usadoOrdemAleatoria = [];

let controlador;
let somatoria = 0;
let iniciado = false;

tamanho = ordemAleatoria.length;

for (let i = 0; i < tamanho; i++) {
    usadoOrdemAleatoria[i] = false;
}

for (let z = 0; z < tamanho; z++) {

    for (let i = 0; i < tamanho; i++){

        if (iniciado == false && usadoOrdemAleatoria[i] == false) {
            controlador = i;
            iniciado = true;
        }
        else if ((ordemAleatoria[i] <= ordemAleatoria[controlador]) && (usadoOrdemAleatoria[i] == false)) {
            controlador = i;
        }
    }
    iniciado = false;
    usadoOrdemAleatoria[controlador] = true;
    ordemCrescente[z] = ordemAleatoria[controlador];
    somatoria += ordemAleatoria[controlador];
}


    console.log("Ordem Crescente:" + ordemCrescente);


console.log("O Maior número é:  " + ordemCrescente[0]);
console.log("O Menor número é: " + ordemCrescente[9]);
console.log("A soma de todos os números é: " + somatoria);