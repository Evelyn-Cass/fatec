function juntarNome() {
    let nome = document.getElementById('nome').value;
    let sobrenome = document.getElementById("sobrenome").value;
    if (nome != '' && sobrenome != '') {
        document.getElementById('nomeCompleto').innerHTML = nome + ' ' + sobrenome;
        document.getElementById("container").style.display = "flex";
        mostrarLog(nome, sobrenome);
        // escreverNomeCompleto();
    }
    else {
        document.getElementById("aviso").style.display = "block";
    }
    ajustarFoco();
}

function limpar() {
    // document.getElementById('nomeCompleto').innerHTML = '';
    // document.getElementById('nome').value = '';
    // document.getElementById('sobrenome').value = '';
    document.getElementById("nomes").reset();
    document.getElementById("aviso").style.display = "none";
    document.getElementById('nome').focus();
    document.getElementById("container").style.display = "none";
}

function mostrarLog(nome, sobrenome) {
    console.log("Nome: " + nome);
    console.log("Sobrenome: " + sobrenome);
    console.log("Nome Completo: " + nome + ' ' + sobrenome);
}

function ajustarFoco() {
    document.getElementById('nome').focus();
}

// apaga o conteudo da página e escreve o nome e sobrenome
function escreverNomeCompleto() {
    let nome = document.getElementById('nome').value;
    let sobrenome = document.getElementById("sobrenome").value;
    document.writeln("Nome Completo: " + nome + ' ' + sobrenome + "<strong><br/>");
    document.writeln("<button id='voltar' onclick='history.back()'>Voltar</button>")
}
