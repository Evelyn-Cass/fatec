Algoritmo "LOGIN_TRES_TENTATIVAS"

Var

   usuario, senha:caracter
   i : inteiro

Inicio

   PARA i DE 1 ATE 3 FACA

      ESCREVAL("Usuário:")
      LEIA(usuario)

      ESCREVAL("Senha:")
      LEIA(senha)

      LIMPATELA

      SE (usuario = "Evelyn") E (senha="1234") ENTAO

         ESCREVAL("Usuário Encontrado!")
         ESCREVAL("Login realizado com sucesso!")
         INTERROMPA

      SENAO
         ESCREVAL("Usuário ou a senha incorreto.")
         ESCREVAL("Tentativas restantes:", i,"/3")
         ESCREVAL("")
         SE ( i = 3) ENTÃO
            ESCREVAL("Você excedeu o número máximo de tentativas de login.")
            ESCREVAL("Programa será encerrado!")
         FIMSE

      FIMSE

   FIMPARA



Fimalgoritmo