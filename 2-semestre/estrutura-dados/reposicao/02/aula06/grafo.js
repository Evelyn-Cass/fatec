class Grafo {
    constructor() {
        this.adjacencia = {};
    }

    adicionarVertice(vertice) {
        if (!this.adjacencia[vertice]) {
            this.adjacencia[vertice] = [];
        }
    }

    adicionarAresta(vertice1, vertice2) {
        if (!this.adjacencia[vertice1]) {
            this.adicionarVertice(vertice1);
        }
        if (!this.adjacencia[vertice2]) {
            this.adicionarVertice(vertice2);
        }
        this.adjacencia[vertice1].push(vertice2);
        this.adjacencia[vertice2].push(vertice1);
    }

    removerAresta(vertice1, vertice2) {
        this.adjacencia[vertice1] = this.adjacencia[vertice1].filter(v => v !== vertice2);
        this.adjacencia[vertice2] = this.adjacencia[vertice2].filter(v => v !== vertice1);
    }

    listar() {
        for (let vertice in this.adjacencia) {
            console.log(`${vertice}: ${this.adjacencia[vertice].join(', ')}`);
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
function benchmarkGrafo() {
    const grafo = new Grafo();

    // Inserção de vértices e arestas
    console.log("Inserção:");
    const insertTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            grafo.adicionarVertice(i);
            if (i > 0) {
                grafo.adicionarAresta(i, i - 1);
            }
        }
    });
    console.log("Grafo:", insertTime, "ms");

    // Listagem
    console.log("Listagem:");
    const listTime = measureTime(() => {
        grafo.listar();
    });
    console.log("Grafo:", listTime, "ms");

    // Remoção de arestas
    console.log("Remoção:");
    const removeTime = measureTime(() => {
        for (let i = 0; i < 10000; i++) {
            if (i > 0) {
                grafo.removerAresta(i, i - 1);
            }
        }
    });
    console.log("Grafo:", removeTime, "ms");

    return { insertTime, listTime, removeTime };
}

const results = benchmarkGrafo();
console.log(results);