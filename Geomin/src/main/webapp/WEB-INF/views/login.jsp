<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
 

		//아이디 찾기 
		let findIdbtn = document.querySelector('#findIdbtn');
		
		findIdbtn.addEventListener('click', function(event){
			// 기본 이벤트 제거
			event.preventDefault();
			// event.stopPropagation(); // 이벤트 전파 중지
			
			let findname = document.querySelector('#findname');
			let findphone = document.querySelector('#findphone');
			let findIdText = document.querySelector('#findIdText');
			
			
			if(!findname.value){
				findIdText.innerHTML = '이름을 입력해주세요';
				return
			}
			if(!findphone.value){
				findIdText.innerHTML = '휴대폰 번호를 입력해주세요';
				return
			}
			
			let obj={mname : findname.value,
					 mphone : findphone.value};
			
			console.log("아이디 찾기 체크", obj);
			
			fetchPost('/geomin/findId', obj, (map)=>{
				findIdText.value = map.msg;
			});

		});
		
		//비밀번호 찾기 
		let findPwbtn = document.querySelector('#findPwbtn');
		
		findPwbtn.addEventListener('click', function(event){
			// 기본 이벤트 제거
			event.preventDefault();
			// event.stopPropagation(); // 이벤트 전파 중지
			
			let findid = document.querySelector('#findid');
			let findnamePw = document.querySelector('#findnamePw');
			let findphonePw = document.querySelector('#findphonePw');
			let findPwText = document.querySelector('#findPwText');
			
			
			if(!findid.value){
				findPwText.innerHTML = '아이디를 입력해주세요';
				return
			}
			if(!findnamePw.value){
				findPwText.innerHTML = '이름을 입력해주세요';
				return
			}
			if(!findphonePw.value){
				findPwText.innerHTML = '휴대폰 번호를 입력해주세요';
				return
			}
			// 컬럼명과 이름을 맞춰주니 브라우저에 출력되었음
			let obj={mname : findnamePw.value,
					 mphone : findphonePw.value,
					 memberid : findid.value};
			
			console.log("비밀번호 찾기 체크", obj);
			
			fetchPost('/geomin/findPw', obj, (map)=>{
				findPwText.value = map.msg;
			});

		});
	   	
		});
		
	// post방식 요청
	function fetchPost(url, obj, callback){
		try{
			// url 요청
			fetch(url
					, {
						method : 'post'
						, headers : {'Content-Type' : 'application/json'}
						, body : JSON.stringify(obj)
					})
				// 요청결과 json문자열을 javascript 객체로 반환
				.then(response => response.json())
				// 콜백함수 실행
				.then(map => callback(map));			
		}catch(e){
			console.log('fetchPost', e);
		}
	}

	

	function findIdCheck(map){
		if(map.result == 'success'){
   			location.href=map.url;
   		} else {
    		alert(map.msg);
    		findIdText.innerHTML=map.msg;
   		}		
   		console.log(map);
         }
	
		
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

   	//아이디 찾기 버튼 모달 처리
	let openfindId = document.querySelector('#openfindId');
	let myModal = document.querySelector('#myModal');
	let close = document.querySelector('.close');
	let modal_content = document.querySelector('.modal_content');
   	//비밀번호 찾기 버튼 모달 처리
	let openfindPw = document.querySelector('#openfindPw');
	let myModalPw = document.querySelector('#myModalPw');
	let closePw = document.querySelector('.closePw');
	let modal_contentPw = document.querySelector('.modal_contentPw');
	
	
	$(document).ready(function() {
	    // 아이디 찾기 버튼 클릭 시 모달 창 보이도록
	    $("#openfindId").click(function(e) {
	        e.preventDefault(); // 기본 동작 막음
	        $("#myModal").css("display", "block");
	        $("#myModalPw").css("display", "none");
	    });
	
	    // 모달 닫기 버튼 클릭 시 모달이 숨겨지도록 처리
	    $(".close").click(function() {
	        $("#myModal").css("display", "none");
	    });
	
	    // 모달 바깥 클릭 시 모달이 숨겨지도록 처리
	    $(document).click(function(event) {
	        if (event.target == $("#myModal")[0]) {
	            $("#myModal").css("display", "none");
	        }
	    });
	
	    // 모달 내부 클릭 이벤트 전파 중지
	    $("#myModal .modal_content").click(function(event) {
	        event.stopPropagation(); // 이벤트 전파 중지
	    });
	});
	
	$(document).ready(function() {
	    // 비밀번호 찾기 버튼 클릭 시 모달 창 보이도록
	    $("#openfindPw").click(function(e) {
	        e.preventDefault(); // 기본 동작 막음
	        $("#myModalPw").css("display", "block");
	        $("#myModal").css("display", "none");
	    });
	
	    // 모달 닫기 버튼 클릭 시 모달이 숨겨지도록 처리
	    $(".closePw").click(function() {
	        $("#myModalPw").css("display", "none");
	    });
	
	    // 모달 바깥 클릭 시 모달이 숨겨지도록 처리
	    $(document).click(function(event) {
	        if (event.target == $("#myModalPw")[0]) {
	            $("#myModalPw").css("display", "none");
	        }
	    });
	
	    // 모달 내부 클릭 이벤트 전파 중지
	    $("#myModalPw .modal_contentPw").click(function(event) {
	        event.stopPropagation(); // 이벤트 전파 중지
	    });
	});

   	
	
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

