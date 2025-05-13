//10.Simula uma aplicação que consulta usuários em um banco remoto usando async/await e Task.Delay() para simular tempo de rede. Crie uma classe Usuario contendo nome e id. Outra que simule dados do usuário (repositório).


var repositorio = new UsuarioRepositorio();

Console.WriteLine("Consultando usuário com ID 2...");
Usuario? usuario = await repositorio.ObterUsuarioPorIdAsync(2);

if (usuario != null)
{
    Console.WriteLine($"Usuário encontrado: ID = {usuario.Id}, Nome = {usuario.Nome}");
}
else
{
    Console.WriteLine("Usuário não encontrado.");
}

// Classe Usuario contendo nome e id
public class Usuario
{
    public int Id { get; set; }
    public string Nome { get; set; }

    public Usuario(int id, string nome)
    {
        Id = id;
        Nome = nome;
    }
}

// Classe que simula um repositório de dados de usuários
public class UsuarioRepositorio
{
    private readonly List<Usuario> _usuarios = new()
        {
            new Usuario(1, "Alice"),
            new Usuario(2, "Bob"),
            new Usuario(3, "Carlos")
        };

    // Método assíncrono para simular consulta de usuário por ID
    public async Task<Usuario?> ObterUsuarioPorIdAsync(int id)
    {
        await Task.Delay(2000); // Simula o tempo de rede
        return _usuarios.Find(u => u.Id == id);
    }
}


