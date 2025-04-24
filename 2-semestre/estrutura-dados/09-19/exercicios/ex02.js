class Pilha {
    constructor() {
        this.pilha = [];
    }

    adicionarAcao(acao) {
        this.pilha.push(acao);
        console.log("Nova Ação Adicionada: " + acao);
    }

    desfazer(){
        if (this.pilha.length === 0){
            console.log("Nenhuma Ação Encontrada!");
            return;
        }
        const acaoDesfeita = this.pilha.pop();

        console.log("Ação Desfeita: " + acaoDesfeita);
    }
}

let pilha = new Pilha();

pilha.adicionarAcao("Comer");
pilha.adicionarAcao("Jogar");
pilha.adicionarAcao("Estudar");
pilha.adicionarAcao("Dormir");

pilha.desfazer();
