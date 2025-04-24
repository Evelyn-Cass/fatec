var matriz = [[1,2],[3,4]];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    let soma = 0;
    let i=0;
    let z=0;
    matriz.forEach(element => {
        element.forEach(element => {
            if (z == 1 && i == 1) {
                document.getElementById("resultado").innerHTML += element + " = ";    
            }
            else{
                document.getElementById("resultado").innerHTML += element + " + ";
            }
            i++;
            soma += element;
        })
        z++;
        i=0;
    });

    document.getElementById("resultado").innerHTML += soma;

});