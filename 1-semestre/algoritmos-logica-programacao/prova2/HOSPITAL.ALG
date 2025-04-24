Algoritmo "HOSPITAL"
//Evelyn Cassinotte

//Definindo Registro
tipo _paciente = registro
   isOcupado : logico
   nome : caractere
   idade : inteiro
   queixa : caractere
   prioridade : inteiro
   naFila : logico
fimRegistro

//Definindo variaveis
Var

   paciente : vetor[1..10] de _paciente
   fila : vetor[1..10] de inteiro
   controlador, remover: inteiro
   menu  : inteiro
   pause : caractere
   vaga, i, x , posicao: inteiro
   temVaga : logico
   totalPacientes : inteiro

   //Procedimentos
procedimento pausar()
inicio
   Escreval("Precione ENTER para continuar.")
   Leia(pause)
   LimpaTela
fimprocedimento

Procedimento adicionarPaciente()
Inicio
   temVaga <- falso
   Para i de 1 até 10 faça
      Se (paciente[i].isOcupado = falso) então
         vaga <- i
         temVaga <- verdadeiro
         Interrompa
      fimSe
   fimPara

   Se (temVaga = falso) então

      Escreval("Todas as vagas estão Ocupadas!")
      Escreval("Já existem 10/10 paciente na fila.")
      pausar()
      LimpaTela

   seNão
      paciente[vaga].isOcupado <- verdadeiro
      totalPacientes <- totalPacientes + 1
      Escreval("Informe o nome do paciente:")
      leia(paciente[vaga].nome)
      LimpaTela

      Escreval("Informe a idade de ",paciente[vaga].nome)
      leia(paciente[vaga].idade)
      LimpaTela


      Escreval("Informe a queixa de ",paciente[vaga].nome)
      leia(paciente[vaga].queixa)
      LimpaTela

      Repita
         Escreval("Qual é a gravidade da condição:")
         Escreval("-------------------------------")
         Escreval("1 - Grave")
         Escreval("2 - Médio")
         Escreval("3 - Leve")
         Escreval("-------------------------------")
         Escreval("Digite o número referente a gravidade da condição.")
         Leia(paciente[vaga].prioridade)
         LimpaTela
      até (paciente[vaga].prioridade >= 1) e (paciente[vaga].prioridade <= 3)

   FimSe

   atualizarFila()

FimProcedimento

Procedimento atualizarFila()
Var
   maisGrave, menosGrave, menosIdade, maisIdade : inteiro
Inicio


   Se (totalPacientes > 0) então

      //Limpa a Fila e tira os paciente da fila
      Para i de 1 até 10 faça
         fila[i] <- 0
         paciente[i].naFila <- falso
      fimPara

      Para posicao de 1 até totalPacientes faça
         controlador <- 0

         // O algoritmo coloca primeiramente os mais graves e depois os de maior idade como prioridade

         Para i de 1 até 10 faça

            //verifica se o registro está ocupado
            Se (paciente[i].isOcupado = Verdadeiro) então

               //Verifico se o paciente já está na fila
               Se ( paciente[i].naFila = falso) então

                  //Caso Seja a primeira vez rodando a instrução, é armazenada a posição i na variavel mais grave
                  Se (controlador = 0)então
                     maisGrave <-  i
                     controlador <- 1
                  FimSe


                  //Se a prioridade for igual, verifica se a idade é maior
                  Se (paciente[i].prioridade =  paciente[maisGrave].prioridade) e (paciente[i].idade >= paciente[maisGrave].idade) então
                     maisGrave <- i
                  fimSe
                  //Se a prioridade for maior, armazena o novo valor
                  Se (paciente[i].prioridade <  paciente[maisGrave].prioridade) então
                     maisGrave <- i
                  fimSe
               fimSe
            fimSe

         fimPara

         // Armazena o valor encontrado na variavel final e coloca o paciente na fila
         paciente[maisGrave].naFila <- verdadeiro
         fila[posicao] <- maisGrave
      fimPara
   fimSe

FimProcedimento


