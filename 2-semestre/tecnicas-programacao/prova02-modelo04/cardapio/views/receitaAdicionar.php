<?php
require_once "header.php";

// var_dump($_POST);

?>
<div class="content">
	<div class="container">
		<h1>Adicionar receita</h1><br>
		<form action="/cardapio/receitas/adicionar" method="post">

			<label for="nome">Nome:</label>
			<input type="text" name="nome" id="nome" required>
			<br>
			<label>Chefs:</label>
			<select name="chef">
				<option value="0">Escolha um chef</option>
				<?php
				foreach ($chefs as $chef) {
					echo "<option value='{$chef->idchef}'>{$chef->nome}</option>";
				}
				?>
			</select>
			<div style="color:red;font-size:16px;padding:3px 12px">
				<?php echo $mensagem;
				?>
			</div>
			<br>
			<label>Descrição:</label>
			<textarea name="descricao" required></textarea>
			<br>


			<button type="submit" class="">Cadastrar</button>
		</form>
	</div>
</div>

<style>
		h1{
		color: cadetblue;
	}
	.container {
		min-height: 90vh;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	form {
		display: flex;
		flex-direction: column;
	}

	input,
	select {
		border: 2px solid cadetblue;
		border-radius: 50px;
		padding: 3px 8px;
	}

	textarea {
		width: 60vw;
		height: 300px;
		resize: none;
		border: 2px solid cadetblue;
		border-radius: 5px;
	}

	button {
		padding: 12px;
		border: 5px solid cadetblue;
		color: cadetblue;
		font-weight: bold;
		text-transform: uppercase;
		border-radius: 50px;
		max-width: 150px;
		align-self: center;
	}

	button:hover {
		cursor: pointer;
		background-color: cadetblue;
		color: white;
	}
</style>