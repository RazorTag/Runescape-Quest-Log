<?php
session_start();
require "database.php";

$questName = mysqli_real_escape_string($db, stripslashes($_POST["questName"]));
$userID = mysqli_real_escape_string($db, $_POST["userID"]);

if(!$questTree["questNotFound"] = !questExists($db, $questName)) { 
	$questTree["questTree"] = prereqQuests($db, $questName, $userID); 
}
echo json_encode($questTree);

function prereqQuests($db, $baseQuest, $userID) {
	$sql = "SELECT prerequisiteQuest FROM QuestPrerequisite WHERE baseQuest='$baseQuest'";
	$result = mysqli_query($db, $sql);
	$prereqQuests = array();
	if($result) {
		while($row = mysqli_fetch_assoc($result)) {
			$row["completed"] = questCompleted($db, $row["prerequisiteQuest"], $userID);
			$row["children"] = prereqQuests($db, $row["prerequisiteQuest"], $userID);
			$prereqQuests[] = $row;
		}
	}
	return $prereqQuests;
}

function questCompleted($db, $quest, $userID) {
	$sql = "SELECT userID FROM CompletedQuests WHERE userID='$userID' AND questName='$quest'";
	$result = mysqli_query($db, $sql);
	if($result) {
		if($row = mysqli_fetch_assoc($result)) {
			return true;
		}
	}
	return false;
}

function questExists($db, $quest) {
	$sql = "SELECT questName FROM Quest WHERE questName='$quest'";
	$result = mysqli_fetch_assoc(mysqli_query($db, $sql));
	if($result) { return true; }
	else { return false; }
}

exit();
?>