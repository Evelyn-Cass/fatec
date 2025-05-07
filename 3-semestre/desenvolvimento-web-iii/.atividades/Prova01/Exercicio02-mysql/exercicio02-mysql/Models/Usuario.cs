using System.ComponentModel.DataAnnotations;

namespace exercicio02_mysql.Models
{
    public class Usuario
    {
        [Required]
        public int UsuarioId { get; set; }
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? Email { get; set; }
        [Required]
        public int Ramal { get; set; }
    }
}
