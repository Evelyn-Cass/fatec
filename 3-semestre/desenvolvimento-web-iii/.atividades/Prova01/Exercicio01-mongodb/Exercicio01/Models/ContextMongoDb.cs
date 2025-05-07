using MongoDB.Driver;

namespace Exercicio01.Models
{
    public class ContextMongoDb
    {
        public static string? ConnectionString { get; set; }
        public static string? Database { get; set;}
        public static bool IsSSL { get; set; }
        private IMongoDatabase _database { get; }

        public ContextMongoDb()
        {
            try
            {
                MongoClientSettings settings = MongoClientSettings.FromUrl(new MongoUrl(ConnectionString));
                if (IsSSL)
                {
                    settings.SslSettings = new SslSettings { EnabledSslProtocols = System.Security.Authentication.SslProtocols.Tls12 };
                }
                var mongoCliente = new MongoClient(settings);
                _database = mongoCliente.GetDatabase(Database);

            }
            catch (Exception)
            {
                throw new Exception("Não foi possível conectar Mongodb");
            }

        }

        public IMongoCollection<Medico> Medicos
        {
            get
            {
                return _database.GetCollection<Medico>("Medicos");
            }
        }

        public IMongoCollection<Agendamento> Agendamentos 
        {
            get
            {
                return _database.GetCollection<Agendamento>("Agendamentos");
            }
        }

    }
}
