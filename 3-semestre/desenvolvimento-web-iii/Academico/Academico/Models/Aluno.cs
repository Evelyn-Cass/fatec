namespace Academico.Models
{
    public class Aluno
    {
        public int AlunoId { get; set; }
        public int RA { get; set; }
        public int UsuarioId { get; set; } //Foreign Key
        public Usuario? Usuario { get; set; } //Navigation Property
    }
}
