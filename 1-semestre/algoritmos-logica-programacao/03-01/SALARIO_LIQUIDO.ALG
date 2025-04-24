Algoritmo "SALARIO_LIQUIDO"
Var

   salarioBruto, salarioLiquido, salarioDescontadoInss:real
   inss,faixaFinal:real
   impostoRenda:real
   descontoTotal:real

Inicio

   Escreval("Digite o valor do seu salário BRUTO:")
   Leia(salarioBruto)
   limpatela

   Se(salarioBruto >  7786.02)entao

      inss  <- 1412 * 0.075   //Faixa 1
      inss <- inss + (1254.68 * 0.09)  //Faixa 2
      inss <- inss + (1333.35 * 0.12)  //Faixa 3
      inss <- inss + (3785.97 * 0.14) //Faixa 4

   senao
      Se(salarioBruto >  4000.03)entao

         inss  <- 1412 * 0.075   //Faixa 1
         inss <- inss + (1254.68 * 0.09)  //Faixa 2
         inss <- inss + (1333.35 * 0.12)  //Faixa 3
         faixaFinal <- salarioBruto -  4000.03
         inss <- inss + (faixaFinal * 0.14) //Faixa 4

      senao
         Se(salarioBruto > 2666.68)entao

            inss  <- 1412 * 0.075   //Faixa 1
            inss <- inss + ( 1254.68 * 0.09)  //Faixa 2
            faixaFinal <- salarioBruto - 2666.68
            inss <- inss + (faixaFinal * 0.12) //Faixa 3

         senao
            Se(salarioBruto > 1412)entao

               inss  <- 1412 * 0.075    //Faixa 1
               faixaFinal  <- salarioBruto - 1412
               inss <- inss + (faixaFinal * 0.09)  //Faixa 2

            senao

               inss <- salarioBruto * 0.075

            fimse
         fimse
      fimse
   fimse

   salarioDescontadoInss <- salarioBruto - inss

   Se (salarioDescontadoInss < 2112)entao
      impostoRenda <- 0
   senao
      Se (salarioDescontadoInss < 2826.65)entao
         impostoRenda <- salarioDescontadoInss * 0.075 - 158.40
      senao
         Se (salarioDescontadoInss < 3751.05)entao
            impostoRenda <- salarioDescontadoInss * 0.15 - 370.40
         senao
            Se (salarioDescontadoInss < 4664.68)entao
               impostoRenda <- salarioDescontadoInss * 0.225 - 651.73
            senao
               Se (salarioDescontadoInss > 4664.68)entao
                  impostoRenda <- (salarioDescontadoInss * 0.275) - 884.96
               fimse
            fimse
         fimse
      fimse
   fimse

   salarioLiquido <- salarioDescontadoInss - impostoRenda
   descontoTotal <- inss + impostoRenda

   Escreval("                 RESULTADO:")
   Escreval("---------------------------------------------")
   Escreval("Salário BRUTO: R$",salarioBruto)
   Escreval("INSS: R$",inss)
   Escreval("Imposto de Renda: R$",impostoRenda)
   Escreval("Desconto Total: R$",descontoTotal)
   Escreval("Salário Líquido: R$",salarioLiquido)
   Escreval("---------------------------------------------")

Fimalgoritmo