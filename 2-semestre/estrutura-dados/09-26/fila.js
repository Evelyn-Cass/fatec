class Fila {
    constructor() {
        this.items = {};
        this.inicio = 0;
        this.fim = 0;
    }

    enqueue(elemento) {
        this.items[this.fim] = elemento;
        this.fim++;
    }

    dequeue() {
        if (this.isEmpty()) {
            return undefined;
        }

        const item = this.items[this.inicio];
        delete this.items[this.inicio];
        this.inicio++;

        if (this.inicio == this.fim) {
            this.inicio = 0;
            this.fim = 0;
        }

        return item;
    }

    front() {
        if (this.isEmpty()) {
            return undefined;
        }
        return this.items[this.inicio];
    }

    isEmpty() {
        return this.fim == this.inicio;
    }

    size() {
        return this.fim - this.inicio;
    }

    clear() {
        this.items = {};
        this.inicio = 0;
        this.fim = 0;
    }
}

let minhaVariavel = new Fila();

minhaVariavel.enqueue("Maria");
minhaVariavel.enqueue("Ana");
minhaVariavel.enqueue("Rosana");
minhaVariavel.enqueue("Janaina");

console.log(minhaVariavel.front());

console.log(minhaVariavel.dequeue());
console.log(minhaVariavel.dequeue());

minhaVariavel.enqueue("Nádia");

console.log(minhaVariavel.size());
console.log(minhaVariavel.front());