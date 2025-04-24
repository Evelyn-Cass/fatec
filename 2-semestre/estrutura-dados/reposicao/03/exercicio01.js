alunos = {};

alunos[201001] = "Ana Paula Aparecida Silveira";
alunos[201002] = "Renan Oliveira";
alunos[201003] = "Eduardo Cassinotte";
alunos[201004] = "Neile Silva";
alunos[201005] = "Henrique Zechi";

for (const chave in alunos){
    console.log(`${chave}: ${alunos[chave]}`);
}