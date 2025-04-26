//3.Crie um programa que peça ao usuário para inserir um número e uma posição em um vetor de 10 posições.
//Caso o usuário tente acessar uma posição inválida (fora do intervalo 0 a 9),
//capture a exceção e exiba uma mensagem de erro.
//Utilize try-catch para capturar IndexOutOfRangeException.

float[] numeros = new float[10];

while (true)
{

    try
    {
        Console.WriteLine($"Insira o valor desejado:");
        float numero = float.Parse(Console.ReadLine());

        Console.WriteLine("Insira a posição desejada (1-10):");
        int posicao = int.Parse(Console.ReadLine());

        numeros[posicao - 1] = numero;

        Console.Write($"Número adicionado com sucesso!\n");
        break;
    }
    catch (FormatException)
    {
        Console.Clear();
        Console.WriteLine("Valor inválido.");
        continue;
    }
    catch (IndexOutOfRangeException)
    {
        Console.Clear();
        Console.WriteLine("Posição inválida.");
        continue;
    }
}