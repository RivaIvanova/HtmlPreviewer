namespace HTMLPreviewer.Services
{
    using System.Collections.Generic;
    using System.Threading.Tasks;

    using HTMLPreviewer.Models;

    public interface IHtmlService
    {
        Task<bool> IsOriginal(string content, int versionId);

        Task<HTMLInputModel> GetHTML(int id);

        Task<int> AddAsync(string content);

        Task EditAsync(int id, string content);

        Task<IEnumerable<HTMLVersionViewModel>> GetVersions(int id);
    }
}
