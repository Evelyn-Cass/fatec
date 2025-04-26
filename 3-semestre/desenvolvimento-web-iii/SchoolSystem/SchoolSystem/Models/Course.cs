namespace SchoolSystem.Models
{
    public class Course
    {
        public int CourseId { get; set; }
        public string? Title { get; set; }
        public int Vacancies { get; set; }

        public List<Discipline>? Disciplines { get; set; }
    }
}
