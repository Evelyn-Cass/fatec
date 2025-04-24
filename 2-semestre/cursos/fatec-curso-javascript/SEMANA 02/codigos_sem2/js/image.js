// Gera um numero aleatório de 1 a 2
// Math.ceil arrendonda o numero para cima
// Randon gera um numero de 0 a 1, ex: 0.3
let numero = Math.floor(Math.random() * 3);

const imagens = [
  "img/banner1.jpg",
  "https://img.freepik.com/vetores-gratis/modelo-de-capa-de-facebook-de-loja-de-animais-desenhada-a-mao_23-2150384324.jpg",
  "https://media.gettyimages.com/id/1501066662/pt/vetorial/4k-landing-page-template-abstract-dynamic-modern-futuristic-multi-colored-simple-for.jpg?s=612x612&w=gi&k=20&c=Ow2u-yLiHObAyWt90O2FeFxuJeQfrgf2IjbXufL8iCg=",
];

let img = document.getElementById("banner");
img.src = imagens[numero];
console.log(numero);

setInterval(() => {
  numero = Math.floor(Math.random() * 3);
  img.src = imagens[numero];
}, 1000);
