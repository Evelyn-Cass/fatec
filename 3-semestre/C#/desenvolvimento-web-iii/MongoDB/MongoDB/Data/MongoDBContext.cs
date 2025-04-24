using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MongoDB.Models;

namespace MongoDB.Data
{
    public class MongoDBContext : DbContext
    {
        public MongoDBContext (DbContextOptions<MongoDBContext> options)
            : base(options)
        {
        }

        public DbSet<MongoDB.Models.Pet> Pet { get; set; } = default!;
    }
}
