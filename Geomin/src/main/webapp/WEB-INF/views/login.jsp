<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<style>

input[type=text] {
	height:100%; 
	width:99%;
}
	
.btn_find{
	height:80%; 
	width:150px;
}	
	
</style>



</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->


	<!-- 로그인 폼 시작 -->
	<form name='loginMember' id='loginMember' action='/geomin/main' method='POST'>
		<table style='border:1px solid;width:500px;height:400px;margin: 100px auto 30px auto ;' >
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
			<tr>
				<th colspan='2'>
					<input type='submit' name='loginSubmit' id='loginSubmit' value='로그인' style="height:20%; width:87%; margin-bottom: 30px"><br>
					<input type='checkbox' name='rememberId' id='rememberId' value='rememberId' style="height:20px; width:20px;"> 아이디 저장
				</th>
			</tr>
		</table>
	</form>	
<!--  로그인 폼 끝 -->	
	<div>
		<table style='border:1px solid;width:500px;height:50px;margin: 20px auto 100px auto ;' >
			<tr>
				<th><input type='button' id='findId' name='findId'  class='btn_find' value='아이디 찾기' onclick='location.href=""'></th>
				<th><input type='button' id='findPw' name='findPw' class='btn_find' value='비밀번호 찾기' onclick='location.href=""'></th>
				<th><input type='button' id='joinMember' name='joinMember' class='btn_find' value='회원가입' onclick='location.href="/geomin/joinMember"'></th>
			</tr>
		</table>
	</div>

</body>
</html>