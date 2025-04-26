Conta conta = new Conta();
conta.Agencia = "102-5";
conta.NumeroConta = "1234567-89";
conta.Depositar(5000);
conta.Mostrar();
conta.Sacar(100000);

public class SaldoInsuficienteException : Exception
{
    public SaldoInsuficienteException()
    {

    }

    public SaldoInsuficienteException(string Message) : base(Message) { }

    public SaldoInsuficienteException(string Message, Exception inner) : base(Message, inner) { }

    public SaldoInsuficienteException(double valor, double saldo) : base($"Exception: O valor do saque[{valor}], é maior que o saldo[{saldo}]") { }
}
public class Conta()
{
    public string? Agencia { get; set; }
    public string? NumeroConta { get; set; }
    public double Saldo { get; set; }
    public void Sacar(double valor)
    {
        if (Saldo < valor)
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
        Console.WriteLine($"Agencia: {Agencia}");
        Console.WriteLine($"Conta: {NumeroConta}");
        Console.WriteLine($"Saldo: {Saldo}");
    }

}
