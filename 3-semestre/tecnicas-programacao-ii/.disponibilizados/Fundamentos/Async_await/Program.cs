using System.Reflection;
using System.Threading.Tasks;

Console.WriteLine("Café da manhã sincrono");
CafeDaManha();
Console.WriteLine();
Console.WriteLine();
Console.WriteLine("Café da manhã assincrono");
CafeDaManhaAsync();
Console.ReadKey();

//método CafeDaManha

static async Task CafeDaManhaAsync()
{
    Console.WriteLine("Preparar o café da manhã");
    var TarefaCafe = PrepararCafeAsync();
    var TarefaPao = PrepararPaoAsync();
    var cafe = await TarefaCafe;
    var pao = await TarefaPao;
    ServirCafeManhaAsync(cafe, pao);

}
static async Task<Cafe> PrepararCafeAsync()
{
    Console.WriteLine("Fervendo a água");
    await Task.Delay(2000);
    Console.WriteLine("Coando o café");
    await Task.Delay(3000);
    Console.WriteLine("Adoçando o café");
    await Task.Delay(2000);
    return new Cafe();

}



static async Task<Pao> PrepararPaoAsync()
{
    Console.WriteLine("Cortando o pão");
    await Task.Delay(2000);
    Console.WriteLine("Passando Manteiga");
    await Task.Delay(3000);
    Console.WriteLine("Tostar o pão");
    await Task.Delay(2000);
    return new Pao();
}



static void ServirCafeManhaAsync(Cafe cafe, Pao pao)
{
    Console.WriteLine("Servindo o café da manhã");
    Thread.Sleep(2000);
    Console.WriteLine("Café servido");
}
static void CafeDaManha()
{
    Console.WriteLine("Preparar o café da manhã");
    var cafe = PrepararCafe();
    var pao = PrepararPao();
    ServirCafeManha(cafe, pao);

}
static Cafe PrepararCafe()
{
    Console.WriteLine("Fervendo a água");
    Thread.Sleep(2000);
    Console.WriteLine("Coando o café");
    Thread.Sleep(3000);
    Console.WriteLine("Adoçando o café");
    Thread.Sleep(2000);
    return new Cafe();

}



static Pao PrepararPao()
{
    Console.WriteLine("Cortando o pão");
    Thread.Sleep(2000);
    Console.WriteLine("Passando Manteiga");
    Thread.Sleep(3000);
    Console.WriteLine("Tostar o pão");
    Thread.Sleep(2000);
    return new Pao();
}



static void ServirCafeManha(Cafe cafe, Pao pao)
{
    Console.WriteLine("Servindo o café da manhã");
    Thread.Sleep(2000);
    Console.WriteLine("Café servido");
}
internal class Cafe
{
    public Cafe(){}
}
internal class Pao
{
    public Pao(){}
}

