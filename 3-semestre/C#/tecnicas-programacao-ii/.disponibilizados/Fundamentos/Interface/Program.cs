IAnimal obj = new Cachorro();
obj.FazerSom();
public interface IAnimal
{
    //método
    public void FazerSom();
    
}
public class Gato:IAnimal
{
    public void FazerSom()
    {
        Console.WriteLine("miau");
    }
}
public class Cachorro : IAnimal
{
    public void FazerSom()
    {
        Console.WriteLine("Au au");
    }
}



