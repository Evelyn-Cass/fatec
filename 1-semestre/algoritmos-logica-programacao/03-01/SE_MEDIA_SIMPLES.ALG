Algoritmo "SE_MEDIA_SIMPLES"

Var
   nota1,nota2,media:real

Inicio

   Escreval ("Digite a primeira nota:")
   Leia (nota1)

   Escreval ("Digite a segunda nota:")
   Leia (nota2)

   media <- (nota1+nota2)/2
   Escreval ("A média das notas",nota1," e",nota2," é:",media)

   Se (media>=6) Entao
      Escreval("Parabéns, você foi Aprovado!")
   Senao
      Escreval("Você foi reprovado!")
   Fimse

Fimalgoritmo