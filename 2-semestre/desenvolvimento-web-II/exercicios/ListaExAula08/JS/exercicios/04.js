var array = []

function bubblesort(array) {
    for (let i = 0; i < array.length; i++) {
        for (let j = 0; j < array.length - i - 1; j++) {
            if (array[j] < array[j + 1]) {
                let temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();
    if (array.length != 10) {
        const numero = document.getElementById("numero").value;
        const resultado = document.getElementById("resultado");
        document.getElementById("numero").value = "";

        if (numero == "" || numero > 4 || numero < 1) {
            document.getElementById("aviso").style.display = "block";
        } else {
    
            array.push(parseFloat(numero));

            bubblesort(array);

            resultado.innerHTML = "Ordem invertida: " + array;

            document.getElementById("aviso").style.display = "none";
        }

    }
    else {
        alert("10 valores adicionados!")
    }


})