//Eventos
//Mecanismo que permite que uma classe ou um objeto notifique as outras classes quando uma ação ocorre
//Classe que envia( ou aciona ) é chamada Publisher ou Publicador.
//Classe que recebe ( ou manipula) eventos são Subscribers ou Assinantes
//Podem ter vários assinantes de um único evento;
//Um publicador, quase sempre fera um evento quando alguma ação ocorre
//As classes assinantes devem se registrar em evento e tratá-lo..

Console.WriteLine("Usando Evento!");

Pedido pedido = new Pedido();

// Registrar as classes assinantes 
pedido.OnCriarPedido += EnviarEmail.Email;
pedido.OnCriarPedido += EnviarSMS.SMS;

pedido.CriarPedido();

Console.WriteLine("Fim do Pedido!");

Console.ReadKey();

delegate void PedidoEvent();


class Pedido
{
    public event PedidoEvent? OnCriarPedido;
    public void CriarPedido()
    {
        Console.WriteLine("Criando o Pedido!");
        if (OnCriarPedido != null)
        {
            OnCriarPedido();
        }
    }
}
class EnviarEmail()
{
    public static void Email()
    {
        Console.WriteLine("Email enviado!");
    }
}

class EnviarSMS()
{
    public static void SMS()
    {
        Console.WriteLine("SMS enviado!");
    }
}
