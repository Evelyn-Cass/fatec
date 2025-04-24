Algoritmo "PIZZARIA"

Var
   qnt_pizza, qnt_calzone : real
   qnt_suco, qnt_refri : real

   total_pizza, total_calzone : real
   total_suco, total_refri : real

   total_parcial, garcom, total : real
Inicio

   Escreval("Bem vindo ao SysMassa")
   Escreval("Informe as quantidades consumidas:")

   Escreva("Pizzas:")
   Leia(qnt_pizza)
   LimpaTela

   Escreva("Calzones:")
   Leia(qnt_calzone)

   Escreva("Jarras de Suco:")
   Leia(qnt_suco)

   Escreva("Refri:")
   Leia(qnt_refri)

   total_pizza <- qnt_pizza * 45.9
   total_calzone <- qnt_calzone * 33.9
   total_suco <- qnt_suco * 6
   total_refri <- qnt_refri * 4

   total_parcial <- total_pizza + total_calzone + total_suco + total_refri

   garcom <- total_parcial * 0.1

   total <- total_parcial + garcom

   Escreval("Total do Pedido")
   Escreval("Pizzas: R$ ", total_pizza:2:2)
   Escreval("Calzones: R$ ", total_calzone:2:2)
   Escreval("Sucos: R$ ", total_suco:2:2)
   Escreval("Refri: R$ ", total_refri:2:2)
   Escreval("-----------------------------")
   Escreval("10% do garçom: R$ ", garcom:2:2)
   Escreval("Total sem 10%: R$ ", total_parcial:2:2)
   Escreval("Total Geral: R$ ", total:2:2)

Fimalgoritmo
