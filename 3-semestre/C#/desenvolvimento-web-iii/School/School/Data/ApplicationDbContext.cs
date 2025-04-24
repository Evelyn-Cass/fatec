using Microsoft.EntityFrameworkCore;
using School.Models;

namespace School.Data
{
    public class ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : DbContext(options)
    {
        public DbSet<Course> Courses { get; set; }
        public DbSet<Discipline> Disciplines { get; set; }
        public DbSet<Enrollment> Enrollments { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<User> Users { get; set; }
    }

    //public class ApplicationDbContext : DbContext
    //{
    //    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    //    {
    //    }
    //    public DbSet<Course> Courses { get; set; }
    //    public DbSet<Discipline> Disciplines { get; set; }
    //    public DbSet<Enrollment> Enrollments { get; set; }
    //    public DbSet<Student> Students { get; set; }
    //    public DbSet<User> Users { get; set; }
    //}
}