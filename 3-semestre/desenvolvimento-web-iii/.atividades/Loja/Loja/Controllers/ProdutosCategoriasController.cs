using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Loja.Data;
using Loja.Models;

namespace Loja.Controllers
{
    public class ProdutosCategoriasController : Controller
    {
        private readonly ApplicationDbContext _context;

        public ProdutosCategoriasController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: ProdutosCategorias
        public async Task<IActionResult> Index()
        {
            return View(await _context.ProdutosCategorias.ToListAsync());
        }

        // GET: ProdutosCategorias/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produtoCategoria = await _context.ProdutosCategorias
                .FirstOrDefaultAsync(m => m.ProdutoCategoriaId == id);
            if (produtoCategoria == null)
            {
                return NotFound();
            }

            return View(produtoCategoria);
        }

        // GET: ProdutosCategorias/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: ProdutosCategorias/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("ProdutoCategoriaId,ProdutoId,CategoriaId")] ProdutoCategoria produtoCategoria)
        {
            if (ModelState.IsValid)
            {
                _context.Add(produtoCategoria);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(produtoCategoria);
        }

        // GET: ProdutosCategorias/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produtoCategoria = await _context.ProdutosCategorias.FindAsync(id);
            if (produtoCategoria == null)
            {
                return NotFound();
            }
            return View(produtoCategoria);
        }

        // POST: ProdutosCategorias/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("ProdutoCategoriaId,ProdutoId,CategoriaId")] ProdutoCategoria produtoCategoria)
        {
            if (id != produtoCategoria.ProdutoCategoriaId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(produtoCategoria);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProdutoCategoriaExists(produtoCategoria.ProdutoCategoriaId))
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
            return View(produtoCategoria);
        }

        // GET: ProdutosCategorias/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var produtoCategoria = await _context.ProdutosCategorias
                .FirstOrDefaultAsync(m => m.ProdutoCategoriaId == id);
            if (produtoCategoria == null)
            {
                return NotFound();
            }

            return View(produtoCategoria);
        }

        // POST: ProdutosCategorias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var produtoCategoria = await _context.ProdutosCategorias.FindAsync(id);
            if (produtoCategoria != null)
            {
                _context.ProdutosCategorias.Remove(produtoCategoria);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProdutoCategoriaExists(int id)
        {
            return _context.ProdutosCategorias.Any(e => e.ProdutoCategoriaId == id);
        }
    }
}
