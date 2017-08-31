<?php
session_start();
session_destroy();
echo "string";
header("Location:login.php");

?>
