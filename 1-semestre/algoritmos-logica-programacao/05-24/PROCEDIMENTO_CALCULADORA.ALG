Algoritmo "PROCEDIMENTO_CALCULADORA"

Var
   primeiro_numero, segundo_numero, resultado: real
   opcao : inteiro
   pausar : caractere

Procedimento somar()
Inicio
   resultado <- primeiro_numero + segundo_numero
fimProcedimento

Procedimento subtrair()
Inicio
   resultado <- primeiro_numero - segundo_numero
fimProcedimento

Procedimento dividir()
Inicio
   resultado <- primeiro_numero / segundo_numero
fimProcedimento

Procedimento multiplicar()
Inicio
   resultado <- primeiro_numero * segundo_numero
fimProcedimento

Procedimento receberValores()
Inicio

   Escreval("Digite o primeiro número:")
   Leia(primeiro_numero)
   LimpaTela

   Escreval("Digite o segundo número:")
   Leia(segundo_numero)
   LimpaTela

fimProcedimento




Inicio

   repita

      Escreval("   Calculadora!")
      Escreval("-------------------")
      Escreval("1 - Somar")
      Escreval("2 - Subtrair")
      Escreval("3 - Multiplicar")
      Escreval("4 - Dividir")
      Escreval("0 - Sair")
      Escreval("-------------------")
      Escreval("Envie o número referente a opcão desejada:")
      Leia(opcao)
      LimpaTela

      Escolha (opcao)
      caso 1
         receberValores()
         somar()
         Escreval(primeiro_numero:2:2," + ",segundo_numero:2:2," = ",resultado:2:2)
         Escreval("Pressione ENTER para continuar!")
         Leia(pausar)
         LimpaTela
      caso 2
         receberValores()
         subtrair()
         Escreval(primeiro_numero:2:2," - ",segundo_numero:2:2," = ",resultado:2:2)
         Escreval("Pressione ENTER para continuar!")
         Leia(pausar)
         LimpaTela
      caso 3
         receberValores()
         multiplicar()
         Escreval(primeiro_numero:2:2," x ",segundo_numero:2:2," = ",resultado:2:2)
         Escreval("Pressione ENTER para continuar!")
         Leia(pausar)
         LimpaTela
      caso 4
         receberValores()
         dividir()
         Escreval(primeiro_numero:2:2," ÷ ",segundo_numero:2:2," = ",resultado:2:2)
         Escreval("Pressione ENTER para continuar!")
         Leia(pausar)
         LimpaTela
      fimEscolha


   até (opcao = 0)



Fimalgoritmo