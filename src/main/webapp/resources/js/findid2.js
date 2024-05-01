/**
 * 
 */function findpassword() {
		document.getElementById("findpassword").submit();
	}
	function signinform() {
		document.getElementById("signinform").submit();
	}

	//checkBox
	function change() {
		var email = document.getElementById("email");
		var tel = document.getElementById("tel");
		var telBox = document.getElementById("telBox");
		var emailBox = document.getElementById("emailBox");
		if (email.checked == true) {
			emailBox.style.display = "";
			telBox.style.display = "none";
		}
		if (tel.checked == true) {
			telBox.style.display = "";
			emailBox.style.display = "none";
		}
	}