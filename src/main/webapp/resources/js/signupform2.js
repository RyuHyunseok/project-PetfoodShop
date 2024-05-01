

// select box Start
var x, i, j, l, ll, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select2");
l = x.length;
for (i = 0; i < l; i++) {
	selElmnt = x[i].getElementsByTagName("select")[0];
	ll = selElmnt.length;
	/*for each element, create a new DIV that will act as the selected item:*/
	a = document.createElement("DIV");
	a.setAttribute("class", "select-selected");
	a.setAttribute("id", "selectBoxEdit");
	a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	x[i].appendChild(a);
	/*for each element, create a new DIV that will contain the option list:*/
	b = document.createElement("DIV");
	b.setAttribute("class", "select-items select-hide");
	for (j = 1; j < ll; j++) {
		/*for each option in the original select element,
		create a new DIV that will act as an option item:*/
		c = document.createElement("DIV");
		c.setAttribute("class", "selectBoxEdit3");
		c.innerHTML = selElmnt.options[j].innerHTML;
		c
			.addEventListener(
				"click",
				function(e) {
					/*when an item is clicked, update the original select box,
					and the selected item:*/

					var y, i, k, s, h, sl, yl;
					s = this.parentNode.parentNode
						.getElementsByTagName("select")[0];
					sl = s.length;
					h = this.parentNode.previousSibling;
					for (i = 0; i < sl; i++) {
						if (s.options[i].innerHTML == this.innerHTML) {
							s.selectedIndex = i;
							h.innerHTML = this.innerHTML;
							y = this.parentNode
								.getElementsByClassName("same-as-selected");
							yl = y.length;
							for (k = 0; k < yl; k++) {
								y[k].removeAttribute("class");
							}
							this.setAttribute("class",
								"same-as-selected");
							this.setAttribute("class",
								"selectBoxEdit3");
							break;
						}
					}
					h.click();
					emailAuto()
				});
		b.appendChild(c);
	}
	x[i].appendChild(b);
	a.addEventListener("click", function(e) {
		/*when the select box is clicked, close any other select boxes,
		and open/close the current select box:*/
		e.stopPropagation();
		closeAllSelect(this);
		this.nextSibling.classList.toggle("select-hide");
		this.classList.toggle("select-arrow-active");
	});
}
function closeAllSelect(elmnt) {
	/*a function that will close all select boxes in the document,
	except the current select box:*/
	var x, y, i, xl, yl, arrNo = [];
	x = document.getElementsByClassName("select-items");
	y = document.getElementsByClassName("select-selected");
	xl = x.length;
	yl = y.length;
	for (i = 0; i < yl; i++) {
		if (elmnt == y[i]) {
			arrNo.push(i)
		} else {
			y[i].classList.remove("select-arrow-active");
		}
	}
	for (i = 0; i < xl; i++) {
		if (arrNo.indexOf(i)) {
			x[i].classList.add("select-hide");
		}
	}
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
//select box end

//address service
function sample4_execDaumPostcode() {
	new daum.Postcode(
		{
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== ''
					&& /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== ''
					&& data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('address1').value = data.zonecode;
				document.getElementById("address2").value = roadAddr;
				document.getElementById("address3").value = data.jibunAddress;

				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if (data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress
						+ extraRoadAddr;
					guideTextBox.innerHTML = '(예상 도로명 주소 : '
						+ expRoadAddr + ')';
					guideTextBox.style.display = 'block';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					guideTextBox.innerHTML = '(예상 지번 주소 : '
						+ expJibunAddr + ')';
					guideTextBox.style.display = 'block';
				} else {
					guideTextBox.innerHTML = '';
					guideTextBox.style.display = 'none';
				}
			}
		}).open();
}

//check

//id start
var idBox = document.getElementById("idBox");
var idMessage = document.getElementById("idMessage");
var nameBox = document.getElementById("nameBox");
var address4 = document.getElementById("address4");

