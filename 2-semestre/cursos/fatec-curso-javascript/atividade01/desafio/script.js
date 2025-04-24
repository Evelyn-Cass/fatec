function fatorial(numero) {
    const resultado = document.getElementById("resultado");
    let fatorial = 1;
    let i = numero;
    resultado.innerHTML = numero + "! = ";
    while (i >= 1) {
        resultado.innerHTML += i + "! ";
        fatorial = fatorial * i
        if (i == 1) {
            resultado.innerHTML += " = ";
        }
        else {
            resultado.innerHTML += " * ";
        }
        i--;
    }
    resultado.innerHTML += fatorial
}