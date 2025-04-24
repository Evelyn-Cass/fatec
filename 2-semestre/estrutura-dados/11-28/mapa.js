const mapa = new Map();

mapa.set("nome", "Ana");
mapa.set("idade", 30);

console.log(mapa.get("nome"));

console.log(mapa.has("idade"));

mapa.delete("idade");

console.log(mapa.has("idade"));


const mapa2 = new Map([
    ["chave1", "valor1"],
    ["chave2", "valor2"]]);

for (const [chave, valor] of mapa){
    console.log(`${chave}: ${valor}`);
}