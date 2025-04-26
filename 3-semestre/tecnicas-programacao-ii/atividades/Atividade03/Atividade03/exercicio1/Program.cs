//1.Crie uma hierarquia de classes para representar diferentes tipos de funcionários. Criar instâncias de Funcionario e Gerente, sobrescrever métodos exibir. Crie os atributos que achar necessário.

Funcionario funcionario = new Funcionario("Joana", 2500, "RH");
funcionario.Exibir();

Gerente gerente = new Gerente("Henrique", 5000, "TI", "Gerente de Projetos");
gerente.Exibir();


class Funcionario
{
    public string Nome { get; set; }
    public double Salario { get; set; }
    public string Departamento { get; set; }
    public Funcionario(string nome, double salario, string departamento)
    {
        Nome = nome;
        Salario = salario;
        Departamento = departamento;
    }
    public virtual void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, Salário: {Salario}, Departamento: {Departamento}");
    }
}

class Gerente : Funcionario
{
    public string Cargo { get; set; }
    public Gerente(string nome, double salario, string departamento, string cargo) : base(nome, salario, departamento)
    {
        Cargo = cargo;
    }
    public override void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, Salário: {Salario}, Departamento: {Departamento}, Cargo: {Cargo}");
    }
}

