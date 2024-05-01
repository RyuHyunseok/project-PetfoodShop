
function findpassword() {
	document.getElementById("findpassword").submit();
}
function signinform() {
	document.getElementById("signinform").submit();
}

var email = document.getElementById("email");
var nameBox = document.getElementById("nameBox");
var telBox = document.getElementById("telBox");
var message = document.getElementById("message");
var emailText = document.getElementById("emailText");
function findid2() {
	var bool2 = true;
	var bool = true;
	var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if (email.checked == true) {
		if (nameBox.value == "") {
			message.style.display = ""
			message.innerHTML = "이름을 입력해주세요."
			bool = false;
			bool2 = false;
		} else if (emailText.value == "") {
			message.style.display = ""
			message.innerHTML = "이메일을 입력해주세요."
			bool = false;
			bool2 = false;
		} else if (!email_regex.test(emailText.value)) {
			message.style.display = ""
			message.innerHTML = "메일 형식이 틀렸습니다."
			bool = false;
			bool2 = false;
		}
	}
	else {
		if (nameBox.value == "") {
			message.style.display = "";
			message.innerHTML = "이름을 입력해주세요.";
			bool = false;
			bool2 = false;
		} else if (telBox.value == "") {
			message.style.display = ""
			message.innerHTML = "휴대폰 번호를 입력해주세요."
			bool = false;
			bool2 = false;
		}
	}
	if (bool2 == true) {
		if (searchMember() == false) {
			message.style.display = "";
			message.innerHTML = "회원정보를 찾을 수 없습니다.";
			bool = false;
		}
	}
	if (bool == true) {
		document.getElementById("findid2").submit();
	} else {
		return;
	}
}

nameBox.addEventListener("input", (event) => {
	message.style.display = "";
	message.innerHTML = "";
});
emailText.addEventListener("input", (event) => {
	message.style.display = "";
	message.innerHTML = "";
});
telBox.addEventListener("input", (event) => {
	message.style.display = "";
	message.innerHTML = "";
});

function checkReg2(event) {
	const regExp = /[^0-9]/g; // 숫자와 영문자만 허용
	//   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
	const del = event.target;
	if (regExp.test(del.value)) {
		del.value = del.value.replace(regExp, '');
	}
};


//select box Start
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



//email auto start
var emailBox = document.getElementById("emailText");
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
			break;
		case "naver.com":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@naver.com");
			} else {
				str = emailBox.value.concat("@naver.com");
			}
			emailBox.value = str;
			break;
		case "hanmail.net":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@hanmail.net");
			} else {
				str = emailBox.value.concat("@hanmail.net");
			}
			emailBox.value = str;
			break;
		case "daum.net":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@daum.net");
			} else {
				str = emailBox.value.concat("@daum.net");
			}
			emailBox.value = str;
			break;
		case "gmail.com":
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					emailBox.value.indexOf("@")).concat("@gmail.com");
			} else {
				str = emailBox.value.concat("@gmail.com");
			}
			emailBox.value = str;
			break;
		default:
			if (emailBox.value.includes("@")) {
				str = emailBox.value.substring(0,
					(emailBox.value.indexOf("@") + 1));
			} else {
				str = emailBox.value.concat("@");
			}
			emailBox.value = str;
	}
}

function searchMember() {
	var memberBool = false;
	$.ajax({
		url: "searchMember",
		method: "POST",
		async: false,
		data: {
			"name": nameBox.value,
			"email": emailText.value,
			"tel": telBox.value,
			"bool": document.getElementById("email").checked
		},
		success: function(data) {
			if (data == "success") {
				memberBool = true;
			}
		},
		error: function(xhr, status, error) {
			console.error('데이터 전송 실패:', error);
		}
	});
	return memberBool;
}
