window.onload = function init() {
    //this is where we will be use to implement backend to get user password, username, and email
    var current = "Spongebob";//the following values are placeholders, they will be set once backend is implements
    var password = "KrustyKrab";
    var email = "boogeybob@gmail.com"
    
    var cuser = document.getElementById("cuser");
    cuser.innerHTML = "Current Username: " + current;
    var cmail = document.getElementById("cmail");
    cmail.innerHTML = "Current email: " + email;

    var topshow = document.getElementById("top_shows");
    //this is where we will go through the database and get the name and author of shows that user have added to favorites
    var show = "Spongebob Squarepants";//these are placeholders
    var rank = 1;
    var author = "Stephen Hillenburg";
    var showname = rank + ". " + show + " by " + author;
    var shows = document.createElement("p");
    var node = document.createTextNode(showname);
    shows.appendChild(node);
    topshow.appendChild(shows);

    document.getElementById("button").addEventListener("click",change_user);
    document.getElementById("button2").addEventListener("click",change_mail);
    document.getElementById("button3").addEventListener("click",change_pass);
}

function change_user(){
    var cuser = document.getElementById("cuser");
    var user = document.getElementById("username");
    var reuser = document.getElementById("username2");
    if(user.value.length<3) {
	alert("Username must be at least 3 characters!");
    } else if(user.value!==reuser.value) {
	alert("Usernames must match!");
    } else {//username doesn't change for now, it will change once backend is implemented
	alert("You're username has been changed.");
	//implementation of backend
    }
}

function change_mail() {
    var regex = /[A-Za-z1-9]{1,}[@]{1}[A-Za-z]{1,}[\.]{1}[A-Za-z]{1,}/
    var email = document.getElementById("email");
    if(email.value < 3) {
	alert("Please enter in a valid email address!");
    } else  if(regex.test(email.value)==false) {
	alert("Please enter in a valid email address!");
    } else {
	alert("Email has been change.");
    }
}

function change_pass() {
    //implementation of backend here
    var password = "BandGeeks";//placeholder password
    var cpass = document.getElementById("cpass").value;
    var pass = document.getElementById("newpass").value;
    var repass = document.getElementById("newpass2").value;
    if(pass!==repass) {
	alert("Passwords must match!");
    } else if(password!==cpass) {
	alert("Wrong password!");
    } else if(pass.length<3) {
	alert("You're new password needs to be at least 3 characters long");
    }else {
	alert("You're password has been changed!");
    }
}
