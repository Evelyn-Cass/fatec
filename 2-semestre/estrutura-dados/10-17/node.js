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
    insertAtBeginning(value) {
        let newNode = new Node(value);
        newNode.next = this.head;
        this.head = newNode;
    }
    insertAtEnd(value) {
        let newNode = new Node(value);

        if (this.head === null) {
            this.head = newNode;
            return
        }
        let current = this.head;
        while (current.next !== null) {
            current = current.next;
        }
        current.next = newNode;
    }
    removeByValue(value) {
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
    find(value) {
        let current = this.head;
        while (current !== null) {
            if (current.value === value) {
                return true;
            }
            current = current.next;
        }
        return null;
    }
    printList() {
        let current = this.head;
        let list = '';
        while (current !== null) {
            list += current.value + '->';
            current = current.next;
        }
        console.log(list + "null");
    }
}

let list = new LinkedList();

list.insertAtBeginning(30);
list.insertAtBeginning(20);
list.insertAtBeginning(10);
list.insertAtBeginning(10);
list.insertAtEnd(40);
list.insertAtEnd(50);
list.insertAtEnd(60);

list.printList();

list.removeByValue(10);

list.printList();

console.log(list.find(10));