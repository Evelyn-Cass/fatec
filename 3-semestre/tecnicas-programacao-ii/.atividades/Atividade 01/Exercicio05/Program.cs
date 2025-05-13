//5.Criar uma interface chamada ISalario que tenha um método:

//· double CalcularSalario();

//a.Criar duas classes que implementem a interface:
//· FuncionarioHorista: salário baseado em horas trabalhadas e valor por hora.
//· FuncionarioMensalista: salário fixo mensal.
//b. Criar um programa principal que instancie diferentes tipos de funcionários e exiba seus salários.


ISalario funcionario = new FuncionarioHorista(40, 50);
Console.WriteLine($"Salário do funcionário horista: {funcionario.CalcularSalario()}");

funcionario = new FuncionarioMensalista(5000);
Console.WriteLine($"Salário do funcionário mensalista: {funcionario.CalcularSalario()}");

public interface ISalario
{
    public double CalcularSalario();
}

public class FuncionarioHorista : ISalario
{
    public double HorasTrabalhadas { get; set; }
    public double ValorHora { get; set; }
    public FuncionarioHorista(double horasTrabalhadas, double valorHora)
    {
        HorasTrabalhadas = horasTrabalhadas;
        ValorHora = valorHora;
    }
    public double CalcularSalario()
    {
        return HorasTrabalhadas * ValorHora;
    }
}

public class FuncionarioMensalista : ISalario
{
    public double SalarioFixo { get; set; }
    public FuncionarioMensalista(double salarioFixo)
    {
        SalarioFixo = salarioFixo;
    }
    public double CalcularSalario()
    {
        return SalarioFixo;
    }
}

