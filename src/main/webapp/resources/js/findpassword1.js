/**
 * 
 */

function emailSend() {
	$.ajax({
		url: "emailSend",
		method: "POST",
		data: { "email": $("#email").val() },
		async: false,
		success: function(res) {
		},
		error: function(error) {
			console.log(error)
		}
	})
}

var nameBox = document.getElementById("nameBox");
var idBox = document.getElementById("idBox");
var bool = false;

function findpassword2() {
	if (searchMember() == true) {
		emailSend();
		alert("회원정보에 등록된 이메일로 인증번호가 발송되었습니다.");
		document.getElementById("findpassword2").submit();
	} else {
		document.getElementById("message3").style.display = "";
		bool = true;
	}
}


function deleteMessage() {
	if (bool) {
		document.getElementById("message3").style.display = "none";
		bool = false;
	}
}
nameBox.addEventListener("input", deleteMessage)
idBox.addEventListener("input", deleteMessage)

function searchMember() {
	var memberBool = false;
	$.ajax({
		url: "searchMember2",
		method: "POST",
		async: false,
		data: {
			"name": nameBox.value,
			"username": idBox.value
		},
		success: function(res) {
			if (res != "error") {
				memberBool = true;
				document.getElementById("email").value = res;
			}
		},
		error: function(xhr, status, error) {
			console.error('데이터 전송 실패:', error);
		}
	});
	return memberBool;
}