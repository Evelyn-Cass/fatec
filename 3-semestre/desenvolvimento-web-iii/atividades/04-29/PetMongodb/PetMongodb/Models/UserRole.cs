using System.ComponentModel.DataAnnotations;

namespace PetMongodb.Models
{
   
    public class UserRole
    {
        [Required]
        public string? RoleName{ get; set; }
    }
}
