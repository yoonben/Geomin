<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type='text/javascript'>

window.addEventListener('load', function(){
	
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

	// 라디오버튼 '없음' 클릭시 나머지 버튼 클릭 철회 처리
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
<form name='joinMember' id='joinMember' action='' method='post'>
	<table style='border:1px solid;width:800px;height:1000px;'>
		<tr>
			<th colspan='2'><h2>회원가입</h2></th>
		</tr>
		<tr>
			<th>아이디 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='loginId' id='loginId' placeholder='공백없이 영문/숫자 6-15자' 
						required='required' pattern='[A-Za-z0-9]{6,15}'></td>
			<td>중복확인버튼</td>
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
				<label><input type='checkbox' name='marketingAgree' id='marketingAgree' value='emailAgree' > 이메일</label>		
				<label><input type='checkbox' name='marketingAgree' id='marketingAgree' value='smsAgree' > SMS(문자)</label>	
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