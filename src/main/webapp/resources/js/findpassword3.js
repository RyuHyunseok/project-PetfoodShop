/**
 * 
 */   var finalBool = false;
  function findpassword4() {
    if(passwordBox.value == "") {
        passwordBox.style.border = "1px solid #D80707";
        passwordMessage.style.color = "#D80707";
        passwordMessage.innerHTML = "새로운 비밀번호를 입력해주세요"  
    }
    if(passwordChkBox.value == "") {
        passwordChkBox.style.border = "1px solid #D80707";
        passwordChkMessage.style.color = "#D80707";
        passwordChkMessage.innerHTML = "비밀번호를 입력해주세요"  
    }
    if(finalBool == true) {
		document.getElementById("findpassword4").submit();
    } else  {
      return;
    }
  }

      //password start
      var passwordBox = document.getElementById("passwordBox");
    var passwordMessage = document.getElementById("passwordMessage");
    function passwordChk() {
        finalBool = true;
      var regExp = /^[A-Za-z0-9]{6,12}$/;
      if (passwordBox.value != "") {
      if (this.value.match(regExp)) {
        passwordMessage.innerHTML = ""
        passwordBox.style.border = "1px solid #DADADA";

        passwordChkChk();
      } else {
        passwordBox.style.border = "1px solid #D80707";
        passwordMessage.style.color = "#D80707";
        passwordMessage.innerHTML = "비밀번호는 숫자 또는 문자 포함 형태의 6~12자리 이여야합니다."
        
        finalBool = false;
      
      }
    } else {
        passwordBox.style.border = "1px solid #DADADA";
        passwordMessage.innerHTML = "";

        finalBool = false;

    }
  }
    document.getElementById("passwordBox").addEventListener("blur", passwordChk)
    //password end


     //passwordChk start
     var passwordChkBox = document.getElementById("passwordChkBox");
    var passwordChkMessage = document.getElementById("passwordChkMessage");
    function passwordChkChk() {
      finalBool = true;

      if (passwordChkBox.value != "") {

      if(passwordBox.value == passwordChkBox.value) {
        passwordChkBox.style.border = "1px solid #DADADA";
        passwordChkMessage.innerHTML = "";

      } else {
        passwordChkBox.style.border = "1px solid #D80707";
        passwordChkMessage.style.color = "#D80707";
        passwordChkMessage.innerHTML = "비밀번호가 서로 다릅니다.";

        finalBool = false;
      }
    } else {
      passwordChkBox.style.border = "1px solid #DADADA";
        passwordChkMessage.innerHTML = "";
        finalBool = false;
			}
     
	 var regExp = /^[A-Za-z0-9]{6,12}$/;
      if (!this.value.match(regExp)) {
    		finalBool = false;	
		}
    }
    passwordChkBox.addEventListener("blur",passwordChkChk)
    //passwordChk end

