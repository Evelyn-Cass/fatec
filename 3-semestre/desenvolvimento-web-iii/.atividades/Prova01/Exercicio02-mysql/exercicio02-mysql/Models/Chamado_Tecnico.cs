using System.ComponentModel.DataAnnotations;

namespace exercicio02_mysql.Models
{
    public class Chamado_Tecnico
    {
        [Required]
        public int Chamado_TecnicoId { get; set; }
        [Required]
        public DateOnly DataAtribuicao { get; set; }
        [Required]
        public string? Situacao { get; set; }
        [Required]
        public int TecnicoId { get; set; }
        public Tecnico? Tecnico { get; set; }
        [Required]
        public int ChamadoId { get; set; }
        public Chamado? Chamado { get; set; }
    }
}
