const AnoNascimento = prompt("Ano de Nascimento:","2000");
const date = new Date();

alert(`Ano de Nascimento: ${AnoNascimento}\nIdade: ${date.getFullYear() - AnoNascimento}`);