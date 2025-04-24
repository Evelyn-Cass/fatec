using Microsoft.Build.Framework;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = System.ComponentModel.DataAnnotations.RequiredAttribute;

namespace PetMongodb.Models
{
    public class Pet
    {
        [Required]
        public Guid Id { get; set; }
        public string? Nome { get; set; }
        public string? Idade { get; set; }
        [Display(Name = "Raça")]
        public string? Raca { get; set; }
        [Required]
        [Display(Name = "Cor Predominante")]
        public string? CorPredominante { get; set; }
        [Required]
        [Display(Name = "Cor dos Olhos")]
        public string? CorOlhos { get; set; }
        [Display(Name = "Espécie")]

        public string? Especie { get; set; }
        [Display(Name = "Gênero")]
        public string? Genero { get; set; }
        public string? Porte { get; set; }
        public string? Local { get; set; }
        [Display(Name = "Ponto de Referência")]
        public string? PontoReferencia { get; set; }
        public string? Recompensa{ get; set; }
        public DateOnly? Data { get; set; }
       
        public string? IdUsuario { get; set; }
        [Display(Name = "Situação")]
        public string? Situacao { get; set; }
        [Display(Name = "Comentário")]

        public string? Comentario { get; set; }
        public string? Imagem { get; set; }
    }
}
