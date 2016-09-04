<?php
session_start();
require "database.php";

//$IDToken = mysqli_real_escape_string($db, $_POST["IDToken"]);
$sql  = "SELECT questName FROM Quest";
$result = mysqli_query($db, $sql);
$quests = array();
while($row = mysqli_fetch_assoc($result)) {
	$quests[] = $row;
}
$userInfo["quests"] = $quests;
echo json_encode($userInfo);

exit();
?>