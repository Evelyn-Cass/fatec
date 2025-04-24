var array = [1,5,3,9];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    let maiorNumero = 0;

    let i=0;
    array.forEach(element => {
        if (i == 0) {
            maiorNumero = element;
        }
        else{
            if (element > maiorNumero) {
                maiorNumero = element;
            }
        }
        i++;
    });

    document.getElementById("resultado").innerHTML = "Números: " + array + "<br>" +"Maior número: " + maiorNumero;

})