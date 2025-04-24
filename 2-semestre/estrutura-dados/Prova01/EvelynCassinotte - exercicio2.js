//Evelyn Cassinotte

class filaAtendimento {
    constructor() { //Variaveis criadas ao instanciar um objeto filaAtendimento
        this.fila = [] //Cria um array vazio
        this.tamanho = 0 // Controla o Tamanho da Fila
    }

    verificarTamanho(){
        return this.tamanho;
    }

    adicionarPaciente(nome, gravidade) {
        const paciente = {
            nome: nome,
            gravidade: gravidade
        } //Criando um objeto paciente com nome e gravidade
        this.fila[this.tamanho] = paciente; //Adicionando o paciente na Fila
        this.tamanho++; //Aumenta o tamanho da Fila

        //Ultilizando o Bubble Sort para organizar a fila por Gravidade.

        const n = this.tamanho - 1; //Constante para o tamanho da Fila 

        if (n != 0) {
            for (let i = 0; i < n; i++) { //Percore a Fila 
                for (let j = 0; j < n - i; j++) { //Percore a fila novamente para ver se o elemento da direita é maior que o da esquerda 
                    if (this.fila[j].gravidade < this.fila[j + 1].gravidade) { //Verifica se o elemento da esquerda é maior que o da direita
                        // Troca os elementos de posição
                        const temporario = this.fila[j];
                        this.fila[j] = this.fila[j + 1];
                        this.fila[j + 1] = temporario;
                    }
                }
            }
        }
        // Verificar qual é a possição do Paciente inserido.
        for (let i = 0; i < this.tamanho; i++) {
            if (this.fila[i] == paciente) {
                return console.log("O paciente " + nome + " foi adicionado a fila. Posição atual " + (i + 1) + "/" + this.tamanho);
                //Retorna o Paciente addicionado e sua posição na fila.
            }
        }
    }

    atenderPaciente() {

        if (this.tamanho == 0) { //verifica se existem pacientes na fila
            return console.log("Fila de atendimentos vazia!"); //Informa que não existem pacientes na fila
        } else {
            const paciente = this.fila[0]; //Armazena o paciente que no inicio da fila

            delete this.fila[0];  //Remove o Paciente do inicio da fila



            //reorganiza a fila
            let i = 0;
            const n = this.tamanho - 1;
            while (i < n) {
                let j = i + 1;
                this.fila[i] = this.fila[j];
                i++;
            }
            this.tamanho--; //diminui o tamanho da fila

            return console.log(`O paciente ${paciente.nome} foi removido da fila. Gravidade ${paciente.gravidade}`)
        }
    }

    listarPacientes() {

        if (this.tamanho == 0) { //verifica se existem pacientes na fila
            return console.log("Fila de atendimentos vazia!"); //Informa que não existem pacientes na fila
        } else {
            console.log();
            console.log("--------------------");
            console.log("Fila de Atendimentos");
            console.log("--------------------");
            for (let i = 0; i < this.tamanho; i++) {

                console.log(`Posição: ${(i + 1)}º`);
                console.log("Paciente: " + this.fila[i].nome);
                console.log("Gravidade: " + this.fila[i].gravidade);
                console.log("--------------------");
            }
        }
    }

    estaVazia() {

        if (this.tamanho == 0) { //verifica se existem pacientes na fila
            return true;
        } else { //Caso existam pacientes na fila, informa quantos.
            return false;
        }
    }
}

let atendimentos = new filaAtendimento(); //Instancia um objeto da classe filaAtendimento

if (!atendimentos.estaVazia()){
    console.log("Existem "+atendimentos.verificarTamanho() +" pacientes na fila!");
} else {
    console.log("Fila Vazia!");
}; //Verifica se a fila está vazia

// Adciona paciente a fila
atendimentos.adicionarPaciente("Carlos", 3);
atendimentos.adicionarPaciente("João", 5);
atendimentos.adicionarPaciente("Maria", 4);
atendimentos.adicionarPaciente("Pedro", 2);
atendimentos.adicionarPaciente("Ana", 4);

//Retorna o paciente no inicio da fila, com maior gravidade
atendimentos.atenderPaciente();

//Lista todos os paciente que estão na fila
atendimentos.listarPacientes();

//Verifica se existem pacientes na fila
atendimentos.estaVazia();


if (!atendimentos.estaVazia()){
    console.log("Existem "+atendimentos.verificarTamanho() +" pacientes na fila!");
} else {
    console.log("Fila Vazia!");
}; //Verifica se a fila está vazia
