try
{
    A.ProcessarA();
}
catch (Exception)
{
    Console.WriteLine("Estou no Programa - Método não implementado");
}

class A()
{
    public static void ProcessarA()
    {
        try
        {
            B.ProcessarB();
        }
        catch (Exception)
        {
            Console.WriteLine("Estou no Processar A - Método não implementado");
        }
    }


}

class B()
{
    public static void ProcessarB()
    {
        throw new NotImplementedException("Método não Implementado.");
    }
}