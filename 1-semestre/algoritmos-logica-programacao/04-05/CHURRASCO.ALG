Algoritmo "CHURRASCO"

Var
   nomeItem:vetor[1..5] de caractere
   quantidadeItem:vetor[1..5] de real
   valorItem:vetor[1..5] de real
   totalItem:vetor[1..5] de real
   quantidadePessoas:inteiro]
   valorTotal:real
   valorIndividual:real
   i:inteiro
Inicio

   valorTotal <- 0

   Escreval("Quantas pessoas vão participar do churrasco?")
   Leia(quantidadePessoas)
   LimpaTela

   Para i de 1 até 5 faça
      Escreval("Qual é o nome do ",i,"º produto?")
      Leia(nomeItem[i])
      LimpaTela

      Escreval("Qual é a quantidade do ",i,"º produto?")
      Leia(quantidadeItem[i])
      LimpaTela

      Escreval("Qual é a valor do ",i,"º produto?")
      Leia(valorItem[i])
      LimpaTela

      totalItem[i] <- valorItem[i] * quantidadeItem[i]

      valorTotal <- valorTotal + totalItem[i]

   FimPara

   valorIndividual <- valorTotal / quantidadePessoas


   Escreval("                    CHURRASCO")
   Escreval("----------------------------------------------------")
   Escreval("Número de produtos:",i)

   para i de 1 até 5 faça
      Escreval(i,"º produto:",nomeItem[i]," valor:",totalItem[i])
   fimPara
   
   Escreval("Valor Total:",valorTotal)
   Escreval("Número de participantes:",quantidadePessoas)
   Escreval("Valor Individual:",valorIndividual)
   Escreval("----------------------------------------------------")


Fimalgoritmo