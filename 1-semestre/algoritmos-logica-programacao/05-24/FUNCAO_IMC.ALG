Algoritmo "FUNCAO_IMC"

Var

Funcao calcularIMC() : real
Var
   peso, altura : real
Inicio
   Escreval("Qual é sua altura?")
   Leia(altura)
   LimpaTela


   Escreval("Qual é seu peso?")
   Leia(peso)
   LimpaTela

   Retorne peso / (altura * altura)

fimFuncao


Inicio

   Escreval("Seu IMC é ",calcularIMC():2:2)

Fimalgoritmo