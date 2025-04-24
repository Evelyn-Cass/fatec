Algoritmo "IMC"

Var
   altura,peso,resultado:real

Inicio
   Escreval("Bem vindo a calculadora de IMC" )
   Escreval("Digite a sua altura em metros:" )
   Leia (altura)
   LimpaTela

   Escreval("Digite a seu peso em quilos:" )
   Leia (peso)
   LimpaTela

   resultado <- peso / (altura*altura)

   Escreval("O valor do seu IMC é:",resultado,".")

   Se(resultado<16)Entao
      Escreval("Você foi classificado como: Magreza grave.")
   Senao
      Se(resultado<16.9)Entao
         Escreval("Você foi classificado como: Magreza moderada.")
      Senao
         Se(resultado<18.5)Entao
            Escreval("Você foi classificado como: Magreza leve.")
         Senao
            Se(resultado<24.9)Entao
               Escreval("Você foi classificado como: Peso ideal.")
            Senao
               Se(resultado<29.9)Entao
                  Escreval("Você foi classificado como: Sobrepeso.")
               Senao
                  Se(resultado<34.9)Entao
                     Escreval("Você foi classificado como: Obesidade Grau I.")
                  Senao
                     Se(resultado<39.9)Entao
                        Escreval("Você foi classificado como: Obesidade Grau II ou Severa.")
                     Senao
                        Se(resultado<40)Entao
                           Escreval("Você foi classificado como: Obesidade Grau III ou Mórbida.")
                        Senao
                           Escreval("Valor não encontrado!")
                        FimSe
                     FimSe
                  FimSe
               FimSe
            FimSe
         FimSe
      FimSe
   FimSe





Fimalgoritmo