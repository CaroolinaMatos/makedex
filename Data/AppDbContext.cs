using Microsoft.EntityFrameworkCore;
using makedex.Models;


namespace makedex.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> opt) : base(opt)
        {
        }

        public DbSet<Tipo> Tipos { get; set; }
        public DbSet<Maquiagem> Maquiagens { get; set; }
    }
}
