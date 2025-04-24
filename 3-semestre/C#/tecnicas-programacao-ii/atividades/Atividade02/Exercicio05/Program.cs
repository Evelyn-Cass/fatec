//5.Crie um sistema para uma escola de idiomas que gerencie professores,
//alunos e os cursos que os alunos podem se matricular. O sistema deve incluir:

//1.Uma classe Aluno, que contém:
//a.Nome
//b.Idade

//2.Uma classe Professor, que contém:
//a.Nome
//b.Especialização

//3.Uma classe Curso, que contém:
//a.Nome do curso
//b.Duração(em meses)
//c.Professor responsável

//4.	Uma classe associativa Matricula, que vincula os alunos aos cursos. Essa classe deve conter:
//a.Aluno
//b.Curso
//c.Data de matrícula

//6. O programa deve instanciar alguns alunos, professores e cursos
//e demonstrar a criação de matrículas.

Professor professor = new Professor("Rosana", "Lingua Portuguesa");
Aluno aluno1 = new Aluno("João", 20);
Aluno aluno2 = new Aluno("Maria", 19);
Curso curso = new Curso("Português", 6, professor);
Matricula matricula1 = new Matricula(aluno1, curso, DateTime.Parse("24/03/2025"));
Matricula matricula2 = new Matricula(aluno2, curso, DateTime.Parse("26/03/2025"));

matricula1.Exibir();
Console.WriteLine();
matricula2.Exibir();


Console.ReadLine();

class Aluno
{
    public string Nome { get; set; }
    public int Idade { get; set; }
    public Aluno(string nome, int idade)
    {
        Nome = nome;
        Idade = idade;
    }
}

class Professor
{
    public string Nome { get; set; }
    public string Especializacao { get; set; }
    public Professor(string nome, string especializacao)
    {
        Nome = nome;
        Especializacao = especializacao;
    }
}
class Matricula
{
    public Aluno Aluno { get; set; }
    public Curso Curso { get; set; }
    public DateTime DataMatricula { get; set; }
    public Matricula(Aluno aluno, Curso curso, DateTime dataMatricula)
    {
        Aluno = aluno;
        Curso = curso;
        DataMatricula = dataMatricula;
    }
    
    public void Exibir()
    {
        Console.WriteLine("Matricula:");
        Console.WriteLine("Aluno: " + Aluno.Nome);
        Console.WriteLine("Professor Responsavel: " + Curso.ProfessorResponsavel.Nome);
        Console.WriteLine("Curso: " + Curso.Nome);
        Console.WriteLine("Data de Matricula: " + DataMatricula);
    }
    
}
class Curso
{
    public string Nome { get; set; }
    public int Duracao { get; set; }
    public Professor ProfessorResponsavel { get; set; }
    public Curso(string nome, int duracao, Professor professorResponsavel)
    {
        Nome = nome;
        Duracao = duracao;
        ProfessorResponsavel = professorResponsavel;
    }
}
