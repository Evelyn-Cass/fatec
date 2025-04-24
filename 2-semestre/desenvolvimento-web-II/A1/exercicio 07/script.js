const menor = prompt("Qual é o menor número?",0);
const maior = prompt("Qual é o maior número?",10);

let array = []
for (let i = maior; i >=     menor; i--) {
    array.push(i);
};
    
alert(array);