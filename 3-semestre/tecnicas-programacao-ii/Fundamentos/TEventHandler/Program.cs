

Console.WriteLine("Usando Evento!");

Pedido pedido = new Pedido();

// Registrar as classes assinantes 
pedido.OnCriarPedido += EnviarEmail.Email;
pedido.OnCriarPedido += EnviarSMS.SMS;

pedido.CriarPedido("Ana.Laura@email.com", "(14) 15155-7158");

Console.WriteLine("Fim do Pedido!");

Console.ReadKey();

class PedidoEventArgs : EventArgs
{
    public string? Email { get; set; }
    public string? Telefone { get; set; }


}

class Pedido
{
    public EventHandler<PedidoEventArgs>? OnCriarPedido;
    public void CriarPedido(string email, string telefone)
    {
        Console.WriteLine("Criando o Pedido!");
        if (OnCriarPedido != null)
        {
            OnCriarPedido(this, new PedidoEventArgs
            {
                Email = email,
                Telefone = telefone
            });
        }
    }
}
class EnviarEmail()
{
    public static void Email(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"Email enviado para {e.Email}");
    }
}

class EnviarSMS()
{
    public static void SMS(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"SMS enviado para {e.Telefone}");
    }
}