Fabrica fabrica = new Fabrica("Fatec", "Empilhadeira", new DateTime(2024, 05, 31), "CAT", "02:20", "S/0");
fabrica.AdicionarMaquina("Escavadeira", new DateTime(2024, 05, 31), "DOG", "02:30", "Amarela");

fabrica.ListarMaquinas();

Console.WriteLine("----------------------");

Operador operador1 = new Operador("Joana Oliveira", fabrica.BuscarMaquinaPorModelo("CAT"));
Operador operador2 = new Operador("Henrique Gomes", fabrica.BuscarMaquinaPorModelo("DOG"));

await operador1.OperarMaquinaAsync(fabrica, "CAT");

Console.WriteLine("----------------------");

await operador2.OperarMaquinaAsync(fabrica, "cat");

public class ModeloInvalido : Exception
{
    public ModeloInvalido() { }
    public ModeloInvalido(string Message) : base(Message) { }

    public ModeloInvalido(string Message, Exception inner) : base(Message, inner) { }

    public ModeloInvalido(string fabrica, string modelo) : base($"Máquina Modelo: {modelo} não encontrada na Fábrica: {fabrica}") { }

}
class Fabrica
{

    public Fabrica(string nome, string nomeMaquina, DateTime dataFabricacao, string modelo, string horaOperacao, string observacao)
    {
        Nome = nome;
        Maquinas = new List<Maquina>();
        Maquinas.Add(new Maquina(nomeMaquina, dataFabricacao, modelo, horaOperacao, observacao));
    }

    public void AdicionarMaquina(string nomeMaquina, DateTime dataFabricacao, string modelo, string horaOperacao, string observacao)
    {
        Maquinas.Add(new Maquina(nomeMaquina, dataFabricacao, modelo, horaOperacao, observacao));
    }

    public void ListarMaquinas()
    {
        Console.WriteLine("Maquinas Cadastradas");
        foreach (var maquina in Maquinas)
        {
            Console.WriteLine($"Nome: {maquina.Nome}\nModelo: {maquina.Modelo}\nData Fabricação: {maquina.DataFabricacao}\n Número Série: {maquina.NumeroSerie}");
        }
    }

    public Maquina BuscarMaquinaPorModelo(string modelo)
    {
        var maquina = this.Maquinas.FirstOrDefault(u => u.Modelo == modelo);

        if (maquina == default)
        {
            return null;
        }
        return maquina;


    }
    public string? Nome { get; set; }
    public ICollection<Maquina> Maquinas { get; set; }
}

class Equipamento
{
    public string? Nome { get; set; }
    public DateTime DataFabricacao { get; set; }

    public Equipamento(string nome, DateTime dataFabricacao)
    {
        Nome = nome;
        DataFabricacao = dataFabricacao;
    }

}

class Maquina : Equipamento
{
    public string? Modelo { get; set; }
    public string? HoraOperacao { get; set; }

    private Guid numeroSerie = new Guid();
    public Guid NumeroSerie
    {
        get
        {
            return numeroSerie;
        }
    }
    private string? observacao;

    public string? Observacao
    {
        set
        {
            observacao = value;
        }
    }

    public Maquina(string nome, DateTime dataFabricacao, string modelo, string horaOperacao, string observacao) : base(nome, dataFabricacao)
    {
        Modelo = modelo;
        HoraOperacao = horaOperacao;
        Observacao = observacao;
    }
}

class Operador
{
    public string? Nome { get; set; }

    public Maquina Maquina { get; set; }

    public Operador(string nome, Maquina maquina)
    {
        Nome = nome;
        Maquina = maquina;
    }

    public async Task OperarMaquinaAsync(Fabrica fabrica, string modelo)
    {
        Console.WriteLine($"{Nome} está tentando operar a máquina {modelo}");
        Console.WriteLine("Verificando disponibilidade...");
        await Task.Delay(2000);
        var maquina = fabrica.BuscarMaquinaPorModelo(modelo);

        if (maquina == null)
        {
            //Console.WriteLine("Maquina não encontrada!");
            throw new ModeloInvalido(fabrica.Nome, modelo);

        }
        else
        {
            Console.WriteLine($"{Nome} agora está operando a máquina modelo {maquina.Modelo}");
            await Task.Delay(3000);
            Console.WriteLine("Utilização finalizada");
        }
    }
}


