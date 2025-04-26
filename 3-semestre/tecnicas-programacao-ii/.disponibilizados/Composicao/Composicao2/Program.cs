Pessoa pessoa = new Pessoa("Maria da Silva", 14, "999999999");
pessoa.setCelular(14, "98888888888");

pessoa.Mostrar();
public class Pessoa
{
    public string? Nome { get; set; }
    public List<Celular> CelularPessoa = new List<Celular> { };

    public Pessoa(string? nome, int ddd, string? numero)
    {
        Nome = nome;
        CelularPessoa.Add(new Celular(ddd, numero));
    }
    public void Mostrar()
    {
        Console.WriteLine($"Nome: {Nome}\nCelular:\n");
        foreach(var cel in CelularPessoa)
        {
            Console.WriteLine($"DDD:{cel.DDD}\nNúmero:{cel.Numero}");
        }
    }

    public void setCelular(int ddd, string? numero)
    {
        CelularPessoa.Add(new Celular(ddd, numero));
    }

}//fim da classe Pessoa
public class Celular
{
    public Celular(int ddd, string? numero)
    {
        DDD = ddd;
        Numero = numero;
    }
    public int DDD { get; set; }
    public string? Numero { get; set; }
}