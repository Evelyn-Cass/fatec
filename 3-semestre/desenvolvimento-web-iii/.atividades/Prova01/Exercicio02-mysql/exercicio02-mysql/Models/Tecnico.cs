using System.ComponentModel.DataAnnotations;

namespace exercicio02_mysql.Models
{
    public class Tecnico
    {
        [Required]
        public int TecnicoId { get; set; }
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? Especialidade { get; set; }
    }
}
