using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PetMongodb.Models;

namespace PetMongodb.Data
{
    public class PetMongodbContext : DbContext
    {
        public PetMongodbContext (DbContextOptions<PetMongodbContext> options)
            : base(options)
        {
        }

        public DbSet<PetMongodb.Models.Pet> Pet { get; set; } = default!;
    }
}
