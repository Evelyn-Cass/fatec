class meuArray {
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

    obterElemento(indice) {
        if (indice < 0 || indice >= this.tamanho) {
            return undefined;
        }
        return this.items[indice];
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
function benchmarkMeuArray() {
    const meuArrayInstance = new meuArray();

    // Inserção
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            meuArrayInstance.adicionar(i);
        }
    });
    console.log("meuArray:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        meuArrayInstance.listar();
    });
    console.log("meuArray:", listTime, "ms");

    // Remoção
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            meuArrayInstance.remover();
        }
    });
    console.log("meuArray:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkMeuArray();
console.log(results);