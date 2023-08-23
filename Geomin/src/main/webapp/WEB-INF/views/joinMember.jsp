<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script type='text/javascript'>

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
		            alert("4~15자 이내 영문 대소문자, 숫자만 입력하세요.")
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
	
	// 이메일 형식 유효성 검사 
	const email = document.getElementById("email");
	function mailFormCheck(email){
		
	   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	   
	   return form.test(email);
	}

	
	// 생년월일 처리
	$(document).ready(
		    function () {
	        for (var i = 2023; i > 1920; i--) {
	            $('#year').append('<option value="' + i + '">' + i + '</option>');
	        }
	        for (var i = 1; i < 13; i++) {
	            $('#month').append('<option value="' + i + '">' + i + '</option>');
	        }
	        for (var i = 1; i < 32; i++) {
	            $('#day').append('<option value="' + i + '">' + i + '</option>');
	        }
	    }
	)

});	

	// 라디오버튼  클릭시 나머지 버튼 클릭 철회 처리 
	function handleCheckboxClick(checkbox) {
	  if (checkbox.checked) {
	    var checkboxes = document.getElementsByName('marketingAgree');
	    for (var i = 0; i < checkboxes.length; i++) {
	      if (checkboxes[i] !== checkbox) {
	        checkboxes[i].checked = false;
	      }
	    }
	  }
	}	
	

	
</script>

<style>
input[type=text]{
	height:100%; 
	width:99%;
}

input[type=radio]{
	height:18px; 
	width:18px;
}
input[type=checkbox]{
	height:18px; 
	width:18px;
}

select{
    	height:30px; 
    	width:150px;
        transition: all 3s ease-in;	//모든 속성을 1초동안 ease-in
    }
    
select:hover{
    	height:30px; 
    	width:150px;
    }
    
select:active{ 		
    	height:30px; 
    	width:150px;
    }
    
    
</style>


</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->

<!--  회원가입 폼 시작 -->
<form name='joinMember' id='joinMember' action='/geomin/login' method='post'>
	<table style='border:1px solid;width:800px;height:1000px;'>
		<tr>
			<th colspan='2'><h2>회원가입</h2></th>
		</tr>
		<tr>
			<th>아이디 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='loginId' id='loginId' placeholder='공백없이 영문/숫자 6-15자' 
						required='required' pattern='^(?=.*[A-Za-z0-9])[A-Za-z0-9]{6,15}$'
						maxlength='15' ></td>
			<td><input type='button' name='idCheck' id='idCheck' value='중복확인버튼'></td>
		</tr>
		<tr>
			<th></th>
			<td id='result'>아이디를 확인해주세요.</td>
			<td></td>
		</tr>
		<tr>
			<th>비밀번호 <span style='color:#FF0000;'>*</span></th>
			<td><input type='password' name='loginPw' id='loginPw' placeholder='공백없이 영문(대/소문자) 숫자 및 특수문자 조합 8-15자' 
						style="height:100%; width:99%" required='required' pattern='^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$'></td>
			<td></td>
		</tr>
		<tr>
			<th>비밀번호 확인 <span style='color:#FF0000;'>*</span></th>
			<td><input type='password' name='loginPwCheck' id='loginPwCheck' placeholder='비밀번호를 한 번 더 입력해주세요' 
						style="height:100%; width:99%" required='required' pattern='^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$'></td>
			<td></td>
		</tr>
		<tr>
			<th></th>
			<td><div id='pwError'></div></td>
			<td></td>
		</tr>
		<tr>
			<th>이름 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='mName' id='mName' placeholder='아이디를 입력해주세요' required='required'></td>
			<td></td>
		</tr>
		<tr>
			<th>생년월일 <span style='color:#FF0000;'>*</span></th>
			<td>
				<select id="year" required='required'>
					<option>선택</option>
				</select>년  &nbsp; &nbsp;
				<select id="month" required='required'>
					<option>선택</option>
				</select>월  &nbsp; &nbsp;
				<select id="day"  required='required'>
					<option>선택</option>
				</select>일
            </td>
            <td></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type='text' name='mAddr' id='mAddr' placeholder='주소를 입력하세요' ></td>
			<td></td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td><input type='text' name='email' id='email' placeholder='이메일 주소를 입력하세요' ></td>
			<td></td>
		</tr>
		<tr>
			<th>휴대폰 번호 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='mPhone' id=''mPhone'' placeholder='공백, (-)없이  숫자' 
								maxlength='11' required='required' ></td>
			<td></td>
		</tr>
		<tr>
			<th>회원구분 <span style='color:#FF0000;'>*</span></th>
			<td>				
				<select id="mType" style="height:30px; width:150px" required='required'>
					<option>학습관리자</option>
					<option>학습자</option>
					<option>운영관리자</option>
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<label><input type='radio' name='mGender' id='mGender' value='M' > 남자</label>
				<label><input type='radio' name='mGender' id='mGender' value='W' > 여자</label>	
			</td>
			<td></td>
		</tr>
		<tr>
			<th>수신동의(선택)</th>
			<td>이벤트, 커리큘럼, 신규콘텐츠 등 광고 메시지 수신</td>
			<td></td>
		</tr>
		<tr>
			<th></th>
			<td>
				<label><input type='checkbox' name='marketingAgree' id='marketingAgree' value='notAgree' 
																onclick="handleCheckboxClick(this)"> 없음</label>
				<label><input type='checkbox' name='marketingAgree' id='marketingAgree' value='emailAgree'
																onclick="handleCheckboxClick(this)" > 이메일</label>		
				<label><input type='checkbox' name='marketingAgree' id='marketingAgree' value='smsAgree' 
																onclick="handleCheckboxClick(this)"> SMS(문자)</label>	
			</td>
			<td></td>
		</tr>
		<tr>
			<th colspan='3'>
				<input type='submit' name='joinSubmit' id='joinSubmit' value='회원가입하기'>
			</th>
		</tr>
	</table>
</form>	
<!--  회원가입 폼 끝 -->	
	
	
	
	
</body>
</html>