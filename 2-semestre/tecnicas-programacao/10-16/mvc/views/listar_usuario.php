<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Usuários</title>
</head>

<body>
    <h1>Listar Usuários</h1>
    <a href="index.php?controle=usuarioController&metodo=inserir">Novo Usuário</a>
    <table border="1">
        <tr>
            <th>Nome</th>
            <th>Ações</th>
        </tr>
        <tr>
            <?php
            foreach ($retorno as $usuario) {
                echo "
                        <td>
                            {$usuario}
                        </td>
                        <td>
                            <a href='index.php?controle=usuarioController&metodo=alterar'>Alterar</a>
                            <a href='index.php?controle=usuarioController&metodo=excluir'>Excluir</a>
                        </td>
                        </tr>
                ";
            }
            ?>
    </table>
</body>

</html>