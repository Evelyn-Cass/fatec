using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Exercicio01.Models;

namespace Exercicio01.Data
{
    public class Exercicio01Context : DbContext
    {
        public Exercicio01Context (DbContextOptions<Exercicio01Context> options)
            : base(options)
        {
        }

        public DbSet<Exercicio01.Models.Medico> Medico { get; set; } = default!;
        public DbSet<Exercicio01.Models.Agendamento> Agendamento { get; set; } = default!;
    }
}
