using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using PetMongodb.Models;

namespace PetMongodb.Controllers
{
    public class UserController : Controller
    {
        private UserManager<ApplicationUser> _userManager;
        public  UserController(UserManager<ApplicationUser> userManager,RoleManager<ApplicationRole> roleManager)
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
            if(ModelState.IsValid)
            {
                ApplicationUser appuser = new ApplicationUser();
                appuser.UserName = user.Nome;
                appuser.Email = user.Email;
                IdentityResult result = await _userManager.CreateAsync(appuser, user.Password);
                if(result.Succeeded)
                {
                    ViewBag.Message = "Usuário Cadastrado com sucesso";
                }
                else
                {
                    foreach(IdentityError error in result.Errors)
                    {
                        ModelState.AddModelError("", error.Description);
                    }
                }
            }
            return View();
        }
    }
}
