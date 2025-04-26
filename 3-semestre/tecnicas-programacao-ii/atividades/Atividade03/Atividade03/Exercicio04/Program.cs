//4.Crie um relacionamento muitos-para-muitos entre Aluno e Disciplina, usando uma classe associativa Matricula.
//Permitir registrar e consultar as disciplinas que um aluno cursa e vice-versa.
//Crie os atributos que achar necessário.

Disciplina disciplina1 = new Disciplina("Matemática", "Prof. Silva");
Disciplina disciplina2 = new Disciplina("Física", "Prof. Santos");
Disciplina disciplina3 = new Disciplina("Química", "Prof. Oliveira");

Aluno aluno1 = new Aluno("Maria", "123456");

Matricula matricula1 = new Matricula(aluno1, disciplina1);
Matricula matricula2 = new Matricula(aluno1, disciplina2);
Matricula matricula3 = new Matricula(aluno1, disciplina3);

disciplina1.ExibirAlunos();
Console.WriteLine("--------------------");
disciplina2.ExibirAlunos();
Console.WriteLine("--------------------");
disciplina3.ExibirAlunos();
Console.WriteLine("--------------------");
aluno1.ExibirDisciplinas();



class Matricula
{
    public Aluno Aluno { get; set; }
    public Disciplina Disciplina { get; set; }
    public Matricula(Aluno aluno, Disciplina disciplina)
    {
        Aluno = aluno;
        Disciplina = disciplina;

        aluno.Matriculas.Add(this);
        disciplina.Matriculas.Add(this);
    }
}

class Aluno
{
    public string Nome { get; set; }
    public string RA { get; set; }

    public List<Matricula> Matriculas { get; set; } = new List<Matricula>();

    public Aluno(string nome, string ra)
    {
        Nome = nome;
        RA = ra;
    }

    public void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, RA: {RA}");
    }

    public void ExibirDisciplinas()
    {
        Console.WriteLine($"Nome: {Nome}, RA: {RA}");
        Console.WriteLine("Disciplinas Matriculadas:");
        foreach (var matricula in Matriculas)
        {
            Console.WriteLine($"Disciplina: {matricula.Disciplina.Descritivo}");
        }
    }
}

class Disciplina
{
    public string Descritivo { get; set; }
    public string Professor { get; set; }

    public List<Matricula> Matriculas { get; set; } = new List<Matricula>();

    public Disciplina(string descritivo, string professor)
    {
        Descritivo = descritivo;
        Professor = professor;

    }

    public void Exibir()
    {
        Console.WriteLine($"Disciplina: {Descritivo}, Professor: {Professor}");
    }

    public void ExibirAlunos()
    {
        Console.WriteLine($"Disciplina: {Descritivo}, Professor: {Professor}");
        Console.WriteLine("Alunos Matriculados:");
        foreach (var matricula in Matriculas)
        {
            Console.WriteLine($"Aluno: {matricula.Aluno.Nome}, RA: {matricula.Aluno.RA}");
        }
    }
}