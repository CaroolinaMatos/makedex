using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using makedex.Models;
using makedex.Data;

namespace makedex.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDbContext _context;

        public HomeController(ILogger<HomeController> logger, AppDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        // Lista todos os produtos
        public IActionResult Index()
        {
            var lista = _context.Maquiagens
                                .Include(m => m.Tipo)
                                .OrderBy(m => m.Numero)
                                .ToList();
            return View(lista);
        }

        // Mostra detalhes de um produto (numero é a PK)
        public IActionResult Details(uint? numero)
        {
            if (numero == null)
                return NotFound();

            var maquiagem = _context.Maquiagens
                                    .Include(m => m.Tipo)
                                    .FirstOrDefault(m => m.Numero == numero.Value);

            if (maquiagem == null)
                return NotFound();

            return View(maquiagem);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
