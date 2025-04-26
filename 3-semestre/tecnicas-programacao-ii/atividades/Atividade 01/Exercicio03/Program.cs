//3.Criar um array bidimensional (double[,]) para armazenar notas de 3 alunos em 3 matérias.

//a. O programa deve permitir:
//· Preencher o array com notas inseridas pelo usuário.
//· Exibir as notas de todos os alunos.
//· Calcular e exibir a média de cada aluno.

double[,] notas = new double[3, 3];

for (int i = 0; i < notas.GetLength(0); i++)
{
    for (int j = 0; j < notas.GetLength(1); j++)
    {
        Console.WriteLine($"Digite a nota do aluno {i + 1} na prova {j + 1}");
        string? input = Console.ReadLine();
        if (double.TryParse(input, out double nota))
        {
            notas[i, j] = nota;
        }
        else
        {
            j--;
        }
        Console.Clear();
    }
}

for (int i = 0; i < notas.GetLength(0); i++)
{
    Console.WriteLine($"Notas do aluno {i + 1}");
    for (int j = 0; j < notas.GetLength(1); j++)
    {
        Console.WriteLine($"Nota {j + 1}: {notas[i, j]}");
    }
}
Console.WriteLine("Pressione qualquer tecla para continuar...");
Console.ReadLine();
Console.Clear();

for (int i = 0; i < notas.GetLength(0); i++)
{
    double soma = 0;
    for (int j = 0; j < notas.GetLength(1); j++)
    {
        soma += notas[i, j];
    }
    Console.WriteLine($"Média do aluno {i + 1}: {(soma / notas.GetLength(1)).ToString("F2")}");
}