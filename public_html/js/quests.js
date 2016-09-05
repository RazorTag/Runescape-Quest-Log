var userID = "";
var loggedIn = false;
var prereqList;
var loadedQuest = "";

$(document).ready(function() {
  initialize();
});

function onSignIn(googleUser) {
  $("#signOutButton").removeClass("hidden");
  userID = googleUser.getBasicProfile().getId();
  loadQuestTree(loadedQuest);
  loggedIn = true;
}

function signOut() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signOut().then(function () {
    $("#signOutButton").addClass("hidden");
    loggedIn = false;
    userID = "";
    removeCompletedStatus();
  });
}

function loadQuestList() {
  $.get("php/loadQuestList.php",
    function(data, success) {
      $("#questSelect").html("");
      $(data.quests).each(function() {
        $("#questSelect").append($("<option>").attr('value', this.questName).text(this.questName));
      });
    },
    "json"
  );

  $("#questSelect").removeClass("hidden");
}

function initialize() {
  loadQuestList();

  $("#signOutButton").click(signOut);

  $("#questName").keypress(function(e) {
    if(e.keyCode == 13) { loadQuestTree(); }
  });
  $("#questName").focus();
  $("#questSelect").change(function() {
    $("#questName").val($("#questSelect").val());
    loadQuestTree();
  });
  $("#questTree").on("click", "li", clickQuest);
}

function loadFacebookSDK() {
  window.fbAsyncInit = function() {
    FB.init({
      appId      : 'your-app-id',
      xfbml      : true,
      version    : 'v2.7'
    });
  };

  (function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) {return;}
      js = d.createElement(s); js.id = id;
      js.src = "//connect.facebook.net/en_US/sdk.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk')
  );
}

function loadQuestTree(selectedQuest) {
  if(!selectedQuest) { selectedQuest = $("#questName").val(); }
  if(!selectedQuest) { return; }
  $.post("php/prerequisiteTree.php",
    {questName: selectedQuest, userID: userID},
    function(data, status) {
      console.log(data);
      if(status == "success") {
        loadedQuest = selectedQuest;
        if(data.questNotFound) { 
          clearQuestTree();
          $("#baseQuest").html(selectedQuest + " not found");
        }
        else {
          if(data.questTree == "") { 
            clearQuestTree();
            $("#baseQuest").html(selectedQuest + " has no prerequisites"); 
          }
          else { 
            $("#baseQuest").html("Prerequisites for " + selectedQuest); 
            createQuestTree(data.questTree);
          }
        }
      }
      else{
        alert("Failed to load " + questName);
        $("#baseQuest").html("");
      }
    },
    "json"
  );
}

function clearQuestTree() {
  $("#baseQuest").html("");
  $("#questTree").html("");
}

function createQuestTree(questTree) {
  prereqList = [];
	$("#questTree").html(subTree(questTree));
}

function subTree(questTree) {
	var tree = "";
  var li;

  if(questTree.length == 0) { return ""; }
  
  tree = $("<ul>");
  for(var i = 0; i < questTree.length; i++) {
    li = $("<li>").html(questTree[i].prerequisiteQuest);
    li.val(prereqList.length);
    prereqList.push(questTree[i].prerequisiteQuest);
    li.addClass(questClass(li, questTree[i].completed));
    tree.append(li);
    tree.append(subTree(questTree[i].children));
  }
  return tree;
}

function removeCompletedStatus() {
  $("li").each(function() {
    questClass($(this));
  });
}

function questClass(li, completed) {
  li.removeClass("liChecked");
  li.removeClass("liUnchecked");
  li.removeClass("liLoggedOut");

  if(loggedIn) {
    if(completed) { li.addClass("liChecked"); }
    else { li.addClass("liUnchecked"); }
  }
  else { li.addClass("liLoggedOut"); }
}

function clickQuest() {
  var li;

  if(loggedIn) {
    li = $(this);
    li.toggleClass("liUnchecked");
    li.toggleClass("liChecked");

    $.post("php/toggleQuestCompleted.php",
      {userID: userID, questName: prereqList[$(this).val()]},
      function(data, status) {
        questClass(li, data);
      },
      "json"
    );
  }
}