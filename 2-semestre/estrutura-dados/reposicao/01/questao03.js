class No {
    constructor(poder) {
        this.poder = poder;
        this.proximo = null;
    }
}

class Poderes {
    constructor() {
        this.primeiro = null;
    }
    novoPoderInicio(poder) {
        let novoPoder = new No(poder);
        novoPoder.proximo = this.primeiro;
        this.primeiro = novoPoder;
    }
    novoPoderFinal(poder) {
        let novoPoder = new No(poder);

        if (this.primeiro === null) {
            this.primeiro = novoPoder;
            return
        }
        let poderAtual = this.primeiro;
        while (poderAtual.proximo !== null) {
            poderAtual = poderAtual.proximo;
        }
        poderAtual.proximo = novoPoder;
    }
    removerPoder(poder) {
        if (this.primeiro === null) return;

        if (this.primeiro.poder === poder) {
            this.primeiro = this.primeiro.proximo;
            return;
        }

        let poderAtual = this.primeiro;
        while (poderAtual.proximo !== null && poderAtual.proximo.poder !== poder) {
            poderAtual = poderAtual.proximo;
        }
        if (poderAtual.proximo !== null) {
            poderAtual.proximo = poderAtual.proximo.proximo;
        }
    }
    encontrarPoder(poder) {
        let poderAtual = this.primeiro;
        while (poderAtual !== null) {
            if (poderAtual.poder === poder) {
                return true;
            }
            poderAtual = poderAtual.proximo;
        }
        return null;
    }
    mostrarPoderes() {
        let poderAtual = this.primeiro;
        let lista = '';
        while (poderAtual !== null) {
            lista += poderAtual.poder + '->';
            poderAtual = poderAtual.proximo;
        }
        console.log(lista + "null");
    }
}

let poderes = new Poderes();

poderes.novoPoderFinal("Raio Congelante");
poderes.novoPoderInicio("Escudo de Fogo");

poderes.mostrarPoderes();

poderes.removerPoder("Raio Congelante");

if (poderes.encontrarPoder("Escudo de Fogo")){
    console.log("Escudo de Fogo disponível!")
}
else{
    console.log("Poder não encontrado!")
}

poderes.mostrarPoderes();
