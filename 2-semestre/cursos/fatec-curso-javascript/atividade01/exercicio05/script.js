const btn = document.getElementById("button");
const resultado = document.getElementById("resultado");

btn.addEventListener("click", () => {
    btn.style.display = "none";
    resultado.innerHTML += "<tr><th>Tabuada</th></tr><tr>";
        for (let i = 0; i <= 10; i++) {
        resultado.innerHTML += `<td> 5 x ${i} = ${5 * i}</td>`;
    }
    resultado.innerHTML += "</tr>";
});
