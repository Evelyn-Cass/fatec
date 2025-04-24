class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}

class LinkedList {
    constructor() {
        this.head = null;
    }

    insert(value) {
        const newNode = new Node(value);
        if (this.head === null) {
            this.head = newNode;
        } else {
            let current = this.head;
            while (current.next !== null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    list() {
        let current = this.head;
        while (current !== null) {
            console.log(current.value);
            current = current.next;
        }
    }

    remove(value) {
        if (this.head === null) return;
        if (this.head.value === value) {
            this.head = this.head.next;
            return;
        }
        let current = this.head;
        while (current.next !== null && current.next.value !== value) {
            current = current.next;
        }
        if (current.next !== null) {
            current.next = current.next.next;
        }
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
function benchmarkLinkedList() {
    const linkedList = new LinkedList();

    // Inserção
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            linkedList.insert(i);
        }
    });
    console.log("LinkedList:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        linkedList.list();
    });
    console.log("LinkedList:", listTime, "ms");

    // Remoção
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            linkedList.remove(i);
        }
    });
    console.log("LinkedList:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkLinkedList();
console.log(results);