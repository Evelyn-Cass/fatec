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

            var avaliacoesComCarro = new List<dynamic>();
            foreach (var avaliacao in avaliacoes)
            {
                var carro = await _context.Carros.Find(c => c.id.ToString() == avaliacao.IdCarro).FirstOrDefaultAsync();
                avaliacoesComCarro.Add(new
                {
                    Avaliacao = avaliacao,
                    Carro = carro?.Nome ?? "Carro não encontrado"
                });
            }

            return View(avaliacoesComCarro);
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
