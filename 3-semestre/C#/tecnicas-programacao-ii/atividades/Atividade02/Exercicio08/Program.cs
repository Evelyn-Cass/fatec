//8.Crie um programa que simula o download de um arquivo usando async/await.
//O programa deve exibir mensagens indicando o início e o término do download e, enquanto isso, continuar executando outras tarefas.
//•	Criar um método assíncrono BaixarArquivoAsync() que simula um download usando Task.Delay().
//•	Enquanto o download ocorre, o programa deve executar outra tarefa.
//•	Após o término do download, exibir uma mensagem confirmando a conclusão


using System;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        Console.WriteLine("Iniciando o download do arquivo...");
        Task downloadTask = BaixarArquivoAsync();

        Console.WriteLine("Contando ovelhinhas enquanto o download ocorre...");
        ContarOvelhas();

        await downloadTask; 
        Console.WriteLine("Download do arquivo concluído!");
    }

    static async Task BaixarArquivoAsync()
    { 
        await Task.Delay(5000);
    }

    static async Task ContarOvelhas()
    {
        for (int i = 0; i < 6; i++)
        {
            string verbo = (i == 0) ? "pulou" : "pularam";
            string ovelha = (i == 0) ? "ovelhinha" : "ovelhinhas";
            Console.WriteLine($" {i + 1} {ovelha} {verbo} a cerca...");
            await Task.Delay(1000);
        }
    }
}