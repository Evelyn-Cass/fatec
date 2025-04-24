//Evelyn Cassinotte
class Fila {
    constructor() { //variaveis criadas ao inicializar um objeto do tipo Fila
        this.itens = []; //Cria um array de itens

        // **** Parte Corrigida **** this.inicio e this.fim devem começar no zero
        this.inicio = 0; //Define o incio da fila no 0
        this.fim = 0; //Define o fim da fila no 0, não existem itens.
    }

    enqueue(elemento) {
        this.itens[this.fim] = elemento; //Adiciona um elemento no fim do array itens
        this.fim++;  //aumenta o tamanho da fila
        return elemento;
    }

    dequeue() {
        if (this.isEmpty()) {  //Se o array está vazio
            return "Fila Vazia!"; //Informa que a fila está vazia.
        }
        else {
            const primeiro = this.itens[this.inicio]; //Armazena o valor da primeira posição
            delete this.itens[this.inicio]; // Apaga a primeira posição
            this.inicio++; //Aumenta o valor do inicio, mudando onde o array deve começar
            return primeiro; //Retorna o primeiro elemento.
        }
    }

    isEmpty() {
        return this.fim === this.inicio; //verifica se o array está vazio
    }

    peek() {
        if (!this.isEmpty()) { // *** Parte Corrigida *** Adicionada controle de erro caso a fila esteja vazio
            return this.itens[this.inicio];
        }else{ //Retorna que a fila está vazia
            return "Fila Vazia!"
        }
    }

}

let fila = new Fila(); //Instancia um objeto da classe Fila

//Adiciona elementos na fila
console.log("Elemento adicionado: "+fila.enqueue("A"));
console.log("Elemento adicionado: "+fila.enqueue("B"));
console.log("Elemento adicionado: "+fila.enqueue("C"));

//Remove o primeiro elemento e retorna ele 
console.log("Elemento removido: "+fila.dequeue()); //Valor esperado A

//Retorna o primeiro elemento da fila
console.log("Primeiro elemento: "+fila.peek()); //Valor Esperado B

//Remove o primeiro elemento e retorna ele 
console.log("Elemento removido: "+fila.dequeue()); //Valor Esperado B

//Retorna o primeiro elemento da fila
console.log("Primeiro elemento: "+fila.peek()); //Valor Esperado C

//Remove o primeiro elemento e retorna ele 
console.log("Elemento removido: "+fila.dequeue()); //Valor Esperado B

//Retorna o primeiro elemento da fila
console.log(fila.peek()); //Fila Vazia!

//Remove o primeiro elemento e retorna ele 
console.log(fila.dequeue()); //Fila Vazia!
