const btn = document.getElementById("button");
const resultado = document.getElementById("resultado");

btn.addEventListener("click", () => {
    btn.style.display = "none";
    for (let i = 0; i <= 10; i++) {
        resultado.innerHTML += `5 x ${i} = ${5 * i} <br>`;
    }
});
