$(document).ready(function(){
  $("#loadQuestButton").click(function(){
  	var selectedQuest = $("#questName").val();
    $.post("php/prerequisiteTree.php",
      {questName: selectedQuest},
      function(data, status){
      	if(status == "success"){
      		if(data == ""){ $("#baseQuest").html(selectedQuest + " has no prerequisites"); }
					else{ $("#baseQuest").html("Prerequisites for " + selectedQuest); }
      		createQuestTree(data);
      	}
      	else{
      		alert("Failed to load " + questName);
      		$("#baseQuest").html("");
      	}
    	},
      "json"
    );
  });

  $('#questName').keypress(function(e){
    if(e.keyCode == 13)
    $('#loadQuestButton').click();
  });

  $('#questName').focus();
});


function createQuestTree(questTree)
{
	var tree = "";

	tree += "<ul>"
	for(var i = 0; i < questTree.length; i++)	{
		tree += "<li>" + subTree(questTree[i]) + "</li>";
	}
	tree += "</ul>";

	$("#questTree").html(tree);
}


function subTree(subTreeNode)
{
	var tree = "";
	tree += subTreeNode.prerequisiteQuest;
	if(subTreeNode.children.length > 0)
	{
		tree += "<ul>"
		for(var i = 0; i < subTreeNode.children.length; i++) {
			tree += "<li>" + subTree(subTreeNode.children[i]) + "</li>";
		}
		tree += "</ul>";
	}
	return tree;
}