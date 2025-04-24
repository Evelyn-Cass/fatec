const menor = prompt("Qual é o menor número?",0);
const maior = prompt("Qual é o maior número?",10);

let array = []
for (let i = menor; i <= maior; i++) {
    array.push(i);
};
    
alert(array);