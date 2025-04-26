//5.Implemente um pequeno sistema de biblioteca com as seguintes classes:
//•	Pessoa(base)
//•	Leitor(derivada de Pessoa)
//•	Livro
//•	Emprestimo (classe associativa entre Leitor e Livro)

Leitor leitor = new Leitor("João", "12345678900", "L123");
Livro livro = new Livro("O Senhor dos Anéis", "J.R.R. Tolkien", 1954);
Emprestimo emprestimo = new Emprestimo(leitor, livro, DateTime.Now, DateTime.Now.AddDays(14));

emprestimo.Exibir();


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
class Leitor : Pessoa
{
    public string Matricula { get; set; }
    public Leitor(string nome, string cpf, string matricula) : base(nome, cpf)
    {
        Matricula = matricula;
    }
    public void Exibir()
    {
        Console.WriteLine($"Nome: {Nome}, CPF: {CPF}, Matrícula: {Matricula}");
    }
}

class Livro
{
    public string Titulo { get; set; }
    public string Autor { get; set; }
    public int AnoPublicacao { get; set; }
    public Livro(string titulo, string autor, int anoPublicacao)
    {
        Titulo = titulo;
        Autor = autor;
        AnoPublicacao = anoPublicacao;
    }
    public void Exibir()
    {
        Console.WriteLine($"Título: {Titulo}, Autor: {Autor}, Ano de Publicação: {AnoPublicacao}");
    }
}

class Emprestimo
{
    public Leitor Leitor { get; set; }
    public Livro Livro { get; set; }
    public DateTime DataEmprestimo { get; set; }
    public DateTime DataDevolucao { get; set; }
    public Emprestimo(Leitor leitor, Livro livro, DateTime dataEmprestimo, DateTime dataDevolucao)
    {
        Leitor = leitor;
        Livro = livro;
        DataEmprestimo = dataEmprestimo;
        DataDevolucao = dataDevolucao;
    }
    public void Exibir()
    {
        Console.WriteLine($"Leitor: {Leitor.Nome}, Livro: {Livro.Titulo}, Data de Empréstimo: {DataEmprestimo.ToShortDateString()}, Data de Devolução: {DataDevolucao.ToShortDateString()}");
        Leitor.Exibir();
        Livro.Exibir();
    }
}