class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
        this.prev = null;
    }
}

class DoublyLinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // Adiciona um nó no final
    append(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.tail = newNode;
        } else {
            this.tail.next = newNode;
            newNode.prev = this.tail;
            this.tail = newNode;
        }
        this.length++;
    }

    // Lista todos os elementos
    list() {
        let current = this.head;
        while (current) {
            console.log(current.value);
            current = current.next;
        }
    }

    // Remove o último nó
    remove() {
        if (!this.tail) {
            return undefined;
        }

        const removedNode = this.tail;
        if (this.tail.prev) {
            this.tail = this.tail.prev;
            this.tail.next = null;
        } else {
            this.head = null;
            this.tail = null;
        }
        this.length--;
        return removedNode.value;
    }
}

// Função para medir o tempo de execução
function measureTime(callback) {
    const start = performance.now();
    callback();
    const end = performance.now();
    return end - start;
}

// Função para realizar o benchmark
function benchmarkDoublyLinkedList() {
    const doublyLinkedList = new DoublyLinkedList();

    // Inserção
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            doublyLinkedList.append(i);
        }
    });
    console.log("DoublyLinkedList:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        doublyLinkedList.list();
    });
    console.log("DoublyLinkedList:", listTime, "ms");

    // Remoção
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            doublyLinkedList.remove();
        }
    });
    console.log("DoublyLinkedList:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkDoublyLinkedList();
console.log(results);