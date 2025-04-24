using Microsoft.EntityFrameworkCore;

using LojaGames.Models;
namespace LojaGames.Data
{
    public class ApplicationDbContext :  DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Models.GameConsole> GameConsoles { get; set; }
        public DbSet<Game> Games { get; set; }
        public DbSet<Game_Loja> Games_Lojas { get; set; }
        public DbSet<Loja> Lojas { get; set; }
    }
}
