//2.Modele uma relação entre Aluno e Curso onde um aluno pode estar associado a um curso.
//Associar um aluno a um curso, sem que o curso precise conhecer os alunos.
//Crie uma instância do objeto aluno e mostre todos os dados de aluno e cursos associados.
//Crie os atributos que achar necessário

Curso curso1 = new Curso("Programação Orientada a Objetos", "Prof. Carlos");
Curso curso2 = new Curso("Banco de Dados", "Prof. Ana");

Aluno aluno = new Aluno("João", "123456", curso1);
aluno.Cursos.Add(curso2);

aluno.Exibir();


class Aluno
{
    public string Nome { get; set; }
    public string RA { get; set; }

    public List<Curso> Cursos { get; set; } = new List<Curso>();

    public Aluno(string nome, string ra, Curso curso)
    {
        Nome = nome;
        RA = ra;
        Cursos.Add(curso);
    }

    public void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, RA: {RA}");
        Console.WriteLine("Cursos:");
        foreach (var curso in Cursos)
        {
            curso.Exibir();
        }
    }

}

class Curso
{
    public string Descritivo { get; set; }
    public string Professor { get; set; }

    public Curso(string descritivo, string professor)
    {
        Descritivo = descritivo;
        Professor = professor;
    }

    public void Exibir()
    {
        Console.WriteLine($"Curso: {Descritivo}, Professor: {Professor}");
    }
}