window.onload = tratar_eventos;

function tratar_eventos() {

    document.getElementById('mostrar-form-cadastro').onclick = function () {
        this.style.display = 'none';
        document.getElementById('formulario-cadastro-contato').style.display = 'block';
        return false;
    }

    document.getElementById('esconde-form-cadastro').onclick = function () {
        document.getElementById('formulario-cadastro-contato').style.display = 'none';
        document.getElementById('mostrar-form-cadastro').style.display = 'block';
    }

    document.getElementById('form-contato').onsubmit = function () {

        var nome = document.getElementById('nome').value;
        var email = document.getElementById('email').value;
        var telefone = document.getElementById('telefone').value;
        var cidade = document.getElementById('cidade').value;

        var img_remove = document.createElement('img');
        img_remove.setAttribute('src', 'assets/images/cross.png');
        img_remove.className = 'botao-remover-contato';

        var td_remove = document.createElement('td');
        td_remove.appendChild(img_remove);

        var img_avatar = document.createElement('img');
        img_avatar.setAttribute('src', 'assets/images/' + this.avatar_selecionado.value);

        var td_avatar = document.createElement('td');
        td_avatar.appendChild(img_avatar);

        var td_nome = document.createElement('td');
        td_nome.appendChild(document.createTextNode(nome));

        var td_email = document.createElement('td');
        td_email.appendChild(document.createTextNode(email));

        var td_telefone = document.createElement('td');
        td_telefone.appendChild(document.createTextNode(telefone));

        var td_cidade = document.createElement('td');
        td_cidade.appendChild(document.createTextNode(cidade));

        var tr = document.createElement('tr');
        tr.appendChild(td_remove);
        tr.appendChild(td_avatar);
        tr.appendChild(td_nome);
        tr.appendChild(td_email);
        tr.appendChild(td_telefone);
        tr.appendChild(td_cidade);

        document.getElementById('tbl-contatos').getElementsByTagName('tbody')[0].appendChild(tr);

        document.getElementById("formulario-cadastro-contato").style.display = 'none';
        document.getElementById("mostrar-form-cadastro").style.display = 'block';

        ativar_botoes_exclusao();

        return false;
    }

    ativar_botoes_exclusao();
}

function ativar_botoes_exclusao() {

    var corpo_tabela = document.getElementById("tbl-contatos").getElementsByTagName("tbody")[0];
    var images_tabela = corpo_tabela.getElementsByTagName("img");

    for (var i = 0; i < images_tabela.length; i++) {

        if (images_tabela[i].getAttribute('class') == 'botao-remover-contato') {

            images_tabela[i].onclick = function () {

                if (confirm('Tem certeza que deseja remover este contato?')) {

                    this.parentElement.parentElement.remove();
                }
            }
        }
    }
}