<div class="container">
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
		<table style='border:1px solid;width:500px;height:50px;margin: 20px auto 50px auto ;' >
			<tr>
				<th><input type='button' id='openfindId' name='findId'  class='btn_find' value='아이디 찾기' onclick='location.href="/geomin/login"'></th>
				<th><input type='button' id='openfindPw' name='findPw' class='btn_find' value='비밀번호 찾기' onclick='location.href="/geomin/login"'></th>
				<th><input type='button' id='joinMember' name='joinMember' class='btn_find' value='회원가입' onclick='location.href="/geomin/joinMember"'></th>
			</tr>
		</table>
	</div>


	<!-- 아이디 찾기 모달 시작 -->		
	<div id="myModal" class="modal" style="border:1px solid;width:500px;height:300px;margin: 20px auto 20px auto" >
		<div class="modal_content">
			<span class="close">&times;</span>
			<h1>아이디 찾기</h1>

			<form>
				<input type="text" name="findname" id="findname" placeholder="이름을 입력하세요." style="width:90%;height:50px;">
				<input type="text" name="findphone" id="findphone" placeholder="휴대폰 번호를 입력하세요." style="width:90%;height:50px;">
				<input type="submit" value="아이디 찾기" id="findIdbtn"style="width:90%;height:50px;">
				
				<!-- 아이디 찾기 시  msg처리를 위해 hidden으로 input태그 생성 -->
				<input type='text' name='findIdText' id='findIdText' value='' style="width:90%;height:50px;">
			</form>
		</div>
	</div>
	<!-- 아이디 찾기 모달 끝 -->
	
	<!-- 비밀번호 찾기 모달 시작 -->		
	<div id="myModalPw" class="modal" style="border:1px solid;width:500px;height:450px;margin: 20px auto 20px auto" >
		<div class="modal_contentPw">
			<span class="closePw">&times;</span>
			<h1>비밀번호 찾기</h1>

			<form>
				<input type="text" name="findid" id="findid" placeholder="아이디를 입력하세요." style="width:90%;height:50px;">
				<input type="text" name="findnamePw" id="findnamePw" placeholder="이름을 입력하세요." style="width:90%;height:50px;">
				<input type="text" name="findphonePw" id="findphonePw" placeholder="휴대폰 번호를 입력하세요." style="width:90%;height:50px;">
				<input type="submit" value="비밀번호 찾기" id="findPwbtn"style="width:90%;height:50px;">
				<input type="button" value="비밀번호 변경" id="updatePwbtn"style="width:90%;height:50px;">
				
				<!-- 비밀번호 찾기 시  msg처리를 위해 hidden으로 input태그 생성 -->
				<input type='text' name='findPwText' id='findPwText' value='' style="width:90%;height:50px;">
			</form>
		</div>
	</div>
	<!-- 비밀번호 찾기 모달 끝 -->
	
</div>	
	
				
</body>
</html>