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
    		/* $('#introduction1').show ();
    		$('#introduction2').hide();
    		$('#introduction3').hide();
    		$('#introduction4').hide(); */
    		location.href="../teacher/groupRegist";
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
    		/* $('#introduction3').show();
    		$('#introduction1').hide();
    		$('#introduction2').hide();
    		$('#introduction4').hide(); */
    		location.href="../teacher/homeworkMain";
    	});
    	$('#subnavi4').click(function (){
    		console.log('#subnavi4 작동 개시');
    		$('#introduction4').show();
    		$('#introduction1').hide();
    		$('#introduction2').hide();
    		$('#introduction4').hide();
    	});
    	
    	/*
    	$('#introductionbtn').click(function (){
			console.log('#introductionbtn 작동 개시');
			joinStatusValue();
    	});
		
			console.log('클릭되었어요');
			
			let obj = {
		        	   sname : document.getElementById('sname').value,
		        	   groupid : document.getElementById('groupid').value
		        }
		        
			console.log(obj);
		fetchPost('/geomin/joinStatus', obj, (map) => {
			
			document.getElementById('sname').value= map.membervo.sname;
			document.getElementById('groupid').value= map.membervo.groupid;
		})
	
	alert("그룹 가입 신청을 승인하였습니다.");
	});*/

    		


    	
    	// 그룹 승인 신청 페이지 
		
		let contentSelect = document.getElementById('contentSelect');
		let contentList = document.getElementById('contentList');
		
		// contentSelect 엘리먼트에서 옵션 값을 가져와 Set 객체를 생성 (배열에서 중복값 제거)
		let contentSelectOptions = Array.from(contentSelect.options);
		let set = new Set(contentSelectOptions.map(option => option.value));
		
		console.log(set.size);
		
		
		// 중복 제거된 옵션으로 셀렉트 박스 업데이트
		contentSelect.innerHTML = ''; // 기존 옵션 삭제
		uniqueOptions.forEach(optionValue => {
		    let option = document.createElement('option');
		    option.value = optionValue;
		    option.text = optionValue;
		    contentSelect.appendChild(option);
		});

		console.log(uniqueOptions);
		
		
		set.addEventListener('change', function(){
			//contentList.style.display = '';
			console.log('클릭되었어요');
			//console.log(contentSelect.value);
			
			let obj = {
					pkgname : set
			    };
			    
			fetchPost('/geomin/contentId', obj, (map) => {
				
				console.log('map : ', map);
				
				//var sname1 =  map.membervo[3].sname;
				//console.log('sname1 : ' , sname1);
				
				//var sname2 = document.getElementById('sname').textcontent;
				//console.log('sname2 : ' , sname2);
				
				
				for(let i = 0; i <= map.membervo.length; i++){
					let membervo = map.membervo[i];
					document.getElementById('pkgname').innerHTML= membervo.pkgname;
					document.getElementById('groupidOutput').innerHTML= membervo.groupid;
					document.getElementById('personOutput').innerHTML= membervo.person;
					document.getElementById('snameOutput').innerHTML= membervo.sname;
					document.getElementById('mbirthdateOutput').innerHTML= membervo.mbirthdate;
					document.getElementById('mphoneOutput').innerHTML= membervo.mphone;
					document.getElementById('memailOutput').innerHTML= membervo.memail;
					document.getElementById('groupResDateOutput').innerHTML= membervo.groupResDate;
					document.getElementById('joinStatusOutput').innerHTML= membervo.joinStatus;
					}
			
		})
    });	
		
		
		   /*
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
		  */


				
				
			$('#introductionbtn').click(function() {
				var vo = [];

			    $('input[name="rowCheck"]:checked').each(function() {
			        var rowData = {
				        	groupid		: document.getElementById('groupid').innerHTML,
				            sname		: document.getElementById('snameOutput').innerHTML
			        };
			        vo.push(rowData);
			    });

			    console.log(vo);
			    
			   $.ajax({
			        url: '/geomin/joinStatus',
			        type: 'POST',
			        data: JSON.stringify(vo),
	                contentType: "application/json",
	                dataType: "json",
			        success: function(response) {
			            //alert('성공');
			            //console.log(response);
			        },
			        error: function(error) {
			            //alert('실패');
			            //console.error(error);
			        }
			    });
			});	  
		  
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
    
 
  /*
	//승인 버튼 클릭시 
	function joinStatusValue(){
		var url = "/geomin/teacher/homeworkMain";    // 컨트롤러로 보내고자 하는 URL
		var valueArr = new Array();
		var list = $("input[name='rowCheck']");
		
		for(var i=0; i<list.length; i++){
			if(list[i].checked){   //선택되어 있으면 배열에 값을 저장함
				valueArr.push(list[i].value);
			}
		}
		if(valueArr.length == 0){
			alert("학습자를 선택해주세요.");
		} else{
			var chk = confirm("그룹가입 신청을 승인하시겠습니까?");
			$.ajax({
				url : "/geomin/teacher/homeworkMain",   //전송 url
				type : 'POST',
				traditional : true,
				data : {
					valueArr : valueArr     //보내려는 data변수 설정
				},
				success : function(jdata){
				console.log()
				console.log("=============진입 2");
					if(jdata.result == "success"){
				console.log("=============진입 3");
						alert("승인처리되었습니다.");
						var form = document.createElement("form");
					    form.setAttribute("method", "post");
					    form.setAttribute("action", "/geomin/teacher/teacherMain");
					    
					    document.getElementById("updateJoinStatus").appendChild(form);
					    
					    form.submit();
                    } else{
						alert("승인 처리에 실패하였습니다.");
					}
				}
			});
		}
	}   
*/
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
	             			그룹명 : <div id='groupidOutput'></div>
	             			가입입원 : <div id='personOutput'></div>
           			 
	             		<form id='updateJoinStatus' name='updateJoinStatus'>
	             		membervo : ${membervo}
	             		updateRes : ${updateRes }
	           			<input type="text" name="groupid" id='groupid' value="${membervo.groupid}">
	           			<input type="text" name="sname"  id='sname' value="${membervo.sname}">
	           			<input type="text" name="pkgname"  id='pkgname' value="${member.pkgname}">
	           			
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
								      <th rowspan='3' scope="row"><input type='checkbox' name='rowCheck'></th>
								      <!-- 
									      <td><div id='sname'></div></td>
									      <td><div id='mbirthdate'></div></td>
									      <td><div id='mphone'></div></td>
									      <td><div id='memail'></div></td>
									      <td><div id='groupResDate'></div></td>
									      <td><div id='joinStatus'></div></td>
								       -->
								        <td><div id='snameOutput'></div></td>
				                        <td><div id='mbirthdateOutput'></div></td>
				                        <td><div id='mphoneOutput'></div></td>
				                        <td><div id='memailOutput'></div></td>
				                        <td><div id='groupResDateOutput'></div></td>
				                        <c:choose>
											<c:when test="${membervo.joinstatus == 'N'}"> 
												<td><div id='joinStatusOutput'></div></td>
											</c:when>
											<c:otherwise>
												<td><div id='joinStatusOutput'></div></td>
											</c:otherwise>
										</c:choose>
								    </tr> 
							  </tbody>
							  
							</table>
							
	             			<div class="d-grid gap-2 col-6 mx-auto">
	             				<button type="button" class="btn btn-success" id="introductionbtn" name='introductionbtn'>그룹가입 승인</button>
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