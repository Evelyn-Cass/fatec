//7.Um sistema que calcula a média de um aluno com base em duas notas.
//Se a quantidade de provas for 0, trata a exceção.

try
{
    Console.Write("Digite a quantidade de provas: ");
    int quantidadeProvas = int.Parse(Console.ReadLine());

    if (quantidadeProvas == 0)
    {
        throw new DivideByZeroException("A quantidade de provas não pode ser 0.");
    }

    double somaNotas = 0;

    for (int i = 1; i <= quantidadeProvas; i++)
    {
        Console.Write($"Digite a nota da prova {i}: ");
        double nota = double.Parse(Console.ReadLine());
        somaNotas += nota;
    }

    double media = somaNotas / quantidadeProvas;
    Console.WriteLine($"A média do aluno é: {media:F2}");
}
catch (DivideByZeroException ex)
{
    Console.WriteLine($"Erro: {ex.Message}");
}
catch (FormatException)
{
    Console.WriteLine("Erro: Entrada inválida. Por favor, insira números válidos.");
}
catch (Exception ex)
{
    Console.WriteLine($"Erro inesperado: {ex.Message}");
}

