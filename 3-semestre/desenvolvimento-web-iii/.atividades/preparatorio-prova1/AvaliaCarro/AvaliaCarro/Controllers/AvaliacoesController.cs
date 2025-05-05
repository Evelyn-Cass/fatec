using AvaliaCarro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;

namespace AvaliaCarro.Controllers
{
    public class AvaliacoesController : Controller
    {
        ContextMongoDb _context = new ContextMongoDb();

        // GET: Avaliacoes
        public async Task<IActionResult> Index()
        {
            var avaliacoes = await _context.Avaliacoes.Find(u => true).ToListAsync();
            if (avaliacoes == null)
            {
                return NotFound();
            }

            // Corrigido o tipo para IEnumerable e ajustada a projeção
            var carros = await _context.Carros.Find(c => true)
                .Project(c => new { c.id, c.Nome })
                .ToListAsync();
            ViewBag.Carros = carros;

            return View(avaliacoes);
        }

        // GET: Avaliacoes/Create
        public IActionResult Create(string carroid)
        {
            Avaliacao avaliacao = new Avaliacao();
            avaliacao.IdCarro = carroid;
            return View(avaliacao);
        }

        // POST: Avaliacoes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,Data,Nota,IdCarro")] Avaliacao avaliacao)
        {
            if (ModelState.IsValid)
            {
                avaliacao.id = Guid.NewGuid();
                await _context.Avaliacoes.InsertOneAsync(avaliacao);
                return RedirectToAction(nameof(Index));
            }
            return View(avaliacao);
        }
    }
}
