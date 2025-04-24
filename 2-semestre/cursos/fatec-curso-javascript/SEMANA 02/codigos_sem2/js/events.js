function valida(tag, tipo) {
  let proximoElemento = tag.nextElementSibling; // pega o br
  proximoElemento = proximoElemento.nextElementSibling; // pega o span
  if (tipo == "vazio") {
    if (tag.value == "") {
      tag.style.borderColor = "red";

      proximoElemento.style.color = "red";
      proximoElemento.style.fontSize = "10px";
      proximoElemento.style.fontWeight = "200";

      proximoElemento.innerHTML = `o campo [ ${tag.id} ] não pode estar vazio!`;
    } else {
      tag.style.borderColor = "green";
      proximoElemento.innerHTML = ``;
    }
  }

  if (tipo == "cpf") {
    const cpf = tag.value.replace(/\D/g, ""); // troca tudo que não é numero por ''
    console.log(cpf.length)
    if (cpf.length < 11 || cpf.length > 11) {
      // poderia ser adicionado o calculo de cpf

      // calculaCPF(cpf);

      tag.style.borderColor = "red";

      proximoElemento.style.color = "red";
      proximoElemento.style.fontSize = "10px";
      proximoElemento.style.fontWeight = "200";

      proximoElemento.innerHtml = `CPF inválido!`;
    } else {
      tag.style.borderColor = "green";
      proximoElemento.innerHtml = ``;
    }
  }
}

function formata(tag, tipo) {
  if (tipo == "cpf") {
    let cpf = tag.value.replace(/\D/g, ""); // troca tudo que não é numero por ''
    if (cpf.length <= 11) {
      cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
      cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
      cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
    }

    tag.value = cpf;
  } else if (tipo == "cep") {
  }
}
