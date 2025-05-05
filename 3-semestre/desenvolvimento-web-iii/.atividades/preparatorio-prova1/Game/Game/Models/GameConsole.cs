using System.ComponentModel.DataAnnotations;

namespace LojaGames.Models
{
    public class GameConsole
    {
        public Guid Id { get; set; }
        [Required]
        public string? Descritivo { get; set; }

        public List<Game>? Games { get; set; }
    }
}
