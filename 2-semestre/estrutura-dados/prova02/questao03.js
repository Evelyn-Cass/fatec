class Grafo{
    constructor(){
        // Lista de adjacência
        this.adjacencia = {}; // objeto para armazenar usuarios e suas respectivas listas de adjacência
    }

    adicionarUsuario(Usuario){
        // Se o usuário não existir, adicione-o
        if (!this.adjacencia[Usuario]){
            this.adjacencia[Usuario] = [];
        }
    }

    adicionarAmizade(Usuario1, Usuario2){
        if(!this.adjacencia[Usuario1]){ // Se o usuário1 não existir, adicione-o
            this.adicionarUsuario(Usuario1);
        }
        if (!this.adjacencia[Usuario2]){
            // Se o usuário2 não existir, adicione-o
            this.adicionarUsuario(Usuario2);
        }
        // Adicione a amizade
        this.adjacencia[Usuario1].push(Usuario2);
        this.adjacencia[Usuario2].push(Usuario1);
    }

    imprimirGrafo(){
        for (let Usuario in this.adjacencia){
            // Imprime as conexões do usuário
            console.log(`${Usuario} -> ${this.adjacencia[Usuario].join(', ')};`)
        }
    }

    imprimirConexoes(Usuario){
        // Se o usuário não existir, exiba uma mensagem de erro
        if (!this.adjacencia[Usuario]){
            console.log('Usuário não encontrado');
            return;
        }
        // Imprime as conexões do usuário
        console.log(`${Usuario} -> ${this.adjacencia[Usuario].join(', ')};`)
    }

}

const conexoes = new Grafo();

conexoes.adicionarUsuario('Ana Paula');
conexoes.adicionarAmizade('Ana Paula', 'Bianca');
conexoes.adicionarAmizade('Ana Paula', 'David');
conexoes.adicionarAmizade('Bianca', 'David');

console.log('Conexões:');
conexoes.imprimirGrafo();

console.log('Conexões de Ana Paula:');
conexoes.imprimirConexoes('Ana Paula');