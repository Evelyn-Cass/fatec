using AspNetCore.Identity.MongoDbCore.Models;
using MongoDbGenericRepository.Attributes;

namespace MongoDB.Models
{
    [CollectionName("Users")] // Collection name in MongoDB
    public class ApplicationUser : MongoIdentityUser
    {
    }
}
