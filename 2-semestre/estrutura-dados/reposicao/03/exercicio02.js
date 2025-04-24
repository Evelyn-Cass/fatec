function contarCaracteres(str) {
    const resultado = {};

    for (let char of str) {
        if (char !== ' ') {
            if (resultado[char]) {
                resultado[char]++;
            } else {
                resultado[char] = 1;
            }
        }
    }

    return resultado;
}

const stringExemplo = "exemplo de string";
const resultado = contarCaracteres(stringExemplo);


for (const chave in resultado){
    console.log(`${chave}: ${resultado[chave]}`);
}