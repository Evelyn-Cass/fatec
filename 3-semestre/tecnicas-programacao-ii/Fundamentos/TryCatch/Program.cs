try
{
    Console.WriteLine("Type an integer number:");
    var number1 = Convert.ToInt32(Console.ReadLine());
    Console.WriteLine("Type an integer number:");
    var number2 = Convert.ToInt32(Console.ReadLine());
    int result = number1 / number2;
    Console.WriteLine($"{number1}/{number2}={result}");
}
catch (FormatException)
{
    Console.WriteLine("Insert a valid integer number.");
}
catch (OverflowException)
{
    Console.WriteLine("The value is to big.");
}
catch(DivideByZeroException)
{
    Console.WriteLine("Division by zero is not possible.");
}
catch (Exception ex)
{
    Console.WriteLine("Something went wrong:"+ ex.Message);
}
finally
{
    Console.WriteLine("Finalizado!");
}

//NullReferenceException
//File Not Found
//Argument Exception
