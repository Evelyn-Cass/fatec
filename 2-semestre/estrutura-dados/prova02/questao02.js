// Estrutura de dados para armazenar as mensagens de um usuário
class NodeMensagem {
    constructor(mensagem) {
        // Inicializa o nó com a mensagem
        this.mensagem = mensagem;
        // Inicializa as referências para o nó anterior e o próximo
        this.next = null;
        this.prev = null;
    }
}

// Lista duplamente encadeada para gerenciar a timeline de mensagens de um usuário
class Timeline {
    constructor() {
        // Inicializa a lista vazia
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    //Adiciona um nó no final 
    append(mensagem) {
        const newNodeMensagem = new NodeMensagem(mensagem);
        // Se a lista estiver vazia
        if (!this.head) {
            // O novo nó é o primeiro e o último
            this.head = newNodeMensagem;
            this.tail = newNodeMensagem;
        }
        else {
            // O novo nó é adicionado ao final
            this.tail.next = newNodeMensagem;
            newNodeMensagem.prev = this.tail;
            this.tail = newNodeMensagem;
        }
        // Incrementa o tamanho da lista
        this.length++;
    }

    // Percorre a lista do inicio ao fim
    traverse() {
        // Inicia a partir do primeiro nó
        let current = this.head;
        // Enquanto houver um nó
        while (current) {
            // Exibe a mensagem do nó
            console.log(current.mensagem);
            // Avança para o próximo nó
            current = current.next;
        }
    }

    //Percorre a lista do fim ao inicio
    traverseReverse() {
        // Inicia a partir do último nó
        let current = this.tail;
        // Enquanto houver um nó
        while (current) {
            // Exibe a mensagem do nó
            console.log(current.mensagem);
            // Retrocede para o nó anterior
            current = current.prev;
        }
    }
}

const timeline = new Timeline();

timeline.append("Mensagem 1");
timeline.append("Mensagem 2");
timeline.append("Mensagem 3");

console.log("Percorrendo do inicio ao fim:");
timeline.traverse();
//resultado esperado: Mensagem 1, Mensagem 2, Mensagem 3    

console.log("Percorrendo do fim ao inicio:");
timeline.traverseReverse();
//resultado esperado: Mensagem 3, Mensagem 2, Mensagem 1
