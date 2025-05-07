using System.ComponentModel.DataAnnotations;

namespace exercicio02_mysql.Models
{
    public class Chamado
    {
        [Required]
        public int ChamadoId { get; set; }
        [Required]
        public string? Titulo { get; set; }
        [Required]
        public string? Descricao { get; set; }
        [Required]
        public DateOnly DataAbertura { get; set; }
        [Required]
        public string? Situacao { get; set; }
        [Required]
        public int UsuarioId { get; set; }
        public Usuario? Usuario { get; set; }

    }
}
