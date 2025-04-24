function objetoParaMap(obj) {
    const mapa = new Map();
    for (let chave in obj) {
        if (obj.hasOwnProperty(chave)) {
            mapa.set(chave, obj[chave]);
        }
    }
    return mapa;
}

const objetoExemplo = { nome: "João", idade: 25, profissao: "Engenheiro" };
const mapaResultado = objetoParaMap(objetoExemplo);
console.log(mapaResultado);

function mapParaObjeto(mapa) {
    const obj = {};
    for (let [chave, valor] of mapa) {
        obj[chave] = valor;
    }
    return obj;
}

const mapaExemplo = new Map([["nome", "João"], ["idade", 25], ["profissao", "Engenheiro"]]);
const objetoResultado = mapParaObjeto(mapaExemplo);
console.log(objetoResultado);
