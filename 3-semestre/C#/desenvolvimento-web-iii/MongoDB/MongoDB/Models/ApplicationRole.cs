using AspNetCore.Identity.MongoDbCore.Models;
using MongoDbGenericRepository.Attributes;

namespace MongoDB.Models
{
    [CollectionName ("Roles")]
    public class ApplicationRole: MongoIdentityRole
    {
    }
}
