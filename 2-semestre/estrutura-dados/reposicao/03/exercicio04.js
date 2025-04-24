const dicionario ={
    nome:"João",
    idade: 25,
    profissao:"Engenheiro",
    website: null,
    dependentes: undefined,
    nomeMae: null
}
console.table(dicionario);

for (const chave in dicionario) {
    if (dicionario[chave] === null || dicionario[chave]=== undefined){
        delete dicionario[chave];
    }
}

console.table(dicionario);