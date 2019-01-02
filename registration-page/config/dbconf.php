<?php
$dbhost = "127.0.0.1";
$dbuser = "trinity";
$dbpass = "trinity";
$accdb = "auth";
$chardb = "utf8";

$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $accdb);
mysqli_set_charset($conn, $chardb);
?>
