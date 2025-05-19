//2.Exercício: Sistema de Alarme de Temperatura
//Descrição:
//Você está criando um sistema de monitoramento de temperatura para um ar condicionado inteligente. O sistema deve disparar um alarme sempre que a temperatura ultrapassar um limite superior ou inferior predefinido. O objetivo é usar eventos para notificar quando o limite for atingido.
//Requisitos:
//1.Crie uma classe chamada ArCondicionado que tenha uma propriedade Temperatura (do tipo double).
//2.	A classe ArCondicionado deve ter dois limites de temperatura: LimiteSuperior e LimiteInferior.
//3.	Crie um evento chamado AlarmeTemperatura que deve ser disparado sempre que a temperatura do ar condicionado ultrapassar qualquer um dos limites (superior ou inferior).
//4.	Crie uma classe chamada Monitor que se inscreve no evento AlarmeTemperatura e imprime uma mensagem de alerta quando o evento for acionado.
//5.	A classe ArCondicionado deve ter um método chamado AjustarTemperatura, que altera a temperatura e verifica se o evento deve ser disparado.
//Objetivo:
//•	Demonstrar o uso de eventos e delegates em C# para monitorar mudanças de temperatura e notificar componentes do sistema.


ArCondicionado arCondicionado = new ArCondicionado();
//registrar as classes assinantes
arCondicionado.OnAjustarTemperatura += Monitor.AlarmeTemperatura;

arCondicionado.AjustarTemperatura(30);


class LimiteUltrapassado : EventArgs
{
    public double? Temperatura { get; set; }
    public double? LimiteSuperior { get; set; }
    public double? LimiteInferior { get; set; }
}

class ArCondicionado
{
    public event EventHandler<LimiteUltrapassado>? OnAjustarTemperatura;
    public double Temperatura { get; set; }
    public double LimiteSuperior = 26;
    public double LimiteInferior = 20;

    public void AjustarTemperatura(double valor)
    {
        Temperatura += valor;
        Console.WriteLine($"Nova Temperatura: {Temperatura}");
        if (Temperatura > LimiteSuperior || Temperatura < LimiteInferior)
        {
            if (OnAjustarTemperatura != null)
            {
                OnAjustarTemperatura(this, new LimiteUltrapassado
                {
                    Temperatura = this.Temperatura,
                    LimiteSuperior = this.LimiteSuperior,
                    LimiteInferior = this.LimiteInferior
                }
                );
            }
        }
    }
}

class Monitor
{
    public static void AlarmeTemperatura(Object? sender, LimiteUltrapassado e)
    {
        Console.WriteLine($"A temperatura ultrapassou o limite desejado!\nTemperatura atual: {e.Temperatura}\nLimite Superior: {e.LimiteSuperior}\nLimite Inferior: {e.LimiteInferior}");
    }
}