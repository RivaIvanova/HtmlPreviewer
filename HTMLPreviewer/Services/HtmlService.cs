namespace HTMLPreviewer.Services
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;

    using Microsoft.EntityFrameworkCore;

    using HTMLPreviewer.Data;
    using HTMLPreviewer.Data.Models;
    using HTMLPreviewer.Models;

    public class HtmlService : IHtmlService
    {
        private readonly ApplicationDbContext db;

        public HtmlService(ApplicationDbContext db)
        {
            this.db = db;
        }

        public async Task<HTMLInputModel> GetHTML(int id)
        {
            var html = await this.db.HTMLs.FindAsync(id);

            return new HTMLInputModel
            {
                Id = id,
                Content = html.Content,
            };
        }

        public async Task<int> AddAsync(string content)
        {
            var html = new HTML
            {
                Content = content,
                CreatedOn = DateTime.UtcNow,
                ModifiedOn = DateTime.UtcNow,
            };

            await this.db.AddAsync(html);
            await this.db.SaveChangesAsync();

            return html.Id;
        }

        public async Task EditAsync(int id, string content)
        {
            var html = await this.db.HTMLs.FindAsync(id);

            if (html.Content != content)
            {
                var version = new HTMLVersion
                {
                    HTMLId = id,
                    Content = html.Content,
                    CreatedOn = DateTime.UtcNow,
                };

                await this.db.HTMLVersions.AddAsync(version);
                await this.db.SaveChangesAsync();

                html.Content = content;
                html.ModifiedOn = DateTime.UtcNow;
                html.Versions.Add(version);

                await this.db.SaveChangesAsync();
            }
        }

        public async Task<IEnumerable<HTMLVersionViewModel>> GetVersions(int id)
        {
            var version = await this.db
                .HTMLVersions
                .Where(x => x.HTMLId == id)
                .OrderByDescending(x => x.CreatedOn)
                .Select(x => new HTMLVersionViewModel
                {
                    Id = x.Id,
                    Content = x.Content.Substring(0, 20),
                    CreatedOn = x.CreatedOn.ToString("O"),

                }).ToListAsync();

            return version;
        }

        public async Task<bool> IsOriginal(string content, int versionId)
        {
            var version = await this.db
                .HTMLVersions
                .Where(x => x.Id == versionId)
                .FirstOrDefaultAsync();

            if (content == version.Content)
            {
                return true;
            }

            return false;
        }
    }
}
