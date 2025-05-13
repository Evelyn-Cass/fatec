Console.WriteLine("Usando Evento!");

Pedido pedido = new Pedido();

// Registrar as classes assinantes 
pedido.OnCriarPedido += EnviarEmail.Email;
pedido.OnCriarPedido += EnviarSMS.SMS;

pedido.CriarPedido("Ana.Laura@email.com", "(14) 15155-7158");
pedido.FinalizarPedido();
pedido.EntregarPedido();

Console.WriteLine("Fim do Pedido!");

Console.ReadKey();

class PedidoEventArgs : EventArgs
{
    public string? Email { get; set; }
    public string? Telefone { get; set; }
    public string? Status { get; set; }
}

class Pedido
{
    private string? Status { get; set; }
    private string? Email { get; set; }
    private string? Telefone { get; set; }
    public EventHandler<PedidoEventArgs>? OnCriarPedido;
    public void CriarPedido(string email, string telefone)
    {
        Console.WriteLine("Criando o Pedido!");
        Email = email;
        Telefone = telefone;
        this.MudarStatus("Preparando");
    }

    private void MudarStatus(string status)
    {
        this.Status = status;
        if (OnCriarPedido != null)
        {
            OnCriarPedido(this, new PedidoEventArgs
            {
                Email = this.Email,
                Telefone = this.Telefone,
                Status = this.Status
            });
        }
    }

    public void FinalizarPedido()
    {
        Console.WriteLine("Seu pedido está sendo Finalizado!");
        this.MudarStatus("Finalizando");
    }
    public void EntregarPedido()
    {
        Console.WriteLine("Seu pedido saiu para Entrega");
        this.MudarStatus("Saiu para Entrega!");
    }
}
class EnviarEmail()
{
    public static void Email(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"[Status do Pedido: {e.Status}] [Enviado para o email: {e.Email}]");
    }
}

class EnviarSMS()
{
    public static void SMS(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"[Status do Pedido: {e.Status}] [Enviado para o telefone: {e.Telefone}]");
    }
}