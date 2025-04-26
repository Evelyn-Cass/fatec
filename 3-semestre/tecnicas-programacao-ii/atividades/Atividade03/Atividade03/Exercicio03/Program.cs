//3.Modele um Pedido que depende de uma lista de ItemPedido para existir.
//Mostrar que ItemPedido só existe dentro de um Pedido.
//Crie os atributos que achar necessário.

Pedido pedido = new Pedido("12345", DateTime.Now, "João", "Produto A", 10.0, 2);
pedido.AdicionarItem("Produto B", 20.0, 1);

pedido.Exibir();



class ItemPedido
{
    public string descritivo { get; set; }
    public double valor { get; set; }
    public int quantidade { get; set; }

    public ItemPedido(string descritivo, double valor, int quantidade)
    {
        this.descritivo = descritivo;
        this.valor = valor;
        this.quantidade = quantidade;
    }

    public void Exibir()
    {
        Console.WriteLine($"Item: {descritivo},\nValor Unitário: {valor:C},\nQuantidade: {quantidade},\nValor Final: {valor * quantidade:C}");
    }
}

class Pedido {
    public string NumeroNotaFiscal { get; set; }
    public DateTime Data { get; set; }
    public string Cliente { get; set; }
    public List<ItemPedido> Itens { get; set; } = new List<ItemPedido>();

    public Pedido(string numeroNotaFiscal, DateTime data, string cliente, string descritivo, double valor, int quantidade)
    {
        NumeroNotaFiscal = numeroNotaFiscal;
        Data = data;
        Cliente = cliente;
        Itens.Add(new ItemPedido(descritivo, valor, quantidade));
    }

    public void AdicionarItem(string descritivo, double valor, int quantidade)
    {
        Itens.Add(new ItemPedido(descritivo, valor, quantidade));
    }

    public void Exibir()
    {
        Console.WriteLine($"Número da Nota Fiscal: {NumeroNotaFiscal},\nData: {Data},\nCliente: {Cliente}");
        Console.WriteLine("Itens do Pedido:");
        foreach (var item in Itens)
        {
            item.Exibir();
            Console.WriteLine("--------------------");
        }
    }

}
