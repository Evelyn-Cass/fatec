using System.ComponentModel.DataAnnotations;

namespace MongoDB.Models
{
    public class User
    {
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? Celular { get; set; }
        [Required]
        [EmailAddress(ErrorMessage = "Email inválido")]
        public string? Email { get; set; }
        [Required]
        public string? Password { get; set; }
    }
}
