//Delegate
//é um tipo como int, float... que representa um método com parâmetros e um tipo com retorno específico.
//A sua instância pode ser associada a qualquer método com assinatura Compatível e pode-ser invocar o método pela instância delegada.
// Utilizador para implementar eventos, funções anônimas. Tem-se a flexibilidade de implementar funcionalidades em tempo de execução.
//Três etapas:
//  1 - Declarar delegate
//  2 - Definir método destino
//  3 - Invocar ou chamar o delegate
//  [Modificador] delegate [tipo] [nome]([parâmentros])

void MeuMetodo(string msg)
{
    Console.WriteLine(msg);
}

//segunda parte
MeuDelegate del1 = new MeuDelegate(MeuMetodo);
MeuDelegate del2 = MeuMetodo;
MeuDelegate del3 = (msg) => Console.WriteLine(msg);

//terceira parte
del1.Invoke("Minha Mensagem!");
del2("Minha Mensagem 2");


Console.ReadKey();

//primeira parte
public delegate void MeuDelegate(string msg);


