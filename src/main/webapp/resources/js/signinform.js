function signupform1() {
	document.getElementById("signupform1").submit();
}
function findid() {
	document.getElementById("findid").submit();
}
function findpassword() {
	document.getElementById("findpassword").submit();
}

function login() {
	var id = document.getElementById("id");
	var password = document.getElementById("password")
	if (id.value == "" || password.value == "") {
		alert("아이디 또는 비밀번호를 입력해주세요.");
	} else {
		$.ajax({
			url: "logincheck",
			method: "post",
			data: {"username" : id.value,
					"password" : password.value
					},
			success: function(data) {
				if(data == "success") {
					document.getElementById("logincheck").submit();
				} else if(data == "admin") {
					document.getElementById("admin").submit();
				} else if(data == "error") {
					alert("아이디 또는 비밀번호를 잘못 입력하셨습니다")
				}
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		})
	}
}