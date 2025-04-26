// This file has been developed ond the day of: 17/02/2025

int x = 10;
int y = 20;
int z = 30;

Mathematics math = new Mathematics();
//Mathematics math = new();

math.Addition(x, y);

math.Addition(x, y, z);

Console.WriteLine($"Initial values: x = {x}, y = {y}");

math.Subtraction(ref x, ref y); //When using ref, the value of x and y can be changed in the method

Console.WriteLine($"After the Subtraction: x = {x}, y = {y}");


public class Mathematics
{
    public void Addition(int x, int y)
    {
        int sum = x + y;
        Console.WriteLine($"{x} + {y} = {sum}");
    }

    public void Addition(double x, double y)
    {
        double sum = x + y;
        Console.WriteLine($"{x} + {y} = {sum}");
    }

    public void Addition(int x, int y, int z)
    {
        int sum = x + y + z;
        Console.WriteLine($"{x} + {y} + {z} = {sum}");
    }

    public void Subtraction(ref int x, ref int y)
    {
        int sub = x - y;
        Console.WriteLine($"{x} - {y} = {sub}");
        x = 0;
        y = 0;
    }
}