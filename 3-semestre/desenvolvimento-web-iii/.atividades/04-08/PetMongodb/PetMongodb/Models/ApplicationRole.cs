using AspNetCore.Identity.MongoDbCore.Models;
using MongoDbGenericRepository.Attributes;

namespace PetMongodb.Models
{
    [CollectionName ("Roles")]
    public class ApplicationRole:MongoIdentityRole
    {
    }
}
