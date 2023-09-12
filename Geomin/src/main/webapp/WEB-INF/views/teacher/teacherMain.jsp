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


    	
    	.box_title01 {
		    margin-bottom: 24px;
		    width: 500px;
		    border-bottom: 2px solid black;
		}
		

    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
    window.addEventListener('load', function(){
    	
    	joiningGroup();
    	
   	 	const subnavi1 = document.getElementById('subnavi1');
    	const subnavi2 = document.getElementById('subnavi2');
    	const subnavi3 = document.getElementById('subnavi3');
    	const subnavi4 = document.getElementById('subnavi4');
    	let introductionbtn = document.getElementById('introductionbtn');
    	
    	$('#subnavi1').click(function (){
    		console.log('#subnavi1 작동 개시');
    		redirectToGroupRegist("");
    	});
    	
    	function redirectToGroupRegist(pkgName) {
    	    // pkgName 파라미터를 이용하여 페이지 이동
    	    if (pkgName !== "") {
    	        location.href = `../teacher/groupRegist?pkgName=${pkgName}`;
    	    } else {
    	        location.href = "../teacher/groupRegist";
    	    }
    	}
    	
    	$('#subnavi2').click(function (){
    		location.href="../teacher/teacherMain";
    	});
    	$('#subnavi3').click(function (){
    		console.log('#subnavi3 작동 개시');
    		location.href="../teacher/homeworkMain";
    	});
    	$('#subnavi4').click(function (){
    		location.href="../teacher/homeworkEvaluation";
    	});
  	
    	contentSelect.addEventListener('change', function(e){
    		let content = '';
    		
    		let groupid = document.getElementById('contentSelect').value;
    		
    		if(groupid === '그룹을 선택해주세요'){
    			return;
    		}
    			
    		let obj = {
    			groupid : groupid
    		}
    		
    		console.log(obj);
    		
    		
    		fetchPost('/geomin/contentId', obj, (map) => {
    			
    		})
    	})
    		


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
		  


			 
	});
	
	
	
	function approveSelected() {
		
    }
  
	function joiningGroup() {
		let content = '';
		
		let memberid = document.getElementById('memberid').value;
		
		if(memberid === null || memberid === ''){
			alert("로그인후 이용할 수 있습니다.")
			location.href="/geomin/login";
		}
		
		let obj = {
	        	   memberid : document.getElementById('memberid').value
	        }
	        
		console.log(obj);
		
		fetchPost('/geomin/joiningGroup', obj, (map) => {
			
			content += '<option selected>그룹을 선택해주세요</option>';
			
			map.groupList.forEach(function (item, index) {
				content += '<option>'+item.groupid+'</option>';
			})
			
			document.getElementById('contentSelect').innerHTML = content;
		})

	}
	
	
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
							 	<option selected>그룹을 선택해주세요</option>
							</select>           		
             		</div>
					<div  id='contentList'>
	             			그룹명 : <div class='groupidOutput'></div>
	             			가입입원 : <div class='personOutput'></div>
           			 
	             		<form id='updateJoinStatus' name='updateJoinStatus'>
	           			<input type="text" name="memberid" id="memberid" value="${sessionScope.member.memberid}">
	           			
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
								  
							    <tbody id='contentList2'>
								    
							  </tbody>
							  
							</table>
							
	             			<div class="d-grid gap-2 col-6 mx-auto">
	             				<button type="button" class="btn btn-success" id="introductionbtn" name='introductionbtn' 
	             						onclick="approveSelected()">그룹가입 승인</button><!--  -->
             				</div>
	             		</form>
             		</div>	
             	</div>


             	<!-- 숙제 전송 페이지-->
             	<div id="introduction3">
             		
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