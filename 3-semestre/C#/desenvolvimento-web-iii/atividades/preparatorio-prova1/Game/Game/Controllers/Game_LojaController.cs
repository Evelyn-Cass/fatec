using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using LojaGames.Data;
using LojaGames.Models;

namespace LojaGame.Controllers
{
    public class Game_LojaController : Controller
    {
        private readonly ApplicationDbContext _context;

        public Game_LojaController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Game_Loja
        public async Task<IActionResult> Index()
        {
            return View(await _context.Games_Lojas.ToListAsync());
        }

        // GET: Game_Loja/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var game_Loja = await _context.Games_Lojas
                .FirstOrDefaultAsync(m => m.Id == id);
            if (game_Loja == null)
            {
                return NotFound();
            }

            return View(game_Loja);
        }

        // GET: Game_Loja/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Game_Loja/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,IdLoja,IdGame")] Game_Loja game_Loja)
        {
            if (ModelState.IsValid)
            {
                game_Loja.Id = Guid.NewGuid();
                _context.Add(game_Loja);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(game_Loja);
        }

        // GET: Game_Loja/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var game_Loja = await _context.Games_Lojas.FindAsync(id);
            if (game_Loja == null)
            {
                return NotFound();
            }
            return View(game_Loja);
        }

        // POST: Game_Loja/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,IdLoja,IdGame")] Game_Loja game_Loja)
        {
            if (id != game_Loja.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(game_Loja);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!Game_LojaExists(game_Loja.Id))
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
            return View(game_Loja);
        }

        // GET: Game_Loja/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var game_Loja = await _context.Games_Lojas
                .FirstOrDefaultAsync(m => m.Id == id);
            if (game_Loja == null)
            {
                return NotFound();
            }

            return View(game_Loja);
        }

        // POST: Game_Loja/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            var game_Loja = await _context.Games_Lojas.FindAsync(id);
            if (game_Loja != null)
            {
                _context.Games_Lojas.Remove(game_Loja);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool Game_LojaExists(Guid id)
        {
            return _context.Games_Lojas.Any(e => e.Id == id);
        }
    }
}
