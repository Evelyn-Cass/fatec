namespace SchoolSystem.Models
{
    public class Enrollment
    {
        public int EnrollmentId { get; set; }
        public DateTime EnrollmentDate { get; set; }
        public int CourseId { get; set; }
        public int StudentId { get; set; }
    }
}
