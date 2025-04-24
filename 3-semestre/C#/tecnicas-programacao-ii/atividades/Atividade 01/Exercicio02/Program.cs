//2.Criar uma lista(List<string>) para armazenar nomes de alunos.

//a. O programa deve permitir:

//· Adicionar nomes à lista.
//· Remover um nome específico.
//· Listar todos os nomes armazenados.
//b. Criar um menu de opções para interagir com a lista.

List<string> nomes = new List<string>();


string? opcao = "";

while (opcao != "4")
{
    Console.WriteLine("Bem vindo ao sistema de cadastro de alunos:");
    Console.WriteLine("1 - Adicionar nome");
    Console.WriteLine("2 - Remover nome");
    Console.WriteLine("3 - Listar nomes");
    Console.WriteLine("4 - Sair");
    opcao = Console.ReadLine();
    Console.Clear();
    string? nome = "";
    switch (opcao)
    {
        case "1":
            while (nome == null || nome == "")
            {
                Console.WriteLine("Digite o nome do aluno:");
                nome = Console.ReadLine();
            }
            nomes.Add(nome);
            Console.WriteLine($"Nome: {nome} adicionado com sucesso!");
            Console.ReadLine();
            Console.Clear();
            break;
        case "2":
            while (nome == null || nome == "")
            {
                Console.WriteLine("Digite o nome do aluno:");
                nome = Console.ReadLine();
            }
            nomes.Remove(nome);
            Console.WriteLine($"Nome: {nome} removido com sucesso!");
            Console.ReadLine();
            Console.Clear();
            break;
        case "3":
            Console.WriteLine("Listando nomes:");
            if (nomes.Count == 0)
            {
                Console.WriteLine("Nenhum nome cadastrado");
            }
            else
                ListarNomes(nomes);
            Console.ReadLine();
            Console.Clear();
            break;
        case "4":
            Console.WriteLine("Saindo do sistema...");
            break;
        default:
            Console.WriteLine("Opção inválida");
            break;
    }
}


static void ListarNomes(List<string> nomes)
{
    foreach (var nome in nomes)
    {
        Console.WriteLine(nome);
    }
}

