/**
 * 
 */
  var emailNumBox = document.getElementById("emailNumBox");
  var emailNum = document.getElementById("emailNum");
  
  function emailSend() {
	$.ajax({
		url: "emailSend",
		method: "POST",
		data: { "email": $("#email").val() },
		async: false,
		success: function(res) {
			emailNum.value = res;
		},
		error: function(error) {
			console.log(error)
		}
	})
	alert("이메일이 재전송 되었습니다");
}
  
 
  
  function findpassword1() {
		document.getElementById("findpassword1").submit();
	}
  function findpassword3() {
  		if(emailNum.value == emailNumBox.value) {
			document.getElementById("findpassword3").submit();
		} else {
			alert("인증번호가 일치하지않습니다.");
		}
	}