namespace SchoolSystem.Models
{
    public class Discipline
    {
        public int DisciplineId { get; set; }
        public string? Name { get; set; }
        public int Duration { get; set; }
        public int CourseId { get; set; }
        public Course? Course { get; set; }

    }
}
