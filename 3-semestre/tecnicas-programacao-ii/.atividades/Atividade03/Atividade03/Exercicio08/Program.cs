//8.Simula o cadastro de um produto com tratamento para entrada inválida e exceções genéricas.
//Lidar com entrada do usuário, múltiplos catch, e validação de regra de negócio. (FormatException e outros).

Console.WriteLine("Cadastro de Produto");
Console.Write("Digite o descritivo do produto: ");
string descritivo = Console.ReadLine();

Console.Write("Digite o preço do produto: ");
double preco;
while (true)
{
    try
    {
        preco = double.Parse(Console.ReadLine());
        if (preco < 0)
        {
            throw new ArgumentOutOfRangeException("O preço não pode ser negativo.");
        }
        break; 
    }
    catch (FormatException)
    {
        Console.WriteLine("Erro: Entrada inválida. Por favor, insira um número válido para o preço.");
    }
    catch (ArgumentOutOfRangeException ex)
    {
        Console.WriteLine($"Erro: {ex.Message}");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Erro inesperado: {ex.Message}");
    }
}

Console.WriteLine("Produto cadastrado com sucesso!");
