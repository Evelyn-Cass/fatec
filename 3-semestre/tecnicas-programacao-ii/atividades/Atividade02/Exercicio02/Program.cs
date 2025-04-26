//2.Crie um programa que solicite ao usuário que insira um número inteiro.
//Caso o usuário insira um valor inválido (não numérico),
//capture a exceção e peça para ele inserir novamente até que forneça um valor válido.

Console.WriteLine("Digite um número inteiro: ");
while (true)
{
    try
    {
        int numero = Convert.ToInt32(Console.ReadLine());
        Console.Clear();
        Console.WriteLine($"O número {numero} é válido!");
        break;
    }
    catch (FormatException)
    {
        Console.Clear();
        Console.WriteLine("Valor inválido.\nDigite um número inteiro: ");
        continue;
    }
}