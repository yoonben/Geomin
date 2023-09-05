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
	height:45px; 
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

th{
	width: 400px
}

.btn{
	height:30px; 
   	width:120px;
}  
</style>

<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">

window.addEventListener('load', function(){
	joinMemberInfo();
})

function joinMemberInfo() {
	let obj={
			memberid : document.querySelector('#memberidCheck').value
		}
		
		fetchPost('/geomin/joinMemberInfo', obj, (map)=>{
			if(map.result == 'success'){
		           document.querySelector('#memberid').value = map.member.memberid;
		           document.querySelector('#memberid').style.border = '0 solid black';
		           
		            document.querySelector('#mname').value = map.member.mname;
		            document.querySelector('#mname').style.border = '0 solid black';

		            document.querySelector('#mbirthdate').value = map.member.mbirthdate;
		            document.querySelector('#mbirthdate').style.border = '0 solid black';

		            document.querySelector('#maddr').value = map.member.maddr;
		            document.querySelector('#maddr').style.border = '0 solid black';

		            document.querySelector('#memail').value = map.member.memail;
		            document.querySelector('#memail').style.border = '0 solid black';

		            document.querySelector('#mphone').value = map.member.mphone;
		            document.querySelector('#mphone').style.border = '0 solid black';

		            document.querySelector('#mtype').value = map.member.mtype;
		            document.querySelector('#mtype').style.border = '0 solid black';

		            document.querySelector('#mgender').value = map.member.mgender;
		            document.querySelector('#mgender').style.border = '0 solid black';

		            document.querySelector('#marketingagree').value = map.member.marketingagree;
		            document.querySelector('#marketingagree').style.border = '0 solid black';
			}else{
				alert(map.msg);
			}
		})
}
 
function InfoUpdate(){
	// readonly 속성 제거
    document.querySelector('#mname').readOnly = false;
    document.querySelector('#maddr').readOnly = false;
    document.querySelector('#mphone').readOnly = false;
    
    // border 속성 변경 (1px 점선)
    document.querySelector('#mname').style.border = '1px dotted #000';
    document.querySelector('#maddr').style.border = '1px dotted #000';
    document.querySelector('#mphone').style.border = '1px dotted #000';
	document.querySelector('#mphone').placeholder = '공백, (-)없이  숫자';
	
    let obj={
			memberid : document.querySelector('#memberidCheck').value
		}
    
    fetchPost('/geomin/joinMembers', obj, (map)=>{
    	
	    document.querySelector('#tdMbirthdate').innerHTML  = '<input style = "width: 25%; height : 30px;" type="text" class="form-control-plaintext" id="year" name="year" value="'+map.year+'">'
		    +'-<input style = "width: 25%; height : 30px;" type="text" class="form-control-plaintext" id="month" name="month" value="'+map.month+'">'
		    +'-<input style = "width: 25%; height : 30px;" type="text" class="form-control-plaintext" id="day" name="day" value="'+map.day+'">';
	    document.querySelector('#tdMemail').innerHTML = '<input style = "width: 25%; height : 30px;" type="text" class="form-control-plaintext" id="month" name="month" value="'+map.mail+'">'
	    +'@<select class="form-select form-select-sm" aria-label="Small select example">'
	    +'<option value="@naver.com">naver.com</option>'
	    +'<option value="@daum.net">daum.net</option>'
	    +'<option value="@gmail.com">gmail.com</option>'
	    +'<option value="@hanmail.com">hanmail.com</option>'
	  	+'</select>';
	    document.querySelector('#tdMtype').innerHTML = '';
	    document.querySelector('#tdMgender').innerHTML = '';
	    document.querySelector('#tdMarketingagree').innerHTML = '';
	    
    })

}
</script>

</head>
<body>
<!-- 헤더영역 시작 -->
<%@include file="header/header.jsp" %>
<!-- 헤더영역 끝 -->

<!--  회원정보 폼 시작 -->
<form name='joinMemberInfo' id='joinMemberInfo' action='/geomin/joinMemberInfoUpdate' method='POST'>
		<input type="text" id="memberidCheck" name="memberidCheck" value="${member.memberid}">
		<table style='border:1px solid;width:700px;height:900px;margin: 80px auto;' >
		
		<tr>
			<th colspan='2'><h2>회원정보</h2></th>
		</tr>
		<tr>
			<th>아이디 </th>
			<td><input type="text" readonly class="form-control-plaintext" id="memberid" name="memberid" value=""></td>
		</tr>
		<tr>
			<th>이름 </th>
			<td><input type="text" readonly class="form-control-plaintext" id="mname" name="mname" value=""></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td id="tdMbirthdate"><input type="text" readonly class="form-control-plaintext" id="mbirthdate" name="mbirthdate" value=""></td>
		<tr>
			<th>주소</th>
			<td><input type="text" readonly class="form-control-plaintext" id="maddr" name="maddr" value=""></td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td id="tdMemail"><input type="text" readonly class="form-control-plaintext" id="memail" name="memail" value=""></td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td><input type="text" readonly class="form-control-plaintext" id="mphone" name="mphone" value=""></td>
		</tr>
		<tr>
			<th>회원구분</th>
			<td id="tdMtype"><input type="text" readonly class="form-control-plaintext" id="mtype" name="mtype" value=""></td>
		</tr>
		<tr>
			<th>성별</th>
			<td id="tdMgender"><input type="text" readonly class="form-control-plaintext" id="mgender" name="mgender" value=""></td>
		</tr>
		<tr>
			<th>이벤트, 커리큘럼, 신규콘텐츠 등 광고 메시지 수신</th>
			<td id="tdMarketingagree"> <input type="text" readonly class="form-control-plaintext" id="marketingagree" name="marketingagree" value=""></td>
		</tr>
		<tr>
			<th colspan='3'>
				<input type='button' onclick="InfoUpdate()" class="btn" value='회원정보 수정하기'>
				<input type="button" id = "mainPageGo" onclick='location.href="/geomin/main"' value="돌아가기" class="btn">
			</th>
		</tr>
	</table>
</form>	
<!--  회원정보  폼 끝 -->	


	
	
</body>
</html>