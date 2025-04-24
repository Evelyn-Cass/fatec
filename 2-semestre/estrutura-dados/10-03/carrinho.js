class Carrinho {
    constructor() {
        this.produto = {};
        this.valor = {};
        this.quantidade = {};
        this.tamanho = 0;
    }

    adicionar(produto, valor, quantidade = 1) {
        this.produto[this.tamanho] = produto;
        this.valor[this.tamanho] = valor;
        this.quantidade[this.tamanho] = quantidade;
        this.tamanho++;
    }

    totalItens() {
        return this.tamanho;
    }

    valorTotal() {
        let valorTotal = 0;
        for (let i = 0; i < this.tamanho; i++) {
            valorTotal += this.valor[i] * this.quantidade[i];
        }
        return valorTotal;
    }

    limpar() {
        this.tamanho = 0;
        this.produto = {};
        this.valor = {};
        this.quantidade = {};
    }

    remover(codigo) {
        if (this.tamanho > 0) {
            if ((codigo < this.tamanho) && (codigo >= 0)) {
                let i = codigo;
                while (i < (this.tamanho - 1)) {
                    let j = i + 1;
                    this.produto[i] = this.produto[j];
                    this.valor[i] = this.valor[j];
                    this.quantidade[i] = this.quantidade[j];
                    i++;
                }
                this.produto[this.tamanho] = undefined;
                this.valor[this.tamanho] = undefined;
                this.quantidade[this.tamanho] = undefined;

                this.tamanho--;
            }
            else {
                console.log("Código Inválido!");
            }

        } else {
            console.log("Carrinho vazio!");
        }
    }


    retornarProdutos() {
        return this.produto;
    }

    retornarValores() {
        return this.valor;
    }

    mostrarCarrinho() {
        if (this.tamanho > 0) {
            console.log("          Carrinho")
            for (let i = 0; i < this.tamanho; i++) {

                console.log("-----------------------------");
                console.log("Código: " + i);
                console.log("Produto: " + this.produto[i]);
                console.log("Valor: R$" + this.valor[i].toFixed(2));
                console.log("Quantidade: " + this.quantidade[i]);
                console.log("SubTotal: R$" + (this.valor[i] * this.quantidade[i]).toFixed(2));
            }
            console.log("-----------------------------");
        }
        else {
            console.log("Sem produtos no Carrinho!");
        }
    }

}

let carrinho = new Carrinho();


//Adicionando produtos no carrinho
carrinho.adicionar("Brigadeiro", 6.00, 3);
carrinho.adicionar("Cookie", 5.00, 5);
carrinho.adicionar("Bolo de pote", 10.00);
carrinho.adicionar("Torta", 24.00);
carrinho.adicionar("Pavê no pote", 8.00,);
carrinho.adicionar("Maria Mole", 0.50, 6);

console.log("Total de itens: " + carrinho.totalItens());

//Mostrando Todos os Produtos do Carrinho
carrinho.mostrarCarrinho();

//Mostrando o Valor Total do Carrinho
console.log("Total da compra: R$" + carrinho.valorTotal().toFixed(2));
console.log("-----------------------------");

//Removendo o Pavê
carrinho.remover(4);

console.log("Total de itens: " + carrinho.totalItens());
//Mostrando a Lista Atualizada
carrinho.mostrarCarrinho();

//Mostrando o Valor Total do Carrinho
console.log("Total da compra: R$" + carrinho.valorTotal().toFixed(2));
console.log("-----------------------------");

//Removendo TODOS os produtos
carrinho.limpar();

console.log("Total de itens: " + carrinho.totalItens());
//Mostrando a Lista Atualizada
carrinho.mostrarCarrinho();

//Mostrando o Valor Total do Carrinho
console.log("Total da compra: R$" + carrinho.valorTotal().toFixed(2));
console.log("-----------------------------");
