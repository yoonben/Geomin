<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

window.addEventListener('load', function(){
	

//숙제전송 페이지 =========================================================================
let homeworkGroupSelect = document.getElementById('homeworkGroupSelect');
let studentSelect = document.getElementById('studentSelect');
//contentList.style.display = 'none';
//console.log(contentList.value);

homeworkGroupSelect.addEventListener('change', function(){
	//contentList.style.display = '';
	console.log('클릭되었어요222222');
	
	console.log(homeworkGroupSelect.value);
	
	let obj = {
			groupid : homeworkGroupSelect.value
	    };
	    
	fetchPost('/geomin/homeworkID', obj, (map) => {

		document.getElementById('groupid').value= map.homeworkvo[0].groupid;
		
		document.getElementById('sname').innerHTML= map.homeworkvo[0].sname;
		
		document.getElementById('mbirthdate').innerHTML= map.homeworkvo[0].mbirthdate;
		
		document.getElementById('mphone').innerHTML= map.homeworkvo[0].mphone;
		
		document.getElementById('memail').innerHTML= map.homeworkvo[0].memail;

})
});	

})

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
    
    </script>    
</head>
<body>


				<!-- 숙제 전송 페이지-->
             	<div id="introduction3">
             	<div>
             			<h1><b>숙제 전송</b></h1><br>
             		</div>
             		<div>
		      				<select id='homeworkGroupSelect' class="form-select" aria-label="Default select example">
								 	<option selected>숙제 부여할 그룹 선택</option>
								 <c:forEach var="homeworkGroup" items="${homeworkGroupList }">
								  	<option value="${homeworkGroup.groupid}">${homeworkGroup.groupid}</option>
								 </c:forEach>
							</select>           		
             		</div>
             		homeworkGroupList : ${homeworkGroupList }
             		
             		<input type="text" name="groupid" id='groupid' value="${homeworkvo.groupid}">
           			 	
			                <table class="table" border="1px solid" style="height:50%;weight:100%">
								  <thead>
								    <tr class="table-success">
								      <th><input type='checkbox' id='allCheck' name='allCheck'></th>
								      <th>학습자명</th>
								      <th>나이</th>
								      <th>연락처</th>
								      <th>이메일</th>
								    </tr>
								  </thead>
								  
							    <tbody id='studentSelect'>
								    <tr>
								      <th scope="row"><input type='checkbox' name='rowCheck' value='${boardVO.bno }'></th>
								      <td><div id='sname'></div></td>
								      <td><div id='mbirthdate'></div></td>
								      <td><div id='mphone'></div></td>
								      <td><div id='memail'></div></td>
								    </tr>
							  </tbody>
							</table>
	             		<form>
	             		
	             			<table class="table" border="1px solid" style="height:50%;weight:100%">
								    <tr class="table-success">
								      <th>숙제내용</th>
								      <td><textarea id='homeworkCont' name='homeworkCont' style="width:100%; height:200px;"></textarea></td>
								    </tr>
								    <tr> 
								      <th>제출기한</th>
								      <td><input type='text' id='deadline' name='deadline'></td>
								    </tr>
	             			</table>
	             			<div class="d-grid gap-2 col-6 mx-auto">
	             				<button class="btn btn-success" id='submitbtn' name='submitbtn'> 숙제 전송 </button>
             				</div>
	             		</form>
             	
          	 	</div>
</body>
</html>