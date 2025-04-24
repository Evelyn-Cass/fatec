class Carrinho {
    constructor() {
        this.produto = [];
        this.tamanho = 0;
    }

    adicionar(produto, valor, quantidade = 1) {
        produto = {
            nome: produto,
            valor: valor,
            quantidade: quantidade
        }
        this.produto[this.tamanho] = produto;
        this.tamanho++;
    }

    totalItens() {
        return this.tamanho;
    }

    valorTotal() {
        let valorTotal = 0;
        for (let i = 0; i < this.tamanho; i++) {
            valorTotal += this.produto[i].valor * this.produto[i].quantidade;
        }
        return valorTotal;
    }

    limpar() {
        this.produto = [];
        this.quantidade = [];
    }

    remover(codigo) {
        if (this.tamanho > 0) {
            if ((codigo < this.tamanho) && (codigo >= 0)) {
                let i = codigo;
                while (i < (this.tamanho - 1)) {
                    let j = i + 1;
                    this.produto[i].nome = this.produto[j].nome;
                    this.produto[i].valor = this.produto[j].valor;
                    this.produto[i].quantidade = this.produto[j].quantidade;
                    i++;
                }
                this.produto[this.tamanho] = undefined;

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

    mostrarCarrinho() {
        if (this.tamanho > 0) {
            console.log("          Carrinho")
            for (let i = 0; i < this.tamanho; i++) {

                console.log("-----------------------------");
                console.log("Código: " + i);
                console.log("Produto: " + this.produto[i].nome);
                console.log("Valor: R$" + this.produto[i].valor.toFixed(2));
                console.log("Quantidade: " + this.produto[i].quantidade);
                console.log("SubTotal: R$" + (this.produto[i].valor * this.produto[i].quantidade).toFixed(2));
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
