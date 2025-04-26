//1.Criar um programa que tente abrir um arquivo de texto e exibir seu conteúdo.
//•	Capturar FileNotFoundException caso o arquivo não exista.
//•	Capturar UnauthorizedAccessException caso o programa não tenha permissão para acessar o arquivo.
//•	Exibir mensagens informativas para cada erro.
//•	Utilizar um bloco finally para exibir uma mensagem de encerramento.
//•	Observação: entrar com o caminho para o arquivo e utilizar File.ReadAllText(caminhoArquivo) para obter o conteúdo do arquivo.


using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("Digite o caminho do arquivo que deseja visualizar:");
        string? caminhoArquivo = Console.ReadLine();

        try
        {
            if (string.IsNullOrEmpty(caminhoArquivo))
            {
                throw new ArgumentException("O caminho não pode ser nulo ou vazio.");
            }

            string? conteudo = File.ReadAllText(caminhoArquivo);
            Console.WriteLine("Conteúdo do arquivo:");
            Console.WriteLine(conteudo);
        }
        catch (ArgumentException ex)
        {
            Console.WriteLine(ex.Message);
        }
        catch (FileNotFoundException)
        {
            Console.WriteLine("Arquivo não encontrado.");
        }
        catch (UnauthorizedAccessException)
        {
            Console.WriteLine("Acesso ao arquivo não foi autorizado.");
        }
        finally
        {
            Console.WriteLine("Encerrando o programa.");
        }
    }
}
