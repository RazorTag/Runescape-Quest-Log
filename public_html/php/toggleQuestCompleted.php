<?php
session_start();
require "database.php";

//$_POST["userID"] = "366365";
//$_POST["questName"] = "Desert Treasure";
$userID = mysqli_real_escape_string($db, $_POST["userID"]);
$questName = mysqli_real_escape_string($db, stripslashes($_POST["questName"]));

if(($userID != "") AND ($questName != "")) {
	if(questExists($db, $questName)) {
		$sql = "SELECT questName FROM CompletedQuests WHERE userID='$userID' AND questName='$questName'";
		$result = mysqli_query($db, $sql);
		if($row = mysqli_fetch_assoc($result)) {
			$sql = "DELETE FROM CompletedQuests WHERE userID='$userID' AND questName='$questName'";
			if(mysqli_query($db, $sql)) { $completed = false; }
			else { $completed = true; }
		}
		else {
			$sql = "INSERT INTO CompletedQuests(userID, questName) VALUES('$userID', '$questName')";
			if(mysqli_query($db, $sql)) { $completed = true; }
			else { $completed = false; }
		}
	}
}
echo json_encode($completed);

function questExists($db, $quest) {
	$sql = "SELECT questName FROM Quest WHERE questName='$quest'";
	$result = mysqli_fetch_assoc(mysqli_query($db, $sql));
	if($result) { return true; }
	else { return false; }
}

exit();
?>