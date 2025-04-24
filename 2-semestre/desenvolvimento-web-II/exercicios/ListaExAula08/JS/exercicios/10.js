var matriz = [[1, 2], [3, 4]];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();


    let matrizTransposta = [[], []];

    for (let i = 0; i < matriz.length; i++) {
        for (let z = 0; z < matriz.length; z++) {
            matrizTransposta[z][i] = matriz[i][z];
        }
    }

    document.getElementById("resultado").innerHTML = `Matriz Original: ${matriz}<br>` + `Matriz Transposta: ${matrizTransposta}`;

});