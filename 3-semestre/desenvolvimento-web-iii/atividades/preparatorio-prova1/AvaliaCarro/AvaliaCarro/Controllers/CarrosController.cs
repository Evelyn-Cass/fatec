using AvaliaCarro.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;

namespace AvaliaCarro.Controllers
{
    public class CarrosController : Controller
    {
        ContextMongoDb _context = new ContextMongoDb();

        // GET: Carroes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Carros.Find(u => true).ToListAsync());
        }

        // GET: Carroes/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var carro = await _context.Carros.Find(m => m.id == id)
                .FirstOrDefaultAsync();
            if (carro == null)
            {
                return NotFound();
            }

            return View(carro);
        }

        // GET: Carroes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Carroes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,Nome,Marca")] Carro carro)
        {
            if (ModelState.IsValid)
            {
                carro.id = Guid.NewGuid();
                await _context.Carros.InsertOneAsync(carro);
                return RedirectToAction(nameof(Index));
            }
            return View(carro);
        }

        // GET: Carroes/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var carro = await _context.Carros.Find(m => m.id == id).FirstOrDefaultAsync();
            if (carro == null)
            {
                return NotFound();
            }
            return View(carro);
        }

        // POST: Carroes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("id,Nome,Marca")] Carro carro)
        {
            if (id != carro.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    await _context.Carros.ReplaceOneAsync(m => m.id == carro.id, carro);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CarroExists(carro.id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(carro);
        }

        // GET: Carroes/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var carro = await _context.Carros.Find(m => m.id == id).FirstOrDefaultAsync();
            if (carro == null)
            {
                return NotFound();
            }

            return View(carro);
        }

        // POST: Carroes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            await _context.Carros.DeleteOneAsync(m => m.id == id);
            return RedirectToAction(nameof(Index));
        }

        private bool CarroExists(Guid id)
        {
            return _context.Carros.Find(e => e.id == id).Any();
        }
    }
}
