const btnTheme = document.getElementById('tema');
const body = document.body;

btnTheme.addEventListener('click', () => {
    body.classList.toggle("dark-mode");

    const icone = document.getElementById('icone-tema');

    if (icone.classList.contains('fa-sun')) {
        icone.classList.remove('fa-sun');
        icone.classList.add('fa-moon');
    }
    else {
        icone.classList.remove('fa-moon');
        icone.classList.add('fa-sun');  
    }
    // if (body.classList.contains('dark-mode')) {


    // } else {
    // }
});