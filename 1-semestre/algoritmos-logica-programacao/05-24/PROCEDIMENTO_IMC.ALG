Algoritmo "PROCEDIMENTO_IMC"

Var
   imc : real

Procedimento calcularIMC()
Var
   peso, altura: real
Inicio

   Escreval("Qual é sua altura?")
   Leia(altura)
   LimpaTela

   Escreval("Qual é seu peso?")
   Leia(peso)
   LimpaTela

   imc <- peso / (altura*altura)

fimProcedimento

Inicio

   calcularIMC()

   Escreval("O seu IMC é ",imc:5:2)

Fimalgoritmo