
function signupclick(){
var usr = document.getElementById("userName").value;

var pas = document.getElementById("password").value;

var emal = document.getElementById("email").value;

  localStorage.setItem("userName",usr);   
  localStorage.setItem("password",pas);
  
  window.open("logon.html");
}

function login() {

  
  var storedName = localStorage.getItem("userName");
  var storedPw = localStorage.getItem("password");

  var name = document.getElementById("user");
  var userPw = document.getElementById("pass");

  if(name.value == storedName && userPw.value == storedPw) {
    window.open("logon.html");
}else {
    alert('ERROR.');
}
}

function printdemo(){

  var storedName = localStorage.getItem("userName");
  var storedPw = localStorage.getItem("password");
  console.log(storedName);
  console.log(storedPw);
  
}


  

