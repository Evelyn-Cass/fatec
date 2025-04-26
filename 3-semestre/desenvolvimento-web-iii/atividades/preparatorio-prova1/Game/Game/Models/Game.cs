using System.ComponentModel.DataAnnotations;

namespace LojaGames.Models
{
    public class Game
    {
        public Guid Id { get; set; }
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? IdConsole { get; set; }
        public GameConsole? GameConsole { get; set; }
        public List<Game_Loja>? Games_Lojas { get; set; }
    }
}
