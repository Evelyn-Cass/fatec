Algoritmo "MEDIA_ALTURA_JOGADORES"

Var

   mediaAltura, maiorAltura, menorAltura, altura :real
   numeroJogadores, i:inteiro
Inicio

   mediaAltura <- 0
   maiorAltura <- 0
   menorAltura <- 0
   altura <- 0
   numeroJogadores <- 0
   i <- 0
   
   Escreval("Informe o número de jogadores no time:")
   Leia(numeroJogadores)
   LimpaTela

   Para i De 1 Ate numeroJogadores Faca

      Escreval("Informe a altura do",i,"º jogador:")
      Leia(altura)
      LimpaTela

      mediaAltura <- mediaAltura + altura

      Se ( i = 1) Entao
         maiorAltura <- altura
         menorAltura <- altura
      SeNao
         Se (altura > maiorAltura) Entao
            maiorAltura <- altura
         FimSe
         Se (altura < menorAltura) Entao
            menorAltura <- altura
         FimSe
      FimSe

   FimPara

   mediaAltura <- mediaAltura / numeroJogadores

   Escreval("              Resultados:")
   Escreval("----------------------------------------")
   Escreval("Número de jogadores:",numeroJogadores)
   Escreval("Média da altura:",mediaAltura:5:2)
   Escreval("Altura mais alta:",maiorAltura:5:2)
   Escreval("Altura mais baixa:",menorAltura:5:2)
   Escreval("----------------------------------------")




Fimalgoritmo