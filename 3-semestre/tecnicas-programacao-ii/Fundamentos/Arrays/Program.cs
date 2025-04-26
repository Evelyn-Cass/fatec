// This file has been developed ond the day of: 24/02/2025

int[,] numbers = new int[2,2];
numbers[0,0] = 1;
numbers[0,1] = 2;
numbers[1,0] = 3;
numbers[1,1] = 4;

foreach (int i in numbers)
{
    Console.WriteLine(i);
}

for (int line = 0; line < numbers.GetLength(0); line++)
{
    for (int column = 0; column < numbers.GetLength(1); column++)
    {
        Console.WriteLine(numbers[line, column]);
    }
}


Array[] array = { numbers , numbers };

Console.WriteLine(array);

Console.ReadLine();