class Node {
    constructor(value) {
        this.value = value;
        this.left = null;
        this.right = null;
    }
}
class BinaryTree {
    constructor() {
        this.root = null;
    }

    insert(value) {
        const newNode = new Node(value);
        if (this.root === null) {
            this.root = newNode;
        } else {
            this._insertNode(this.root, newNode);
        }
    }

    _insertNode(node, newNode) {
        if (newNode.value < node.value) {
            if (node.left === null) {
                node.left = newNode;
            } else {
                this._insertNode(node.left, newNode);
            }
        } else {
            if (node.right === null) {
                node.right = newNode;
            } else {
                this._insertNode(node.right, newNode);
            }
        }
    }

    // sub-arvore esquerda, nó atual e sub-arvore a direita 
    inOrder(node = this.root) {
        if (node != null) {
            this.inOrder(node.left);
            console.log(node.value);
            this.inOrder(node.right);
        }
    }

    //visita o nó atual, subarvore a esquerda e subarvore a direita
    preOrder(node = this.root) {
        if (node != null) {
            console.log(node.value);
            this.preOrder(node.left);
            this.preOrder(node.right)
        }
    }

    // visita a subarvore a esquera, subarvore a direita e nó atual
    postOrder(node = this.root) {
        if (node != null) {
            this.postOrder(node.left);
            this.postOrder(node.right);
            console.log(node.value);
        }
    }

    search(value) {
        return this._searchNode(this.root, value)
    }

    _searchNode(node, value) {
        if (node === null) {
            return false;
        }
        if (value === node.value) {
            return true;
        }
        else if (value < node.value) {
            return this._searchNode(node.left, value);
        }
        else {
            return this._searchNode(node.right, value)
        }
    }

    remove(value) {
        this.root = this._removeNode(this.root, value);
    }

    _removeNode(node, value) {
        if (node === null) {
            return null;
        }
        if (value < node.value) {
            node.left = this._removeNode(node.left, value)
            return node;
        }
        else if (value > node.value) {
            node.right = this._removeNode(node.right, value)
            return node;
        }
        else {
            if (node.left === null && node === null) {
                node = null;
                return node;
            }
            if (node.left === null) {
                node = node.right;
                return node;
            }
            else if (node.right === null) {
                node = node.left;
                return node;
            }
            const aux = this._findMinNode(node.right);
            node.value = aux.value;
            node.right = this._removeNode(node.right, aux.value);
            return node;
        }
    }

    _findMinNode(node) {
        while (node.left !== null) {
            node = node.left; // Continua indo para a esquerda até encontrar o menor valor
        }
        return node;
    }
}

const tree = new BinaryTree();
tree.insert(15);
tree.insert(10);
tree.insert(20);
tree.insert(8);
tree.insert(12);
tree.insert(18);
tree.insert(25);

console.log("Percurso em-ordem:");
tree.inOrder();

console.log("Buscar o valor 18");
console.log(tree.search(18) ? "Encontrado" : "Não encontrado");

console.log("Remover valor 10:");
tree.remove(10);
tree.inOrder();