using exercicio02_mysql.Models;
using Microsoft.EntityFrameworkCore;

namespace Academico.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options):base(options){}
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Endereco> Enderecos { get; set; }
        public DbSet<Chamado> Chamados { get; set; }
        public DbSet<Tecnico> Tecnicos { get; set; }
        public DbSet<Chamado_Tecnico> Chamados_Tecnicos { get; set; }
        
    }
}
