using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Bson.Serialization;
using MongoDB.Bson;
using MongoDB.Driver;

namespace MongoDB.Models
{
    public class ContextMongDb
    {
        public static string? ConnectionString { get; set; }
        public static string? Database { get; set; }
        public static bool IsSSL { get; set; }
        private IMongoDatabase _database { get; }


        public ContextMongDb()
        {
            try
            {
                MongoClientSettings settings = MongoClientSettings.FromUrl(new MongoUrl(ConnectionString));
                if (IsSSL)
                {
                    settings.SslSettings = new SslSettings { EnabledSslProtocols = System.Security.Authentication.SslProtocols.Tls12 };
                }
                var mongoClient = new MongoClient(settings);
                _database = mongoClient.GetDatabase(Database);
            }
            catch (Exception)
            {
                throw new Exception("Can not access to database server.");
            }
        }

        public IMongoCollection<Pet> Pets
        {
            get
            {
                return _database.GetCollection<Pet>("Pets");
            }
        }

    }
}
