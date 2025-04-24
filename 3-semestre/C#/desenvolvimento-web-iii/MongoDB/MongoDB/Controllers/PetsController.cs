using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;
using MongoDB.Driver.Core;
using MongoDB.Models;



namespace MongoDB.Controllers
{
    public class PetsController : Controller
    {
        ContextMongDb _context = new ContextMongDb();

        // GET: Pets
        public async Task<IActionResult> Index()
        {
            return View(await _context.Pets.Find(u => true).ToListAsync());
        }

        // GET: Pets/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pets
                .Find(m => m.id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return NotFound();
            }

            return View(pet);
        }

        // GET: Pets/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Pets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("id,Name,Age,Breed,Caretaker,Mobile")] Pet pet)
        {
            if (ModelState.IsValid)
            {
                pet.id = Guid.NewGuid();
                await _context.Pets.InsertOneAsync(pet);
                return RedirectToAction(nameof(Index));
            }
            return View(pet);
        }

        // GET: Pets/Edit/5
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pets
               .Find(m => m.id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return NotFound();
            }
            return View(pet);
        }

        // POST: Pets/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Guid id, [Bind("id,Name,Age,Breed,Caretaker,Mobile")] Pet pet)
        {
            if (id != pet.id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    await _context.Pets.ReplaceOneAsync(m => m.id == pet.id, pet);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PetExists(pet.id))
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
            return View(pet);
        }

        // GET: Pets/Delete/5
        public async Task<IActionResult> Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pets
               .Find(m => m.id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return NotFound();
            }

            return View(pet);
        }

        // POST: Pets/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(Guid id)
        {
            await _context.Pets.DeleteOneAsync(m => m.id == id);
            return RedirectToAction(nameof(Index));
        }

        private bool PetExists(Guid id)
        {
            return _context.Pets.Find(e => e.id == id).Any();
        }
    }
}
