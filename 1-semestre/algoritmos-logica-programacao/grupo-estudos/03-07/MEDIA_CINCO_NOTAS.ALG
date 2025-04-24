Algoritmo "MEDIA_CINCO_NOTAS"

Var
   nota, soma, media:real;
   i:inteiro;
Inicio
   PARA i DE 1 ATE 5 FACA
      ESCREVAL("Digite a ",i,"º nota")
      Leia (nota)
      soma <- soma + nota
   FIMPARA
   LIMPATELA
   media <- soma / 5
   ESCREVAL("A média das notas é:",media)

Fimalgoritmo