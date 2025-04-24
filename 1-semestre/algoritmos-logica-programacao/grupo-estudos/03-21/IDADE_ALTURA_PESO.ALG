Algoritmo "IDADE_ALTURA_PESO"

Var
   idade:inteiro
   altura:real
   peso:real
   quantidadePessoasMais50anos:inteiro
   
   somaAlturasPessoas10a20anos:real
   mediaAlturasPessoas10a20anos:real
   quantidadePessoas10a20anos:inteiro
   
   quantidadePessoasMenos50quilos:inteiro
   porcentagemPessoasMenos50quilos:real
   i:inteiro
Inicio

   quantidadePessoasMais50anos <- 0
   quantidadePessoasMenos50quilos <- 0
   somaAlturasPessoas10a20anos <- 0
   quantidadePessoas10a20anos <- 0

   Para i de 1 ate 10 faca



      Escreval("Digite a idade da",i,"º Pessoa:")
      Leia(idade)
      LimpaTela
      
      Escreval("Digite a altura da",i,"º Pessoa:")
      Leia(altura)
      LimpaTela


      Escreval("Digite o peso da",i,"º Pessoa:")
      Leia(peso)
      LimpaTela


      Se (idade > 50) entao
         quantidadePessoasMais50anos <- quantidadePessoasMais50anos + 1
      fimSe

      Se (peso < 50) entao
         quantidadePessoasMenos50quilos <- quantidadePessoasMenos50quilos + 1
      fimSe

      Se (idade >= 10) e (idade <= 20) entao
         somaAlturasPessoas10a20anos <- somaAlturasPessoas10a20anos + altura
         quantidadePessoas10a20anos <- quantidadePessoas10a20anos + 1
      fimSe

   fimPara
   
   
   porcentagemPessoasMenos50quilos <- (quantidadePessoasMenos50quilos * 100) / 10
   
   mediaAlturasPessoas10a20anos<- somaAlturasPessoas10a20anos / quantidadePessoas10a20anos
   

   Escreval("                        Resultados:")
   Escreval("----------------------------------------------------------------")
   Escreval("Idade superior a 50 anos:",quantidadePessoasMais50anos)
   Escreval("Média das Alturas das pessoas com idade de 10 a 20 anos:",mediaAlturasPessoas10a20anos:5:2)
   Escreval("Peso inferior a 50 quilos:" ,porcentagemPessoasMenos50quilos,"%")
   Escreval("----------------------------------------------------------------")

   
Fimalgoritmo
