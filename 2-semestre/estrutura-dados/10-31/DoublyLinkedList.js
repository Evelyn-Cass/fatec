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

    //Adiciona um nó no final 
    append(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.tail = newNode;
        }
        else {
            this.tail.next = newNode;
            newNode.prev = this.tail;
            this.tail = newNode;
        }

        this.length++;
    }

    //adiciona um nó ao inicio
    prepend(value) {
        const newNode = new Node(value);

        if (!this.head) {
            this.head = newNode;
            this.tail = newNode;
        }
        else {
            newNode.next = this.head;
            this.head.prev = newNode;
            this.head = newNode;
        }
        this.length++;
    }

    removeFirst() {
        if (!this.head) return null;

        const removedNode = this.head;

        if (this.head === this.tail) {
            this.head = null;
            this.tail = null;
        }
        else {
            this.head = this.head.next;
            this.head.prev = null;
        }
        this.length--;
        return removedNode.value;
    }

    removeLast() {
        if (!this.tail) return null;

        const removedNode = this.tail;
        if (this.tail === this.head) {
            this.head = null;
            this.tail = null;
        }
        else {
            this.tail = this.tail.prev;
            this.tail.next = null;
        }
        this.length--;
        return removedNode.value;
    }

    // Percorre a lista do inicio ao fim
    traverse() {
        let current = this.head;
        while (current) {
            console.log(current.value);
            current = current.next;
        }
    }

    //Percorre a lista do fim ao inicio
    traverseReverse() {
        let current = this.tail;
        while (current) {
            console.log(current.value);
            current = current.prev;
        }
    }
}

const list = new DoublyLinkedList();

list.append(10);
list.append(20);
list.append(30);

console.log("Percorrendo do inicio ao fim:");
list.traverse();

list.prepend(5);

console.log("Percorrendo do fim ao inicio:");
list.traverse();


list.removeLast();

console.log("Percorrendo do inicio ao fim:");
list.traverse();

list.removeFirst();

console.log("Percorrendo do inicio ao fim:");
list.traverse();

console.log("Percorrendo do fim ao inicio:");
list.traverseReverse();

