﻿using MongoDB.Driver;

namespace PetMongodb.Models
{
    public class ContextMongodb
    {
        public static string? ConnectionString { get; set; }
        public static string? Database { get; set; }
        public static bool IsSSL { get; set; }
        private IMongoDatabase _database { get; }

        
        public ContextMongodb()
        {
            try 
            {
                MongoClientSettings settings = MongoClientSettings.FromUrl(new MongoUrl(ConnectionString));
                if(IsSSL)
                {
                    settings.SslSettings = new SslSettings { EnabledSslProtocols = System.Security.Authentication.SslProtocols.Tls12 };
                }
                var mongoCliente = new MongoClient(settings);
                _database = mongoCliente.GetDatabase(Database);

            } 
            catch(Exception)
            {
                throw new Exception("Não foi possível conectar Mongodb");
            }

        }

        public IMongoCollection <Pet> Pet
        {
            get
            {
                return _database.GetCollection<Pet>("Pet");
            }
        }



    }
}
