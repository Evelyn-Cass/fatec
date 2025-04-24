<?php
session_start();
session_destroy();
setcookie("usuario", "", time() - 3600, "/"); // Remove cookie
header('location: login.php');
?>