Procedimento mostrarFila()
Inicio
   // Mostra a fila de pacientes esperando tratamento
   Escreval("Paciente esperando tratamento:")
   Para i de 1 até totalPacientes faça
      Escreval("------------------------------")
      Escreval("Código do paciente: ",fila[i])
      Escreval("Nome: ", paciente[fila[i]].nome)
      Escreval("Idade:", paciente[fila[i]].idade)
      Escreval("Queixa: ", paciente[fila[i]].queixa)
      Escreval("Prioridade:", paciente[fila[i]].prioridade)
   fimPara
   Escreval("------------------------------")
   pausar()


FimProcedimento


Procedimento chamarProximo()
Inicio

   //informa as iformações do proximo paciente
   Escreval("Chamando o próximo paciente:")
   Escreval("------------------------------")
   Escreval("Código do paciente: ",fila[1])
   Escreval("Nome: ", paciente[fila[1]].nome)
   Escreval("Idade: ", paciente[fila[1]].idade)
   Escreval("Queixa: ", paciente[fila[1]].queixa)
   Escreval("Prioridade: ", paciente[fila[1]].prioridade)
   Escreval("------------------------------")

   Escreval("Remover Paciente da Fila?")
   Escreval("1 - Sim")
   Escreval("2 - Não")
   Escreval("Digite o número referente a opção desejada!")
   leia(remover)
   LimpaTela

   //desativa o registro e atualiza a fila
   Se (remover = 1) então
      totalPacientes <- totalPacientes - 1
      paciente[fila[1]].isOcupado <- falso
      Escreval("Paciente ",paciente[fila[1]].nome," foi removido da fila!")
      atualizarFila()
      pausar()

   senão
      Escreval("Paciente não foi removido!")
      pausar()
   fimSe


FimProcedimento

//Inicio Programa
Inicio

   //Pacientes
   paciente[1].isOcupado <- verdadeiro
   paciente[1].nome <- "Ana Luiza"
   paciente[1].idade <- 32
   paciente[1].queixa <-  "Dor Aguda nas Costas"
   paciente[1].prioridade <- 2
   totalPacientes <- totalPacientes + 1
   paciente[2].isOcupado <- verdadeiro
   paciente[2].nome <- "Tiago"
   paciente[2].idade <- 45
   paciente[2].queixa <-  "Gripe"
   paciente[2].prioridade <- 3
   totalPacientes <- totalPacientes + 1
   paciente[3].isOcupado <- verdadeiro
   paciente[3].nome <- "Henrique"
   paciente[3].idade <- 52
   paciente[3].queixa <-  "Braço direito Quebrado"
   paciente[3].prioridade <- 1
   totalPacientes <- totalPacientes + 1
   paciente[4].isOcupado <- verdadeiro
   paciente[4].nome <- "Thais"
   paciente[4].idade <- 15
   paciente[4].queixa <-  "Perna esquerda quebrada"
   paciente[4].prioridade <- 1
   totalPacientes <- totalPacientes + 1
   paciente[5].isOcupado <- verdadeiro
   paciente[5].nome <- "Ricardo"
   paciente[5].idade <- 20
   paciente[5].queixa <-  "Sinusite"
   paciente[5].prioridade <- 3
   totalPacientes <- totalPacientes + 1
   paciente[6].isOcupado <- verdadeiro
   paciente[6].nome <- "Joana"
   paciente[6].idade <- 42
   paciente[6].queixa <-  "Enxaqueca"
   paciente[6].prioridade <- 2
   totalPacientes <- totalPacientes + 1

   atualizarFila()


   Repita

      Escreval("Bem vindo ao Hospital Fatec")
      Escreval("Existem",totalPacientes,"/10 pacientes esperando tratamento.")
      Escreval("---------------------------")
      Escreval("Selecione um opção:")
      Escreval("1 - Novo paciente")
      Escreval("2 - Próximo paciente")
      Escreval("3 - Fila de Espera")
      Escreval("0 - Sair do Programa")
      Escreval("---------------------------")
      Escreval("Digite o número referente a opção desejada!")
      Leia(menu)
      LimpaTela

      Escolha menu
      Caso 1
         adicionarPaciente()
      Caso 2
         chamarProximo()
      Caso 3
         mostrarFila()

      FimEscolha

   até (menu = 0)

Fimalgoritmo