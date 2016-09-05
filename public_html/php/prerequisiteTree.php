<?php
session_start();
require "database.php";

$questName = $_POST["questName"];
//$questName = "Eadgar's Ruse";
$questTree["beforeCheck"] = $questName;
$questName = mysqli_real_escape_string($db, stripslashes($questName));

$questTree["afterCheck"] = $questName;

$questTree["questNotFound"] = !questExists($questName, $db);
if(!$questTree["questNotFound"]) { $questTree["questTree"] = prereqQuests($questName, $db); }
echo json_encode($questTree);

function prereqQuests($baseQuest, $db) {
	$sql = "SELECT prerequisiteQuest FROM QuestPrerequisite WHERE baseQuest='$baseQuest'";
	$result = mysqli_query($db, $sql);
	$prereqQuests = array();
	if($result) {
		while($row = mysqli_fetch_assoc($result)) {
		  $row["children"] = prereqQuests($row["prerequisiteQuest"], $db);
		  $prereqQuests[] = $row;
		}
	}
	return $prereqQuests;
}

function questExists($baseQuest, $db) {
	$sql = "SELECT * FROM Quest WHERE questName='$baseQuest'";
	$result = mysqli_fetch_assoc(mysqli_query($db, $sql));
	if($result) { return true; }
	else { return false; }
}

exit();
?>