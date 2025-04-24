Algoritmo "CARRINHO"

Tipo Produto = registro
   nome : caractere
   quantidade: inteiro
   valorUnitario, valorTotal: real
   ocupado: logico
fimRegistro

Var
   itens: vetor[1..10] de Produto
   posicaoCarrinho, quantidadeCarrinho: inteiro
   carrinhoCheio: logico
   pause:caractere
   opcao, opcaoModifica, codigo, i,confirmacao:inteiro



Procedimento exibirCarrinho
Inicio
   quantidadeCarrinho <- 0
   Para i de 1 até 10 faça
      Se (itens[i].ocupado = verdadeiro) então
         quantidadeCarrinho <- quantidadeCarrinho + 1
      fimSe
   fimPara

   Se (quantidadeCarrinho = 0) então
      Escreval("O carrinho está vazio!")
      Escreval("------------------------------")

   seNão



      Escreval("             Produtos no carrinho:")
      Escreval("------------------------------------------------")
      Para i de 1 até 10 faça

         Se(itens[i].ocupado = verdadeiro) então

            Escreval("Código: ",i)
            Escreval("Nome: ",itens[i].nome)
            Escreval("Quantidade: ",itens[i].quantidade)
            Escreval("Valor Unitário: R$",itens[i].valorUnitario:5:2)
            Escreval("Subtotal: R$",itens[i].valorTotal:5:2)
            Escreval("------------------------------------------------")



         fimSe
      fimPara
   fimSe
FimProcedimento

Procedimento modificarItem
inicio
   Escreval("                Item Modificado")
   Escreval("------------------------------------------------")
   Escreval("Código: ",codigo)
   Escreval("Nome: ",itens[codigo].nome)
   Escreval("Quantidade: ",itens[codigo].quantidade)
   Escreval("Valor Unitário: R$",itens[codigo].valorUnitario:5:2)
   Escreval("Subtotal: R$",itens[codigo].valorTotal:5:2)
   Escreval("------------------------------------------------")
   Escreval("Pressione ENTER para Continuar")
   Leia(pause)
   LimpaTela
FimProcedimento

