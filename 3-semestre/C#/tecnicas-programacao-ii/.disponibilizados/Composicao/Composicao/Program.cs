Carro carro = new Carro("Fiat", "Toro Volcano", 150, "Flex");
carro.Mostrar();

public class Carro
{
    public Carro(string marca, string? modelo, int potencia, string? tipo)
    {
        Marca = marca;
        Modelo = modelo;
        MotorCarro = new Motor(potencia, tipo);

        
    }
    public string? Marca { get; set; }
    public string? Modelo { get; set; }
    public Motor MotorCarro { get; set; }
    public void Mostrar()
    {
        Console.WriteLine($"Modelo: {Modelo} \nMarca: {Marca}\n" +
            $"Motor:\n Potência:{MotorCarro.Potencia}\n Tipo:{MotorCarro.Tipo}");
    }
    public class Motor
    {
        public Motor(int potencia, string? tipo)
        {
            Potencia = potencia;
            Tipo = tipo;
        }
        public int Potencia { get; set; }
        public string? Tipo { get; set; }
    }
}//fim da classe carro

