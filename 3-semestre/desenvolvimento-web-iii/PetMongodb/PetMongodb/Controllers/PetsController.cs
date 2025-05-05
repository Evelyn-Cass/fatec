using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using MongoDB.Driver;
using PetMongodb.Data;
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
        [AllowAnonymous]
        //GET:Pets
        public async Task<IActionResult> All()
        {
            var userId = _userManager.GetUserId(User);
            return View(await _context.Pet.Find(pet => pet.Situacao != "Finalizado").ToListAsync());
        }
        // GET: Pets do usuário logado
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
        public async Task<IActionResult> Create([Bind("Id,Nome,Idade,Raca,CorPredominante, CorOlhos, Especie, Genero, Porte, Local, PontoReferencia, Data, IdUsuario, Situacao, Recompensa, Comentario")] Pet pet, IFormFile Imagem)
        {
            if (ModelState.IsValid)
            {
                if (Imagem != null && Imagem.Length > 0)
                {
                    

                    // Atribui o caminho relativo da imagem no campo 'Imagem'
                    pet.Imagem = Path.Combine("img/", Imagem.FileName);
                }

                pet.Id = Guid.NewGuid();
                pet.IdUsuario = _userManager.GetUserId(User);

                await _context.Pet.InsertOneAsync(pet);

                var filePath = Path.Combine(Directory.GetCurrentDirectory(),
                        "wwwroot", "img", Imagem.FileName);

                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await Imagem.CopyToAsync(stream);
                }
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
        public async Task<IActionResult> Edit(Guid id,[Bind("Nome,Idade,Raca,CorPredominante, CorOlhos, Especie, Genero, Porte, Local, PontoReferencia, Data, IdUsuario, Situacao, Recompensa, Comentario")] string oldimage,Pet pet, IFormFile? Imagem)
        {
            if (id != pet.Id)
            {
                return NotFound();
            }
           
            if (ModelState.IsValid)
            {
                if (Imagem != null && Imagem.Length > 0)
                {
                    // Atribui o caminho relativo da imagem no campo 'Imagem'
                    pet.Imagem = Path.Combine("img/", Imagem.FileName);
                }
                else
                {
                    pet.Imagem = oldimage;
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
                if (Imagem != null && Imagem.Length > 0)
                {
                   var imagemFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", oldimage);

                    // Verificar se o arquivo existe antes de tentar deletar
                    if (System.IO.File.Exists(imagemFilePath))
                    {
                        await Task.Run(() => System.IO.File.Delete(imagemFilePath));
                    }
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(),
                            "wwwroot", "img", Imagem.FileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await Imagem.CopyToAsync(stream);
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
        public async Task<IActionResult> DeleteConfirmed(Guid id, string? Imagem)
        {
            await _context.Pet.DeleteOneAsync(u => u.Id == id);

            if (!string.IsNullOrEmpty(Imagem))
            {
                var imagemFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", Imagem);

                // Verificar se o arquivo existe antes de tentar deletar
                if (System.IO.File.Exists(imagemFilePath))
                {
                    await Task.Run(() => System.IO.File.Delete(imagemFilePath));
                }
            }
            return RedirectToAction(nameof(Index));
        }

        private bool PetExists(Guid id)
        {
            return _context.Pet.Find(e => e.Id == id).Any();
        }
        // POST: Pets/MudarSituacao/5
     
        public async Task<IActionResult> MudarSituacao(Guid id, string situacao)
        {
            if (id == Guid.Empty || string.IsNullOrEmpty(situacao))
            {
                return BadRequest("Id ou situação inválidos.");
            }

            var pet = await _context.Pet.Find(m => m.Id == id).FirstOrDefaultAsync();
            if (pet == null)
            {
                return NotFound("Pet não encontrado.");
            }

            pet.Situacao = situacao;

            try
            {
                await _context.Pet.ReplaceOneAsync(m => m.Id == pet.Id, pet);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Erro ao atualizar a situação: {ex.Message}");
            }

            return RedirectToAction(nameof(Index));
        }
    }
}