Inicio




   Repita

      Repita
         Escreval("Bem vindo a seu Carrinho de compra digital!")
         Escreval("-------------------------------------------")
         Escreval("1 - Ver Carrinho")
         Escreval("2 - Adicionar item")
         Escreval("3 - Modificar item")
         Escreval("0 - Encerrar Aplicação")
         Escreval("-------------------------------------------")
         Escreval("Envie o número referente a opção desejada:")
         Leia(opcao)
         LimpaTela
      até (opcao >= 0) e (opcao <=3)

      se (opcao = 1) então
         exibirCarrinho
         Escreval("Pressione ENTER para Continuar")
         Leia(pause)
         LimpaTela
      fimSe  //fim Opcao 1

      se (opcao = 2) então

         //adicionar item

         quantidadeCarrinho <- 0
         carrinhoCheio <- verdadeiro

         Para i de 1 até 10 faça
            Se (itens[i].ocupado = falso) então
               carrinhoCheio <- falso
               posicaoCarrinho <- i
               interrompa
            fimSe
         fimPara

         Se (carrinhoCheio = verdadeiro) então

            Escreval("O carrinho está cheio!")
            Escreval("------------------------------")
            Escreval("Pressione ENTER para Continuar")
            Leia(pause)
            LimpaTela

         seNao

            Escreval("Digite o nome do produto:")
            Leia(itens[posicaoCarrinho].nome)
            LimpaTela

            Repita
               Escreval("Digite a quantidade de ",itens.nome[posicaoCarrinho],":")
               Leia(itens[posicaoCarrinho].quantidade)
               LimpaTela
               Se (itens[posicaoCarrinho].quantidade <= 0) então
                  Escreval("A quantidade deve ser maior que ZERO")
               fimSe
            até (itens[posicaoCarrinho].quantidade > 0)

            Repita
               Escreval("Digite o valor unitário de ",itens.nome[posicaoCarrinho],":")
               Leia(itens[posicaoCarrinho].valorUnitario)
               LimpaTela
               Se (itens[posicaoCarrinho].valorUnitario <= 0) então
                  Escreval("O valor unitário deve ser maior que ZERO")
               fimSe
            até (itens[posicaoCarrinho].valorUnitario > 0)

            itens[posicaoCarrinho].valorTotal <- itens[posicaoCarrinho].valorUnitario * itens[posicaoCarrinho].quantidade
            itens[i].ocupado <- verdadeiro

            Escreval("          Item adicionado ao Carrinho")
            Escreval("------------------------------------------------")
            Escreval("Código: ",posicaoCarrinho)
            Escreval("Nome: ",itens[posicaoCarrinho].nome)
            Escreval("Quantidade: ",itens[posicaoCarrinho].quantidade)
            Escreval("Valor Unitário: R$",itens[posicaoCarrinho].valorUnitario:5:2)
            Escreval("Subtotal: R$",itens[posicaoCarrinho].valorTotal:5:2)
            Escreval("------------------------------------------------")
            Escreval("Pressione ENTER para Continuar")
            Leia(pause)
            LimpaTela

         fimSe

      fimSe //fim OPCAO 2

      se (opcao = 3) então


         exibirCarrinho

         Se (quantidadeCarrinho = 0) então

            Escreval("Pressione ENTER para Continuar")
            Leia(pause)
            LimpaTela

         seNão
            Repita
               Escreval("Envie o código do produto desejado:")
               Leia(codigo)
               LimpaTela
               Se (itens[codigo].ocupado = falso) então

                  exibirCarrinho
               fimSe
            até (itens[codigo].ocupado = verdadeiro)

            Repita
               Escreval("Modificações disponíveis")
               Escreval("------------------------")
               Escreval("1 - Nome")
               Escreval("2 - Quantidade")
               Escreval("3 - Valor Unitário")
               Escreval("4 - Remover")
               Escreval("0 - Cancelar")
               Escreval("------------------------")
               Escreval("Envie o número referente a opção desejada")
               Leia(opcaoModifica)
               LimpaTela
            até (opcaoModifica >= 0) e (opcaoModifica <= 4)

            Se (opcaoModifica = 1) então

               Escreval("Digite o novo nome do produto:")
               Leia(itens[codigo].nome)
               LimpaTela

               modificarItem

            fimSe //opcaoModifica 1

            Se (opcaoModifica = 2) então

               Repita
                  Escreval("Digite a nova quantidade de ",itens[codigo].nome,":")
                  Leia(itens[codigo].quantidade)
                  LimpaTela
                  Se (itens[codigo].quantidade <= 0) então
                     Escreval("A quantidade deve ser maior que ZERO")
                  fimSe
               até (itens[codigo].quantidade > 0)

               itens[codigo].valorTotal <- itens[codigo].valorUnitario * itens[codigo].quantidade

               modificarItem

            fimSe //opcaoModifica 2

            Se (opcaoModifica = 3) então

               Repita
                  Escreval("Digite o novo valor unitário de ",itens[codigo].nome,":")
                  Leia(itens[codigo].valorUnitario)
                  LimpaTela
                  Se (itens[codigo].valorUnitario <= 0) então
                     Escreval("O valor unitário deve ser maior que ZERO")
                  fimSe
               até (itens[codigo].valorUnitario > 0)

               itens[codigo].valorTotal <- itens[codigo].valorUnitario * itens[codigo].quantidade

               modificarItem

            fimSe //opcaoModifica 3

            Se (opcaoModifica = 4) então


               repita
                  Escreval("                      Opções")
                  Escreval("--------------------------------------------------")
                  Escreval("1 - Sim")
                  Escreval("2 - Não")
                  Escreval("--------------------------------------------------")
                  Escreval("Tem certeza que deseja apagar o item: ",itens[codigo].nome," ?")
                  Leia(confirmacao)
                  LimpaTela
               até (confirmacao = 1) ou (confirmacao = 2)

               Se (confirmacao = 1) então

                  itens[codigo].ocupado <- falso

                  Escreval(itens[codigo].nome," removido com sucesso!")
                  Escreval("Pressione ENTER para Continuar")
                  Leia(pause)
                  LimpaTela

               seNão

                  Escreval("Remoção Cancelada!")
                  Escreval("Pressione ENTER para Continuar")
                  Leia(pause)
                  LimpaTela
               fimSe //opcaoModifica 4

            fimSe

         fimSe

      fimSe //Fim opcao 3

   até (opcao = 0)






Fimalgoritmo