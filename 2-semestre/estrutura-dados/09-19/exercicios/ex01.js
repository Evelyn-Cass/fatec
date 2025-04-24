// node 09-19/ex01.js

let numeros = [];
let numerosPares = [];
let soma = 0;

for (let i = 0; i < 10; i++) {
    numeros[i] = Math.floor(Math.random() * 100);
}

console.log("Números aleatórios: "+numeros);

numeros.forEach(num => {
    if (num % 2 === 0) {
        numerosPares.push(num);
        soma += num;
    }
});

console.log("Números pares: "+numerosPares);
console.log("Soma dos números pares: "+soma);