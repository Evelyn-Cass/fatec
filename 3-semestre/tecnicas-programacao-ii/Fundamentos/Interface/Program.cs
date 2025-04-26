// This file has been developed ond the day of: 10/03/2025

IAnimal animal = new Cat();
animal.MakeSound();

animal = new Dog();
animal.MakeSound();

public interface IAnimal //Interface is used to define the methods that a class must implement.
{
    public void MakeSound();
}

public class Cat : IAnimal
{
    public void MakeSound()
    {
        Console.WriteLine("Meoow");
    }
}

public class Dog : IAnimal
{
    public void MakeSound()
    {
        Console.WriteLine("Woof Woof!");
    }
}