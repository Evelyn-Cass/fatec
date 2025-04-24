var contagem = {
    quantidadePar: 0,
    quantidadeImpar: 0,
    Pares: [],
    Impares: []
}

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    const numero = document.getElementById("numero").value;
    const resultado = document.getElementById("resultado");
    document.getElementById("numero").value = "";

    if (numero == "") {
        document.getElementById("aviso").style.display = "block";
    } else {

        if (parseFloat(numero) % 2 == 0) {
            contagem.quantidadePar++;
            contagem.Pares.push(parseFloat(numero));
        }
        else {
            contagem.quantidadeImpar++;
            contagem.Impares.push(parseFloat(numero));
        }

        resultado.innerHTML = "<b>Números Pares:</b> " + contagem.Pares + "<br>" + "<b>Quantidade de pares:</b> " + contagem.quantidadePar + "<br>" + "<b>Números Impares:</b> " + contagem.Impares + "<br>" + "<b>Quantidade de ímpares:</b> " + contagem.quantidadeImpar;


        document.getElementById("aviso").style.display = "none";
    }




})