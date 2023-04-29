const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
	container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
	container.classList.remove("right-panel-active");
});

function showps() {
	var x = document.getElementById("pass");
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}

}
function showpsr() {
	var y = document.getElementById("spswd");
	if (y.type === "password") {
		y.type = "text";
	} else {
		y.type = "password";
	}

}