using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.HttpSys;
using PetMongodb.Models;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace PetMongodb.Controllers
{
    public class UserController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        private RoleManager<ApplicationRole> _roleManager;

        public UserController(UserManager<ApplicationUser> userManager, RoleManager<ApplicationRole> roleManager)
        {
            this._userManager = userManager;
            this._roleManager = roleManager;
        }



        public IActionResult Create(string role)
        {
            ViewBag.Role = role;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(User user, string role)
        {
            if (ModelState.IsValid)
            {
                ApplicationUser appuser = new ApplicationUser();
                string userName = user.NomeCompleto.Replace(" ", "");
                var normalizedString = userName.Normalize(NormalizationForm.FormD);

                // Remove os caracteres de acentuação
                StringBuilder sb = new StringBuilder();
                foreach (char c in normalizedString)
                {
                    // Apenas mantém os caracteres que não são diacríticos (acentos, til, etc.)
                    if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                    {
                        sb.Append(c);
                    }
                }

                userName = sb.ToString().Normalize(NormalizationForm.FormC);

                userName = Regex.Replace(userName, @"[^a-zA-Z0-9\s]", "");

                Console.WriteLine(userName);

                

                appuser.UserName = userName;
                appuser.Email = user.Email;
                appuser.PhoneNumber = user.Celular;
                appuser.NomeCompleto = user.NomeCompleto;
                IdentityResult result = await _userManager.CreateAsync(appuser, user.Password);
                if (result.Succeeded)
                {
                    //add role
                    await _userManager.AddToRoleAsync(appuser, role);
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
        [Authorize(Roles = "Administrador")]
        public IActionResult CreateRole()
        {
            return View();
        }
        [HttpPost]
        [Authorize(Roles = "Administrador")]
        public async Task<IActionResult> CreateRole(UserRole userRole)
        {
            if (ModelState.IsValid)
            {
                IdentityResult result = await _roleManager.CreateAsync(new ApplicationRole() { Name = userRole.RoleName });
                if (result.Succeeded)
                {
                    ViewBag.Message = "Perfil Cadastrado com sucesso";
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
    }//fim da classe
}//fim namespace
