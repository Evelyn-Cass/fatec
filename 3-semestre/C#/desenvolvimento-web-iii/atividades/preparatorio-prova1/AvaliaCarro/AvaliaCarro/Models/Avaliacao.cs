using System.ComponentModel.DataAnnotations;

namespace AvaliaCarro.Models
{
    public class Avaliacao
    {
        public Guid id { get; set; }
        [Required]
        public string? Data { get; set; }
        [Required]
        public int Nota { get; set; }
        [Required]
        public string? IdCarro { get; set; }
    }
}
