//node 08-22/mencao.js

const prompt = require('prompt-sync')();

console.log('Vamos calcular sua menção');
notaUm = parseFloat(prompt("Insira o valor da primeira nota:"))
notaDois = parseFloat(prompt("Insira o valor da segunda nota:"))

media = (notaUm + notaDois) / 2

console.log("Sua média é: " + media.toFixed(2))

if (media >= 8.5) {
    console.log("Sua menção é A")
}
else if (media >= 7.5) {
    console.log("Sua menção é B")
}
else if (media >= 6) {
    console.log("Sua menção é C")
}
else if (media >= 5) {
    console.log("Sua menção é D")
}
else {
    console.log("Sua menção é E")
}