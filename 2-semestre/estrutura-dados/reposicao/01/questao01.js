class No {
    constructor(ponto) {
        this.ponto = ponto;
        this.proximo = null;
    }
}

class TrilhaAventura {
    constructor() {
        this.inicio = null;
    }
    novoPontoInicio(ponto) {
        let novoPonto = new No(ponto);
        novoPonto.proximo = this.inicio;
        this.inicio = novoPonto;
    }
    novoPontoFinal(ponto) {
        let novoPonto = new No(ponto);

        if (this.inicio === null) {
            this.inicio = novoPonto;
            return
        }
        let pontoAtual = this.inicio;
        while (pontoAtual.proximo !== null) {
            pontoAtual = pontoAtual.proximo;
        }
        pontoAtual.proximo = novoPonto;
    }
    removerPonto(ponto) {
        if (this.inicio === null) return;

        if (this.inicio.ponto === ponto) {
            this.inicio = this.inicio.proximo;
            return;
        }

        let pontoAtual = this.inicio;
        while (pontoAtual.proximo !== null && pontoAtual.proximo.ponto !== ponto) {
            pontoAtual = pontoAtual.proximo;
        }
        if (pontoAtual.proximo !== null) {
            pontoAtual.proximo = pontoAtual.proximo.proximo;
        }
    }
    encontrarPonto(ponto) {
        let pontoAtual = this.inicio;
        while (pontoAtual !== null) {
            if (pontoAtual.ponto === ponto) {
                return true;
            }
            pontoAtual = pontoAtual.proximo;
        }
        return null;
    }
    mostrarPontos() {
        let pontoAtual = this.inicio;
        let trilha = '';
        while (pontoAtual !== null) {
            trilha += pontoAtual.ponto + '->';
            pontoAtual = pontoAtual.proximo;
        }
        console.log(trilha + "null");
    }
}

let trilha = new TrilhaAventura();


trilha.novoPontoInicio("Cachoeira");
trilha.novoPontoInicio("Mirante");
trilha.novoPontoFinal("Caverna");

trilha.mostrarPontos();

trilha.removerPonto("Caverna");

trilha.mostrarPontos();

