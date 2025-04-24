Algoritmo "FUNCAO_CALCULADORA"

Var
   primeiro_numero, segundo_numero : real

Funcao somar(x, y: real) : real
Inicio
   retorne x + y
fimFuncao

Inicio

   Escreval("Digite o primeiro número:")
   leia(primeiro_numero)
   LimpaTela
   
   Escreval("Digite o segundo número:")
   leia(segundo_numero)
   LimpaTela

   Escreva("O resultado da soma de")
   Escreva(primeiro_numero," +",segundo_numero," = ")
   Escreval(somar(primeiro_numero,segundo_numero))
Fimalgoritmo