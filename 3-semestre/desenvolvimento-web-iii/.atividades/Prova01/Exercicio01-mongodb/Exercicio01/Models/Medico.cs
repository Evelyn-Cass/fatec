using System.ComponentModel.DataAnnotations;

namespace Exercicio01.Models
{
    public class Medico
    {
        [Required] 
        public Guid Id { get; set; }
        [Required]
        public string? Nome { get; set; }
        [Required]
        public string? Especialidade { get; set; }
        [Required]
        public string? CRM { get; set; }
        [Required]
        public string? Telefone{ get; set; }
    }
}
    