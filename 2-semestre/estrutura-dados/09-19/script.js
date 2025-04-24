//node 09-19/script.js

let letras = ["A","B","C","D","E"];
// console.log(letras);

letras.push(false); //Adiciona um elemento no final do array
// console.log(letras);

letras.shift(); //Remove o primeiro elemento
// console.log(letras);

letras.unshift(1); //Adiciona um elemento no inicio
// console.log(letras);

letras.pop(); //Remove o ultimo elemento
// console.log(letras);

letras.push({"name":"Lucas"}); //Adiciona um elemento no final do array
// console.log(letras);

letras.push([89,63,40,-12]);
// console.log(letras);

// console.table(letras[6]);

letras.forEach(letra => {
    console.log(letra);
});