<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<head>
    <style type="text/css">
/*     	#container>#section>.subNavi>ul{
    		text-align: left;
    		list-style-type: none;
    		margin-right:20px;
    	}
        #container>#section>.subNavi>ul>li{
    		padding-left: 12px;
            margin-top: 25px;
            margin-right:20px;
            font-size: 14px;
    	} */
    	
    	#section>.subNavi {
    width: 180px;
    height: 600px;
    float: left;
    border-right: 1px solid #D9D9D9;
    box-sizing: border-box;
    margin-top: 25px;
    margin-left: 10px;
    margin-right: 10px;
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
		
				#container>#section>.subNavi>ul{
    		/* text-align: left; */
    		list-style-type: none;
    		 width: 140px;
			height:200px;
			text-align: center;
			
    	}
    	    #container>#section>.subNavi>ul> a{
          /*   margin-top: 25px; */
            font-size: 15px;
            width: 140px;
			height:50px;
			text-align: center;
			margin-top: 25px;
			margin-left: 25px;
			font-family: 'GmarketSansMedium';
    	}
    	
        #container>#section>.subNavi>ul>li{
            margin-top: 15px;
            margin-right: 30px;
            padding-top: 15px;
            font-size: 14px;
            cursor: pointer;
            width: 140px;
			height:50px;
			text-align: center;
			border-top:1px solid #002A51;
			border-bottom:1px solid #002A51;
			font-family: 'GmarketSansMedium';
    	}
    	#container>#section>.subNavi>ul>li:hover{
            margin-top: 15px;
            margin-right: 30px;
            padding-top: 10px;
            font-size: 13px;
            cursor: pointer;
            color: #003C72;
			width: 140px;
			height:50px;
			text-align: center;
			box-shadow: 0px 3px 6px rgba(0, 0, 0.2, 0.2);
			border-top:1px solid #002A51;
			border-bottom:1px solid #002A51;
			background-color: #CDE6FD;
			font-size: 1.2rem;
        	font-weight: 600;
        	font-family: 'GmarketSansMedium';
    	}
    	
		

    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    
    window.addEventListener('load', function(){
    	
    	joiningGroup();
    	
   	 	const subNavi1 = document.getElementById('subNavi1');
    	const subNavi2 = document.getElementById('subNavi2');
    	const subNavi3 = document.getElementById('subNavi3');
    	const subNavi4 = document.getElementById('subNavi4');
    	let introductionbtn = document.getElementById('introductionbtn');
    	
    	$('#subNavi1').click(function (){
    		console.log('#subNavi1 작동 개시');
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
    	
    	$('#subNavi2').click(function (){
    		location.href="../teacher/teacherMain";
    	});
    	$('#subNavi3').click(function (){
    		console.log('#subNavi3 작동 개시');
    		location.href="../teacher/homeworkMain";
    	});
    	$('#subNavi4').click(function (){
    		location.href="../teacher/homeworkEvaluation";
    	});
  	
    	contentSelect.addEventListener('change', function(e){
    		studentJoin();
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
			if(map.groupList.length > 0){
			content += '<option selected>그룹을 선택해주세요</option>';
			
			map.groupList.forEach(function (item, index) {
				content += '<option>'+item.groupid+'</option>';
			})
			}else{
				content += '<option selected>승인할 수 있는 그룹이 없습니다.</option>';
			}
			document.getElementById('contentSelect').innerHTML = content;
		})

	}
	
	function studentJoin(){
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
			
			map.groupList.forEach(function (item, index) {
			      content+= '<tr>'
			    	  		+"<td><input type='checkbox' class='Checkbox' name='rowCheck' value='"+item.memberid+"'></td>"
			      			+"<td>"+item.mname+"</td>"
			      			+"<td>"+item.mbirthdate+"</td>"
			      			+"<td>"+formatPhoneNumber(item.mphone)+"</td>"
			      			+"<td>"+item.groupResDate+"</td>"
			      			+"<td id='groupjoinstatus"+item.memberid+"'>"+item.groupjoinstatus+"</td>"
			      			+'</tr>';
			document.querySelector('#personOutput').value = item.person;
			document.querySelector('#pkgid').value = item.pkgid;
			
			})
			
			document.querySelector('#groupidOutput').value = map.groupid;
			document.getElementById('contentList2').innerHTML = content;
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
    
    function formatPhoneNumber(phoneNumber) {
        // 숫자만 남기고 모든 문자 제거
        phoneNumber = phoneNumber.replace(/\D/g, '');
        
        // 11자리인 경우: 010-3333-4444 형식으로 변환
        if (phoneNumber.length === 11) {
            return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
        }
        // 10자리인 경우: 032-111-2222 형식으로 변환
        else if (phoneNumber.length === 10) {
            return phoneNumber.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
        }
        // 그 외의 경우: 변환하지 않고 그대로 반환
        else {
            return phoneNumber;
        }
    }
    
    function approveSelected() {
		
		const selectedCheckboxes = document.querySelectorAll('.Checkbox:checked');
		
		 if (selectedCheckboxes.length > 0) {
		        console.log('selectedCheckboxes.length:', selectedCheckboxes.length);
		        
		        let deleteCount = 0; // 실제 삭제된 패키지 수 추적
				let i = 0;
				const studentidList = [];
		        let studentid;
		        let groupjoinstatus;
		        selectedCheckboxes.forEach(checkbox => {	
		            studentid = checkbox.value;
		            
		            studentidList.push(studentid);
		 		})
		 		
		 		  let obj = {
		        		studentidList: studentidList
		            	, groupid : document.querySelector('#groupidOutput').value
		            	, pkgid : document.querySelector('#pkgid').value
		            }
		        
		        fetchPost('/geomin/joinStatus', obj, (map) => {
		        	alert(map.msg);
		        	document.querySelector('#allCheck').checked = false;
		        	studentJoin();
		        })
		 	}else {
	 			alert("숙제 보내는 중 예외사항이 발생 하였습니다.");
		    }
		
	}
	</script>
	
	
</head>

<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	
	<div id='section'>
            <div class='subNavi'>
            	<ul>
            		<a><b>강사마당</b></a>
                    <li><a id="subNavi1">학습 그룹 등록</a></li>
                   	<li><a id="subNavi2">그룹 가입 승인</a></li>
                   	<li><a id="subNavi3">숙제 전송</a></li>
                   	<li><a id="subNavi4">숙제 평가</a></li>
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
	             			<input type="hidden" name="pkgid" id="pkgid" value="">
	             			<div class='groupidOutput'>그룹명 : <input type="text" name="groupid" id="groupidOutput" value=""></div>
	             			<div class='personOutput'>가입입원 : <input type="text" name="person" id="personOutput" value=""></div>
           			 
	             		<form id='updateJoinStatus' name='updateJoinStatus'>
	           			<input type="hidden" name="memberid" id="memberid" value="${sessionScope.member.memberid}">
	           			
			                <table class="table" border="1px solid" style="height:50%;weight:100%">
								  <thead>
								    <tr class="table-success">
								      <th><input type='checkbox' id='allCheck' name='allCheck'></th>
								      <th>학습자명</th>
								      <th>나이</th>
								      <th>연락처</th>
								      <th>가입신청 일자</th>
								      <th>승인 여부</th>
								    </tr>
								  </thead>
								  
							    <tbody id='contentList2'>
							    <tr>
							    	<th colspan='6' style="text-align: center;">그룹을 선택해 주세요</th>
								<tr>
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
            	<%@include file="../header/banner.jsp" %>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <%@include file="../header/footer.jsp" %>
</body>
</html>