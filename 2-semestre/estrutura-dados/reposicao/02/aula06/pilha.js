class Pilha {
    constructor() {
        this.items = {};
        this.tamanho = 0;
    }

    adicionar(elemento) {
        this.items[this.tamanho] = elemento;
        this.tamanho++;
    }

    remover() {
        if (this.tamanho === 0) {
            return undefined;
        }

        const ultimoItem = this.items[this.tamanho - 1];
        delete this.items[this.tamanho - 1];
        this.tamanho--;

        return ultimoItem;
    }

    listar() {
        for (let i = 0; i < this.tamanho; i++) {
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
function benchmarkPilha() {
    const pilha = new Pilha();

    // Inserção
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            pilha.adicionar(i);
        }
    });
    console.log("Pilha:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        pilha.listar();
    });
    console.log("Pilha:", listTime, "ms");

    // Remoção
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            pilha.remover();
        }
    });
    console.log("Pilha:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkPilha();
console.log(results);