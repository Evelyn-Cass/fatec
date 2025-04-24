namespace Academico.Models
{
    public class Disciplina
    {
        public int DisciplinaId { get; set; }
        public string? Descritivo { get; set; }
        public int Duracao { get; set; }
        public int CursoId { get; set; }
        public Curso? Curso { get; set; }

    }
}
