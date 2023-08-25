<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script>

window.addEventListener('load', function(){

	  //로그인
			loginSubmit.addEventListener('click', function(e){
				//기본이벤트 제거 (서브밋되는거 막아줄 수 있다)
				e.preventDefault();
				
			// 파라메터 수집
			let obj = {
					memberid : document.querySelector('#loginId').value
					, mpassword : document.querySelector('#loginPw').value
			}
			
			console.log(obj);
			
			// 요청
			fetch('/geomin/main', {
				    method: 'POST',
				    headers: {
				      'Content-Type': 'application/json'
				    },
				    body: JSON.stringify(obj)
				  })
				  .then(response => response.json())
				  .then(loginCheck)
				});
	  
			});
				
				
				
	     	function loginCheck(map){
	    		//로그인성공 > 메인페이지로 이동
	    		//로그인 실패 > 메세지 처리
	    		if(map.result == 'success'){
	    			location.href=map.url;
	    		} else {
		    		alert(map.msg);
	    			msg.innerHTML=map.msg;
	    		}		
	    		console.log(map);
	          }

	     	
	     	//아이디 저장 체크박스
	     	$(document).ready(function(){
	    		// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    	    var key = getCookie("key");
	    	    $("#loginId").val(key); 
	    	     
	    	    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	    	    if($("#loginId").val() != ""){ 
	    	        $("#rememberId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    	    }
	    	     
	    	    $("#rememberId").change(function(){ // 체크박스에 변화가 있다면,
	    	        if($("#rememberId").is(":checked")){ // ID 저장하기 체크했을 때,
	    	            setCookie("key", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	    	        }else{ // ID 저장하기 체크 해제 시,
	    	            deleteCookie("key");
	    	        }
	    	    });
	    	     
	    	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    	    $("#loginId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	    	        if($("#rememberId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	    	            setCookie("key", $("#loginId").val(), 7); // 7일 동안 쿠키 보관
	    	        }
	    	    });
	     	});

	    	// 쿠키 저장하기 
	    	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	    	function setCookie(cookieName, value, exdays) {
	    		var exdate = new Date();
	    		exdate.setDate(exdate.getDate() + exdays);
	    		var cookieValue = escape(value)
	    				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	    		document.cookie = cookieName + "=" + cookieValue;
	    	}

	    	// 쿠키 삭제
	    	function deleteCookie(cookieName) {
	    		var expireDate = new Date();
	    		expireDate.setDate(expireDate.getDate() - 1);
	    		document.cookie = cookieName + "= " + "; expires="
	    				+ expireDate.toGMTString();
	    	}
	         
	    	// 쿠키 가져오기
	    	function getCookie(cookieName) {
	    		cookieName = cookieName + '=';
	    		var cookieData = document.cookie;
	    		var start = cookieData.indexOf(cookieName);
	    		var cookieValue = '';
	    		if (start != -1) { // 쿠키가 존재하면
	    			start += cookieName.length;
	    			var end = cookieData.indexOf(';', start);
	    			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
	    				end = cookieData.length;
	                    console.log("end위치  : " + end);
	    			cookieValue = cookieData.substring(start, end);
	    		}
	    		return unescape(cookieValue);
	    	}
	
</script>

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
		<table style='border:1px solid;width:500px;height:400px;margin: 100px auto 20px auto ;' >
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
					<input type='submit' name='loginSubmit' id='loginSubmit' class='msg' value='로그인' style="height:20%; width:87%; margin-bottom: 20px"><br>
					<label><input type='checkbox' name='rememberId' id='rememberId' value='rememberId' style="height:20px; width:20px;"> 아이디 저장</label>
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