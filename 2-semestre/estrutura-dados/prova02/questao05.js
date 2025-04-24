class NodeInteresse {
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

        let newNodeInteresse = new NodeInteresse(interesse); // Cria um novo nó com o interesse

        if (this.head === null) { // Se a lista estiver vazia, o novo nó é a cabeça
            this.head = newNodeInteresse;
            return
        }
        let current = this.head; // Senão, percorre a lista até o último nó
        while (current.proximo !== null) {
            // Se o próximo nó não for nulo, atualiza o nó atual
            current = current.proximo;
        }
        current.proximo = newNodeInteresse; // O próximo do último nó é o novo nó
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

class Grafo {
    constructor() {
        // Lista de adjacência
        this.adjacencia = {}; // objeto para armazenar usuarios e suas respectivas listas de adjacência
    }

    adicionarUsuario(Usuario) {
        // Se o usuário não existir, adicione-o
        if (!this.adjacencia[Usuario]) {
            this.adjacencia[Usuario] = [];
        }
    }

    adicionarAmizade(Usuario1, Usuario2) {
        if (!this.adjacencia[Usuario1]) { // Se o usuário1 não existir, adicione-o
            this.adicionarUsuario(Usuario1);
        }
        if (!this.adjacencia[Usuario2]) {
            // Se o usuário2 não existir, adicione-o
            this.adicionarUsuario(Usuario2);
        }
        // Adicione a amizade
        this.adjacencia[Usuario1].push(Usuario2);
        this.adjacencia[Usuario2].push(Usuario1);
    }

    imprimirGrafo() {
        for (let Usuario in this.adjacencia) {
            // Imprime as conexões do usuário
            console.log(`${Usuario} -> ${this.adjacencia[Usuario].join(', ')};`)
        }
    }

    imprimirConexoes(Usuario) {
        // Se o usuário não existir, exiba uma mensagem de erro
        if (!this.adjacencia[Usuario]) {
            console.log('Usuário não encontrado');
            return;
        }
        // Imprime as conexões do usuário
        console.log(`${Usuario} -> ${this.adjacencia[Usuario].join(', ')};`)
    }
}
class Node {
    // cria um node que contém ID do usuário, um array com as mensagens enviadas, e referências para os nós esquerdo e direito.
    constructor(Id) {
        this.id_usuario = Id;
        this.messages = [];
        this.left = null;
        this.right = null;
    }

}
class BinaryTree {
    constructor() {
        // inicializa a raiz da árvore como nula
        this.root = null;
    }

    inserirUsuario(id_usuario) {
        // funçao para inserir um novo usuário na árvore
        const newNode = new Node(id_usuario);
        if (this.root === null) {            // verifica se a raiz é nula, 

            // se sim, o novo nó será a raiz
            this.root = newNode;
        } else {
            // se não for nula, chama a função _insertNode
            this._insertNode(this.root, newNode);
        }
    }

    _insertNode(node, newNode) {
        if (newNode.id_usuario < node.id_usuario) { // verifica se o id do usuario é menor que o id do nó
            if (node.left === null) { //verifica se o no a esquerda é nulo 
                node.left = newNode; // insere o novo nó a esquerda
            } else {
                this._insertNode(node.left, newNode); // chama a funcao novamente
            }
        } else {
            // se o id do usuario for maior que o id do nó
            if (node.right === null) { // verifica se o no a direita é nulo
                node.right = newNode; // insere o novo nó a direita
            } else {
                this._insertNode(node.right, newNode); // chama a funcao novamente
            }
        }
    }

    adicionarMensagem(id_usuario, mensagem) {
        // Adiciona uma nova mensagem associada a um ID de usuário
        const node = this._searchNode(this.root, id_usuario);
        if (node) {
            node.push(mensagem);
        } else {
            // Se o usuário não for encontrado, exibe uma mensagem de erro
            console.log("Usuário não encontrado.");
        }
    }

    mensagens(id_usuario) {
        // Busca e exibe todas as mensagens enviadas pelo id do usuario informado
        return this._searchNode(this.root, id_usuario)
    }

    _searchNode(node, id_usuario) {
        // busca um nó na árvore
        if (node === null) {
            // Se o nó for nulo, retorna falso
            return false;
        }
        if (id_usuario === node.id_usuario) {
            // Se o ID do usuário for igual ao ID do nó, retorna as mensagens
            return node.messages;
        }
        else if (id_usuario < node.id_usuario) {
            // Se o ID do usuário for menor que o ID do nó, chama a função _searchNode
            return this._searchNode(node.left, id_usuario);
        }
        else {
            // Se o ID do usuário for maior que o ID do nó, chama a função _searchNode
            return this._searchNode(node.right, id_usuario)
        }
    }
}

function simulacao() {

    // Criar instâncias das estruturas
    const interesses1 = new Interesses();
    const interesses2 = new Interesses();
    const interesses3 = new Interesses();
    const timeline1 = new Timeline();
    const timeline2 = new Timeline();
    const timeline3 = new Timeline();

    const grafo = new Grafo();
    const arvoreUsuarios = new BinaryTree();

    // Adicionar 3 usuários com interesses, conexões e mensagens
    const usuarios = ['Usuario1', 'Usuario2', 'Usuario3'];


    //Usuario 01
    grafo.adicionarUsuario(1);
    grafo.adicionarAmizade(1, 2);
    grafo.adicionarAmizade(1, 3);
    arvoreUsuarios.inserirUsuario(1);
    arvoreUsuarios.adicionarMensagem(1, "Mensagem 1 do Usuario1");
    arvoreUsuarios.adicionarMensagem(1, "Mensagem 2 do Usuario1");
    interesses1.insertAtEnd("Gatos");
    interesses1.insertAtEnd("Cães");
    timeline1.append("Mensagem 1 do Usuario1");
    timeline1.append("Mensagem 2 do Usuario1");

    //Usuario 02
    arvoreUsuarios.inserirUsuario(2);
    arvoreUsuarios.adicionarMensagem(2, "Mensagem 1 do Usuario2");
    arvoreUsuarios.adicionarMensagem(2, "Mensagem 2 do Usuario2");
    interesses2.insertAtEnd("Comida Italiana");
    interesses2.insertAtEnd("Diário de viagem");
    timeline2.append("Mensagem 1 do Usuario2");
    timeline2.append("Mensagem 2 do Usuario2");

    //Usuario 03
    arvoreUsuarios.inserirUsuario(3);
    arvoreUsuarios.adicionarMensagem(3, "Mensagem 1 do Usuario3");
    arvoreUsuarios.adicionarMensagem(3, "Mensagem 2 do Usuario3");
    interesses3.insertAtEnd("Fotografia");
    interesses3.insertAtEnd("Música");
    timeline3.append("Mensagem 1 do Usuario3");
    timeline3.append("Mensagem 2 do Usuario3");

    // Exibir os interesses dos usuários
    console.log('Interesses:');
    console.log('Usuario1:');
    interesses1.printList();
    console.log('Usuario2:');
    interesses2.printList();
    console.log('Usuario3:');
    interesses3.printList();

    // Exibir timeline das mensagens dos usuários
    console.log('Mensagens:');
    console.log('Usuario1:');
    timeline1.traverse();
    console.log('Usuario2:');
    timeline2.traverse();
    console.log('Usuario3:');
    timeline3.traverse();

    // Exibir as mensagens de um usuário específico
    console.log('Mensagens de um Usuario especifico(Usuario2):');
    console.log(arvoreUsuarios.mensagens(2));

    // Exibir as conexões dos usuários
    console.log('Conexões:');
    grafo.imprimirGrafo();
}

simulacao();