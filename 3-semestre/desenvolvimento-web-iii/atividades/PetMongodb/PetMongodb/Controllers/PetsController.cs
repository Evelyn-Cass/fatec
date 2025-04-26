using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MongoDB.Driver;
using PetMongodb.Models;

namespace PetMongodb.Controllers
{
    [Authorize]
    public class PetsController : Controller
    {
        ContextMongodb _context = new ContextMongodb();

        private UserManager<ApplicationUser> _userManager;
        public PetsController(UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager)
        {
            this._userManager = userManager;
        }

        // GET: Pets
        public async Task<IActionResult> Index()
        {
            var userId = _userManager.GetUserId(User);
            return View(await _context.Pet.Find(p => p.IdUsuario == userId).ToListAsync());
        }

        // GET: Pets/Details/5
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var pet = await _context.Pet
                .Find(m => m.Id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return NotFound();
            }

            return View(pet);
        }

        // GET: Pets/Create
        public IActionResult Create(string situacao)
        {
            Pet pet = new Pet();
            pet.Situacao = situacao;
            return View(pet);
        }

        // POST: Pets/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nome,Idade,Raca,CorPredominante, CorOlhos, Especie, Genero, Porte, Local, PontoReferencia, Data, Recompensa, IdUsuario, Situacao, Imagem, Comentario")] Pet pet, IFormFile imagem)
        {
            if (ModelState.IsValid)
            {
                if (imagem != null && imagem.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(),
                        "wwwroot", "img", imagem.FileName);

                    // Salva a imagem no diretório especificado
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imagem.CopyToAsync(stream);
                    }

                    // Atribui o caminho relativo da imagem no campo 'Imagem'
                    pet.Imagem = Path.Combine("img", imagem.FileName);
                }

                pet.Id = Guid.NewGuid();
                pet.IdUsuario = _userManager.GetUserId(User);

                await _context.Pet.InsertOneAsync(pet);
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

            var pet = await _context.Pet
                .Find(m => m.Id == id).FirstOrDefaultAsync();
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
        public async Task<IActionResult> Edit(Guid id, [Bind("Id,Nome,Idade,Raca,CorPredominante, CorOlhos, Especie, Genero, Porte, Local, PontoReferencia, Data, Recompensa, IdUsuario, Situacao, Imagem, Comentario")] Pet pet, IFormFile imagem)
        {
            if (id != pet.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                if (imagem != null && imagem.Length > 0)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(),
                        "wwwroot", "img", imagem.FileName);

                    // Salva a imagem no diretório especificado
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await imagem.CopyToAsync(stream);
                    }

                    // Atribui o caminho relativo da imagem no campo 'Imagem'
                    pet.Imagem = Path.Combine("img", imagem.FileName);
                }
                try
                {
                    await _context.Pet.ReplaceOneAsync(m => m.Id == pet.Id, pet);
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PetExists(pet.Id))
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
            var pet = await _context.Pet.Find(m => m.Id == id).FirstOrDefaultAsync();

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
            await _context.Pet.DeleteOneAsync(u => u.Id == id);
            return RedirectToAction(nameof(Index));
        }

        private bool PetExists(Guid id)
        {
            return _context.Pet.Find(e => e.Id == id).Any();
        }
    }
}
