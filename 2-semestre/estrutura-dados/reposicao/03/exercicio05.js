function contarPalavras(frase) {
    const mapaPalavras = new Map();
    const palavras = frase.split(' ');

    for (let palavra of palavras) {
        if (mapaPalavras.has(palavra)) {
            mapaPalavras.set(palavra, mapaPalavras.get(palavra) + 1);
        } else {
            mapaPalavras.set(palavra, 1);
        }
    }

    return mapaPalavras;
}


const fraseExemplo = "esta é uma frase de exemplo esta é uma frase";
const resultado = contarPalavras(fraseExemplo);
console.log(resultado);