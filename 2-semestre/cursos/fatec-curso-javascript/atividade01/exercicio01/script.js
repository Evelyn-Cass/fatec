const btn = document.getElementById("button");
const text = document.getElementById("text");

btn.addEventListener("click", () => {
    text.innerHTML = 'Bem vindo ao Site!';
    btn.style.display = "none";
});
