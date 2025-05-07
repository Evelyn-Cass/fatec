using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Academico.Data;
using exercicio02_mysql.Models;

namespace exercicio02_mysql.Controllers
{
    public class Chamados_TecnicosController : Controller
    {
        private readonly ApplicationDbContext _context;

        public Chamados_TecnicosController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Chamados_Tecnicos
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Chamados_Tecnicos.Include(c => c.Chamado).Include(c => c.Tecnico);
            return View(await applicationDbContext.ToListAsync());
        }

        // GET: Chamados_Tecnicos/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var chamado_Tecnico = await _context.Chamados_Tecnicos
                .Include(c => c.Chamado)
                .Include(c => c.Tecnico)
                .FirstOrDefaultAsync(m => m.Chamado_TecnicoId == id);
            if (chamado_Tecnico == null)
            {
                return NotFound();
            }

            return View(chamado_Tecnico);
        }

        // GET: Chamados_Tecnicos/Create
        public IActionResult Create()
        {
            ViewData["ChamadoId"] = new SelectList(_context.Chamados, "ChamadoId", "ChamadoId");
            ViewData["TecnicoId"] = new SelectList(_context.Tecnicos, "TecnicoId", "TecnicoId");
            return View();
        }

        // POST: Chamados_Tecnicos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Chamado_TecnicoId,DataAtribuicao,Situacao,TecnicoId,ChamadoId")] Chamado_Tecnico chamado_Tecnico)
        {
            if (ModelState.IsValid)
            {
                _context.Add(chamado_Tecnico);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ChamadoId"] = new SelectList(_context.Chamados, "ChamadoId", "ChamadoId", chamado_Tecnico.ChamadoId);
            ViewData["TecnicoId"] = new SelectList(_context.Tecnicos, "TecnicoId", "TecnicoId", chamado_Tecnico.TecnicoId);
            return View(chamado_Tecnico);
        }

        // GET: Chamados_Tecnicos/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var chamado_Tecnico = await _context.Chamados_Tecnicos.FindAsync(id);
            if (chamado_Tecnico == null)
            {
                return NotFound();
            }
            ViewData["ChamadoId"] = new SelectList(_context.Chamados, "ChamadoId", "ChamadoId", chamado_Tecnico.ChamadoId);
            ViewData["TecnicoId"] = new SelectList(_context.Tecnicos, "TecnicoId", "TecnicoId", chamado_Tecnico.TecnicoId);
            return View(chamado_Tecnico);
        }

        // POST: Chamados_Tecnicos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Chamado_TecnicoId,DataAtribuicao,Situacao,TecnicoId,ChamadoId")] Chamado_Tecnico chamado_Tecnico)
        {
            if (id != chamado_Tecnico.Chamado_TecnicoId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(chamado_Tecnico);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!Chamado_TecnicoExists(chamado_Tecnico.Chamado_TecnicoId))
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
            ViewData["ChamadoId"] = new SelectList(_context.Chamados, "ChamadoId", "ChamadoId", chamado_Tecnico.ChamadoId);
            ViewData["TecnicoId"] = new SelectList(_context.Tecnicos, "TecnicoId", "TecnicoId", chamado_Tecnico.TecnicoId);
            return View(chamado_Tecnico);
        }

        // GET: Chamados_Tecnicos/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var chamado_Tecnico = await _context.Chamados_Tecnicos
                .Include(c => c.Chamado)
                .Include(c => c.Tecnico)
                .FirstOrDefaultAsync(m => m.Chamado_TecnicoId == id);
            if (chamado_Tecnico == null)
            {
                return NotFound();
            }

            return View(chamado_Tecnico);
        }

        // POST: Chamados_Tecnicos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var chamado_Tecnico = await _context.Chamados_Tecnicos.FindAsync(id);
            if (chamado_Tecnico != null)
            {
                _context.Chamados_Tecnicos.Remove(chamado_Tecnico);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool Chamado_TecnicoExists(int id)
        {
            return _context.Chamados_Tecnicos.Any(e => e.Chamado_TecnicoId == id);
        }
    }
}
