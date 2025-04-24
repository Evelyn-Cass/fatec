var frutas = ["maça","banana","maça","laranja"];

document.getElementById("adicionar").addEventListener("click", (e) => {
    e.preventDefault();

    let i=0;
    maca = 0;
    banana = 0;
    laranja = 0;

    frutas.forEach(element => {
        if (element == "maça"){
            maca++;
        }
        else if (element == "banana"){
            banana++;
        }
        else{
            laranja++;
        }
    });

    document.getElementById("resultado").innerHTML = "Maça: " + maca + "<br>" +"Banana: " + banana + "<br>" + "Laranja: " + laranja;

})