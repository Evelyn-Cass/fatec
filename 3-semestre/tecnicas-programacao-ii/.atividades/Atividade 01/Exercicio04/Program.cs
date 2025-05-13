//4.Criar um ArrayList para armazenar produtos.

//a. O programa deve permitir:
//· Adicionar um produto à lista.
//· Remover um produto.
//· Exibir a lista de produtos.

//b. Criar um menu de opções para interagir com a lista.

using System.Collections;

ArrayList produtos = new ArrayList();

string? opcao = "";
while (opcao != "4")
{
    Console.WriteLine("Bem vindo ao sistema de cadastro de produtos:");
    Console.WriteLine("1 - Adicionar produto");
    Console.WriteLine("2 - Remover produto");
    Console.WriteLine("3 - Listar produtos");
    Console.WriteLine("4 - Sair");
    opcao = Console.ReadLine();
    Console.Clear();
    string? produto = "";

    switch (opcao)
    {
        case "1":
            while (produto == null || produto == "")
            {
                Console.WriteLine("Digite o nome do produto:");
                produto = Console.ReadLine();
            }
            produtos.Add(produto);
            Console.WriteLine($"Produto: {produto} adicionado com sucesso!");
            Console.ReadLine();
            Console.Clear();
            break;
        case "2":
            while (produto == null || produto == "")
            {
                Console.WriteLine("Digite o nome do produto:");
                produto = Console.ReadLine();
            }
            produtos.Remove(produto);
            Console.WriteLine($"Produto: {produto} removido com sucesso!");
            Console.ReadLine();
            Console.Clear();
            break;
        case "3":
            Console.WriteLine("Listando produtos:");
            if (produtos.Count == 0)
            {
                Console.WriteLine("Nenhum produto cadastrado");
            }
            else
                foreach (var item in produtos)
                {
                    Console.WriteLine(item);
                }
            ;
            Console.ReadLine();
            Console.Clear();
            break;
        case "4":
            break;
        default:
            Console.WriteLine("Opção inválida");
            Console.ReadLine();
            Console.Clear();
            break;
    }
}

