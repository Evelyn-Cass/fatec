Algoritmo "CABELEREIRO"

Var
   horario:vetor[1..8] de logico
   cliente:vetor[1..8] de caractere
   profissional:vetor[1..8] de caractere
   opcaoMenu:inteiro
   opcao:inteiro
   pause:caractere
   dia:caractere
   i, controle:inteiro
Inicio

   Escreval("Qual é o dia atual? DD/MM/AAAA")
   Leia(dia)
   LimpaTela

   repita
      Escreval(" Bem vindo a Barbearia!")
      Escreval("---------------------------")
      Escreval("Selecione um opção:")
      Escreval("1 - Agendar ")
      Escreval("2 - Ver Agendamentos")
      Escreval("0 - Sair do Programa")
      Escreval("---------------------------")
      Escreval("Digite o número referente a opcão desejada:")
      Leia(opcaoMenu)
      LimpaTela

      se (opcaoMenu = 1)entao
         repita
            Escreval ("Horários do dia ",dia,":")
            Escreva("1 - 8:00 - ")
            Se (horario[1] = falso) entao
               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("2 - 9:00 - ")
            Se (horario[2] = falso) entao

               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("3 - 10:00 - ")
            Se (horario[3] = falso) entao

               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("4 - 11:00 - ")
            Se (horario[4] = falso) entao

               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("5 - 12:00 - ")
            Se (horario[5] = falso) entao

               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("6 - 14:00 - ")
            Se (horario[6] = falso) entao
               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("7 - 15:00 - ")
            Se (horario[7] = falso) entao
               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreva("8 - 16:00 - ")
            Se (horario[8] = falso) entao

               Escreval("Disponível")
            seNão
               Escreval("Indisponível")
            fimSe
            Escreval("Digite o número referenta ao horário você deseja agendar?")
            Leia(opcao)
            LimpaTela
         até (opcao >= 1) e (opcao <= 8)

         Se (horario[opcao] = falso) entao
            horario[opcao] <- verdadeiro

            Escreval("Nome do Cliente:")
            Leia(cliente[opcao])
            LimpaTela
            Escreval("Nome do Profissional:")
            Leia(profissional[opcao])
            LimpaTela

            Escreval("Agendamento Concluído!")
            Escreval("Pressione ENTER para continuar!")
            Leia(pause)
            LimpaTela
         Senão
            Escreval("Horário indisponível!")
            Escreval("Pressione ENTER para continuar!")
            Leia(pause)
            LimpaTela
         fimSe

      fimse

      se (opcaoMenu = 2)entao
         controle <- 0
         para i de 1 até 8 faça
            Se (horario[i] = verdadeiro) então
               controle <- controle + 1
            fimSe
         fimPara
         Se (controle > 0) então
            Escreval ("Horários Agendados ",dia,":")
             Escreval("--------------------------------------------------")
            Se (horario[1] = verdadeiro) entao
               Escreval("8:00 - ",cliente[1])
               Escreval("Profissional: ",profissional[1])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[2] = verdadeiro) entao
               Escreval("9:00 - ",cliente[2])
               Escreval("Profissional: ",profissional[2])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[3] = verdadeiro) entao
               Escreval("10:00 - ",cliente[3])
               Escreval("Profissional: ",profissional[3])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[4] = verdadeiro) entao
               Escreval("11:00 - ",cliente[4])
               Escreval("Profissional: ",profissional[4])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[5] = verdadeiro) entao
               Escreval("12:00 - ",cliente[5])
               Escreval("Profissional: ",profissional[5])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[6] = verdadeiro) entao
               Escreval("14:00 - ",cliente[6])
               Escreval("Profissional: ",profissional[6])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[7] = verdadeiro) entao
               Escreval("15:00 - ",cliente[7])
               Escreval("Profissional: ",profissional[7])
               Escreval("--------------------------------------------------")
            fimSe
            Se (horario[8] = verdadeiro) entao
               Escreval("16:00 - ",cliente[8])
               Escreval("Profissional: ",profissional[8])
               Escreval("--------------------------------------------------")
            fimSe

         senão
            Escreval("Não exitem agendamentos no dia: ",dia,"!")
         fimSe
         Escreval("Pressione ENTER para continuar!")
         Leia(pause)
         LimpaTela

      fimse
   até (opcaoMenu = 0)


Fimalgoritmo