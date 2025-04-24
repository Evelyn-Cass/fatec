Algoritmo "ROBO_WHATSAPP"

Var
   opcaoMenuPrincipal:inteiro
   pause:inteiro
   quantidade:inteiro
   confirmacao:caractere

   opcaoProduto:inteiro
   nomeProduto:caractere

   valorProduto:real
   valorTotal:real
   valorPedido:real

   opcaoPagamento:inteiro
   taxaEntrega:real

   opcaoTroco:caractere
   valorAReceber:real
   valorTroco:real

Procedimento cardapioSalgados
Inicio
   Escreval("            Cardápio:")
   Escreval("---------------------------------")
   Escreval("Pastéis:")
   Escreval("1 - Queijo Mussarela R$: 10,00")
   Escreval("2 - Queijo Coalho R$: 12,00")
   Escreval("3 - Queijo e Presunto R$: 13,90")
   Escreval("4 - Queijo com Bancon R$: 15,00")
   Escreval("5 - Camarão R$: 20,00")
   Escreval("---------------------------------")
   Escreval("Coxinhas:")
   Escreval("6 - Queijo Mussarela R$: 6,00")
   Escreval("7 - Frango R$: 6,00")
   Escreval("8 - Costela de porco R$: 8,00")
   Escreval("9 - Queijo com Bacon R$: 7,00")
   Escreval("10 - Camarão R$: 10,00")
   Escreval("---------------------------------")
FimProcedimento

Procedimento informacoesProduto
Inicio
   Se (opcaoProduto = 1) Entao
      valorProduto <- 10
      nomeProduto <- "Pastel de Queijo Mussarela"
   FimSe
   Se (opcaoProduto = 2) Entao
      valorProduto <- 12
      nomeProduto <- "Pastel de Queijo Coalho"
   FimSe
   Se (opcaoProduto = 3) Entao
      valorProduto <- 13.9
      nomeProduto <- "Pastel de Queijo e Presunto"
   FimSe
   Se (opcaoProduto = 4) Entao
      valorProduto <- 15
      nomeProduto <- "Pastel de Queijo com Bacon"
   FimSe
   Se (opcaoProduto = 5) Entao
      valorProduto <- 20
      nomeProduto <- "Pastel de Camarão"
   FimSe
   Se (opcaoProduto = 6) Entao
      valorProduto <- 6
      nomeProduto <- "Coxinha de Queijo Mussarela"
   FimSe
   Se (opcaoProduto = 7) Entao
      valorProduto <- 6
      nomeProduto <- "Coxinha de Frango"
   FimSe
   Se (opcaoProduto = 8) Entao
      valorProduto <- 8
      nomeProduto <- "Coxinha de Costela de porco"
   FimSe
   Se (opcaoProduto = 9) Entao
      valorProduto <- 7
      nomeProduto <- "Coxinha de Queijo com Bacon"
   FimSe
   Se (opcaoProduto = 10) Entao
      valorProduto <- 10
      nomeProduto <- "Coxinha de Camarão"
   FimSe
FimProcedimento

Procedimento formasPagamento
Inicio
   Escreval("      Formas de Pagamento:")
   Escreval("---------------------------------")
   Escreval("1 - Dinheiro")
   Escreval("2 - PIX")
   Escreval("3 - Cartão Débito")
   Escreval("4 - Cartão Crédito")
   Escreval("---------------------------------")


FimProcedimento

Inicio
   opcaoMenuPrincipal <- 0
   pause <- 0
   opcaoProduto <- 0
   quantidade <- 0
   confirmacao <- "N"

   Repita

      Escreval(" Bem vindo a Sabor & Cia!")
      Escreval("---------------------------")
      Escreval("Selecione um opção:")
      Escreval("1 - Cardápio")
      Escreval("2 - Novo Pedido")
      Escreval("3 - Formas de Pagamento")
      Escreval("4 - Acompanhar Pedido")
      Escreval("0 - Sair do Programa")
      Escreval("---------------------------")
      Leia(opcaoMenuPrincipal)
      LimpaTela

      Se (opcaoMenuPrincipal = 1) Entao
         cardapioSalgados
         Escreval("Aperte a tecla ENTER para continuar")
         Leia(pause)
         LimpaTela
      FimSe
      Se (opcaoMenuPrincipal=2) Entao

         Repita
            cardapioSalgados
            Escreval("Digite o número referente ao produto desejado:")
            Leia(opcaoProduto)
            LimpaTela
         ate (opcaoProduto>1) ou (opcaoProduto<10)
         informacoesProduto

         Repita
            Escreval("Quantidade:")
            Leia(quantidade)
            valorPedido <- quantidade * valorProduto
            taxaEntrega <- valorPedido * 0.1
            valorTotal <- valorPedido + taxaEntrega
            LimpaTela
         ate (quantidade <> 0)

         Escreval("                   Pedido:")
         Escreval("-----------------------------------------------")
         Escreval("Produto: ",nomeProduto)
         Escreval("Quantidade:",quantidade)
         Escreval("Valor unitário: R$",valorProduto)
         Escreval("Valor do Pedido: R$",valorPedido)
         Escreval("Valor da Taxa de Entrega: R$",taxaEntrega)
         Escreval("Valor Total: R$",valorTotal)
         Escreval("-----------------------------------------------")
         Escreval("Digite 'S'(sem aspas) para confirmar a compra")
         Leia(confirmacao)
         LimpaTela

         Se (confirmacao = "S") Ou (confirmacao = "s") Entao

            formasPagamento
            Escreval("Digite o número referente à forma de pagamento desejada:")
            Leia(opcaoPagamento)
            LimpaTela

            Se (opcaoPagamento = 1) Entao
               Escreval("Você precisa de troco?")
               Escreval("Digite 'S'(sem aspas) para confirmar")
               Leia(opcaoTroco)
               LimpaTela

               Se (opcaoTroco = "S") Ou (opcaoTroco = "s") Entao

                  repita
                     Escreval("Será necessário o troco para o valor de R$",valorTotal,"?")
                     Leia(valorAReceber)
                     LimpaTela
                  ate (valorAReceber >= valorTotal)

                  valorTroco <- valorAReceber - valorTotal
                  Escreval("Valor Total: R$",valorTotal)
                  Escreval("Valor à Pagar: R$",valorAReceber)
                  Escreval("Valor do Troco: R$",valorTroco)
                  Escreval("Aperte Enter para continuar")
                  Leia(pause)
                  LimpaTela
               FimSe
            FimSe


            Escreval("Seu pedido foi confirmado e saiu para entrega!")
            Escreval("Aperte a tecla ENTER para continuar")
            Leia(pause)
            LimpaTela


         Senao
            Escreval("Compra Cancelada!")
            Escreval("Aperte a tecla ENTER para continuar")
            Leia(pause)
            LimpaTela
         FimSe
      FimSe
      Se (opcaoMenuPrincipal=3) Entao
         formasPagamento
         Escreval("Aperte a tecla ENTER para continuar")
         Leia(pause)
         LimpaTela
      FimSe
      Se (opcaoMenuPrincipal=4) Entao
         Escreval("Todos os pedidos foram entregues!")
         Escreval("Aperte a tecla ENTER para continuar")
         Leia(pause)
         LimpaTela
      FimSe




   Ate (opcaoMenuPrincipal = 0)

   Escreval("Programa Encerrado!")
   Escreval("")

Fimalgoritmo

