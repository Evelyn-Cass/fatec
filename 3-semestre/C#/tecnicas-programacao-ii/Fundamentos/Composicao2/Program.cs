Pessoa usuario = new Pessoa("Maria Oliveira", 11, "998005847");
usuario.setCelular(14, "9876451231");

usuario.Mostrar();


public class Pessoa
{
    public string? Nome { get; set; }
    public List<Celular> Celulares { get; set; } = new List<Celular>();
    public Pessoa(string? nome, int ddd, string? numero)
    {
        Nome = nome;
        Celulares.Add(new Celular(ddd, numero));
    }
    public void setCelular(int ddd, string? numero)
    {
        Celulares.Add(new Celular(ddd, numero));
    }

    public void Mostrar()
    {
        Console.WriteLine($"Nome: {Nome}\nCelulares:");
        foreach (var celular in Celulares)
        {
            Console.WriteLine($"({celular.DDD}) {celular.Numero}");
        }
    }
}

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
