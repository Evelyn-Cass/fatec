Algoritmo "VETOR_CRESCENTE"

Var
   ordem, ordemCrescente, ordemVetor:vetor[1..10] de inteiro
   i,x :inteiro
Inicio




   Para i de 1 até 10 faça

      Escreval("Digite o",i,"º número:")
      Leia(ordem[i])

      LimpaTela

   fimPara

   Escreval("Gerando Resultados....")

   //Maior número e menor Número
   Para i de 1 até 10 faça

      Se i = 1 então
         ordemCrescente[1] <- ordem[i]
         ordemVetor[1] <- i
         ordemCrescente[10] <- ordem[i]
         ordemVetor[10] <- i
      senão
         Se ordem[i] < ordemCrescente[1] então
            ordemCrescente[1] <- ordem[i]
            ordemVetor[1] <- i
         fimSe
         Se ordem[i] > ordemCrescente[10] então
            ordemCrescente[10] <- ordem[i]
            ordemVetor[10] <- i
         fimSe
      fimSe
      ordemCrescente[2] <- ordemCrescente[10]
      ordemCrescente[3] <- ordemCrescente[10]
      ordemCrescente[4] <- ordemCrescente[10]
      ordemCrescente[5] <- ordemCrescente[10]
      ordemCrescente[6] <- ordemCrescente[1]
      ordemCrescente[7] <- ordemCrescente[1]
      ordemCrescente[8] <- ordemCrescente[1]
      ordemCrescente[9] <- ordemCrescente[1]
   fimPara


   //Posição 2 e 9
   Para i de 1 até 10 faça

      Se i <> ordemVetor[1] então

         Se (ordem[i] <= ordemCrescente[2]) então
            ordemCrescente[2] <- ordem[i]
            ordemVetor[2] <- i
         fimSe
      fimSe
      Se i <> ordemVetor[10] então
         Se ordem[i] >= ordemCrescente[9] então
            ordemCrescente[9] <- ordem[i]
            ordemVetor[9] <- i
         fimSe
      fimSe
   fimPara

   //Posição 3 e 8
   Para i de 1 até 10 faça

      Se (i <> ordemVetor[1]) e (i <> ordemVetor[2]) então

         Se (ordem[i] <= ordemCrescente[3]) então
            ordemCrescente[3] <- ordem[i]
            ordemVetor[3] <- i
         fimSe
      fimSe
      Se (i <> ordemVetor[10]) e (i <> ordemVetor[9]) então
         Se ordem[i] >= ordemCrescente[8] então
            ordemCrescente[8] <- ordem[i]
            ordemVetor[8] <- i
         fimSe
      fimSe
   fimPara

   //Posição 4 e 7
   Para i de 1 até 10 faça

      Se (i <> ordemVetor[1]) e (i <> ordemVetor[2]) e (i <> ordemVetor[3])então

         Se (ordem[i] <= ordemCrescente[4]) então
            ordemCrescente[4] <- ordem[i]
            ordemVetor[4] <- i
         fimSe
      fimSe
      Se (i <> ordemVetor[10]) e (i <> ordemVetor[9]) e (i <> ordemVetor[8]) então
         Se ordem[i] >= ordemCrescente[7] então
            ordemCrescente[7] <- ordem[i]
            ordemVetor[7] <- i
         fimSe
      fimSe
   fimPara

   //Posição 5 e 6
   Para i de 1 até 10 faça

      Se (i <> ordemVetor[1]) e (i <> ordemVetor[2]) e (i <> ordemVetor[3]) e (i <> ordemVetor[4])então

         Se (ordem[i] <= ordemCrescente[5]) então
            ordemCrescente[5] <- ordem[i]
            ordemVetor[5] <- i
         fimSe
      fimSe
      Se (i <> ordemVetor[10]) e (i <> ordemVetor[9]) e (i <> ordemVetor[8]) e (i <> ordemVetor[7]) então
         Se ordem[i] >= ordemCrescente[6] então
            ordemCrescente[6] <- ordem[i]
            ordemVetor[6] <- i
         fimSe
      fimSe
   fimPara
   LimpaTela





   //Resultados

   Escreva("Seguência Original é:")

   Para i de 1 até 10 faça

      Escreva(ordem[i])
      Se (i <> 10) então
         Escreva(",")
      FimSe

   FimPara

   Escreval()
   Escreva("Seguência em Ordem Crescente é:")

   Para i de 1 até 10 faça

      Escreva(ordemCrescente[i])
      Se (i <> 10) então
         Escreva(",")
      FimSe

   fimPara



Fimalgoritmo