function idChk() {
	if (idBox.value != "") {
		if (idBox.value.length < 4) {
			idBox.style.border = "1px solid #D80707";
			idMessage.style.color = "#D80707";
			idMessage.innerHTML = "최소 4글자 이상 입력해 주세요."

			bool2 = false;

			passwordBox.removeEventListener("blur", passwordChk)
			passwordChkBox.removeEventListener("blur", passwordChkChk)
			emailBox.removeEventListener("blur", emailChk)

			passwordBox.readOnly = true;
			passwordChkBox.readOnly = true;
			nameBox.readOnly = true;
			emailBox.readOnly = true;
			telBox.readOnly = true;
			address4.readOnly = true;
		} else if (usernameChk() == false) {
			idBox.style.border = "1px solid #D80707";
			idMessage.style.color = "#D80707";
			idMessage.innerHTML = "이미 등록된 아이디입니다. 다른 아이디를 입력해 주세요.";

			bool2 = false;

			passwordBox.removeEventListener("blur", passwordChk)
			passwordChkBox.removeEventListener("blur", passwordChkChk)
			emailBox.removeEventListener("blur", emailChk)

			passwordBox.readOnly = true;
			passwordChkBox.readOnly = true;
			nameBox.readOnly = true;
			emailBox.readOnly = true;
			telBox.readOnly = true;
			address4.readOnly = true;
		} else {
			idBox.style.border = "1px solid #dadada";
			idMessage.style.color = "#7fad39";
			idMessage.innerHTML = "사용가능한 아이디 입니다.";

			bool2 = true;

			passwordBox.addEventListener("blur", passwordChk)
			passwordChkBox.addEventListener("blur", passwordChkChk)
			emailBox.addEventListener("blur", emailChk)

			passwordBox.readOnly = false;
			passwordChkBox.readOnly = false;
			nameBox.readOnly = false;
			emailBox.readOnly = false;
			telBox.readOnly = false;
			address4.readOnly = false;
		}
	} else {
		idBox.style.border = "1px solid #DADADA";
		idMessage.innerHTML = "";

		passwordBox.addEventListener("blur", passwordChk)
		passwordChkBox.addEventListener("blur", passwordChkChk)
		emailBox.addEventListener("blur", emailChk)

		passwordBox.readOnly = false;
		passwordChkBox.readOnly = false;
		nameBox.readOnly = false;
		emailBox.readOnly = false;
		telBox.readOnly = false;
		address4.readOnly = false;
	}
}
idBox.addEventListener("blur", idChk)

function checkReg(event) {
	const regExp = /[^0-9a-zA-Z]/g; // 숫자와 영문자만 허용
	//   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
	const del = event.target;
	if (regExp.test(del.value)) {
		del.value = del.value.replace(regExp, '');
	}
};
function checkReg3(event) {
	const del = event.target;
		del.value = del.value.replace(' ', '');
};
//id end

//password start
var passwordBox = document.getElementById("passwordBox");
var passwordMessage = document.getElementById("passwordMessage");
function passwordChk() {
	var regExp = /^[A-Za-z0-9]{6,12}$/;
	if (passwordBox.value != "") {
		if (this.value.match(regExp)) {
			passwordMessage.innerHTML = ""
			passwordBox.style.border = "1px solid #DADADA";

			bool2 = true;

			idBox.addEventListener("blur", idChk)
			passwordChkBox.addEventListener("blur", passwordChkChk)
			emailBox.addEventListener("blur", emailChk)

			idBox.readOnly = false;
			passwordChkBox.readOnly = false;
			nameBox.readOnly = false;
			emailBox.readOnly = false;
			telBox.readOnly = false;
			address4.readOnly = false;

			passwordChkChk();
		} else {
			passwordBox.style.border = "1px solid #D80707";
			passwordMessage.style.color = "#D80707";
			passwordMessage.innerHTML = "비밀번호는 숫자 또는 문자 포함 형태의 6~12자리 이여야합니다."

			bool2 = false;

			idBox.removeEventListener("blur", idChk)
			passwordChkBox.removeEventListener("blur", passwordChkChk)
			emailBox.removeEventListener("blur", emailChk)

			idBox.readOnly = true;
			passwordChkBox.readOnly = true;
			nameBox.readOnly = true;
			emailBox.readOnly = true;
			telBox.readOnly = true;
			address4.readOnly = true;
		}
	} else {
		passwordBox.style.border = "1px solid #DADADA";
		passwordMessage.innerHTML = "";

		idBox.addEventListener("blur", idChk)
		passwordChkBox.addEventListener("blur", passwordChkChk)
		emailBox.addEventListener("blur", emailChk)

		idBox.readOnly = false;
		passwordChkBox.readOnly = false;
		nameBox.readOnly = false;
		emailBox.readOnly = false;
		telBox.readOnly = false;
		address4.readOnly = false;
	}
}
document.getElementById("passwordBox").addEventListener("blur",
	passwordChk)
