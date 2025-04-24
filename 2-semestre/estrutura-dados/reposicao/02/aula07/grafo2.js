class Grafo {
    constructor() {
        this.adjacencia = {};
    }

    adicionarVertice(vertice) {
        if (!this.adjacencia[vertice]) {
            this.adjacencia[vertice] = [];
        }
    }

    adicionarAresta(vertice1, vertice2, peso) {
        if (!this.adjacencia[vertice1]) {
            this.adicionarVertice(vertice1);
        }
        if (!this.adjacencia[vertice2]) {
            this.adicionarVertice(vertice2);
        }
        this.adjacencia[vertice1].push({ vertice: vertice2, peso: peso });
        this.adjacencia[vertice2].push({ vertice: vertice1, peso: peso });
    }

    removerAresta(vertice1, vertice2) {
        this.adjacencia[vertice1] = this.adjacencia[vertice1].filter(v => v.vertice !== vertice2);
        this.adjacencia[vertice2] = this.adjacencia[vertice2].filter(v => v.vertice !== vertice1);
    }

    imprimirGrafo() {
        for (let vertice in this.adjacencia) {
            const arestas = this.adjacencia[vertice].map(v => `${v.vertice}(${v.peso})`).join(', ');
            console.log(`${vertice} -> ${arestas};`);
        }
    }

    bfs(inicio) {
        const visitados = {};
        const fila = [inicio];
        visitados[inicio] = true;

        while (fila.length > 0) {
            const vertice = fila.shift();
            console.log(vertice);

            this.adjacencia[vertice].forEach(v => {
                if (!visitados[v.vertice]) {
                    visitados[v.vertice] = true;
                    fila.push(v.vertice);
                }
            });
        }
    }

    dijkstra(inicio, fim) {
        const distancias = {};
        const visitados = {};
        const antecessores = {};
        const pq = new PriorityQueue();

        for (let vertice in this.adjacencia) {
            distancias[vertice] = Infinity;
            antecessores[vertice] = null;
        }
        distancias[inicio] = 0;
        pq.enqueue(inicio, 0);

        while (!pq.isEmpty()) {
            const { vertice } = pq.dequeue();

            if (vertice === fim) {
                const caminho = [];
                let atual = fim;
                while (atual) {
                    caminho.unshift(atual);
                    atual = antecessores[atual];
                }
                return { distancia: distancias[fim], caminho };
            }

            if (!visitados[vertice]) {
                visitados[vertice] = true;

                this.adjacencia[vertice].forEach(v => {
                    const distancia = distancias[vertice] + v.peso;
                    if (distancia < distancias[v.vertice]) {
                        distancias[v.vertice] = distancia;
                        antecessores[v.vertice] = vertice;
                        pq.enqueue(v.vertice, distancia);
                    }
                });
            }
        }

        return { distancia: Infinity, caminho: [] };
    }
}

class PriorityQueue {
    constructor() {
        this.items = [];
    }

    enqueue(vertice, prioridade) {
        const novoElemento = { vertice, prioridade };
        let adicionado = false;

        for (let i = 0; i < this.items.length; i++) {
            if (novoElemento.prioridade < this.items[i].prioridade) {
                this.items.splice(i, 0, novoElemento);
                adicionado = true;
                break;
            }
        }

        if (!adicionado) {
            this.items.push(novoElemento);
        }
    }

    dequeue() {
        return this.items.shift();
    }

    isEmpty() {
        return this.items.length === 0;
    }
}

// Exemplo de uso
const meuGrafo = new Grafo();
meuGrafo.adicionarVertice(1);
meuGrafo.adicionarVertice(2);
meuGrafo.adicionarVertice(3);
meuGrafo.adicionarVertice(4);
meuGrafo.adicionarAresta(1, 2, 1);
meuGrafo.adicionarAresta(1, 3, 4);
meuGrafo.adicionarAresta(2, 4, 2);
meuGrafo.adicionarAresta(3, 4, 3);
meuGrafo.imprimirGrafo();

console.log("BFS:");
meuGrafo.bfs(1);

console.log("Menor caminho:");
const resultado = meuGrafo.dijkstra(1, 4);
console.log(`Distância: ${resultado.distancia}`);
console.log(`Caminho: ${resultado.caminho.join(' -> ')}`);