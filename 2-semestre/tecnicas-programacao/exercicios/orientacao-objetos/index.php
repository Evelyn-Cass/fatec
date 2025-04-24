<?php

require_once "Paciente.class.php";
require_once "Agenda.class.php"; 
require_once "Horario.class.php";
require_once "Consulta.class.php";
require_once "Servico.class.php";
require_once "LimpezaRestauracao.class.php";
require_once "Exame.class.php";

$paciente = new Paciente("João da Silva","12345-6","Rua das Laranjeiras, 10","11 99999-9999","21/05/1980","Gerente");

echo "<div>";
echo "<b>Paciente:</b><br>";
echo "<b>Nome:</b> {$paciente->getNome()}<br>";
echo "<b>RG:</b> {$paciente->getRg()}<br>";
echo "<b>Endereço:</b> {$paciente->getEndereco()}<br>";
echo "<b>Telefone:</b> {$paciente->getTelefone()}<br>";
echo "<b>Data de nascimento:</b> {$paciente->getDataNascimento()}<br>";
echo "<b>Cargo:</b> {$paciente->getProfissao()}<br>";
echo "</div>";


$agenda = new Agenda("2024");

echo "<div>";
echo "<b>Agenda:</b><br>";
echo "<b>Ano:</b> {$agenda->getAno()}<br>";
echo "</div>";

$horario = new Horario("02/05/2024","10:00");

echo "<div>";
echo "<b>Horário:</b><br>";
echo "<b>Data:</b> {$horario->getData()}<br>";
echo "<b>Hora:</b> {$horario->getHora()}<br>";
echo "</div>";

$consulta = new Consulta("Braço quebrado");

echo "<div>";
echo "<b>Consulta:</b><br>";
echo "<b>Historico:</b> {$consulta->getHistorico()}<br>";
echo "</div>";

$limpezaRestauracao = new LimpezaRestauracao("Resina Nº. 123","Dente Nº 21","Dente quebrado",321.50);

echo "<div>";
echo "<b>Limpeza e Restauração:</b><br>";
echo "<b>Descricão:</b> {$limpezaRestauracao->getDescricao()}<br>";
echo "<b>Dente tratado:</b> {$limpezaRestauracao->getDenteTratado()}<br>";
echo "<b>Material:</b> {$limpezaRestauracao->getMaterialUsado()}<br>";
echo "<b>Preço:</b> R$ ".number_format($limpezaRestauracao->getPreco(),'2',',','.')."<br>";
echo "</div>";

$exame = new Exame("Diabetes","Sangue","Glucose",29.99);

echo "<div>";
echo "<b>Exame:</b><br>";
echo "<b>Prevenção</b>: {$exame->getMedidaPreventiva()}<br>";
echo "<b>Tipo:</b> {$exame->getTipoExame()}<br>";
echo "<b>Descricão:</b> {$exame->getDescricao()}<br>";
echo "<b>Preço:</b> R$ ".number_format($exame->getPreco(),'2',',','.')."<br>";
echo "</div>";

?>

<style>
    div{
        border-bottom: 1px solid black;
        width: 30%;
        padding: 10px 0;
    }
</style>