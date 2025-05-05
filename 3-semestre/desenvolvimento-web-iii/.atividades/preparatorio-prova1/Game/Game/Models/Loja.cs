using System.ComponentModel.DataAnnotations;

namespace LojaGames.Models
{
    public class Loja
    {    
        public Guid Id { get; set; }
        [Required]
        public string? Nome { get; set; }
        public List<Game_Loja>? Games_Lojas { get; set; }
    }
}
