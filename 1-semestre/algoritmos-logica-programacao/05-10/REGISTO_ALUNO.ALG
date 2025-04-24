Algoritmo "REGISTO_ALUNO"

Tipo Pessoa = registro
   nome : caracter
   idade : inteiro
   peso : real
fimRegistro

Var
   aluno : Pessoa
   i: inteiro

Inicio

   aluno.nome <- "João"
   aluno.idade <- 12
   aluno.peso <- 43.50

   Escreval("Nome do Aluno: ",aluno.nome)
   Escreval("Idade do Aluno:",aluno.idade)
   Escreval("Peso do Aluno: ",aluno.peso:2:2)



Fimalgoritmo