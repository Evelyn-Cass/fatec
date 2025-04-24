
const nome = prompt("Nome do aluno:","Evelyn");
const sobreNome = prompt("Sobrenome do aluno:","Cassinotte");

const dia = new Date;
const data = prompt(`Hoje é dia:`,` ${dia.getUTCDate()}/${dia.getMonth()}/${dia.getFullYear()}`);

alert(`Dia: ${data}\n Nome Completo: ${nome} ${sobreNome}`);
