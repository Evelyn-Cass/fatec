
document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    const numero = document.getElementById("numero").value;
    const resultado = document.getElementById("resultado");
    document.getElementById("numero").value = "";

    if (numero == "") {
        document.getElementById("aviso").style.display = "block";
    } else {
        resultado.innerHTML = "";
        let numeros =[];
        for (let i = 0; i < 10; i++) {
            numeros.push(Math.floor(Math.random() * 100));
        }

        numeros.forEach(element => {
            resultado.innerHTML += `${numero} x ${element} = ${element * numero}<br>`;
        });


        document.getElementById("aviso").style.display = "none";
    }




})