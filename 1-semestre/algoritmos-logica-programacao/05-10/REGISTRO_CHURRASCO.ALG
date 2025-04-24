Algoritmo "REGISTRO_CHURRASCO"

Tipo Ingrediente = registro
   nome : caracter
   quantidade : real
   valorUnitario : real
   valorSubtotal : real
FimRegistro

Var
   itens : Vetor[1..10] de Ingrediente
   i, quantidadeItens, quantidadePessoas, opcao : inteiro
   pause : caractere
   valorTotal, valorPessoa : real

Inicio

   quantidadeItens <- 0
   valorTotal <- 0

   Repita
      Escreval("Quantas Pessoas participarão do Evento?")
      Leia(quantidadePessoas)
      LimpaTela
   até (quantidadePessoas > 0)

   Repita
      quantidadeItens <- quantidadeItens + 1

      Escreval ("Qual o nome do",quantidadeItens,"º produto?")
      Leia(itens[quantidadeItens].nome)
      LimpaTela

      Repita
         Escreval ("Qual a quantidade de ",itens[quantidadeItens].nome," ?")
         Leia(itens[quantidadeItens].quantidade)
         LimpaTela
      ate (itens[quantidadeItens].quantidade > 0)

      Repita
         Escreval ("Qual o valor de ",itens[quantidadeItens].nome," ?")
         Leia(itens[quantidadeItens].valorUnitario)
         LimpaTela
      ate (itens[quantidadeItens].valorUnitario > 0)

      itens[quantidadeItens].valorSubtotal <- itens[quantidadeItens].valorUnitario * itens[quantidadeItens].quantidade
      valorTotal <- valorTotal + itens[quantidadeItens].valorSubtotal
      
      repita
         Escreval("Deseja Adicionar mais produtos no carrinho?")
         Escreval("1 - Sim")
         Escreval("2 - Não")
         Escreval("Digite o número referente a opção desejada")
         Leia(opcao)
         LimpaTela
      até (opcao = 1) ou (opcao = 2)

   até (quantidadeItens = 10) ou (opcao = 2)

   Se (quantidadeItens = 10) então
      Escreval("ERRO: Não foi póssivel adicionar mais produtos. Carrinho Cheio")
      Escreval("Pressione ENTER para continuar")
      Leia(pause)
      LimpaTela
   fimSe

   valorPessoa <- valorTotal / quantidadePessoas


   para i de 1 até quantidadeItens faca
      Escreval("               Produtos:")
      Escreval("---------------------------------------")
      Escreval(i:1:0,"º -  ",itens[i].nome)
      Escreval("Quantidade: ",itens[i].quantidade:2:2)
      Escreval("Valor Unitário: R$ ",itens[i].valorUnitario:2:2)
      Escreval("Valor Total: R$ ",itens[i].valorSubTotal:2:2)
      Escreval("---------------------------------------")
   fimPara

   Escreval("               Valores:")
   Escreval("---------------------------------------")
   Escreval("Quantidade Total de produtos: ",quantidadeItens)
   Escreval("Valor Total: R$ ",valorTotal:2:2)
   Escreval("Quantidade de Participantes:",quantidadePessoas)
   Escreval("Valor por pessoa: R$ ",valorPessoa:2:2)
   Escreval("---------------------------------------")




Fimalgoritmo