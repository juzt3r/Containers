using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;

namespace UptimeAPI.Models
{
    public class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("USERS"); // Bruker nøyaktig tabellnavn fra databasen
        }
    }

    public class User
    {
        public int Id { get; set; }
        public string username { get; set; }
        public string Email { get; set; }
    }
}
