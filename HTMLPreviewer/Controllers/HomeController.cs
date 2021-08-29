namespace HTMLPreviewer.Controllers
{
    using System.Diagnostics;
    using System.Threading.Tasks;

    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Logging;

    using HTMLPreviewer.Models;
    using HTMLPreviewer.Services;

    using Ganss.XSS;

    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IHtmlService htmlService;

        public HomeController(
            ILogger<HomeController> logger,
            IHtmlService htmlService)
        {
            _logger = logger;
            this.htmlService = htmlService;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return this.View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(HTMLInputModel html)
        {
            if (!this.ModelState.IsValid)
            {
                return this.View();
            }

            var sanitizer = new HtmlSanitizer();
            var sanitizedContent = sanitizer.Sanitize(html.Content);

            if (sanitizedContent.Length != 0)
            {
                var htmlId = await this.htmlService.AddAsync(sanitizedContent);
                return this.RedirectToAction(nameof(this.HTML), new { id = htmlId });
            }

            return this.View();
        }

        [HttpGet]
        public async Task<IActionResult> HTML(int id)
        {
            var input = await this.htmlService.GetHTML(id);

            return this.View(input);
        }

        [HttpGet]
        public IActionResult Oops()
        {
            return this.View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
