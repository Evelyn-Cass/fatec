using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using AvaliaCarro.Models;

namespace AvaliaCarro.Data
{
    public class AvaliaCarroContext : DbContext
    {
        public AvaliaCarroContext (DbContextOptions<AvaliaCarroContext> options)
            : base(options)
        {
        }

        public DbSet<AvaliaCarro.Models.Carro> Carro { get; set; } = default!;
        public DbSet<AvaliaCarro.Models.Avaliacao> Avaliacao { get; set; } = default!;
    }
}
