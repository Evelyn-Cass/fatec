namespace Academico.Models
{
    public class Matricula
    {
        public int MatriculaId { get; set; }
        public DateTime MatriculaDate { get; set; }
        public int CursoId { get; set; }
        public int AlunoId { get; set; }
    }
}
