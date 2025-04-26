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
            return View(await _context.Avaliacoes.Find(u => true).ToListAsync());
        }


        // GET: Avaliacoes/Create
        public IActionResult Create(string carroid)
        {
            Avaliacao avaliacao = new Avaliacao();
            avaliacao.IdCarro = carroid;
            return View(avaliacao);
        }

        // POST: Avaliacoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
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
