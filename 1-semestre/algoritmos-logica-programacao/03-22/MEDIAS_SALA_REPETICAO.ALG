Algoritmo "MEDIAS_SALA_REPETICAO"

Var
   nota1,nota2,media:real
   somaMediaAlunos,mediaSala:real
   i:inteiro
   pausar:caractere
Inicio
   Para i de 1 ate 10 faca
      Escreval("Notas do",i,"º aluno:")

      repita
         Escreval("Digite a primeira nota:")
         Leia(nota1)
         LimpaTela
      até (nota1 >= 0) e (nota1 <= 10)

      Escreval("Notas do",i,"º aluno:")

      Escreval("Digite a segunda nota:")
      Leia(nota2)
      LimpaTela
      Enquanto (nota2 < 0) e (nota2 > 10) faca
         Escreval("Digite a segunda nota:")
         Leia(nota2)
         LimpaTela
      fimEnquanto

      media <- (nota1 + nota2) / 2
      somaMediaAlunos <- somaMediaAlunos + media

      Escreval("A média do",i,"º aluno é:",media:5:2)
      Escreval
      Escreval("Pressione ENTER para continuar!")
      Leia(pausar)
      LimpaTela

   fimPara
   
   mediaSala <- somaMediaAlunos / i

   Escreval("A média da sala é:",mediaSala:5:2)
   Escreval
   Escreval("Pressione ENTER para continuar!")
   Leia(pausar)
   LimpaTela

Fimalgoritmo