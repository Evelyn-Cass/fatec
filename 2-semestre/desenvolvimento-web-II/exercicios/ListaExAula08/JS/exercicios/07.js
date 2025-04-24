var array = [10,20,30];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    let numerosMaiores = [];
    array.forEach(element => {
        if (element>=15) {
            numerosMaiores.push(element);
        }
    });

    document.getElementById("resultado").innerHTML = "Os números maiores que 15: " + numerosMaiores+".";
    })