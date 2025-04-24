//7.Você deve criar um sistema para gerenciar bibliotecas, que envolva livros e empréstimos.
//A ideia é que um usuário possa emprestar e devolver livros, com validação para:
//•	Tentativa de empréstimo de livro não disponível.
//•	Tentativa de devolução de livro que não foi emprestado.
//•	Tentativa de empréstimo de livro por usuário que tem livro emprestado com data ultrapassada.

//1.	Classe Livro
//a.	Título
//b.	Autor
//c.	ID (único para cada livro)
//d.	Status (Disponível / Emprestado)

//2.	Classe Usuario
//a.	Nome
//b.	ID
//c.	Lista de livros emprestados

//3.	Classe Emprestimo (associativa)
//a.	Livro emprestado
//b.	Usuario que fez o empréstimo
//c.	Data do empréstimo
//d.	Data prevista para devolução

//4.	Tratamento de exceções:
//a.ArgumentException para IDs inválidos.
//b.	InvalidOperationException para tentar emprestar ou devolver um livro não disponível ou que não foi emprestado.

Usuario usuario1 = new Usuario(1, "Paulo");
Usuario usuario2 = new Usuario(2, "Henrique");

Livro livro1 = new Livro(1, "O Senhor dos Anéis", "J.R.R. Tolkien");
Livro livro2 = new Livro(2, "Harry Potter", "J.K. Rowling");
Livro livro3 = new Livro(3, "Morro dos Ventos Uivantes", "Emily Brontë");
Livro livro4 = new Livro(4, "Dom Casmurro", "Machado de Assis");
Livro livro5 = new Livro(5, "O Pequeno Príncipe", "Antoine de Saint-Exupéry");

List<Emprestimo> emprestimos = new List<Emprestimo>();

Emprestar(usuario1, livro1, emprestimos);

Emprestar(usuario1, livro2, emprestimos);

Emprestar(usuario2, livro1, emprestimos);

Devolucao(usuario2, livro1, emprestimos);

Devolucao(usuario1, livro1, emprestimos);

Emprestar(usuario2, livro1, emprestimos);

static void Devolucao(Usuario usuario, Livro livro, List<Emprestimo> emprestimos)
{
    try
    {
        if (livro.Status == true)
        {
            throw new InvalidOperationException($"Livro: {livro.Titulo} não foi emprestado");
        }
        else
        {

            foreach (var emprestimo in emprestimos)
            {
                if (emprestimo.Livro.ID == livro.ID && emprestimo.Usuario.ID == usuario.ID)
                {
                    livro.Status = true;
                    emprestimos.Remove(emprestimo);
                    usuario.LivrosEmprestados.Remove(livro);
                    Console.WriteLine($"Livro {livro.Titulo} devolvido por {usuario.Nome}");
                    break;
                }
                else
                {
                    throw new InvalidOperationException($"Livro: {livro.Titulo} não foi emprestado por esse usuário");
                }
            }

        }
    }
    catch (InvalidOperationException e)
    {
        Console.WriteLine(e.Message);
    }
}

static void Emprestar(Usuario usuario, Livro livro, List<Emprestimo> emprestimos)
{
    try
    {
        if (usuario.LivrosEmprestados.Count > 0)
        {
            foreach (var item in usuario.LivrosEmprestados)
            {
                if (item.Status == false)
                {
                    throw new InvalidOperationException($"{usuario.Nome} já possui um livro emprestado");
                }
            }
        }
        if (livro.Status == false)
        {
            throw new InvalidOperationException($"Livro: {livro.Titulo} não disponível");
        }
        else
        {
            livro.Status = false;
            Emprestimo emprestimo = new Emprestimo(livro, usuario, DateTime.Now, DateTime.Now.AddDays(7));
            usuario.LivrosEmprestados.Add(livro);
            emprestimos.Add(emprestimo);
            Console.WriteLine($"Livro {livro.Titulo} emprestado para {usuario.Nome}");
        }
    }
    catch (InvalidOperationException e)
    {
        Console.WriteLine(e.Message);
    }
}

class Livro
{
    public int ID { get; set; }
    public string Titulo { get; set; }
    public string Autor { get; set; }
    public bool Status { get; set; }

    public Livro(int ID, string Titulo, string Autor)
    {
        this.ID = ID;
        this.Titulo = Titulo;
        this.Autor = Autor;
        this.Status = true;
    }

}

class Usuario
{
    public int ID { get; set; }
    public string Nome { get; set; }
    public List<Livro> LivrosEmprestados { get; set; }
    public Usuario(int ID, string Nome)
    {
        this.ID = ID;
        this.Nome = Nome;
        this.LivrosEmprestados = new List<Livro>();
    }
}

class Emprestimo
{
    public Livro Livro { get; set; }
    public Usuario Usuario { get; set; }
    public DateTime DataEmprestimo { get; set; }
    public DateTime DataDevolucao { get; set; }
    public Emprestimo(Livro livroEmprestado, Usuario usuarioEmprestimo, DateTime dataEmprestimo, DateTime dataDevolucao)
    {
        Livro = livroEmprestado;
        Usuario = usuarioEmprestimo;
        DataEmprestimo = dataEmprestimo;
        DataDevolucao = dataDevolucao;
    }
}

