// This file has been developed ond the day of: 17/02/2025

Cat cat = new("Chocolat");
cat.GetName();
cat.Meow();

Dog dog = new Dog("Spike");
dog.GetName();
dog.Bark();

public class Animal
{
    public Animal(string name)
    {
        this.Name = name;
    }

    protected string Name { get; set; }
}

public class Dog : Animal
{
    public Dog(string name) : base(name)
    {
    }

    public void GetName()
    {
        Console.WriteLine("The dog's name is " + this.Name);
    }
    public void Bark()
    {
        Console.WriteLine($"{Name} is barking. Woof Woof!");
    }
}

public class Cat : Animal
{
    public Cat(string name) : base(name)
    {
    }
    public void GetName()
    {
        Console.WriteLine("The cat's name is " + this.Name);
    }
    public void Meow()
    {
        Console.WriteLine($"{Name} is meowing. Meooow!");
    }
}