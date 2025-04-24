using AspNetCore.Identity.MongoDbCore.Models;
using MongoDbGenericRepository.Attributes;

namespace PetMongodb.Models
{
    [CollectionName("Users")]
    public class ApplicationUser:MongoIdentityUser
    {
    }
}
