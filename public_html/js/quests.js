$(document).ready(function() {
  initialize();
});

function onSignIn(googleUser) {
  var id_token = googleUser.getAuthResponse().id_token;
  loadUserInfo(id_token);
  $("#signOutButton").removeClass("hidden");
}

function signOut() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signOut().then(function () {
    clearUserInfo();
    $("#signOutButton").addClass("hidden");
  });
}

function loadUserInfo(IDToken) {
  $.post("php/loadUserInfo.php",
    {IDToken: IDToken},
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

function clearUserInfo() {

}

function initialize() {
  loadUserInfo();

  $("#signOutButton").click(signOut);

  $("#questName").keypress(function(e) {
    if(e.keyCode == 13) {
      loadQuestTree();
    }
  });
  $("#questName").focus();
  $("#questSelect").change(function() {
    $("#questName").val($("#questSelect").val());
    loadQuestTree();
  });
  $("#questTree").on("click", "li", clickQuest);
}

function loadConstants() {

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

function loadQuestTree() {
  var selectedQuest = $("#questName").val();
  $.post("php/prerequisiteTree.php",
    {questName: selectedQuest},
    function(data, status) {
      console.log(data.beforeCheck);
      console.log(data.afterCheck);
      if(status == "success") {
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
	$("#questTree").html(subTree(questTree));
}

function subTree(questTree) {
	var tree = "";

  if(questTree.length == 0) { return ""; }
  
  tree = $("<ul>");
  for(var i = 0; i < questTree.length; i++) {
    tree.append($("<li>").html(questTree[i].prerequisiteQuest).addClass("liUnchecked"));
    tree.append(subTree(questTree[i].children));
  }
  return tree;
}

function clickQuest() {
  $(this).toggleClass("liUnchecked");
  $(this).toggleClass("liChecked");
  console.log($(this).html());
}