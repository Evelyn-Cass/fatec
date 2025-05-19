Console.WriteLine("Usando evento");
Pedido pedido = new Pedido();
//registrar as classes assinantes
pedido.OnCriarPedido += EnviarEmail.email;
pedido.OnCriarPedido += EnviarSMS.sms;

pedido.criarPedido();

Console.WriteLine("Fim do Pedido");


Console.ReadKey();
delegate void PedidoEvent();
class Pedido
{
    public event PedidoEvent? OnCriarPedido;
    public void criarPedido()
    {
        Console.WriteLine("iniciando o criar pedido");
        if (OnCriarPedido != null)
        {
            OnCriarPedido();
        }

    }
}
    class EnviarEmail
    {
        public static void email()
        {
            Console.WriteLine("Email enviado");
        }
    }
    class EnviarSMS
    {
        public static void sms()
        {
            Console.WriteLine("SMS enviado");
        }
    }


    

