//Console.WriteLine("Breakfeast Synchronous");
//BreakfeastSync();
Console.WriteLine("Breakfeast Asynchronous");
BreakfeastAsync();
Console.ReadLine();
static async void BreakfeastAsync()
{
    Console.WriteLine("Making the Breakfeast");
    var TaskCoffee = makeCoffeeAsync(); 
    var TaskSandwich = makeSandwichAsync();
    var coffee = await TaskCoffee;
    var sandwich = await TaskSandwich;
    serveBreakfeastAsync(coffee, sandwich);
}

//static void BreakfeastSync()
//{
//    Console.WriteLine("Making the Breakfeast");
//    var coffee = makeCoffeeSync();
//    var sandwich = makeSandwichSync();
//    serveBreakfeastSync(coffee, sandwich);
//}

//static Coffee makeCoffeeSync()
//{
//    Console.WriteLine("Heating the water");
//    Thread.Sleep(2000);
//    Console.WriteLine("Filtering the coffee");
//    Thread.Sleep(3000);
//    Console.WriteLine("Sweetening the coffee");
//    Thread.Sleep(2000);
//    return new Coffee();
//}
static async Task<Coffee> makeCoffeeAsync()
{
    Console.WriteLine("Heating the water");
    await Task.Delay(2000);
    Console.WriteLine("Filtering the coffee");
    await Task.Delay(3000);
    Console.WriteLine("Sweetening the coffee");
    await Task.Delay(2000);
    return new Coffee();
}

//static Sandwich makeSandwichSync()
//{
//    Console.WriteLine("Cutting the bread");
//    Thread.Sleep(2000);
//    Console.WriteLine("Toasting the bread");
//    Thread.Sleep(2000);
//    Console.WriteLine("Spread butter on the bread");
//    Thread.Sleep(3000);
//    return new Sandwich();
//}
static async Task<Sandwich> makeSandwichAsync()
{
    Console.WriteLine("Cutting the bread");
    await Task.Delay(2000);
    Console.WriteLine("Toasting the bread");
    await Task.Delay(2000);
    Console.WriteLine("Spread butter on the bread");
    await Task.Delay(3000);
    return new Sandwich();
}

//static void serveBreakfeastSync(Coffee coffee, Sandwich sandwich)
//{
//    Console.WriteLine("Serving the breakfeast");
//    Thread.Sleep(2000);
//    Console.WriteLine("Breakfeast served");
//}
static void serveBreakfeastAsync(Coffee coffee, Sandwich sandwich)
{
    Console.WriteLine("Serving the breakfeast");
    Thread.Sleep(2000);
    Console.WriteLine("Breakfeast served");
}
internal class Coffee
{
    public Coffee() { }
}
internal class Sandwich
{
    public Sandwich()
    {
    }
}