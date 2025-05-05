using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PetMongodb.Models;

namespace PetMongodb.Controllers
{
    public class UserController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        public UserController(UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager)
        {
            this._userManager = userManager;
        }



        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(User user)
        {
            if (ModelState.IsValid)
            {
                ApplicationUser appuser = new ApplicationUser();

                // Transformar o nome completo em username
                appuser.UserName = GerarUserName(user.NomeCompleto);
                appuser.Email = user.Email;
                appuser.PhoneNumber = user.Celular;
                appuser.NomeCompleto = user.NomeCompleto;

                IdentityResult result = await _userManager.CreateAsync(appuser, user.Password);
                if (result.Succeeded)
                {
                    ViewBag.Message = "Usuário Cadastrado com sucesso";
                }
                else
                {
                    foreach (IdentityError error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                }
            }
            return View();
        }

        // Método para gerar o username
        private string GerarUserName(string? nomeCompleto)
        {
            if (string.IsNullOrWhiteSpace(nomeCompleto))
                return string.Empty;

            // Remover acentos
            string normalized = nomeCompleto.Normalize(NormalizationForm.FormD);
            StringBuilder sb = new StringBuilder();
            foreach (char c in normalized)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            // Remover espaços e converter para minúsculas
            return Regex.Replace(sb.ToString(), @"\s+", "").ToLowerInvariant();
        }
    }
}
