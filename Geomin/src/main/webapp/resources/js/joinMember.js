
window.addEventListener('load', function(){
	
	// 유효성 검사
	// 아이디 중복 체크 
	$("#idCheck").click(function(){
		 const loginId = document.getElementById('loginId').value;
		 console.log('loginId : ' , loginId);
		 
        var regId = /^[a-zA-Z0-9]{6,15}$/;
			 
        
		 $.ajax({
		  url : "/geomin/idCheck",
		  type : "post",
		  data : {loginId : loginId},
		  success : function(data) {
		  //입력 아이디가 동일한 아이디 값이면 1, 아니면 0
		   if(data == 1) {
		   		$("#result").text("이미 사용중인 아이디 입니다.");
		   		$("#result").attr("style", "color:#f00");    
		   } else {
			   // 아이디 글자 수 확인
			   if(loginId.length <6){
		            alert("아이디를 6글자 이상 입력하세요.")
		            loginId.focus();
		            return false;
		        } 
		      //아이디 영어 대소문자 확인
		        else if(!regId.test(loginId)){
		            alert("6~15자 이내 영문 대소문자, 숫자만 입력하세요.")
		            loginId.focus();
		            return false;
		        } else{
			    	$("#result").text("사용 가능한 아이디 입니다.");
			    	$("#result").attr("style", "color:#00f");
		        }
		   }
		  }
		 });  // ajax 끝
		});  
	
	
	//비밀번호 유효성 검사
    const loginPw = document.getElementById("loginPw");
    const loginPwCheck = document.getElementById("loginPwCheck");
    const regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$/;
	const pwErrorElement = document.getElementById("pwError");

	loginPw.addEventListener('input', function () {
	    hideErrorMessage(pwErrorElement);
	});
	// 비밀번호 입력창 벗어났을 때 오류 보여줌
	loginPw.addEventListener('focusout', function () {
	    const pwValue = loginPw.value.trim();
	    
	    //빈칸일 경우 아무것도 출력X
	    if (pwValue.length === 0) {
	        return;
	    }
	    
	    if (pwValue.length < 8) {
	        displayErrorMessage(pwErrorElement, "비밀번호를 8글자 이상 입력하세요.");
	        return;
	    } else if (!regPw.test(pwValue)) {
	        displayErrorMessage(pwErrorElement, "8~15자 이내 영문 대소문자, 숫자, 특수문자를 조합하여 입력하세요.");
	        return;
	    } else if  (loginPwCheck.value !== loginPw.value) {
	        displayErrorMessage(pwErrorElement, "비밀번호와 동일하지 않습니다.");
	    }
	});
	
	//비밀번호 재확인 유효성검사
	loginPwCheck.addEventListener('input', function () {
	    hideErrorMessage(pwErrorElement);
	});

	loginPwCheck.addEventListener('focusout', function () {
	    if (loginPwCheck.value !== loginPw.value) {
	        displayErrorMessage(pwErrorElement, "비밀번호와 동일하지 않습니다.");
	    }
	});
	function displayErrorMessage(element, message) {
	    element.textContent = message;
	    element.style.color = "#f00";
	}
	function hideErrorMessage(element) {
	    element.textContent = "";
	}
	
	
	
	// 이름 유효성 검사
    const mName = document.getElementById("mName");
    const regMname = /^[가-힣a-zA-Z]+$/;
	const nameErrorElement = document.getElementById("nameError");

	mName.addEventListener('input', function () {
	    hideErrorMessage(nameErrorElement);
	});
	// 입력창 벗어났을 때 오류 보여줌
	mName.addEventListener('focusout', function () {
	    const mnameValue = mName.value.trim();
	    
	    //빈칸일 경우 아무것도 출력X
	    if (mnameValue.length === 0) {
	        return;
	    }
	    
	    if (!regMname.test(mName.value)) {
	        displayErrorMessage(nameErrorElement, "이름은 한글과 영문 대소문자만 입력 가능합니다.");
	        alert("형식을 맞춰주세요");
	        return false;
	    }
	});
	
	
	
	// 이메일 형식 유효성 검사 
	const email = document.getElementById("email");
	function mailFormCheck(email){
		
	   var form = /^[a-zA-Z0-9._%+-]$/;
	   
	   return form.test(email);
	}

	
	
	
	// 생년월일 옵션값 처리
	$(document).ready(function () {
    for (var i = 2023; i > 1920; i--) {
        $('#year').append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i < 13; i++) {
        $('#month').append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i < 32; i++) {
        $('#day').append('<option value="' + i + '">' + i + '</option>');
    }
})

	//생년월일 yyyy-MM-dd 형식 처리
	function submitForm() {
	    // 생년월일을 구성
	    let year = document.getElementById("year").value;
	    let month = document.getElementById("month").value;
	    let day = document.getElementById("day").value;
	
	    // 월과 일이 한 자리 수인 경우 두 자리로 변경
	    if (month.length === 1) {
	        month = "0" + month;
	    }
	    if (day.length === 1) {
	        day = "0" + day;
	    }
	
	    // 변환된 생년월일 값을 문자열로 조합
	    const formattedBirthdate = year + "-" + month + "-" + day;
	
	    // 생년월일을 hidden 필드에 설정
	    document.getElementById("mbirthdate").value = formattedBirthdate;
	}	
	
	year.addEventListener("blur", submitForm);
	month.addEventListener("blur", submitForm);
	day.addEventListener("blur", submitForm);
	
	
	
	// 이메일아이디와 주소 더하기
	function FullEmail() {
        let memail1 = document.getElementById('memail1').value; // 이메일 아이디 입력값 가져오기
        let memail2 = document.getElementById('memail2').value; // 이메일 도메인 선택값 가져오기
        console.log("memail1=============", memail1);
        console.log("memail2=============", memail2);
        const memail = memail1 + memail2; // 전체 이메일 주소 조합
        
        // 생성된 전체 이메일 주소를 입력 필드에 설정
        document.getElementById('memail').value = memail;
    }
	
	memail1.addEventListener("blur", FullEmail);
	memail2.addEventListener("blur", FullEmail);
	
	
	
	
	// 회원가입 성공 메세지  alert창 처리
	joinSubmit.addEventListener('click', function(){
		
		let loginId = document.getElementById('loginId').value;
	    let loginPw = document.getElementById('loginPw').value;
	    let loginPwCheck = document.getElementById('loginPwCheck').value;
	    let mPhone = document.getElementById('mPhone').value;
	    let mName = document.getElementById('mName').value;
	    let year = document.getElementById('year').value;
	    let month = document.getElementById('month').value;
	    let day = document.getElementById('day').value;
	    let mType = document.getElementById('mType').value;
	    let memail1 = document.getElementById('memail1').value;
	    let memail2 = document.getElementById('memail2').value;
	    
	    // 필요한 정보를 확인하고 alert 메시지를 생성합니다.
	    let message = "회원가입 정보를 확인해주세요.\n\n";
	    
	    if (loginId.trim() === "") {
	        message += "아이디를 입력하세요.\n";
	    }
	    if (loginPw.trim() === "") {
	        message += "비밀번호를 입력하세요.\n";
	    }
	    if (loginPwCheck.trim() === "") {
	        message += "비밀번호 확인을 입력하세요.\n";
	    }
	    if (mPhone.trim() === "") {
	        message += "휴대폰 번호를 입력하세요.\n";
	    }
	    if (mName.trim() === "") {
	        message += "이름을 입력하세요.\n";
	    }
	    if (year.trim() === "") {
	        message += "생년월일을 입력하세요.\n";
	    }
	    if (month.trim() === "") {
	        message += "생년월일을 입력하세요.\n";
	    }
	    if (day.trim() === "") {
	        message += "생년월일을 입력하세요.\n";
	    }
	    if (mType.trim() === "") {
	        message += "생년월일을 입력하세요.\n";
	    }
	    if (memail1.trim() === "") {
	        message += "이메일 아이디를 입력하세요.\n";
	    }
	    if (memail2.trim() === "") {
	        message += "이메일 주소를 입력하세요.\n";
	    }

	    // 만약 확인할 정보가 없다면 바로 회원가입을 진행합니다.
	    if (message === "회원가입 정보를 확인해주세요.\n\n") {
		    alert("회원가입이 성공적으로 완료되었습니다.");
		    return true; // 회원가입 진행
		} else {
	    	alert("아직 빈 칸이 있습니다. 빈 칸을 입력해주세요.");
		    return false; // 회원가입 막음
		}	
	});

});

	// 라디오버튼  클릭시 나머지 버튼 클릭 철회 처리 (db에 1개만 저장되도록 / 2개이상하려면 컬럼 추가)
	function handleCheckboxClick(checkbox) {
	  if (checkbox.checked) {
	    var checkboxes = document.getElementsByName('marketingagree');
	    for (var i = 0; i < checkboxes.length; i++) {
	      if (checkboxes[i] !== checkbox) {
	        checkboxes[i].checked = false;
	      }
	    }
	  }
	}	
	