namespace PetMongodb.Models
{
    public class Pet
    {
        public Guid Id { get; set; }
        public string? Nome { get; set; }
        public string? Idade { get; set; }
        public string? Raca { get; set; }
        public string? CorPredominante { get; set; }
        public string? CorOlhos { get; set; }
        public string? Especie { get; set; }
        public string? Genero { get; set; }
        public string? Porte { get; set; }
        public string? Local { get; set; }
        public string? PontoReferencia { get; set; }
        public DateOnly? Data { get; set; }
        public decimal Recompensa { get; set; }
        public string? IdUsuario { get; set; }
        public string? Situacao { get; set; } 
        public string? Imagem { get; set; }
        public string? Comentario { get; set; }
    }
}
