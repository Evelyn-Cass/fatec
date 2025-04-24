//4.Crie um programa que solicite ao usuário que insira uma data no formato "dd/MM/yyyy".
//Caso o usuário insira uma data inválida, o programa deve capturar a exceção
//e continuar pedindo até que uma data válida seja inserida.
//•	Utilize DateTime.TryParseExact() para validar a data.
//•	Capture FormatException caso o formato esteja errado.
//•	Permita que o usuário tente novamente até fornecer uma entrada correta.

while (true)
{
    Console.WriteLine("Insira uma data ('dd/MM/yyyy'):");
    string? entrada = Console.ReadLine();
    DateTime data;

    try
    {
        data = DateTime.ParseExact(entrada, "dd/MM/yyyy", null);
        Console.WriteLine($"Data válida: {data.ToString("dd/MM/yyyy")}");
        break; 
    }
    catch (FormatException)
    {
        Console.Clear();
        Console.WriteLine("Formato de data inválido.");
    }
}


