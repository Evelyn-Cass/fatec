class meuArray{
    constructor(){
        this.items = {};
        this.tamanho = 0;
    }
    
    adicionar(elemento){
        this.items[this.tamanho] = elemento;
        this.tamanho++;
    }

    remover(){
        if(this.tamanho === 0){
            return undefined;
        }
        
        const ultimoItem = this.items[this.tamanho-1];
        delete this.items[this.tamanho-1];
        this.tamanho--;
        return ultimoItem;
    }

    obterElemento(indice){
        if(indice < 0 || indice >= this.tamanho){
            return undefined;
        }
        return this.items[indice];
    }

    tamanhoArray(){
        return this.tamanho;
    }

    limpar(){
        this.items = {};
        this.tamanho = 0;
    }
}

let minhaVariavel = new meuArray();

minhaVariavel.adicionar(10);
minhaVariavel.adicionar(20);
minhaVariavel.adicionar(30);

console.log("O primeiro elemento é: " + minhaVariavel.obterElemento(1));
console.log("Tamanho do Array: " + minhaVariavel.tamanhoArray());

console.log("Último elmento removido: " + minhaVariavel.remover()); //remove o último elemento;
console.log("Tamanho do Array: " + minhaVariavel.tamanhoArray());
