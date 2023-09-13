<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/login.js"></script>


<style>

input[type=text] {
	height:100%; 
	width:99%;
}
	

.btn_find{
	height:80%; 
   	width:150px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
}
.btn_find:hover{
	height:80%; 
   	width:150px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
}
#loginSubmit{
	height:20%; 
	width:87%; 
	margin-bottom: 20px;
	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
}
#loginSubmit:hover{
	height:20%; 
	width:87%; 
	margin-bottom: 20px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
}

#myModal{
	border-top:2px solid;
	border-bottom:2px solid;
	width:500px;
	height:300px;
	margin: 100px auto 20px auto;
}
#myModalPw{
	border-top:2px solid;
	border-bottom:2px solid;
	width:500px;
	height:350px;
	margin: 100px auto 20px auto;
}
#updatePw{
	border-top:2px solid;
	border-bottom:2px solid;
	width:500px;
	height:350px;
	margin: 100px auto 20px auto;
}
	
.close {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:25px;
  cursor: pointer;
}
.closePw {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:25px;
  cursor: pointer;
}
.closeUptPw {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:25px;
  cursor: pointer;
}
</style>


</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->

<div class="container">
	<!-- 로그인 폼 시작 -->
	<form name='loginMember' id='loginMember' action='/geomin/main' method='POST'>
		<table style='border-top:2px solid;border-bottom:2px solid;width:500px;height:400px;margin: 100px auto 20px auto ;' >
			<tr>
				<th colspan='2'><h2>로그인</h2></th>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type='text' name='memberid' id='loginId' maxlength='15' style="height:70%; width:90%"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type='password' name='mpassword' id='loginPw' style="height:70%; width:90%"></td>
			</tr>
			<!-- 로그인 : 아이디 비밀번호 오류시  msg처리를 위해 hidden으로 input태그 생성 -->
			<tr><input type='hidden' name='msg' id='msg'></tr>
			<tr>
				<th colspan='2'>
					<input type='submit' name='loginSubmit' id='loginSubmit' class='msg' value='로그인'><br>
					<label><input type='checkbox' name='rememberId' id='rememberId' value='rememberId' style="height:20px; width:20px;"> 아이디 저장</label>
				</th>
			</tr>
		</table>
	</form>	
<!--  로그인 폼 끝 -->	
	<div>
		<table style='width:500px;height:50px;margin: 20px auto 50px auto;' >
			<tr>
				<th><input type='button' id='openfindId' name='findId'  class='btn_find' value='아이디 찾기' ></th>
				<th><input type='button' id='openfindPw' name='findPw' class='btn_find' value='비밀번호 찾기' ></th>
				<th><input type='button' id='joinMember' name='joinMember' class='btn_find' value='회원가입' onclick='location.href="/geomin/joinMember"'></th>
			</tr>
		</table>
	</div>


	<!-- 아이디 찾기 모달 시작 -->		
	<div id="myModal" class="modal" >
		<div class="modal_content">
			<span class="close">&times;</span>
			<h1 style='padding-top:30px'>아이디 찾기</h1>

			<form>
				<input type="text" name="findname" id="findname" placeholder="이름을 입력하세요." style="width:90%;height:50px;">
				<input type="text" name="findphone" id="findphone" placeholder="휴대폰 번호를 입력하세요." style="width:90%;height:50px;">
				<input type="submit" value="아이디 찾기" id="findIdbtn" class='btn_find' style="width:90%;height:50px;">
				
				<!-- 아이디 찾기 시  msg처리를 위해 hidden으로 input태그 생성 -->
				<input type='text' name='findIdText' id='findIdText' value='' style="width:90%;height:50px; text-align:center;font-size:15px;" >
			</form>
		</div>
	</div>
	<!-- 아이디 찾기 모달 끝 -->
	
	<!-- 비밀번호 찾기 모달 시작 -->		
	<div id="myModalPw" class="modal">
		<div class="modal_contentPw">
			<span class="closePw">&times;</span>
			<h1 style='padding-top:30px'>비밀번호 찾기</h1>

			<form action='/geomin/findPw'>
				<input type="text" name="findid" id="findid" placeholder="아이디를 입력하세요." style="width:90%;height:50px;">
				<input type="text" name="findemailPw" id="findemailPw" placeholder="이메일 주소를 입력하세요." style="width:90%;height:50px;">
				<input type="submit" value="임시 비밀번호 발급" id="findPwbtn" class='btn_find' style="width:90%;height:50px;">
				<input type="button" value="비밀번호 변경" id="updatePwbtn" class='btn_find' style="width:90%;height:50px;">
				
				<!-- 비밀번호 찾기 시  msg처리를 위해 hidden으로 input태그 생성 -->
				<input type='text' name='findPwText' id='findPwText' value='' style='width:90%;height:50px;text-align:center;font-size:15px;'>
			</form>
		</div>
	</div>
	<!-- 비밀번호 찾기 모달 끝 -->
	
	<!-- 임시 비밀번호 변경 모달 시작 -->		
	<div id="updatePw" class="modal" >
		<div class="modal_contentUptPw">
			<span class="closeUptPw">&times;</span>
			<h1 style='padding-top:30px'>비밀번호 변경</h1>

			<form action='/geomin/updatePw'>
				<input type="text" name="helpid" id="helpid" placeholder="아이디를 입력해주세요" style="width:90%;height:50px;">
				<input type="password" name="newpw" id="newpw" placeholder="새로운비밀번호 (영대소문자,숫자,특수문자 포함 8-15자)" style="width:90%;height:50px;">
				<input type="password" name="newpwCheck" id="newpwCheck" placeholder="비밀번호를 한 번 더 입력해주세요" style="width:90%;height:50px;">
				<input type="submit" value="비밀번호 변경" id="newpwbtn" class='btn_find' style="width:90%;height:50px;">
				
				<!-- 비밀번호 찾기 시  msg처리를 위해 hidden으로 input태그 생성 -->
				<input type='text' name='UpdatePwText' id='UpdatePwText' value='' style='width:90%;height:50px;text-align:center; font-size:15px;'>
			</form>
		</div>
	</div>
	<!-- 임시 비밀번호 변경 모달 끝 -->
				
</div>	

<%@include file="header/footer.jsp" %>	
				
</body>
</html>