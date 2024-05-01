/**
 * 
 */
function memberUpdate() {
  		var tel = telBox1.value.concat(telBox2.value).concat(telBox3.value);
  		$.ajax({
  			url: "memberUpdate",
  			method: "POST",
  			async: "false",
  			data: {
  				"name" : nameBox.value,
  				"username": idBox.value,
  				"password": passwordBox.value,
  				"email": emailBox.value,
  				"tel": tel,
  				"postcode": address1.value,
  				"roadAddress": address2.value,
  				"jibunAddress": address3.value,
  				"detailAddress": address4.value
  			},
  		   success: function(res) {
  			   window.location.reload();
			   alert(res);
  		   },
  		   error: function(error) {
  			   console.log(error)
  		   }
  		});
  	}
  
    var tel = document.getElementById("tel");
	var telBox1 = document.getElementById("telBox1");
	var telBox2 = document.getElementById("telBox2");
	var telBox3 = document.getElementById("telBox3");
	telBox1.value = tel.value.substring(0,3);
	telBox2.value = tel.value.substring(3,7);
	telBox3.value = tel.value.substring(7,11);
    function DaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('address1').value = data.zonecode;
                    document.getElementById("address2").value = addr;
                    document.getElementById("address3").value = data.jibunAddress;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("address4").focus();
                }
            }).open();
        }
    
    
    
        function clearInputs() {
        var inputs = document.querySelectorAll('input'); // 페이지에 있는 모든 input 요소 선택에서 inputs에 할당
        for (var i = 0; i < inputs.length; i++) {
                inputs[i].value= '';
         }
    }
       
    
        
    
        
        
        
        
        
        
        
        
      //id start
        var idBox = document.getElementById("idBox");
        var idMessage = document.getElementById("idMessage");
        var nameBox = document.getElementById("nameBox");
        var address4 = document.getElementById("address4");

       
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

        			passwordChkBox.addEventListener("blur", passwordChkChk)
        			emailBox.addEventListener("blur", emailChk)

        			idBox.readOnly = false;
        			passwordChkBox.readOnly = false;
        			nameBox.readOnly = false;
        			emailBox.readOnly = false;
        			telBox1.readOnly = false;
        			telBox2.readOnly = false;
        			telBox3.readOnly = false;
        			address4.readOnly = false;

        			passwordChkChk();
        		} else {
        			passwordBox.style.border = "1px solid #D80707";
        			passwordMessage.style.color = "#D80707";
        			passwordMessage.innerHTML = "비밀번호는 숫자 또는 문자 포함 형태의 6~12자리 이여야합니다."

        			bool2 = false;

        			passwordChkBox.removeEventListener("blur", passwordChkChk)
        			emailBox.removeEventListener("blur", emailChk)

        			idBox.readOnly = true;
        			passwordChkBox.readOnly = true;
        			nameBox.readOnly = true;
        			emailBox.readOnly = true;
        			telBox1.readOnly = true;
        			telBox2.readOnly = true;
        			telBox3.readOnly = true;
        			address4.readOnly = true;
        		}
        	} else {
        		passwordBox.style.border = "1px solid #DADADA";
        		passwordMessage.innerHTML = "";
        		bool2 =true;
        		passwordChkBox.addEventListener("blur", passwordChkChk)
        		emailBox.addEventListener("blur", emailChk)

        		idBox.readOnly = false;
        		passwordChkBox.readOnly = false;
        		nameBox.readOnly = false;
        		emailBox.readOnly = false;
        		telBox1.readOnly = false;
    			telBox2.readOnly = false;
    			telBox3.readOnly = false;
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

        		
        			passwordBox.addEventListener("blur", passwordChk)
        			emailBox.addEventListener("blur", emailChk)

        			idBox.readOnly = false;
        			passwordBox.readOnly = false;
        			nameBox.readOnly = false;
        			emailBox.readOnly = false;
        			telBox1.readOnly = false;
        			telBox2.readOnly = false;
        			telBox3.readOnly = false;
        			address4.readOnly = false;
        		} else {
        			passwordChkBox.style.border = "1px solid #D80707";
        			passwordChkMessage.style.color = "#D80707";
        			passwordChkMessage.innerHTML = "비밀번호가 서로 다릅니다.";

        			bool2 = false;

        		
        			passwordBox.removeEventListener("blur", passwordChk)
        			emailBox.removeEventListener("blur", emailChk)

        			idBox.readOnly = true;
        			passwordBox.readOnly = true;
        			nameBox.readOnly = true;
        			emailBox.readOnly = true;
        			telBox1.readOnly = true;
        			telBox2.readOnly = true;
        			telBox3.readOnly = true;
        			address4.readOnly = true;
        		}
        	} else {
        		passwordChkBox.style.border = "1px solid #DADADA";
        		passwordChkMessage.innerHTML = "";
				bool2 =true;
      
        		passwordBox.addEventListener("blur", passwordChk)
        		emailBox.addEventListener("blur", emailChk)

        		idBox.readOnly = false;
        		passwordBox.readOnly = false;
        		nameBox.readOnly = false;
        		emailBox.readOnly = false;
        		telBox1.readOnly = false;
    			telBox2.readOnly = false;
    			telBox3.readOnly = false;
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


        			passwordBox.addEventListener("blur", passwordChk)
        			passwordChkBox.addEventListener("blur", passwordChkChk)

        			idBox.readOnly = false;
        			passwordBox.readOnly = false;
        			nameBox.readOnly = false;
        			passwordChkBox.readOnly = false;
        			telBox1.readOnly = false;
        			telBox2.readOnly = false;
        			telBox3.readOnly = false;
        			address4.readOnly = false;
        		} else {
        			emailBox.style.border = "1px solid #D80707";
        			emailMessage.style.color = "#D80707";
        			emailMessage.innerHTML = "입력된 이메일은 잘못된 형식입니다."

        			bool2 = false;

        	
        			passwordBox.removeEventListener("blur", passwordChk)
        			passwordChkBox.removeEventListener("blur", passwordChkChk)

        			idBox.readOnly = true;
        			passwordBox.readOnly = true;
        			nameBox.readOnly = true;
        			passwordChkBox.readOnly = true;
        			telBox1.readOnly = true;
        			telBox2.readOnly = true;
        			telBox3.readOnly = true;
        			address4.readOnly = true;
        		}
        	} else {
        		emailMessage.innerHTML = ""
        		emailBox.style.border = "1px solid #DADADA";
        		bool2 =true;
    
        		passwordBox.addEventListener("blur", passwordChk)
        		passwordChkBox.addEventListener("blur", passwordChkChk)

        		idBox.readOnly = false;
        		passwordBox.readOnly = false;
        		nameBox.readOnly = false;
        		passwordChkBox.readOnly = false;
        		telBox1.readOnly = false;
    			telBox2.readOnly = false;
    			telBox3.readOnly = false;
        		address4.readOnly = false;
        	}
        }
        emailBox.addEventListener("blur", emailChk);





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
        telBox1.addEventListener("click", function() {
        	if (telError == true) {
        		telMessage.innerHTML = ""
        		telBox1.style.border = "1px solid #DADADA";
        		telBox2.style.border = "1px solid #DADADA";
        		telBox3.style.border = "1px solid #DADADA";
        		telError = false;
        	}
        });
        telBox2.addEventListener("click", function() {
        	if (telError == true) {
        		telMessage.innerHTML = ""
        		telBox1.style.border = "1px solid #DADADA";
        		telBox2.style.border = "1px solid #DADADA";
        		telBox3.style.border = "1px solid #DADADA";
        		telError = false;
        	}
        });
        telBox3.addEventListener("click", function() {
        	if (telError == true) {
        		telMessage.innerHTML = ""
        		telBox1.style.border = "1px solid #DADADA";
        		telBox2.style.border = "1px solid #DADADA";
        		telBox3.style.border = "1px solid #DADADA";
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
        	if (passwordBox.value != "" && passwordChkBox.value == "") {
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
        	if (telBox1.value == "" || telBox2.value == "" || telBox3.value == "") {
        		telBox1.style.border = "1px solid #D80707";
        		telBox2.style.border = "1px solid #D80707";
        		telBox3.style.border = "1px solid #D80707";
        		telMessage.style.color = "#D80707";
        		telMessage.innerHTML = "필수항목 입니다."
        		bool = false;
        		telError = true;
        	}
        	if (bool2 == false) {
        		bool = false;
        	}
        	var dupBool = (originalName == nameBox.value
            		&& passwordBox.value == ""
            		&& originalEmail == emailBox.value
            		&& originalTel1 == telBox1.value
            		&& originalTel2 == telBox2.value
            		&& originalTel3 == telBox3.value
            		&& originalAddress1 == address1.value
            		&& originalAddress2 == address2.value
            		&& originalAddress3 == address3.value
            		&& originalAddress4 == address4.value);
    		if(dupBool && bool){
    			alert("변경사항이 없습니다.")	
    			bool = false;
    		}
        	
        	if(bool) {
        		memberUpdate();
        	}
        	
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
        			contentType : "application/json; charset:UTF-8",
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
        	var originalName = nameBox.value;
        	var originalPassword = originalPasswordBox.value;
        	var originalEmail = emailBox.value;
        	var originalTel1 = telBox1.value;
        	var originalTel2 = telBox2.value;
        	var originalTel3 = telBox3.value;
        	var originalAddress1 = address1.value;
        	var originalAddress2 = address2.value;
        	var originalAddress3 = address3.value;
        	var originalAddress4 = address4.value;
        	