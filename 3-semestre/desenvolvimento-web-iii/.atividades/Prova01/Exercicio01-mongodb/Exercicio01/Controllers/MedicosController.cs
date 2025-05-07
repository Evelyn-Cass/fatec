using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Exercicio01.Data;
using Exercicio01.Models;
using MongoDB.Driver;

namespace Exercicio01.Controllers
{
    public class MedicosController : Controller
    {

        ContextMongoDb _context = new ContextMongoDb();

        // GET: Medicos
        public async Task<IActionResult> Index()
        {
            return View(await _context.Medicos.Find(u => true).ToListAsync());
        }

        public async Task<IActionResult> All()
        {
            return View(await _context.Medicos.Find(u => true).ToListAsync());
        }



        // GET: Medicos/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Medicos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Especialidade,CRM,Telefone")] Medico medico)
        {
            if (ModelState.IsValid)
            {
                medico.Id = Guid.NewGuid();
                await _context.Medicos.InsertOneAsync(medico);
                return RedirectToAction(nameof(Index));
            }
            return View(medico);
        }

     
        private bool MedicoExists(Guid id)
        {
            return _context.Medicos.Find(e => e.Id == id).Any();
        }
    }
}
