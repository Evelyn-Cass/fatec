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

    topo() {
        if (this.tamanho === 0) {
            return undefined;
        }
        return this.items[this.tamanho - 1];
    }

    estaVazia() {
        return this.tamanho === 0;
    }

    tamanhoPilha() {
        return this.tamanho;
    }

    limpar() {
        this.items = {};
        this.tamanho = 0;

    }
}

let minhaVariavel = new Pilha();

minhaVariavel.adicionar(10);
minhaVariavel.adicionar(20);
minhaVariavel.adicionar(30);
minhaVariavel.adicionar(40);

console.log(minhaVariavel.topo());

console.log(minhaVariavel.remover());
console.log(minhaVariavel.topo());

console.log(minhaVariavel.tamanhoPilha());