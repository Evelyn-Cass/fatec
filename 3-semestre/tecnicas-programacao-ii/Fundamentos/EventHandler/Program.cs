//Delegates Pré-Definidos para Eventos
// - EventHandler: Método que vai manipular evento que não possui dados,
//         public delegate void EventHandler(Object? sender, EventArgs e);
//           onde:
//              Object? sender -> contém uma referência ao objeto que gerou o evento,
//              EventArgs -> Objeto que não contém nenhum dado de um evento
//
//         EventHandler <TeventArgs> -> Método que vai manipular o evento que possui dados
//         
//         Public delegate void EventHandler<TEventArgs>(Objetct? sender, TEventArgs e);    


Console.WriteLine("Usando Evento!");

Pedido pedido = new Pedido();

// Registrar as classes assinantes 
pedido.OnCriarPedido += EnviarEmail.Email;
pedido.OnCriarPedido += EnviarSMS.SMS;

pedido.CriarPedido();

Console.WriteLine("Fim do Pedido!");

Console.ReadKey();



class Pedido
{
    public EventHandler? OnCriarPedido;
    public void CriarPedido()
    {
        Console.WriteLine("Criando o Pedido!");
        if (OnCriarPedido != null)
        {
            OnCriarPedido(this, EventArgs.Empty);
        }
    }
}
class EnviarEmail()
{
    public static void Email(Object? sender, EventArgs e)
    {
        Console.WriteLine("Email enviado!");
    }
}

class EnviarSMS()
{
    public static void SMS(Object? sender, EventArgs e)
    {
        Console.WriteLine("SMS enviado!");
    }
}
