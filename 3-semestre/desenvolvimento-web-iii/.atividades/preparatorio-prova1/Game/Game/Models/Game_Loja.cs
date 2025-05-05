using System.ComponentModel.DataAnnotations;

namespace LojaGames.Models
{
    public class Game_Loja
    {
        public Guid Id { get; set; }
        public string? IdLoja { get; set; }
        public string? IdGame { get; set; }
        public Loja? Loja { get; set; }
        public Game? Game { get; set; }

    }
}
