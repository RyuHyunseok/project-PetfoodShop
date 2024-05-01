/**
 * 
 */
		var originalPasswordBox = document
				.getElementById("originalPasswordBox");
		var passwordBox = document.getElementById("passwordBox");
		
		function ajaxMemberDelete() {
			$.ajax({
				url: "ajaxMemberDelete",
				method: "POST",
				async: false,
				success: function() {},
				error: function(error) {
					console.log(error);
				}
			});
		}
		
		function passwordChk() {
			var bool = false;
			if (passwordBox.value != "") {
				if (passwordBox.value == originalPasswordBox.value) {
					bool = true;
				} else {
					alert("비밀번호가 다릅니다. 다시 확인 바랍니다.");
				}
			} else {
				alert("비밀번호를 입력해주세요.")
			}
			
			if(bool) {
				ajaxMemberDelete();
				alert("탈퇴가 정상적으로 처리되었습니다.");
			}
			return bool
		}