using System.ComponentModel.DataAnnotations;

namespace AvaliaCarro.Models
{
    public class Carro
    {
        public Guid id { get; set; }
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? Marca { get; set; }
    }
}
