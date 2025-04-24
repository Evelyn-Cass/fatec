Algoritmo "DESCONTO_FORMA_PAGAMENTO"

Var
   valor,valorComDesconto,valorDesconto:real
   formaPagamento:inteiro
Inicio
   Escreval("Digite o valor que será pago:")
   Leia (valor)
   LimpaTela

   Escreval("FORMAS DE PAGAMENTO")
   Escreval("1. Cartão")
   Escreval("2. PIX")
   Escreval("3. Dinheiro")
   Escreval("Entre o número referente a forma de pagamento:")
   Leia (formaPagamento)
   LimpaTela

   Se(formaPagamento=1) Entao
      Escreval("Valor a ser pago é: R$",valor)
   Senao
      Se(formaPagamento=2) Entao
         valorDesconto <- valor * 0.06
         valorComDesconto <- valor * 0.94
         Escreval("Foi aplicado 6% de desconto!")
         Escreval("Valor da compra: R$",valor)
         Escreval("Valor do desconto: R$",valorDesconto)
         Escreval("Valor com desconto: R$",valorComDesconto)
      Senao
         Se(formaPagamento=3) Entao
            valorDesconto <- valor * 0.10
            valorComDesconto <- valor * 0.90
            Escreval("Foi aplicado 10% de desconto!")
            Escreval("Valor da compra: R$",valor)
            Escreval("Valor do desconto: R$",valorDesconto)
            Escreval("Valor da compra com desconto: R$",valorComDesconto)
         Senao
            Escreval("Forma de pagamento Inválida!")
         Fimse
      Fimse
   Fimse







Fimalgoritmo