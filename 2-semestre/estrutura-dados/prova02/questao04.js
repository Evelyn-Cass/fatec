
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

const usuarios = new BinaryTree();

usuarios.inserirUsuario(1);

usuarios.adicionarMensagem(1, "Hoje o dia está chuvoso, acordei com frio.");
usuarios.adicionarMensagem(1, "Espero que amanhã faça sol, planejo ir para a praia.");
usuarios.adicionarMensagem(1, "Estou ansioso para o final de semana.");

usuarios.mensagens(1).forEach(element => {
    console.log(element);
}); 
