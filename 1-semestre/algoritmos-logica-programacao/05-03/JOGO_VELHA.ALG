Algoritmo "JOGO_VELHA"
Var
   jogo: vetor[1..3,1..3] de caracter
   linha, coluna: inteiro
   jogador: caractere
   i, j, jogada, resto:inteiro
   fim, verificacao:logico
Inicio

   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         jogo[i,j] <- " "
      fimPara
   fimPara
   fim <- falso
   Para jogada de 1 até 9 faca

      resto <- jogada mod 2
      Se (resto = 0) então
         jogador <- "X"
      Senao
         jogador <- "O"
      fimSe
      Escreval("Jogo da Velha!")
      Escreval

      para i de 1 ate 3 faca
         para j de 1 ate 3 faca
            se ( j <> 3) entao
               Escreva(" ",jogo[i,j],"  |")
            senao
               Escreva(" ",jogo[i,j],"  ")
            fimSe
         fimPara
         se ( i <> 3) entao
            Escreval
            Escreval("--------------")
         fimSe
      fimPara

      Escreval
      Escreval
      Escreval("JOGADOR ",jogador)
      Escreval("Qual posição você deseja?")

      verificacao <- falso
      Repita
         Repita
            Escreval("Informe a linha:")
            leia(linha)
         até (linha > 0) e (linha < 4)

         Repita
            Escreval("Informe a coluna:")
            leia(coluna)
         até (linha > 0) e (linha < 4)

         se (jogo[linha,coluna] <> " ") então
            LimpaTela

            Escreval("Jogo da Velha!")
            Escreval
            para i de 1 ate 3 faca
               para j de 1 ate 3 faca
                  se ( j <> 3) entao
                     Escreva(" ",jogo[i,j],"  |")
                  senao
                     Escreva(" ",jogo[i,j],"  ")
                  fimSe
               fimPara
               se ( i <> 3) entao
                  Escreval
                  Escreval("--------------")
               fimSe
            fimPara
            Escreval
            Escreval
            Escreval("Posição Ocupada!!")
            Escreval("JOGADOR ",jogador)
            Escreval("Qual posição você deseja?")


         senão
            verificacao <- verdadeiro
            jogo[linha,coluna] <- jogador
         fimse

      até (verificacao =  verdadeiro)
      LimpaTela



      para i de 1 até 3 faça
         Se (jogo[i,1] <> " ") e (jogo[i,1] = jogo[i,2]) e (jogo[i,2] = jogo[i,3]) então
            fim <- verdadeiro
         fimse
         Se (jogo[1,i] <> " ") e (jogo[1,i] = jogo[2,i]) e (jogo[2,i] = jogo[3,i]) então
            fim <- verdadeiro
         fimse
      fimPara
      Se (jogo[1,1] <> " ") e (jogo[1,1] = jogo[2,2]) e (jogo[2,2] = jogo[3,3]) então
         fim <- verdadeiro
      fimse
      Se (jogo[1,3] <> " ") e (jogo[1,3] = jogo[2,2]) e (jogo[2,2] = jogo[3,1]) então
         fim <- verdadeiro
      fimse

      se fim = verdadeiro então
         Escreval("Jogo da Velha!")
         Escreval
         para i de 1 ate 3 faca
            para j de 1 ate 3 faca
               se ( j <> 3) entao
                  Escreva(" ",jogo[i,j],"  |")
               senao
                  Escreva(" ",jogo[i,j],"  ")
               fimSe
            fimPara
            se ( i <> 3) entao
               Escreval
               Escreval("--------------")
            fimSe
         fimPara
         Escreval
         Escreval
         Escreval ("Jogador '",jogador ,"' GANHOU!")
         FimAlgoritmo
      fimSe

   fimpara
   Escreval("Jogo da Velha!")
   Escreval
   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         se ( j <> 3) entao
            Escreva(" ",jogo[i,j],"  |")
         senao
            Escreva(" ",jogo[i,j],"  ")
         fimSe
      fimPara
      se ( i <> 3) entao
         Escreval
         Escreval("--------------")
      fimSe
   fimPara
   Escreval
   Escreval
   Escreval("DEU VELHA!")
fimSe
Fimalgoritmo