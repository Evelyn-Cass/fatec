<!doctype html>
<html>

<head>
  <title>Restaurante</title>
  <meta charset="UTF-8">
</head>

<body>
  <div class="menu">
    <a class="nav-link fs-4" href="/cardapio/receitas">Receitas</a>
    <a class="nav-link fs-4" href="/cardapio/receitas/adicionar">Nova Receita</a>
    </nav>
  </div>

  <style>
    * {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
      font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    }

    .menu {
      background-color: cadetblue;
      width: 100vw;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: end;
    }

    a {
      text-decoration: none;
      padding: 0 16px;
      color: white;
      font-weight: 300;
    }
    a:hover{
      text-decoration: underline;
    }
  </style>