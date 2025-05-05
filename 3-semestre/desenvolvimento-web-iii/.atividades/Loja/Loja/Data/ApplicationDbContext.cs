using Loja.Models;
using Microsoft.EntityFrameworkCore;

namespace Loja.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<Compra> Compras { get; set; }
        public DbSet<Item> Itens { get; set; }
        public DbSet<Produto> Produtos { get; set; }
        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<ProdutoCategoria> ProdutosCategorias { get; set; }
    }
}
