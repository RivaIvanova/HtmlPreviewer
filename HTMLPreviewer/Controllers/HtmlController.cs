namespace HTMLPreviewer.Controllers
{
    using System.Threading.Tasks;

    using Microsoft.AspNetCore.Mvc;

    using Ganss.XSS;

    using HTMLPreviewer.Models;
    using HTMLPreviewer.Services;

    [Route("api/[controller]")]
    [ApiController]
    public class HtmlController : ControllerBase
    {
        private readonly IHtmlService htmlService;

        public HtmlController(IHtmlService htmlService)
        {
            this.htmlService = htmlService;
        }

        [HttpGet("{id}")]
        public async Task<JsonResult> Get(int id)
        {
            var versions = await this.htmlService.GetVersions(id);
            var js = new JsonResult(versions);

            return js;
        }

        [HttpPost]
        public async Task<bool> Post(CheckOriginalViewModel model)
        {
            return await this.htmlService.IsOriginal(model.Content, model.Version);
        }

        [HttpPut]
        public async Task<IActionResult> Put(HTMLInputModel html)
        {
            if (!this.ModelState.IsValid)
            {
                return this.BadRequest();
            }

            var sanitizer = new HtmlSanitizer();
            var sanitizedContent = sanitizer.Sanitize(html.Content);

            if (sanitizedContent.Length != 0)
            {
                await this.htmlService.EditAsync(html.Id, sanitizedContent);
            }

            return this.Ok();
        }
    }
}
