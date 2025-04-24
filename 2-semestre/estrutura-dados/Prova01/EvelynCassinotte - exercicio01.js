//Evelyn Cassinotte

class Pilha {
    constructor() { //Variaveis criadas ao inicializar um objeto do tipo Pilha
        this.itens = []; //Cria um array vazio
        this.tamanho = 0; // ***** Parte corrigida ****** Para um melhor controle da pilha devo usar uma variavel para controlar o tamanho da pilha
    
    }

    push(elemento) {
        this.itens[this.tamanho] = elemento; // Adiciona o elemento no final da pilha
        // *** Parte Corrigida *** Caso estivesse usando this.itens.lenght e nao this.tamanho poderiam acontecer erros de lógica devido ao fato de quando se usa o delete o tamanho do array não muda
        this.tamanho++; // Aumenta o tamanho da pilha
        return "Elemento adicionado: " + elemento; // Informa que o elemento foi adicionado com sucesso
    }

    pop() {
        if (this.tamanho == 0) { //Se a pilha estiver vazia
            return "Não foi possivel remover um elemento, pois a pilha está vazia!";
        }
        else {        // Se a pilha não estiver vazia
            const topo = this.itens[this.tamanho - 1]; //Pega o elemento do topo da pilha
            delete this.itens[this.tamanho - 1]; //Remove o elemento do topo
            this.tamanho--; //Diminui o tamanho da pilha
            return "Elemento removido: " + topo; //Informa que o Elemento foi removido.
        }
    }


    peek() {
        if (this.tamanho == 0) { //Se a pilha estiver vazia
            return "Não foi possivel retornar o elemento do topo, pois a pilha está vazia!";
        } // ***** Parte Corrigida *****  Retorno uma mensagem de erro caso a pilha esteja vazia
        else {
            // Se a pilha não estiver vazia
            const topo = this.itens[this.tamanho - 1]; //Pega o elemento do topo
            return "Elemento no topo: " + topo; //Informa qual é o elemento do topo
        }
    }
}

let pilha = new Pilha();
console.log(pilha.peek()); //Informa que a pilha esta vazia
console.log(pilha.pop()); //Informa que a pilha esta vazia
console.log(pilha.push(1));  //Informa que o elemento foi adicionado
console.log(pilha.push(2)); //Informa que o elemento foi adicionado
console.log(pilha.pop()); //Informa que o último elemento foi removido e qual é.
console.log(pilha.peek()); //Informa qual é o elemento do topo da pilha
console.log(pilha.pop()); //Informa que o último elemento foi removido e qual é.
console.log(pilha.peek()); //Informa qual é o elemento do topo da pilha
console.log(pilha.pop()); //Informa que a pilha esta vazia
