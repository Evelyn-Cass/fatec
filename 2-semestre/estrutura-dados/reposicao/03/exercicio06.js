function contarLetras(str) {
    const mapaLetras = new Map();

    for (let char of str) {
        if (char !== ' ') {
            if (mapaLetras.has(char)) {
                mapaLetras.set(char, mapaLetras.get(char) + 1);
            } else {
                mapaLetras.set(char, 1);
            }
        }
    }

    return mapaLetras;
}

const stringExemplo = "Exemplo de String";
const resultado = contarLetras(stringExemplo);
console.log(resultado);