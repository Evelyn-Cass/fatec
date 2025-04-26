namespace School.Models
{
    public class Student
    {
        public int StudentId { get; set; }
        public int RA { get; set; }
        public int UserId { get; set; } //Foreign Key
        public User? User { get; set; } //Navigation Property
    }
}
