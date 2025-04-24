class Node {
    constructor(interesse) {
        this.interesse = interesse; // Interesse do usuário
        this.proximo = null; // Referência para o próximo nó
    }
}

// Lista encadeada para armazenar os interesses de um usuário
class Interesses {
    // Construtor da lista encadeada
    constructor() {
        // Inicializa a lista encadeada com a cabeça nula
        this.head = null;
    }

    // Inserir um novo interesse no final da lista
    insertAtEnd(interesse) {
        
        let newNode = new Node(interesse); // Cria um novo nó com o interesse

        if (this.head === null) { // Se a lista estiver vazia, o novo nó é a cabeça
            this.head = newNode;
            return
        }
        let current = this.head; // Senão, percorre a lista até o último nó
        while (current.proximo !== null) {
            // Se o próximo nó não for nulo, atualiza o nó atual
            current = current.proximo;
        }
        current.proximo = newNode; // O próximo do último nó é o novo nó
    }


    // Exibir todos os interesses armazenados
    printList() {
        // Percorre a lista e exibe os interesses
        let current = this.head;
        let list = '';
        while (current !== null) {
            list += current.interesse + '->';
            current = current.proximo;
        }
        console.log(list + "null");
    }
}

const interesses = new Interesses();

// Inserindo interesses no final da lista 
interesses.insertAtEnd("Gatos");
interesses.insertAtEnd("Cães");
interesses.insertAtEnd("Comida Italiana");
interesses.insertAtEnd("Diário de viagem");
interesses.insertAtEnd("Fotografia");
interesses.insertAtEnd("Música");
interesses.insertAtEnd("Cinema");

interesses.printList();
//retorno esperado: Gatos->Cães->Comida Italiana->Diário de viagem->Fotografia->Música->Cinema->null

