//3.Exercício: Sistema de Contagem de Cliques
//Descrição:
//Você vai criar um sistema que simula a contagem de cliques em um botão. Sempre que o botão for clicado, um evento será disparado para notificar que o clique ocorreu. Não será necessário passar informações no evento além de simplesmente dispará-lo.
//Requisitos:
//1.Crie uma classe chamada Botao que possui um evento chamado Clique.
//2.	Crie uma classe chamada ContadorCliques que se inscreve no evento Clique e conta o número de cliques.
//3.	A classe Botao deve ter um método chamado SimularClique que dispara o evento Clique toda vez que é chamado.
//4.	A classe ContadorCliques deve exibir no console a quantidade de cliques sempre que o evento for acionado.
//5.	O evento Clique não passará parâmetros.
//Objetivo:
//•	Demonstrar como criar e manipular eventos simples em C#.
//•	Trabalhar com eventos sem passar parâmetros para os manipuladores de evento.
//•	Observação:
//•	Não utilizar Delegate pré-definido.



Botao botao = new Botao();
ContadorCliques contador = new ContadorCliques(botao);

// Simulando cliques no botão
botao.SimularClique();
botao.SimularClique();
botao.SimularClique();



// Classe Botao que possui um evento chamado Clique
public class Botao
{
    // Definição do evento Clique
    public event Action Clique;

    // Método para simular o clique e disparar o evento
    public void SimularClique()
    {
        Clique?.Invoke();
    }
}

// Classe ContadorCliques que se inscreve no evento Clique
public class ContadorCliques
{
    private int _contador;

    // Construtor que se inscreve no evento Clique do Botao
    public ContadorCliques(Botao botao)
    {
        botao.Clique += IncrementarContador;
    }

    // Método para incrementar o contador e exibir no console
    private void IncrementarContador()
    {
        _contador++;
        Console.WriteLine($"Número de cliques: {_contador}");
    }
}
