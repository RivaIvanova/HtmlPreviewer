namespace HTMLPreviewer.Data
{
    using Microsoft.EntityFrameworkCore;

    using HTMLPreviewer.Data.Models;

    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<HTML> HTMLs { get; set; }

        public DbSet<HTMLVersion> HTMLVersions { get; set; }
    }
}
