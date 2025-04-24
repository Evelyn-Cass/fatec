var array = []

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();
    if (array.length != 10) {
        const numero = document.getElementById("numero").value;
        const resultado = document.getElementById("resultado");
        document.getElementById("numero").value = "";

        if (numero == "") {
            document.getElementById("aviso").style.display = "block";
        } else {
            array.push(parseFloat(numero));

            if (array.length != 1) {
                let i = 0;
                let soma = 0;
                array.forEach(valor => {
                    soma += valor;
                    if (i == 0) {
                        resultado.innerHTML = valor;
                    }
                    else {
                        resultado.innerHTML += " + " + valor;
                    }
                    i++;
                    if (i == array.length) {
                        resultado.innerHTML += " = " + soma;
                    }

                });
            }
            else{
                resultado.innerHTML = array[0];
            }
            document.getElementById("aviso").style.display = "none";
        }

    }
    else {
        alert("10 valores adicionados!")
    }


})