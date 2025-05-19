//1.Exercício: Operações Aritméticas
//Crie um delegate chamado Operacao que recebe dois números double e retorna um double. Em seguida, crie métodos para somar, subtrair, multiplicar e dividir dois números.No Main, use o delegate para chamar cada um desses métodos.


double Somar(double x, double y)
{
    return x + y;
}
double Subtrair(double x, double y)
{
    return x - y;
}
double Multiplicar(double x, double y)
{
    return x * y;
}
double Dividir(double x, double y)
{
    return x / y;
}


Operacao delSomar = new Operacao(Somar);
Operacao delSubtrair = new Operacao(Subtrair);
Operacao delMultiplicar = new Operacao(Multiplicar);
Operacao delDividir = new Operacao(Dividir);

Console.WriteLine(delSomar(1, 2));
Console.WriteLine(delSubtrair(1, 2));
Console.WriteLine(delMultiplicar(1, 2));
Console.WriteLine(delDividir(1, 2));


Console.ReadKey();


public delegate double Operacao(double x, double y);


