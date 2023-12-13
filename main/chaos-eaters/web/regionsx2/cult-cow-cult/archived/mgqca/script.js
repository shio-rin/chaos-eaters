var secret = "secretcow";
var password = "cultcow";

const element = document.getElementById("button");
element.addEventListener("click", myFunction);

function myFunction() {
  var x = prompt("Enter in the code "," ");
if (x.toLowerCase() == password) {
  alert("Come right in \n \n You've entered in the right code");
window.open('https://cult-cow-corporation.konstantineduno.repl.co/');
}

else if (x.toLowerCase() == secret) {
  alert("Secret code? \n \n welcome, devoloper");
  window.open("https://replit.com/join/jlwohxlzde-isaacsperli");
}


else {
  window.open('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
}
}
