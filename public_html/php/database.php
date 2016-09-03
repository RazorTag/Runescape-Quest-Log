<?php

// Database configuration
$db_host = "localhost"; // Host name
$db_username = "doomt_doomturtle"; // Mysql username
$db_password = "Rqjh7!42"; // Mysql password
$db_name = "doomturtle_RunescapePrerequisites"; // Database name

// Connect to server and select databse.
$db = mysqli_connect($db_host, $db_username, $db_password, $db_name);

if($db->connect_errno > 0){
    die('Unable to connect to database [' . $db->connect_error . ']');
}

?>