<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script type='text/javascript'>

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
    	width:120px;
        transition: all 3s ease-in;	//모든 속성을 1초동안 ease-in
    }
    
select:hover{
    	height:30px; 
    	width:120px;
    }
    
select:active{ 		
    	height:30px; 
    	width:120px;
    }

.btn{
	height:30px; 
   	width:120px;
}  
</style>



</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->

<!--  회원정보 폼 시작 -->
<form name='joinMemberInfo' id='joinMemberInfo' action='/geomin/joinMemberInfoUpdate' method='POST'>
	<table style='border:1px solid;width:700px;height:900px;margin: 80px auto;' >
		<c:set var="memberVO" value="${member}"/>
		<tr>
			<th colspan='2'><h2>회원정보</h2></th>
		</tr>
		<tr>
			<th>아이디 </th>
			<td>${member.memberid }</td>
		</tr>
		<tr>
			<th>이름 </th>
			<td>${member.mname }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${member.mbirthdate }</td>
		<tr>
			<th>주소</th>
			<td>${member.maddr }</td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td>${member.memail }</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>${member.mphone }</td>
		</tr>
		<tr>
			<th>회원구분</th>
			<td>${member.mtype }</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${member.mgender }</td>
		</tr>
		<tr>
			<th>이벤트, 커리큘럼, 신규콘텐츠 등 광고 메시지 수신</th>
			<td>${member.marketingagree }</td>
		</tr>
		<tr>
			<th colspan='3'>
				<input type='submit' name='InfoUpdate' id='InfoUpdate' class="btn" value='회원정보 수정하기'>
				<input type="button" id = "mainPageGo" onclick='location.href="/geomin/main"' value="돌아가기" class="btn">
			</th>
		</tr>
	</table>
</form>	
<!--  회원정보  폼 끝 -->	


	
	
</body>
</html>