//Você deve criar um sistema para um hospital, onde existam pacientes,
//médicos e consultas. O sistema deve conter:

//1.Uma classe base Pessoa contendo:
//a.Nome
//b.Idade

//2.Duas classes derivadas de Pessoa:
//a.Medico, com especialidade e CRM.
//b.	Paciente, com um histórico de doenças.

//3.	Uma classe Consulta (classe associativa), que liga médicos e pacientes.
//a.	Médico responsável.
//b.	Paciente atendido.
//c.	Data da consulta.
//d.	Diagnóstico.

//O programa deve criar objetos para representar médicos, pacientes e consultas,
//exibindo os detalhes no final.

Medico Medico1 = new Medico("Renan Hanamoto",48, "Clínico Geral", "123567-89");
Medico Medico2 = new Medico("Aline Peixoto",36, "Dermatologista", "1234567-98");
Paciente Paciente1 = new Paciente("Henrique Veronez", 32, "Alergias Crônicas");
Paciente Paciente2 = new Paciente("Cida Louveira", 27, "Não possui histórico de doenças.");

Consulta Consulta1 = new Consulta(Medico1,Paciente2,DateTime.Now,"Virose");
Consulta Consulta2 = new Consulta(Medico2, Paciente1, DateTime.Now, "Dermatite");

Consulta1.Exibir();
Console.WriteLine();
Consulta2.Exibir();


class Pessoa
{
    public string Nome { get; set; }
    public int Idade { get; set; }

    public Pessoa(string nome, int idade)
    {
        Nome = nome;
        Idade = idade;
    }
}

class Medico : Pessoa
{
    public string Especialidade { get; set; }
    public string CRM { get; set; }
    public Medico(string nome, int idade, string especialidade, string crm) : base(nome, idade)
    {
        Especialidade = especialidade;
        CRM = crm;
    }
}

class Paciente : Pessoa
{
    public string HistoricoDoencas { get; set; }
    public Paciente(string nome, int idade, string historicoDoencas) : base(nome, idade)
    {
        HistoricoDoencas = historicoDoencas;
    }
}

class Consulta
{
    public Medico MedicoResponsavel { get; set; }
    public Paciente PacienteAtendido { get; set; }
    public DateTime DataConsulta { get; set; }
    public string Diagnostico { get; set; }

    public Consulta(Medico medicoResponsavel, Paciente pacienteAtendido, DateTime dataConsulta, string diagnostico)
    {
        MedicoResponsavel = medicoResponsavel;
        PacienteAtendido = pacienteAtendido;
        DataConsulta = dataConsulta;
        Diagnostico = diagnostico;
    }

    public void Exibir()
    {
        Console.WriteLine("Dados da Consulta:");
        Console.WriteLine($"Data: {DataConsulta}");
        Console.WriteLine($"Paciente: {PacienteAtendido.Nome} - {PacienteAtendido.Idade} anos");
        Console.WriteLine($"Histórico de Doenças: {PacienteAtendido.HistoricoDoencas}");
        Console.WriteLine($"Médico: {MedicoResponsavel.Nome} {MedicoResponsavel.CRM}");
        Console.WriteLine($"Especialidade: {MedicoResponsavel.Especialidade}");
        Console.WriteLine($"Diagnóstico: {Diagnostico}");
    }
}
