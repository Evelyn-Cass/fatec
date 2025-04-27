using System.ComponentModel.DataAnnotations;

namespace PetMongodb.Models
{
    public class User
    {
        [Required]
        [Display(Name = "Nome Completo")]
        public string? NomeCompleto { get; set; }
        [Required]
        public string? Celular { get; set; }
        [Required]
        [EmailAddress(ErrorMessage="E-mail inválido")]
        public string? Email { get; set; }
        [Required]
        [Display(Name = "Senha")]
        public string? Password { get; set; }

    }
}
