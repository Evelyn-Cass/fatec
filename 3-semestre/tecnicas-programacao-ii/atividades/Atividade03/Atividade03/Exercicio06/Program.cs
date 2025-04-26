//6.Simula uma escola com professores e alunos, onde cada professor tem um array fixo de 3 alunos.
//Criar instâncias e preencher o array manualmente.
//Trabalhar com herança e array fixo.
//Crie os atributos que achar necessários.

Professor professor = new Professor("Maria", "98765432100", "Matemática");
Aluno aluno1 = new Aluno("Carlos", "11122233344", "A001");
Aluno aluno2 = new Aluno("Ana", "55566677788", "A002");
Aluno aluno3 = new Aluno("Pedro", "99988877766", "A003");
professor.AdicionarAluno(aluno1, 0);
professor.AdicionarAluno(aluno2, 1);
professor.AdicionarAluno(aluno3, 2);
professor.ExibirAlunos();

class Pessoa
{
    public string Nome { get; set; }
    public string CPF { get; set; }
    public Pessoa(string nome, string cpf)
    {
        Nome = nome;
        CPF = cpf;
    }
}

class Aluno : Pessoa
{
    public string Matricula { get; set; }
    public Aluno(string nome, string cpf, string matricula) : base(nome, cpf)
    {
        Matricula = matricula;
    }
    public void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, CPF: {CPF}, Matrícula: {Matricula}");
    }
}

class Professor : Pessoa
{
    public Aluno[] Alunos { get; set; }
    public string Disciplina { get; set; }
    public Professor(string nome, string cpf, string disciplina) : base(nome, cpf)
    {
        Alunos = new Aluno[3];
        Disciplina = disciplina;
    }
    public void AdicionarAluno(Aluno aluno, int index)
    {
        if (index >= 0 && index < 3)
        {
            Alunos[index] = aluno;
        }
        else
        {
            Console.WriteLine("Índice inválido.");
        }
    }
    public void ExibirAlunos()
    {
        Console.WriteLine($"Professor: {Nome}, CPF: {CPF}, Disciplinas: {Disciplina}");
        foreach (var aluno in Alunos)
        {
            if (aluno != null)
            {
                aluno.Exibir();
            }
        }
    }
}