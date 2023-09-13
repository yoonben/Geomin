<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="/resources/js/joinMember.js"></script>

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
    	height:40px; 
    	width:120px;
        transition: all 3s ease-in;	//모든 속성을 1초동안 ease-in
    }
    
select:hover{
    	height:40px; 
    	width:120px;
    }
    
select:active{ 		
    	height:40px; 
    	width:120px;
    }

.btn{
	height:30px; 
   	width:120px;
}  

#memail1{
	height:50px; 
}
#memail2{
	height:50px; 
}

/* 아이디 중복체크 버튼 */
#idCheck{
	height:100%; 
   	width:100px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
}
#idCheck:hover{
	height:100%; 
   	width:100px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
}


/* 회원가입시 버튼 처리 */
#joinSubmit{
	height:100%; 
   	width:130px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
}
#joinSubmit:hover{
	height:100%; 
   	width:130px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
}

#btnReset{
	height:100%; 
   	width:130px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
}
#btnReset:hover{
	height:100%; 
   	width:130px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
}

#mainPageGo{
	height:100%; 
   	width:130px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
}
#mainPageGo:hover{
	height:100%; 
   	width:130px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
}



</style>


</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->


<!--  회원가입 폼 시작 -->
<form name='joinMember' id='joinMember' action='/geomin/login' method='POST'>
	<!-- 생년월일 형식 저장한 값  히든 처리 -->
	<input type="hidden" id="mbirthdate" name="mbirthdate">
	<input type="hidden" id="memail" name="memail">
	<table style='border-top:1px solid;border-bottom:1px solid;
			width:800px;height:900px;margin: 80px auto; border-spacing:15px 10px;' >
		<tr>
			<th colspan='3'><h2>회원가입</h2></th>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">아이디 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='memberid' id='loginId' placeholder='공백없이 영문/숫자 6-15자' 
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
			<th style="background-color: #E4EDF5;border-radius: 5px;">비밀번호 <span style='color:#FF0000;'>*</span></th>
			<td><input type='password' name='mpassword' id='loginPw' placeholder='공백없이 영문(대/소문자) 숫자 및 특수문자 조합 8-15자' 
						style="height:100%; width:99%" required='required' pattern='^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,15}$'></td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">비밀번호 확인 <span style='color:#FF0000;'>*</span></th>
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
			<th style="background-color: #E4EDF5;border-radius: 5px;">이름 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='mname' id='mName' placeholder='아이디를 입력해주세요' required='required' pattern='/^[가-힣a-zA-Z]+$/'></td>
			<td></td>
		</tr>
			<tr>
			<th></th>
			<td><div id='nameError'></div></td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">생년월일 <span style='color:#FF0000;'>*</span></th>
			<td>
				<select id="year"  name="year" required='required'  value='' >
					<option>선택</option>
				</select>년  &nbsp; &nbsp;
				<select id="month" name="month" required='required'  value='' >
					<option >선택</option>
				</select>월  &nbsp; &nbsp;
				<select id="day"   name="day" required='required'  value='' >
					<option >선택</option>
				</select>일
            </td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">주소</th>
			<td><input type='text' name='maddr' id='mAddr' placeholder='주소를 입력하세요' ></td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">이메일주소 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='memail1' id='memail1' placeholder='이메일 아이디를 입력하세요' required='required' style='weight:50%;' >		
					</td>
			<td><select name="memail2" id="memail2" required='required' style='weight:50%;' value=''>
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
					</select></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">휴대폰 번호 <span style='color:#FF0000;'>*</span></th>
			<td><input type='text' name='mphone' id='mPhone' placeholder='공백, (-)없이  숫자' 
								maxlength='11' required='required' ></td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">회원구분 <span style='color:#FF0000;'>*</span></th>
			<td>				
				<select id="mType" name='mtype' style="height:30px; width:150px" required='required'>
					<option value='T'>학습관리자</option>
					<option value='S'>학습자</option>
					<option value='A'>운영관리자</option>
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">성별</th>
			<td>
				<label><input type='radio' name='mgender' id='mGender' value='M' > 남자</label>
				<label><input type='radio' name='mgender' id='mGender' value='W' > 여자</label>	
			</td>
			<td></td>
		</tr>
		<tr>
			<th style="background-color: #E4EDF5;border-radius: 5px;">수신동의(선택)</th>
			<td>이벤트, 커리큘럼, 신규콘텐츠 등 광고 메시지 수신</td>
			<td></td>
		</tr>
		<tr>
			<th></th>
			<td>
				<label><input type='checkbox' name='marketingagree' id='marketingAgree' value='notAgree' 
																onclick="handleCheckboxClick(this)"> 미동의</label>
				<label><input type='checkbox' name='marketingagree' id='marketingAgree' value='emailAgree'
																onclick="handleCheckboxClick(this)" > 이메일</label>		
				<label><input type='checkbox' name='marketingagree' id='marketingAgree' value='smsAgree' 
																onclick="handleCheckboxClick(this)"> SMS(문자)</label>	
			</td>
			<td></td>
		</tr>
		<tr>
			<th colspan='3'>
				<input type='submit' name='joinSubmit' id='joinSubmit' class="btn" value='회원가입하기'>
				<input type="reset" id = "btnReset" value="다시 작성" class="btn">
				<input type="button" id = "mainPageGo" onclick='location.href="/geomin/main"' value="가입 취소" class="btn">
			</th>
		</tr>
	</table>
</form>	
<!--  회원가입 폼 끝 -->	
 			

	
<%@include file="header/footer.jsp" %>		
</body>
</html>