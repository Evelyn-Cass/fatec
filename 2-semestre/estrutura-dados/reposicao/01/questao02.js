class No {
    constructor(participante) {
        this.participante = participante;
        this.proximo = null;
    }
}

class Corrida {
    constructor() {
        this.primeiro = null;
    }
    primeiraPosicao(participante) {
        let novoParticipante = new No(participante);
        novoParticipante.proximo = this.primeiro;
        this.primeiro = novoParticipante;
    }
    ultimaPosicao(participante) {
        let novoParticipante = new No(participante);

        if (this.primeiro === null) {
            this.primeiro = novoParticipante;
            return
        }
        let participanteAtual = this.primeiro;
        while (participanteAtual.proximo !== null) {
            participanteAtual = participanteAtual.proximo;
        }
        participanteAtual.proximo = novoParticipante;
    }
    removerParticipante(participante) {
        if (this.primeiro === null) return;

        if (this.primeiro.participante === participante) {
            this.primeiro = this.primeiro.proximo;
            return;
        }

        let participanteAtual = this.primeiro;
        while (participanteAtual.proximo !== null && participanteAtual.proximo.participante !== participante) {
            participanteAtual = participanteAtual.proximo;
        }
        if (participanteAtual.proximo !== null) {
            participanteAtual.proximo = participanteAtual.proximo.proximo;
        }
    }
    encontrarParticipante(participante) {
        let participanteAtual = this.primeiro;
        let posicao = 0;
        while (participanteAtual !== null) {
            posicao++;
            if (participanteAtual.participante === participante) {
                return console.log("A "+participante+" está na posição: "+posicao);
            }
            participanteAtual = participanteAtual.proximo;
        }
        return null;
    }
    mostrarParticipantes() {
        let participanteAtual = this.primeiro;
        let posicoes = '';
        while (participanteAtual !== null) {
            posicoes += participanteAtual.participante + '->';
            participanteAtual = participanteAtual.proximo;
        }
        console.log(posicoes + "null");
    }
}

let corrida = new Corrida();

corrida.primeiraPosicao("Tartaruga Veloz");
corrida.ultimaPosicao("Tartaruga Lenta");

corrida.encontrarParticipante("Tartaruga Lenta");
corrida.mostrarParticipantes();

corrida.removerParticipante("Tartaruga Lenta");

corrida.encontrarParticipante("Tartaruga Veloz");