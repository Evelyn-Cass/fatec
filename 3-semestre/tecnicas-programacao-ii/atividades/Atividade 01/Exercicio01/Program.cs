//1.Faça conforme definido abaixo:

//a.Criar uma classe base chamada Veiculo contendo:
//o Um atributo somente leitura chamado Marca (não pode ser alterado após a criação).
//o Um atributo somente gravação chamado Placa (só pode ser definido, mas não pode ser lido diretamente).
//o Um método ExibirInformacoes() que exibe a marca do veículo.

//b. Criar duas classes derivadas:
//o Carro: Adiciona um atributo para o número de portas.
//o Moto: Adiciona um atributo indicando se possui partida elétrica.
//c. Criar um programa para testar as classes, instanciando objetos e definindo valores.


Veiculo veiculo = new Veiculo("Fiat", "ABC1234");
veiculo.ExibirInformacoes();
veiculo.Placa = "DEF5678";
veiculo.ExibirInformacoes();
Console.WriteLine();


Carro carro = new Carro("Ford", "ACS2587", 4);
carro.ExibirInformacoes();
Console.WriteLine(carro.NumeroPortas);
carro.NumeroPortas = 2;
Console.WriteLine(carro.NumeroPortas);
Console.WriteLine();

Moto moto = new Moto("Honda", "QWE1234", true);
moto.ExibirInformacoes();
Console.WriteLine(moto.PartidaEletrica);
moto.PartidaEletrica = false;
Console.WriteLine(moto.PartidaEletrica);
Console.WriteLine();



public class Veiculo
{
    public Veiculo(string marca, string placa)
    {
        this.marca = marca;
        this.placa = placa;
    }

    private string? placa;
    public string? Placa
    {
        set
        {
            this.placa = value;
        }
    }

    private string? marca;
    public string? Marca
    {
        get
        {
            return this.marca;
        }
    }

    public void ExibirInformacoes()
    {
        Console.WriteLine("Marca: " + this.marca);
    }

}

//b. Criar duas classes derivadas:
//o Carro: Adiciona um atributo para o número de portas.
//o Moto: Adiciona um atributo indicando se possui partida elétrica.
//c. Criar um programa para testar as classes, instanciando objetos e definindo valores.

public class Carro : Veiculo
{
    public Carro(string marca, string placa, int numeroPortas) : base(marca, placa)
    {
        this.numeroPortas = numeroPortas;
    }
    private int numeroPortas;
    public int NumeroPortas
    {
        set
        {
            this.numeroPortas = value;
        }
        get
        {
            return this.numeroPortas;
        }
    }

}

public class Moto : Veiculo
{
    public Moto(string marca, string placa, bool partidaEletrica) : base(marca, placa)
    {
        this.partidaEletrica = partidaEletrica;
    }
    private bool partidaEletrica;
    public bool PartidaEletrica
    {
        set
        {
            this.partidaEletrica = value;
        }
        get
        {
            return this.partidaEletrica;
        }
    }
}