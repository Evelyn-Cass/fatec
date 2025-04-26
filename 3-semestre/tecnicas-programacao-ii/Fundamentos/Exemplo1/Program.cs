// This file has been developed ond the day of: 17/02/2025

Console.WriteLine("Cálculo do IMC");

Console.WriteLine("Informe seu nome:");
string nome = Console.ReadLine() ?? "";

Console.WriteLine("Informe seu peso (kilos):");
double peso = Convert.ToDouble(Console.ReadLine());

Console.WriteLine("Informe sua altura (metros):");
double? altura = double.Parse(Console.ReadLine());

double imc = peso / Math.Pow(altura.Value, 2);

string resultado;

switch (imc)
{
    case < 18.5:
        resultado = "Abaixo do peso";
        break;
    case < 24.9:
        resultado = "Peso normal";
        break;
    case < 29.9:
        resultado = "Sobrepeso";
        break;
    default:
        resultado = "Obesidade";
        break;
       
}

Console.WriteLine($"{nome}, seu IMC é {imc}[{resultado}]");

Console.ReadLine();
