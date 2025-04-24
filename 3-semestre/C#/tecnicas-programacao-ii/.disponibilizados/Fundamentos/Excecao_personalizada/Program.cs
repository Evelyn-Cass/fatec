Conta conta = new Conta();
conta.Agencia = "456-7";
conta.NumeroConta = "12345-6";
conta.Depositar(5000);
conta.Mostrar();
conta.Sacar(100000);
Console.ReadKey();
public class SaldoInsuficienteException:Exception
{
    public SaldoInsuficienteException(){}
    public SaldoInsuficienteException(string Message) : base(Message) { }

    public SaldoInsuficienteException(string Message, Exception inner) : base(Message, inner) { }
    
    public SaldoInsuficienteException(double valor, double saldo):base($"Exception: O valor do saque{valor} é maior do que o saldo{saldo}") { }
    
    }

public class Conta
{
    public string?   Agencia { get; set; }
    public string? NumeroConta { get; set; }
    public double Saldo { get; set; }

    public void Sacar(double valor)
    {
        if(Saldo < valor)
        {
            throw new SaldoInsuficienteException(valor, Saldo);
        }
        else
        {
            Saldo -= valor;
        }
     }
    public void Depositar(double valor)
    {
        Saldo += valor;
    }

    public void Mostrar()
    {
        Console.WriteLine($"Agencia:{Agencia}\nConta:{NumeroConta}\nSaldo:{Saldo}");
    }
}