//password end

//passwordChk start
var passwordChkBox = document.getElementById("passwordChkBox");
var passwordChkMessage = document.getElementById("passwordChkMessage");
function passwordChkChk() {
	if (passwordChkBox.value != "") {
		if (passwordBox.value == passwordChkBox.value) {
			passwordChkBox.style.border = "1px solid #DADADA";
			passwordChkMessage.innerHTML = "";

			bool2 = true;

			idBox.addEventListener("blur", idChk)
			passwordBox.addEventListener("blur", passwordChk)
			emailBox.addEventListener("blur", emailChk)

			idBox.readOnly = false;
			passwordBox.readOnly = false;
			nameBox.readOnly = false;
			emailBox.readOnly = false;
			telBox.readOnly = false;
			address4.readOnly = false;
		} else {
			passwordChkBox.style.border = "1px solid #D80707";
			passwordChkMessage.style.color = "#D80707";
			passwordChkMessage.innerHTML = "비밀번호가 서로 다릅니다.";

			bool2 = false;

			idBox.removeEventListener("blur", idChk)
			passwordBox.removeEventListener("blur", passwordChk)
			emailBox.removeEventListener("blur", emailChk)

			idBox.readOnly = true;
			passwordBox.readOnly = true;
			nameBox.readOnly = true;
			emailBox.readOnly = true;
			telBox.readOnly = true;
			address4.readOnly = true;
		}
	} else {
		passwordChkBox.style.border = "1px solid #DADADA";
		passwordChkMessage.innerHTML = "";

		idBox.addEventListener("blur", idChk)
		passwordBox.addEventListener("blur", passwordChk)
		emailBox.addEventListener("blur", emailChk)

		idBox.readOnly = false;
		passwordBox.readOnly = false;
		nameBox.readOnly = false;
		emailBox.readOnly = false;
		telBox.readOnly = false;
		address4.readOnly = false;
	}
}
passwordChkBox.addEventListener("blur", passwordChkChk)
//passwordChk end

//emailChk start
var emailBox = document.getElementById("emailBox");
var emailMessage = document.getElementById("emailMessage");
function emailChk() {
	var regExp = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;
	if (emailBox.value != "") {
		if (emailBox.value.match(regExp)) {
			emailMessage.innerHTML = ""
			emailBox.style.border = "1px solid #DADADA";

			bool2 = true;

			idBox.addEventListener("blur", idChk)
			passwordBox.addEventListener("blur", passwordChk)
			passwordChkBox.addEventListener("blur", passwordChkChk)

			idBox.readOnly = false;
			passwordBox.readOnly = false;
			nameBox.readOnly = false;
			passwordChkBox.readOnly = false;
			telBox.readOnly = false;
			address4.readOnly = false;
		} else {
			emailBox.style.border = "1px solid #D80707";
			emailMessage.style.color = "#D80707";
			emailMessage.innerHTML = "입력된 이메일은 잘못된 형식입니다."

			bool2 = false;

			idBox.removeEventListener("blur", idChk)
			passwordBox.removeEventListener("blur", passwordChk)
			passwordChkBox.removeEventListener("blur", passwordChkChk)

			idBox.readOnly = true;
			passwordBox.readOnly = true;
			nameBox.readOnly = true;
			passwordChkBox.readOnly = true;
			telBox.readOnly = true;
			address4.readOnly = true;
		}
	} else {
		emailMessage.innerHTML = ""
		emailBox.style.border = "1px solid #DADADA";

		idBox.addEventListener("blur", idChk)
		passwordBox.addEventListener("blur", passwordChk)
		passwordChkBox.addEventListener("blur", passwordChkChk)

		idBox.readOnly = false;
		passwordBox.readOnly = false;
		nameBox.readOnly = false;
		passwordChkBox.readOnly = false;
		telBox.readOnly = false;
		address4.readOnly = false;
	}
}
emailBox.addEventListener("blur", emailChk);






var telBox = document.getElementById("telBox");
var telMessage = document.getElementById("telMessage");
function checkReg2(event) {
	const regExp = /[^0-9]/g; // 숫자와 영문자만 허용
	//   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
	const del = event.target;
	if (regExp.test(del.value)) {
		del.value = del.value.replace(regExp, '');
	}
};
//emailChk end

//delete errorMessage start 

