<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    header('location: login.php');
}
echo "Bem-vindo ao Dashboard!";
?>
<a href="logout.php">Logout</a>
