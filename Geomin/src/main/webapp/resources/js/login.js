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
			let findemailPw = document.querySelector('#findemailPw');
			
			
			if(!findid.value){
				findPwText.innerHTML = '아이디를 입력해주세요';
				return
			}
			if(!findemailPw.value){
				findPwText.innerHTML = '이름을 입력해주세요';
				return
			}
			// 컬럼명과 이름을 맞춰주니 브라우저에 출력되었음
			let obj={memail : findemailPw.value,
					 memberid : findid.value};
			
			console.log("비밀번호 찾기 체크", obj);
			
			fetchPost('/geomin/findPw', obj, (map)=>{
				findPwText.value = map.msg;
			});

		});
		
		$(function(){
			$("#findPwbtn").click(function(){
				$.ajax({
					url : "/geomin/findPw",
					type : "POST",
					data : {
						id : $("#findid").val(),
						email : $("#findemailPw").val()
					},
					success : function(result) {
						alert(result);
					},
				})
			});
		})
		
		
		
		
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

	

	/* 
	function findIdCheck(map){
		if(map.result == 'success'){
   			location.href=map.url;
   		} else {
    		alert(map.msg);
    		findIdText.innerHTML=map.msg;
   		}		
   		console.log(map);
       } 
     */
	
		
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

   	
	
	
	