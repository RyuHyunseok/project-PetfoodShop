/**
 * 
 */ function signinform() {
		document.getElementById("signinform").submit();
	}
  
  function selectAll() {
    var isCheck = document.getElementById('checkbox2').checked
    if (isCheck) {
    	document.getElementById('checkbox3').checked = true;
      document.getElementById('checkbox4').checked = true;
    } else {
      document.getElementById('checkbox3').checked = false;
      document.getElementById('checkbox4').checked = false;
    }
  }
  function selectCancel(Box) {
    var isCheck = document.getElementById('checkbox2').checked
    if (isCheck && !document.getElementById(Box).checked) {
    	document.getElementById('checkbox2').checked = false;
    }
    if (document.getElementById('checkbox3').checked && document.getElementById('checkbox4').checked) {
      document.getElementById('checkbox2').checked = true;
    }
  }

  function agreeCheck() {
	var bool = true;
    var checkbox1 = document.getElementById("checkbox1");
    var checkbox2 = document.getElementById("checkbox2");
    var checkbox3 = document.getElementById("checkbox3");
    var checkbox4 = document.getElementById("checkbox4");
    var errorMessage = document.getElementById("errorMessage");

    if(!checkbox1.checked) {
      errorMessage.innerHTML = "* (필수) 만 14세 이상임에 동의해 주세요.";
      bool = false;
    }
    else if(!checkbox3.checked) {
      errorMessage.innerHTML = "* (필수) 이용약관을 체크해주세요.";
      bool = false;
    }
    else if(!checkbox4.checked) {
      errorMessage.innerHTML = "* (필수) 개인정보 수집 및 이용 을 체크해주세요.";
      bool = false;
    }
    else {
      errorMessage.innerHTML = "";
    }
    return bool;
  }