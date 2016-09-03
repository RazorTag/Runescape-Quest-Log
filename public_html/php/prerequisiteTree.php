<?php
session_start();
require "database.php";

$questName = mysqli_real_escape_string($db, $_POST["questName"]);
$questTree = prereqQuests($questName, $db);
echo json_encode($questTree);

function prereqQuests($baseQuest, $db) {
	$sql = "SELECT prerequisiteQuest FROM QuestPrerequisite WHERE baseQuest='$baseQuest'";
	$result = mysqli_query($db, $sql);
	$prereqQuests = array();
	if($result) {
		while($row = mysqli_fetch_assoc($result))
		{
		  $row["children"] = prereqQuests($row["prerequisiteQuest"], $db);
		  $prereqQuests[] = $row;
		}
	}
	return $prereqQuests;
}

exit();
?>