idBox.addEventListener("click", function() {
	if (idError == true) {
		idMessage.innerHTML = ""
		idBox.style.border = "1px solid #DADADA";
		idError = false;
	}
});
passwordBox.addEventListener("click", function() {
	if (passwordError == true) {
		passwordMessage.innerHTML = ""
		passwordBox.style.border = "1px solid #DADADA";
		passwordError = false;
	}
});
passwordChkBox.addEventListener("click", function() {
	if (passwordChkError == true) {
		passwordChkMessage.innerHTML = ""
		passwordChkBox.style.border = "1px solid #DADADA";
		passwordChkError = false;
	}
});
nameBox.addEventListener("click", function() {
	if (nameError == true) {
		nameMessage.innerHTML = ""
		nameBox.style.border = "1px solid #DADADA";
		nameError = false;
	}
});
emailBox.addEventListener("click", function() {
	if (emailError == true) {
		emailMessage.innerHTML = ""
		emailBox.style.border = "1px solid #DADADA";
		emailError = false;
	}
});
telBox.addEventListener("click", function() {
	if (telError == true) {
		telMessage.innerHTML = ""
		telBox.style.border = "1px solid #DADADA";
		telError = false;
	}
});
//delete errorMessage end

//finalChk start
var bool2 = true;
var bool;
var idError = false;
var passwordError = false;
var passwordChkError = false;
var nameError = false;
var emailError = false;
var telError = false;

function finalChk() {
	bool = true;
	if (idBox.value == "") {
		idBox.style.border = "1px solid #D80707";
		idMessage.style.color = "#D80707";
		idMessage.innerHTML = "필수항목 입니다."
		bool = false;
		idError = true;
	}
	if (passwordBox.value == "") {
		passwordBox.style.border = "1px solid #D80707";
		passwordMessage.style.color = "#D80707";
		passwordMessage.innerHTML = "필수항목 입니다."
		bool = false;
		passwordError = true;
	}
	if (passwordChkBox.value == "") {
		passwordChkBox.style.border = "1px solid #D80707";
		passwordChkMessage.style.color = "#D80707";
		passwordChkMessage.innerHTML = "필수항목 입니다."
		bool = false;
		passwordChkError = true;
	}
	if (nameBox.value == "") {
		nameBox.style.border = "1px solid #D80707";
		nameMessage.style.color = "#D80707";
		nameMessage.innerHTML = "필수항목 입니다."
		bool = false;
		nameError = true;
	}
	if (emailBox.value == "") {
		emailBox.style.border = "1px solid #D80707";
		emailMessage.style.color = "#D80707";
		emailMessage.innerHTML = "필수항목 입니다."
		bool = false;
		emailError = true;
	}
	if (telBox.value == "") {
		telBox.style.border = "1px solid #D80707";
		telMessage.style.color = "#D80707";
		telMessage.innerHTML = "필수항목 입니다."
		bool = false;
		telError = true;
	}
	if (bool2 == false) {
		bool = false;
	}
	return bool;
}
//end

//email auto start


function emailAuto() {
	var str = "";
	switch (document.getElementById("selectBox").value) {
		case "nate.com":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@nate.com");
			} else {
				str = emailBox.value.concat("@nate.com");
			}
			emailBox.value = str;
			emailChk();
			break;
		case "naver.com":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@naver.com");
			} else {
				str = emailBox.value.concat("@naver.com");
			}
			emailBox.value = str;
			emailChk();
			break;
		case "hanmail.net":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@hanmail.net");
			} else {
				str = emailBox.value.concat("@hanmail.net");
			}
			emailBox.value = str;
			emailChk();
			break;
		case "daum.net":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@daum.net");
			} else {
				str = emailBox.value.concat("@daum.net");
			}
			emailBox.value = str;
			emailChk();
			break;
		case "gmail.com":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@gmail.com");
			} else {
				str = emailBox.value.concat("@gmail.com");
			}
			emailBox.value = str;
			emailChk();
			break;
		default:
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					(emailBox.value.indexOf("@") + 1));
			} else {
				str = emailBox.value.concat("@")
			}
				emailBox.value = str;

			}
	}

	function usernameChk() {
		var ajaxBool = false;
		$.ajax({
			url: "usernameCheck",
			method: "POST",
			async: false,
			data: {
				"username": idBox.value
			},
			success: function(data) {
				if (data == "success") {
					ajaxBool = true;
				}
				if (data == "error") {
					ajaxBool = false;
				}
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		});
		return ajaxBool;
	}