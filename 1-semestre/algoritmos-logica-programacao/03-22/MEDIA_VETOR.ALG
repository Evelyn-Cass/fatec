Algoritmo "MEDIA_VETOR"

Var
   nome:vetor[1..10] de caractere
   nota1:vetor[1..10] de real
   nota2:vetor[1..10] de real
   media:vetor[1..10] de real
   mediaSala:real
   i:inteiro
Inicio
   mediaSala <- 0

   Para i de 1 ate 10 faca

      Escreval("Nome do",i,"º aluno:")
      Leia(nome[i])

      repita
         Escreval("Entre as notas do(a)",nome[i],":")
         Escreval("1ª nota:")
         Leia(nota1[i])
         LimpaTela
      ate (nota1[i] >= 0) e (nota1[i] <= 10)

      repita
         Escreval("Entre as notas do(a)",nome[i],":")
         Escreval("2ª nota:")
         Leia(nota2[i])
         LimpaTela
         LimpaTela
      ate (nota1[i] >= 0) e (nota1[i] <= 10)

      media[i] <- (nota1[i] + nota2[i]) / 2
      mediaSala <- mediaSala + media[i]

   fimPara
   mediaSala <- mediaSala / i

   Escreval("      Resultados:")
   Escreval("------------------------")

   Para i de 1 ate 10 faca
      Escreval("Aluno(a):",nome[i]:5:2)
      Escreval("1ª nota:",nota1[i]:5:2)
      Escreval("2ª nota:",nota2[i]:5:2)
      Escreval("Média:",media[i]:5:2)
      Escreval("------------------------")
   fimPara
   Escreval("Média da Sala:",mediaSala:5:2)


Fimalgoritmo