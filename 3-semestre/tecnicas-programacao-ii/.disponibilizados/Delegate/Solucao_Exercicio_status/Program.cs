Console.WriteLine("Usando evento");
Pedido pedido = new Pedido();
//registrar as classes assinantes
pedido.OnCriarPedido += EnviarEmail.email;
pedido.OnCriarPedido += EnviarSMS.sms;

pedido.OnMudarStatus += EnviarEmail.email;
pedido.OnMudarStatus += EnviarSMS.sms;

pedido.criarPedido("Recebemos o seu Pedido","maria@gmail.com", "(14)999999999");

pedido.mudarStatus("Aguardando Pagamento", "maria@gmail.com", "(14)99999999");

class PedidoEventArgs : EventArgs
{
    public string? Status { get; set; }
    public string? Email { get; set; }
    public string? Telefone { get; set; }
}
class Pedido
{
    public event EventHandler<PedidoEventArgs>? OnCriarPedido;
    public event EventHandler<PedidoEventArgs>? OnMudarStatus;
    public void criarPedido(string status, string email, string telefone)
    {
        Console.WriteLine("iniciando o criar pedido");
        if (OnCriarPedido != null)
        {
            OnCriarPedido(this, new PedidoEventArgs
            {
                Status = status,
                Email = email,
                Telefone = telefone
            }
            );
        }

    }
    public void mudarStatus(string? status, string email, string telefone)
    {
        if (status != null && OnMudarStatus != null)
        {
            Console.WriteLine("Mudando Status");
            OnMudarStatus(this, new PedidoEventArgs
            {
                Status = status,
                Email = email,
                Telefone = telefone
            }
            );
        }
    }
}
class EnviarEmail
{
    public static void email(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"Email enviado para: {e.Email}\nO status do seu pedido é: {e.Status}");
    }
}
class EnviarSMS
{
    public static void sms(Object? sender, PedidoEventArgs e)
    {
        Console.WriteLine($"SMS enviado para : {e.Telefone}\nO status do seu pedido é:{e.Status}");
    }
}


