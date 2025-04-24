//Bubble Sort
let vetor = [1, 22, 45, 78, 9, 234, 56, 65, 234, 12];

let n = vetor.length;

for (let i = 0; i < n - 1; i++) {
    for (let j = 0; j < n - 1 - i; j++) {
        if (vetor[j] > vetor[j + 1]) {
            // Troca os elementos de posição
            let temp = vetor[j];
            vetor[j] = vetor[j + 1];
            vetor[j + 1] = temp;
        }
    }
}

// Encontrando o menor e maior número no vetor
let menor = vetor[0];
let maior = vetor[vetor.length - 1];

// Calculando a somatória dos elementos do vetor
let somatoria = 0;
for (let i = 0; i < vetor.length; i++) {
    somatoria += vetor[i];
}

// Exibindo os resultados
console.log("Vetor ordenado: " + vetor);
console.log("Menor número: " + menor);
console.log("Maior número: " + maior);
console.log("Somatória do vetor: " + somatoria);