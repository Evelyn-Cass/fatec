var matriz = [[1,2],[3,4]];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    let i=0;
    let z=0;
    matriz.forEach(element => {
        element.forEach(element => {
            document.getElementById("resultado").innerHTML +=  `Matriz[${z},${i}] = ${element}<br>`;
            i++;
        })
        z++;
        i=0;
    });


});