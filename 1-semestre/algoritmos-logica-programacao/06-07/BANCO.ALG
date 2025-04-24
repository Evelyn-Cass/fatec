Algoritmo "Banco"

Tipo extrato = registro
   data : caracter
   saldoAnterior: real
   saldoFinal:real
   movimentacao : real
   categoria : inteiro
FimRegistro

Var

   transacao: vetor[1..10] de extrato
   operacao, iOperacao : inteiro
   usuario, senha : caractere
   iLogin : inteiro
   login : logico
   saldo, quantidade : real
   opcao : inteiro
   pause: caractere

Procedimento depositar()
Inicio

   Se (operacao <> 10) então
      Repita
         Escreval("Digite a quantidade que deseja depositar")
         Leia(quantidade)
         LimpaTela
         Se (quantidade <= 0) então
            Escreval("Valor não pode ser igual ou menor que Zero!")
         fimSe
      até (quantidade > 0)
      operacao <- operacao + 1

      transacao[operacao].categoria <- 1 //deposito
      transacao[operacao].movimentacao <- quantidade
      transacao[operacao].saldoAnterior <- saldo
      saldo <- saldo + quantidade
      transacao[operacao].saldoFinal <- saldo

      Escreval("Digite a data atual:")
      Leia (transacao[operacao].data)
      LimpaTela

      Escreval("Deposito realizado com sucesso!")
      Escreval("Saldo incial: R$",transacao[operacao].saldoAnterior:5:2)
      Escreval("Valor movimentado: + ",transacao[operacao].movimentacao:5:2)
      Escreval("Saldo final: R$",transacao[operacao].saldoFinal:5:2)
      Escreval("-------------------------------")
      Escreval("Pressione ENTER para continuar!")
      leia(pause)
      LimpaTela

   senao

      Escreval("Você já realizou o máximos de transações!")
      Escreval("-------------------------------")
      Escreval("Pressione ENTER para continuar!")

   fimSe

FimProcedimento

Procedimento sacar()
Inicio

   Se (operacao <> 10) então
      Se (saldo=0) então
         Escreval("Saldo insuficiente para realizar saques!")
         Escreval("Saldo atual: R$",saldo:5:2)
         Escreval("-------------------------------")
         Escreval("Pressione ENTER para continuar!")
         leia(pause)
         LimpaTela
      seNão
         Repita
            Escreval("Saldo Atual: R$",saldo:5:2)
            Escreval("-------------------------------------")
            Escreval("Digite a quantidade que deseja sacar.")
            Leia(quantidade)
            LimpatELA
            Se (quantidade > saldo) então
               Escreval("Valor deve ser maior ou igual ao saldo!")
            fimSe
         até (quantidade <= saldo)
         operacao <- operacao + 1

         transacao[operacao].categoria <- 2 //saque
         transacao[operacao].movimentacao <- quantidade
         transacao[operacao].saldoAnterior <- saldo
         saldo <- saldo - quantidade
         transacao[operacao].saldoFinal <- saldo

         Escreval("Digite a data atual:")
         Leia (transacao[operacao].data)
         LimpaTela

         Escreval("Saque realizado com sucesso!")
         Escreval("Saldo incial: R$",transacao[operacao].saldoAnterior:5:2)
         Escreval("Valor movimentado: - ",transacao[operacao].movimentacao:5:2)
         Escreval("Saldo final: R$",transacao[operacao].saldoFinal:5:2)
         Escreval("-------------------------------")
         Escreval("Pressione ENTER para continuar!")
         leia(pause)
         LimpaTela
      fimSe
   senão

      Escreval("Você já realizou o máximos de transações!")
      Escreval("-------------------------------")
      Escreval("Pressione ENTER para continuar!")
      leia(pause)
      LimpaTela
   fimSe

FimProcedimento


procedimento mostrarExtrato()
inicio
   Se (operacao = 0) então

      Escreval("Ainda não foram realizadas transações nessa conta!")
      Escreval("Saldo atual: R$",saldo:5:2)
      Escreval("--------------------------------------------------")
      Escreval("Pressione ENTER para continuar!")
      leia(pause)
      LimpaTela
   senão

      Escreval("EXTRATO:")
      Escreval("--------------------------------------------------")

      Para iOperacao de 1 até operacao faça

         Escreval("Código:",iOperacao)
         Escreval("Data:",transacao[iOperacao].data)
         Escreval("Saldo Inicial: R$",transacao[iOperacao].saldoAnterior:5:2)
         Escreva("Valor movimentado: R$ ")
         Se (transacao[iOperacao].categoria = 1) então
            Escreva("+")//Deposito
         senão
            Escreva("-")//Saque
         fimSe
         Escreval(transacao[iOperacao].movimentacao:5:2)
         Escreval("Saldo Final: R$",transacao[iOperacao].saldoFinal:5:2)
         Escreval("--------------------------------------------------")

      fimPara
      Escreval("Pressione ENTER para continuar!")
      leia(pause)
      LimpaTela
   fimSe


fimProcedimento

//Inicio Programa
Inicio

   operacao <- 0
   saldo <- 0
   login <- falso

   Escreval("   Bem vindo ao Banco da Fatec!")
   Escreval("----------------------------------")

   Para iLogin de 1 até 3 faça

      Escreval("Insira o nome do usuário da conta:")
      Leia(usuario)
      LimpaTela

      Escreval("Insira a senha referente ao usuário ",usuario,":")
      Leia(senha)
      LimpaTela

      Se (usuario = "admin") e (senha = "admin") entao
         login <- verdadeiro
         Interrompa
      FimSe

      Escreval("Senha incorreta!")
      Escreval("Tentativas realizadas",iLogin,"/3")

   fimPara

   Se (login = verdadeiro) então

      Repita

         Escreval("Bem vindo ",usuario,"!")
         Escreval("----------------------")
         Escreval("1 - Depositar")
         Escreval("2 - Sacar")
         Escreval("3 - Ver extrato")
         Escreval("0 - Sair")
         Escreval("----------------------")
         Escreval("Digite o número referente a opção desejada.")
         Leia(opcao)
         LimpaTela


         Se (opcao = 1) então
            depositar()
         fimSe // fim opcao 1


         Se (opcao = 2) então
            sacar()
         fimSe // fim opcao 2

         Se (opcao = 3) então
            mostrarExtrato()
         fimSe // fim opcao 3

      até (opcao = 0)

          FimSe


   Se (iLogin = 3) e (login <> verdadeiro) então
      Escreval("Foi exedido o número de tentativas!")
      Escreval("Sistema será encerrado...")
   FimSe


Fimalgoritmo