<?php
require_once "header.php";
?>
<div class="content">
	<div class="container">
		<h2><?php if(isset($_GET["mensagem"])){ echo $_GET["mensagem"];}; ?></h2>
		<br>
		<h1>Receitas</h1>
		<br>
		<table class="table table-striped">
			<tr>
				<th>Nome</th>
				<th>Descricao</th>
				<th>Chef</th>
				<th>Especialidade</th>
			</tr>
			<?php
			foreach ($receitas as $receita) {
				echo "
					<tr>
					<td>{$receita->nome}</td>
					<td>{$receita->descricao}</td>
					<td>{$receita->chef_nome}</td>
					<td>{$receita->especialidade}</td>
					";
			} //fim foreach
			echo "</tr>";
			?>
		</table>
	</div>
</div>
</body>

</html>

<style>
	h1 {
		color: cadetblue;
	}
	h2{color: green;}
	.container {
		min-height: 80vh;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	table {
		min-width: 80%;
	}

	tr {
		padding: 6px;
		font-weight: normal;
	}

	tr td {
		border-bottom: 1px solid cadetblue;
		padding: 8px 8px;
	}

	tr:first-child th {
		background-color: cadetblue;
		border: 1px solid cadetblue;
		color: white;
		padding: 6px;
		font-weight: normal;
	}
</style>