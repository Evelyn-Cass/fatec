const dicionario = {};
dicionario["nome"] = "Carlos";
dicionario["numero"] = 42;

console.log((dicionario["nome"]));
console.log(dicionario["numero"]);

for (const chave in dicionario){
    console.log(`${chave}: ${dicionario[chave]}`);
}

const mapa = new Map();
mapa.set("nome","Carlos");
mapa.set("numero", 42);

console.log(mapa.get("nome"));
console.log(mapa.get(42));

for (const[chave, valor] of mapa){
    console.log(`${chave}: ${valor}`)
}