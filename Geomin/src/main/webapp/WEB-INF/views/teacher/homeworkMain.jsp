<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<style type="text/css">
    	#container>#section>.subnavi>ul{
    		text-align: left;
    		list-style-type: none;
    	}
        #container>#section>.subnavi>ul>li{
    		padding-left: 60px;
            margin-top: 25px;
            font-size: 14px;
    	}
    	#introduction3{
    		width: 630px;
    		text-align: center;
    	}
    	 #introduction3>h3{
    		float: left;
		    width: 310px;
		    font-size: 1.1rem;
		    line-height: 80px;
		    font-weight: 900;
    	}
    	#introduction3>h5{
    		font-size: 0.9rem;
    		line-height: 50px;
    	} 
    	
     	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		} 
		
</style>

<title>Insert title here</title>

<script type="text/javascript">

window.addEventListener('load', function(){
	const subnavi1 = document.getElementById('#subnavi1');
	const subnavi2 = document.getElementById('#subnavi2');
	const subnavi3 = document.getElementById('#subnavi3');
	const subnavi4 = document.getElementById('#subnavi4');
	
	$('#subnavi1').click(function (){
		console.log('#subnavi1 작동 개시');
		$('#introduction1').show ();
		$('#introduction2').hide();
		$('#introduction3').hide();
		$('#introduction4').hide();
	});
	
	$('#subnavi2').click(function (){
		console.log('#subnavi2 작동 개시');
		$('#introduction2').show();
		$('#introduction1').hide();
		$('#introduction3').hide();
		$('#introduction4').hide();
	});
	$('#subnavi3').click(function (){
		console.log('#subnavi3 작동 개시');
		$('#introduction3').show();
		$('#introduction1').hide();
		$('#introduction2').hide();
		$('#introduction4').hide();
	});
	$('#subnavi4').click(function (){
		console.log('#subnavi4 작동 개시');
		$('#introduction4').show();
		$('#introduction1').hide();
		$('#introduction2').hide();
		$('#introduction3').hide();
	});
	
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
	<div id='container'>
	<%@include file="../header/header.jsp" %>
	<div id='section'>
			<div class='subnavi'>
            	<ul>
            		<li><b>강사마당</b></li>
                    <li><label style="cursor:pointer;"><a id="subnavi1">학습 그룹 등록</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi2">그룹 가입 승인</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi3">숙제 전송</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi4">숙제 평가</a></label></li>
               	</ul>
				
            </div>
            <div class='content'>
            
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
       	 		</div>
       	 	</div>
       	</div> 	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
          	 	
</body>
</html>