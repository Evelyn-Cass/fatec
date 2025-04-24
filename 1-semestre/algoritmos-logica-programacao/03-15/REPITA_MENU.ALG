Algoritmo "REPITA_MENU"

Var
   opcao:inteiro

Inicio
   Repita
      Escreval("Escolha um Opção:")
      Escreval("1 - Dizer Olá!")
      Escreval("2 - Dizer Oi!")
      Escreval("0 - Sair do Programa")
      Escreval("Digite o número referente a opção escolhida")
      Leia(opcao)
      LimpaTela

      Se (opcao = 1) Entao
         Escreval("Olá!")
         Escreval("")
      FimSe
      Se (opcao = 2) Entao
         Escreval("Oi!")
         Escreval("")
      FimSe
   Ate (opcao = 0)

   Escreval("Programa Encerrado!")
Fimalgoritmo