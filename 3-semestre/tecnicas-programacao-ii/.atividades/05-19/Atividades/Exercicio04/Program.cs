
//4.Exercício: Sistema de Contagem de Cliques

//Crie uma classe Estoque que representa um produto com quantidade. Quando a quantidade cair abaixo de um limite mínimo (ex: 5 unidades), dispare um evento EstoqueBaixo, enviando como parâmetro o nome do produto e a quantidade atual. A classe que assinar o evento deve exibir um alerta.
//•	Observação:
//•	Utilizar Delegate pré-definido.

Estoque estoque = new Estoque("Lapiseira", 6);
//registrar as classes assinantes
estoque.OnVender += Alerta.Alertar;

estoque.Vender(3);

class EstoqueBaixo : EventArgs
{
    public string? Produto { get; set; }
    public int Quantidade { get; set; }
}
class Estoque
{
    public string? Produto { get; set; }
    public int Quantidade { get; set; }
    public event EventHandler<EstoqueBaixo>? OnVender;

    public Estoque(string produto, int quantidade)
    {
        Produto = produto;
        Quantidade = quantidade;
    }

    public void Vender(int quantidade)
    {
        if (quantidade > Quantidade)
        {
            Console.WriteLine("Quantidade Inválida");
        }
        else
        {
            Console.WriteLine("Venda Realizada!");
            Quantidade -= quantidade;
            if (Quantidade < 5)
            {
                if (OnVender != null)
                {
                    OnVender(this, new EstoqueBaixo
                    {
                        Produto = Produto,
                        Quantidade = Quantidade
                    }
                    );
                }
            }
        }
    }
}
class Alerta
{
    public static void Alertar(Object? sender, EstoqueBaixo e)
    {
        Console.WriteLine($"A quantidade do {e.Produto} está abaixo do límite: {e.Quantidade} unidades");
    }
}
