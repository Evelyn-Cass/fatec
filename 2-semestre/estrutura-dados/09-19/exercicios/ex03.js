class Fila {
    constructor() {
        this.fila = [];
    }

    adicionar(cliente) {
        this.fila.push(cliente);
        console.log("Novo Cliente Adicionado(a): " + cliente)
    }

    remover() {
        const cliente = this.fila.shift();
        console.log("Cliente Removido da Fila: "+ cliente);
    }
}

let fila = new Fila();

fila.adicionar("Joana");
fila.adicionar("Ricardo");
fila.adicionar("Neile");
fila.adicionar("Eduardo");

fila.remover();