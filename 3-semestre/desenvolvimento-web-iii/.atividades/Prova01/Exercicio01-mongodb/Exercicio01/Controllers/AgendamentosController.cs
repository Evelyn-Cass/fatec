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
    public class AgendamentosController : Controller
    {
        ContextMongoDb _context = new ContextMongoDb();

        // GET: Agendamentoes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Agendamentos.Find(u=> true).ToListAsync());
        }


        // GET: Agendamentoes/Create
        public IActionResult Create(string IdMedico)
        {
            Agendamento agendamento = new Agendamento();
            agendamento.IdMedico = IdMedico;
            return View(agendamento);
        }

        // POST: Agendamentoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,NomePaciente,CelularPaciente,Status,IdMedico")] Agendamento agendamento)
        {
            if (ModelState.IsValid)
            {
                agendamento.Id = Guid.NewGuid();
                await _context.Agendamentos.InsertOneAsync(agendamento);
                return RedirectToAction(nameof(Index));
            }
            return View(agendamento);
        }

        private bool AgendamentoExists(Guid id)
        {
            return _context.Agendamentos.Find(e => e.Id == id).Any();
        }
    }
}
