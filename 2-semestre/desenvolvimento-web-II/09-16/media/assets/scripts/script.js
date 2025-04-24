/*Capturar dados do formulário*/
// Declarar as váriaveis para receber os dados do formulário
// Declarar constantes para pesos
// Lançar as faltas
// Calcular a média final
// Exibir a média final e resultado Aprovado(>=6) ou Reprovado(<6)


const faltas = document.getElementById("faltas");

faltas.addEventListener("input", function () {

    let quantidadeFaltas = parseFloat(document.getElementById("faltas").value);
    const totalAulas = 80;
    porcentagemPresenca = (1 - (quantidadeFaltas / totalAulas)) * 100;

    if (porcentagemPresenca >= 0 && porcentagemPresenca <= 100) {
        document.getElementById("porcentagem-presenca").value = porcentagemPresenca + "%";
    }
    else {
        document.getElementById("porcentagem-presenca").value = "";
    }
    if (porcentagemPresenca < 75) {
        document.getElementById("porcentagem-presenca").style = "color: red";
    } else {
        document.getElementById("porcentagem-presenca").style = "color: green";
    }

})

function calcularMedia() {
    if (document.getElementById("form").checkValidity()) {

        let avaliacao1 = parseFloat(document.getElementById("avaliacao1").value);
        let avaliacao2 = parseFloat(document.getElementById("avaliacao2").value);
        let projeto1 = parseFloat(document.getElementById("projeto1").value);
        let projeto2 = parseFloat(document.getElementById("projeto2").value);
        let participacao = parseFloat(document.getElementById("participacao").value);
        let porcentagemPresenca = parseFloat(document.getElementById("porcentagem-presenca").value);

        const peso1 = 0.15;
        const peso2 = 0.2;
        const peso3 = 0.3;

        // A1*0.15+A2*0.15+P1*0.2+P2*0.2+PD*0.3

        const media = ((avaliacao1 * peso1) + (avaliacao2 * peso1) + (projeto1 * peso2) + (projeto2 * peso2) + (participacao * peso3)).toFixed(2);

        document.getElementById("container").style = "visibility: visible;"
        document.getElementById("aviso").style = "visibility: hidden;"
        document.getElementById("media").innerHTML = media;

        if ((media >= 6) && (porcentagemPresenca >= 75)) {
            document.getElementById("resultado").innerHTML = "Aprovado";
            document.getElementById("resultado").style.color = "green";
        } else {
            document.getElementById("resultado").innerHTML = "Reprovado";
            document.getElementById("resultado").style.color = "red";
        }
    } else {
        document.getElementById("aviso").style = "visibility: visible;"
        document.getElementById("container").style = "visibility: hidden;"
    }

};

function limpar() {
    document.getElementById('form').reset();
    document.getElementById("container").style = "visibility: hidden;"
    document.getElementById("aviso").style = "visibility: hidden;"
    document.getElementById("avaliacao1").focus();

};

function checarNumero(input, max, min) {
    
    if (input.value > max || input.value < min) input.value = null;
}

