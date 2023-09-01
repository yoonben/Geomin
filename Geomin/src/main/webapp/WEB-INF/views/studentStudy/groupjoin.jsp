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
    	const introductionbtn = document.getElementById('#introductionbtn');
    	
    	$('#subnavi1').click(function (){
    		console.log('#subnavi1 작동 개시');
    		$('#introduction1').show ();
    		$('#introduction2').hide();
    	});
    	
    	$('#subnavi2').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});
    	
    	$('#introductionbtn').click(function (){
    		console.log('#subnavi2 작동 개시');
    		$('#introduction2').show();
    		$('#introduction1').hide();
    	});

    
    	//숙제 목록 전체선택 /부분선택
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
    	/*
	    yearSelect.addEventListener('change', function () {
	    	const yearSelect = document.querySelector('#yearSelect');
	    	
	        yearInput.value = yearSelect.value;
	        
	        monthChart(yearInput.value);
    	*/
		
		let groupSelect = document.getElementById('groupSelect');
		let groupCont = document.getElementById('groupCont');
		groupCont.style.display = 'none';
		
		groupSelect.addEventListener('change', function(){
			groupCont.style.display = '';
			
			console.log(groupSelect.value);
			
			let obj = {
			        groupid : groupSelect.value
			    };
			    
			fetchPost('/geomin/gropuId', obj, (map) => {
				
				document.getElementById('pkgname').innerHTML= map.packagevo.pkgname;

				document.getElementById('pkgcont').innerHTML= map.packagevo.pkgcontent;
				
				document.getElementById('mname').innerHTML= map.packagevo.mname;
				
				document.getElementById('period').innerHTML= map.packagevo.period;
				
				document.getElementById('difficulty').innerHTML= map.packagevo.difficulty;
				
				document.getElementById('person').innerHTML= map.packagevo.person;
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
	    })
	</script>
	
	
</head>

<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	
	<div id='section'>
            <div class='subnavi'>
            	<ul>
            		<li><b>학습서비스</b></li>
                    <li><label style="cursor:pointer;"><a id="subnavi1">학습 그룹 가입 신청</a></label></li>
                   	<li><label style="cursor:pointer;"><a id="subnavi2">나의 숙제 제출</a></label></li>
               	</ul>
				
            </div>
             <div class='content'>
             	<!-- 학습그룹 신청 페이지 -->
             	<div id="introduction1">
                	<img src="/resources/img/game1.jpg" alt="" id='introduction1img'>
             		<h1><b>학습 그룹 신청<b></b></h1><br><br> 
             		<h3>"바둑의 첫 걸음, 그룹신청!"</h3><br> 
           		
           		<form id='groupjoinForm' name='groupjoin' action='/studentStudy/groupjoin?groupid="group1"' method='POST'>
           		
           			 <!-- input type="hidden" name="groupid" value="${groupSelect.groupid}"> -->
                	 <table class="table" border="1px solid" style="height:50%;weight:100%">
							  <thead>
							    <tr class="table-success">
			               			<th>그룹목록</th>
			               			<td>
			               			<select id='groupSelect' class="form-select" aria-label="Default select example">
										 	<option selected>그룹 선택</option>
										 <c:forEach var="groupRes" items="${groupRes }">
										  	<option value="${groupRes.groupid}">${groupRes.groupid}</option>
										 </c:forEach>
										</select>
			               			</td>
			               		</tr>
							  </thead>
						
                	 		<%-- <c:set var="groupPick" value="${groupSelect}"/> --%>
							  <tbody id='groupCont'>
								<!-- 그룹목록 선택에 따른 정보 출력-->
		                		<tr>
		                			<th>학습컨텐츠 </th>
		                			<td><div id='pkgname'></div></td>
		                		</tr>
		                		<tr>
		                			<th>학습내용 </th>
		                			<td><div id='pkgcont'></div></td>
		                		</tr>
		                		<tr>
		                			<th>학습선생님 </th>
		                			<td><div id='mname'></div></td>
		                		</tr>
		                		<tr>
		                			<th>학습기간 </th>
		                			<td><div id='period'></div></td>
		                		</tr>
		                		<tr>
		                			<th>학습난이도 </th>
		                			<td><div id='difficulty'></div></td>
		                		</tr>
             				    <tr>
		                			<th>가입현황</th>  <!-- 시간될때 현재 가입가능 여부  표시 -->
		                			<td><div id='person'></div></td>
		                		</tr>
						    </tbody>
						   
					    </table>
	               	<button type="submit" class="btn btn-success" id="introductionbtn">그룹 신청하기</button>
               	</form> 
           	</div>
             	
             	
             	
             	
             	
             	<!-- 숙제 제출 페이지 -->
             	<div id="introduction2">
             	
             		<div>
             			<h1><b>나의 숙제 제출</b></h1><br>
             		</div>
             		
             		<div>
             			학습자 : 
             		</div>
             		
             		<form>
	             		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	             			<button type="button" class="btn btn-success" id="introductionbtn">숙제 조회</button>
	             		</div>
             		
		                <table class="table" border="1px solid" style="height:50%;weight:100%">
							  <thead>
							    <tr class="table-success">
							      <th scope="col"><input type='checkbox' id='allCheck' name='allCheck'></th>
							      <th scope="col">학습컨텐츠</th>
							      <th scope="col">학습선생님</th>
							      <th scope="col">숙제 내용</th>
							      <th scope="col">제출기한</th>
							      <th scope="col">제출일자</th>
							    </tr>
							  </thead>
							  
							  <tbody>
							    <tr>
							      <th rowspan='2' scope="row"><input type='checkbox' name='rowCheck' value='${boardVO.bno }'></th>
							      <td>Mark</td>
							      <td>Otto</td>
							      <td>@mdo</td>
							      <td>@mdo</td>
							      <td>@mdo</td>
							    </tr>
							    <tr>
							      <th scope="col">학습내용</th>
							      <td colspan='6'>@mdo</td>
							    </tr>
							  </tbody>
						</table>
             			
             			<button type="submit" class="btn btn-success" id="introductionbtn">숙제 제출하기</button>
             		</form>
             	</div>

            </div>
            
            <div class='banner'>
            </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        
</body>
</html>