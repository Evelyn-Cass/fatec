ExemploIEnumerable obj = new ExemploIEnumerable();
List<string> nomes1 = new List<string> { "Maria", "Paulo" };

String[] nomes2 = { "Clara", "Pedro" };

obj.ExibirNome(nomes1);
Console.WriteLine();
obj.ExibirNome(nomes2);
Console.WriteLine();

//Exemplo ICollection
ICollection<string> pessoas = new List<string> {"Clovis"};
pessoas.Add("João");

foreach(var nome in pessoas)
{
    Console.WriteLine(nome);
}
Console.WriteLine();
pessoas.Remove("Clovis");
foreach (var nome in pessoas)
{
    Console.WriteLine(nome);
}






public class ExemploIEnumerable
{
    public void ExibirNome(IEnumerable<string> nomes)
    {
        foreach(var nome in nomes)
        {
            Console.WriteLine(nome);
        }
    }
}
