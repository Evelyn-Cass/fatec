using System.ComponentModel.DataAnnotations;

namespace Exercicio01.Models
{
    public class Agendamento
    {
        [Required]
        public Guid Id { get; set; }
        [Required]
        [Display(Name = "Nome do Paciente")]
        public string? NomePaciente { get; set; }
        [Required]
        [Display(Name = "Celular do Paciente")]
        public string? CelularPaciente { get; set; }
        [Required]
        public string? Status { get; set; }
        [Required]
        public string? IdMedico { get; set; }
    }
}
