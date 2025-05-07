using System.ComponentModel.DataAnnotations;

namespace exercicio02_mysql.Models
{
    public class Endereco
    {
        [Required]
        public int EnderecoId { get; set; }
        [Required]
        public string? Logradouro { get; set; }
        [Required]
        public string? Numero { get; set; }
        [Required]
        public string? CEP { get; set; }
        [Required]
        public int UsuarioId { get; set; }
        public Usuario? Usuario { get; set; }
    }
}
