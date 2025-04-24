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

        if (this.inicio === this.fim) {
            this.inicio = 0;
            this.fim = 0;
        }

        return item;
    }

    isEmpty() {
        return this.inicio === this.fim;
    }

    list() {
        for (let i = this.inicio; i < this.fim; i++) {
            console.log(this.items[i]);
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
function benchmarkFila() {
    const fila = new Fila();

    // Inserção
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            fila.enqueue(i);
        }
    });
    console.log("Fila:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        fila.list();
    });
    console.log("Fila:", listTime, "ms");

    // Remoção
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            fila.dequeue();
        }
    });
    console.log("Fila:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkFila();
console.log(results);