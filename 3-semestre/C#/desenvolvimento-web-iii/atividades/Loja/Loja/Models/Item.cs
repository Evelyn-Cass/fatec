namespace Loja.Models
{
    public class Item
    {
        public int ItemId { get; set; }
        public int Quantidade { get; set; }
        public int ProdutoId { get; set; }
        public int CompraId { get; set; }
    }
}
