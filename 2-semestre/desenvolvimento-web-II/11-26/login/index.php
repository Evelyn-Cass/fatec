<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inicial</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            font-size: 16px;
            color: white;
            background-color: #007BFF; /* Cor azul */
            text-decoration: none; /* Remove o sublinhado */
            border-radius: 5px; /* Bordas arredondadas */
            transition: background-color 0.3s; /* Efeito de transição */
        }
        .button:hover {
            background-color: #0056b3; /* Cor ao passar o mouse */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bem-vindo ao Sistema</h1>
        <a href="login.php" class="button">Login</a>
        <a href="registro.php" class="button">Registrar</a>
    </div>
</body>
</html>
