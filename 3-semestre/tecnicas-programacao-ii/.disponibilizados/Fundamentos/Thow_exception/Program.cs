
try
{
    A.ProcessarA();
}
catch (Exception)
{
    Console.WriteLine("Estou fora do A - Método não implementado");
}

class A()
{
    public static  void ProcessarA()
    {
        
            B.ProcessarB();
        
    }
}
class B()
{
    public static void ProcessarB()
    {
        throw new NotImplementedException("Método não implementado");
    }
}


