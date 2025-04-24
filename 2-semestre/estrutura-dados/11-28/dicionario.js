const apiResponse = {
    status: 'sucess',
    data:{
        id: 1,
        nome: "produto A",
        preco: 100
    }
}

console.log(apiResponse.data.nome);

//Criando um dicionário com um objeto
const dicionario ={
    nome:"João",
    idade: 25,
    profissao:"Engenheiro"
}
console.log(dicionario.nome);
console.log((dicionario["idade"]));

const dicionario2 = {};

dicionario2["cor"] = "Azul";
dicionario2.tamanho = "Grande";

console.log(dicionario2);

delete dicionario2["cor"];
console.log(dicionario2);

const dicionario3 = {
    fruta: "maçã",
    cor: "vermelho",
    preco:5
}

for(const chave in dicionario3){
    console.log(`${chave}: ${dicionario[chave]}`);
}

const dicionario4 = {
    nome: "João",
    idade: 25,
    cidade: "Rio de Janeiro"
}

console.log(Object.keys(dicionario4));
console.log(Object.values(dicionario4));

Object.entries(dicionario4).forEach(([chave, valor]) =>{
    console.log(`${chave}: ${valor}`);
})

const dicionario5 = {fruta: "maçã"};

if("fruta" in dicionario5){
    console.log("Chave encontrada!");
} else{
    console.log("Chave não encontrada!");
}

const dados= {nome: "Carlos"};

if (!("idade" in dados)){
    dados["idade"] = 28;
}

console.log(dados);