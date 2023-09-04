<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<head>
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
    	#introduction1{
    		width: 630px;
    		text-align: center;
    	}
    	#introduction1>h3{
    		float: left;
		    width: 310px;
		    font-size: 1.1rem;
		    line-height: 80px;
		    font-weight: 900;
    	}
    	#introduction1>h5{
    		font-size: 0.9rem;
    		line-height: 50px;
    	}
    	/* #introduction1img{
    	
    		float:left;
    		margin-right : 10px;
    		margin-top : 15px;
    		width: 300px;
    	} */
    	#introduction1img{
    	 height:5%;
    	 weight:100%;
    	 margin-bottom:30px;
    	 
    	 }
    	#introduction2{
    		display: none;
    	}


    	
    	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		}
		

    </style>
    
    
    <script type="text/javascript">
    window.addEventListener('load', function(){
   	 	const subnavi1 = document.getElementById('#subnavi1');
    	const subnavi2 = document.getElementById('#subnavi2');
    	const subnavi3 = document.getElementById('#subnavi3');
    	const subnavi4 = document.getElementById('#subnavi4');
    	const introductionbtn = document.getElementById('#introductionbtn');
    	
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
    		$('#introduction4').hide();
    	});
    	
    	$('#introductionbtn').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});

    	
    	// 그룹 승인 신청 페이지 
    	let contentSelect = document.getElementById('contentSelect');
		let contentList = document.getElementById('contentList');
		//contentList.style.display = 'none';
		//console.log(contentList.value);
		
		contentSelect.addEventListener('change', function(){
			//contentList.style.display = '';
			
			console.log(contentSelect.value);
			
			let obj = {
					pkgname : contentSelect.value
			    };
			    
			fetchPost('/geomin/contentId', obj, (map) => {
				
				console.log(map);
				
				document.getElementById('pkgname').value= map.membervo.pkgname;
				
				document.getElementById('groupid').innerHTML= map.membervo.groupid;

				document.getElementById('person').innerHTML= map.membervo.person;
				
				document.getElementById('sname').innerHTML= map.membervo.sname;
				
				document.getElementById('mbirthdate').innerHTML= map.membervo.mbirthdate;
				
				document.getElementById('mphone').innerHTML= map.membervo.mphone;
				
				document.getElementById('memail').innerHTML= map.membervo.memail;
				
				document.getElementById('groupResDate').innerHTML= map.membervo.groupResDate;
				
				document.getElementById('joinStatus').innerHTML= map.membervo.joinStatus;
				
		})
    });	
		
		
		

		
		
		// 숙제전송 페이지 =========================================================================
    	let groupSelect = document.getElementById('groupSelect');
		let studentSelect = document.getElementById('studentSelect');
		//contentList.style.display = 'none';
		//console.log(contentList.value);
		
		groupSelect.addEventListener('change', function(){
			//contentList.style.display = '';
			
			console.log(groupSelect.value);
			
			let obj = {
					groupid : groupSelect.value
			    };
			    
			fetchPost('/geomin/homework', obj, (map) => {
				
				document.getElementById('sname').innerHTML= map.homeworkvo.sname;
				
				document.getElementById('mbirthdate').innerHTML= map.homeworkvo.mbirthdate;
				
				document.getElementById('mphone').innerHTML= map.homeworkvo.mphone;
				
				document.getElementById('memail').innerHTML= map.homeworkvo.memail;

				document.getElementById('studentid').innerHTML= map.homeworkvo.studentid;
			
		})
    });	

		
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
    
    
  // 목록 전체선택 /부분선택
	$(function(){
		var chkObj = document.getElementsByName('rowCheck');
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function(){
			var chk_listArr = $("input[name='rowCheck']");
			for(var i=0; i<chk_listArr.length; i++){
				chk_listArr[i].checked = this.checked;
			}
		});
		
		$("input[name='rowCheck']").click(function(){
			if($("input[name='rowCheck']:checked").length == rowCnt){
				$("input[name='allCheck']")[0].checked = true;
			} else {
				$("input[name='allCheck']")[0].checked = false;
			}
		});
	});
    
    })
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
             
             	<!-- 학습 그룹 등록 페이지 -->
             	<div id="introduction1">
             	
          	 	</div>
             	
             	

             	<!-- 그룹 가입 승인 페이지 -->
             	<div id="introduction2">
             		<div>
             			<h1><b>그룹 가입 승인</b></h1><br>
             		</div>
             		
             		<div>
		      				<select id='contentSelect' class="form-select" aria-label="Default select example">
							 	<option selected>학습컨텐츠 선택</option>
							 <c:forEach var="contentRes" items="${contentRes }">
							  	<option value="${contentRes.pkgname}">${contentRes.pkgname}</option>
							 </c:forEach>
							</select>           		
             		</div>
					<div  id='contentList'>
	             			그룹명 : <div id='groupid'></div>
	             			가입입원 : <div id='person'></div>
           			 
	             		<form>
	             		
	             		<input type="text" name="pkgname" id='pkgname' value="${membervo.pkgname}">
           			 	
			                <table class="table" border="1px solid" style="height:50%;weight:100%">
								  <thead>
								    <tr class="table-success">
								      <th><input type='checkbox' id='allCheck' name='allCheck'></th>
								      <th>학습자명</th>
								      <th>나이</th>
								      <th>연락처</th>
								      <th>이메일</th>
								      <th>가입신청 일자</th>
								      <th>승인 여부</th>
								    </tr>
								  </thead>
								  
							    <tbody>
								    <tr>
								      <th rowspan='3' scope="row"><input type='checkbox' name='rowCheck' value='${boardVO.bno }'></th>
								      <td><div id='sname'></div></td>
								      <td><div id='mbirthdate'></div></td>
								      <td><div id='mphone'></div></td>
								      <td><div id='memail'></div></td>
								      <td><div id='groupResDate'></div></td>
								      <td><div id='joinStatus'></div></td>
								    </tr>
							  </tbody>
							  
							</table>
							
							
	             			<div class="d-grid gap-2 col-6 mx-auto">
	             				<button type="submit" class="btn btn-success" id="introductionbtn">그룹가입 승인</button>
             				</div>
	             		</form>
             		</div>	
             	</div>


             	<!-- 숙제 전송 페이지 -->
             	<div id="introduction3">
             	<div>
             			<h1><b>숙제 전송</b></h1><br>
             		</div>
             		<div>
		      				<select id='groupSelect' class="form-select" aria-label="Default select example">
								 	<option selected>숙제 부여할 그룹 선택</option>
								 <c:forEach var="groupList" items="${groupList }">
								  	<option value="${groupList.groupid}">${groupList.groupid}</option>
								 </c:forEach>
							</select>           		
             		</div>
             		
	             		
	             		
			                <table class="table" border="1px solid" style="height:50%;weight:100%">
								  <thead>
								    <tr class="table-success">
								      <th><input type='checkbox' id='allCheck' name='allCheck'></th>
								      <th>학습자명</th>
								      <th>나이</th>
								      <th>연락처</th>
								      <th>이메일</th>
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
								      <td><div id='studentid'></div></td>
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


             	<!-- 숙제 평가 페이지 -->
             	<div id="introduction4">
          	 	</div>
          	 	
            </div>
            
            <div class='banner'>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        
</body>
</html>