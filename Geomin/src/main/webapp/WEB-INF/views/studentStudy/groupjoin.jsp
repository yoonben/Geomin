<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<head>
<style type="text/css">
#container>#section>.subnavi>ul {
	text-align: left;
	list-style-type: none;
}

#container>#section>.subnavi>ul>li {
	padding-left: 60px;
	margin-top: 25px;
	font-size: 14px;
}

#introduction1 {
	width: 630px;
	text-align: center;
}

#introduction1>h3 {
	float: left;
	width: 310px;
	font-size: 1.1rem;
	line-height: 80px;
	font-weight: 900;
}

#introduction1>h5 {
	font-size: 0.9rem;
	line-height: 50px;
}
/* #introduction1img{
    	
    		float:left;
    		margin-right : 10px;
    		margin-top : 15px;
    		width: 300px;
    	} */
#introduction1img {
	height: 5%;
	weight: 100%;
	margin-bottom: 30px;
}

#introduction2 {
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
    		console.log('#introductionbtn 작동 개시');
    		     
    		        let obj = {
    		        	   studentid: document.getElementById('studentid').value,
    		        	   groupid: document.getElementById('groupid').value,
    		        	   pkgid: document.getElementById('pkgid').value,
    		        	   memberid: document.getElementById('memberid').value,
    		        	   sname: document.getElementById('sname').value
    		        };
    		        
    		
    		fetchPost('/geomin/groupjoin', obj, (map) => {
				
		})
		alert("그룹을 신청하였습니다. 승인처리까지 1~3일 소요됩니다.");
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
			 	
			fetchPost('/geomin/groupId', obj, (map) => {
				console.log(map);
				
				document.getElementById('pkgid').value = map.packagevo.pkgid;
				
				document.getElementById('groupid').value = map.packagevo.groupid;
				
				document.getElementById('memberid').value = map.packagevo.memberid;
				
				document.getElementById('pkgname').innerHTML= map.packagevo.pkgname;

				document.getElementById('pkgcont').innerHTML= map.packagevo.pkgcontent;
				
				document.getElementById('mname').innerHTML= map.packagevo.mname;
				
				document.getElementById('period').innerHTML= map.packagevo.period;
				
				document.getElementById('difficulty').innerHTML= map.packagevo.difficulty;
				
				document.getElementById('person').innerHTML= map.packagevo.person;
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
		
		function homwerkList() {
		    content = "";
		    let obj = {
		        studentid: document.querySelector('#studentid').value
		    };
		    
		    console.log(obj);
		    fetchPost('/geomin/howorkList', obj, (map) => {
		    	if (map.homeworklist.length > 0) {
		    		
		    		let i = 0;
		            map.homeworklist.forEach(function (item, index) {
		                content += "<input type='hidden' id='homeworkno"+i+"' name='homeworkno' value='"+item.homeworkno+"'>"
		                	+ "<tr>"
		                	+ "<th scope='row'><input type='checkbox' class='Checkbox' name='Checkbox' value='" + item.studentid + "'></th>"
		                    + "<td>" + item.pkgname + "</td>"
		                    + "<td>" + item.mname + "</td>"
		                    + "<td>" + item.homeworkcont + "</td>"
		                    + "<td>" + item.deadlinedate + "</td>";
		                    if(item.studycont === null){
		                    	content += "<td><textarea id = 'studycont"+i+"' name='studycont' class='form-control'></textarea></td>";
		                    }else{
		                    	content += "<td><textarea id = 'studycont"+i+"' name='studycont' class='form-control'>"+item.studycont+"</textarea></td>";
		                    }
		                    content += "</tr>";
		                    i++;

		            });
		        }
		        
		        document.querySelector('#homeworkList').innerHTML = content;
		    });
		}
		
		function toggleCheckboxes() {
		    var checkboxes = document.querySelectorAll('input[type="checkbox"].Checkbox');
		    var allCheck = document.getElementById('allCheckbox');
		    
		    for (var i = 0; i < checkboxes.length; i++) {
		        checkboxes[i].checked = allCheck.checked;
		    }
		}
		
		function workSubmit() {
			
			const selectedCheckboxes = document.querySelectorAll('.Checkbox:checked');
			
			 if (selectedCheckboxes.length > 0) {

			        console.log('selectedCheckboxes.length:', selectedCheckboxes.length);
			        
			        let deleteCount = 0; // 실제 삭제된 패키지 수 추적
					let i = 0;
			        
			        
			        selectedCheckboxes.forEach(checkbox => {
			            console.log(checkbox.value);
						
			            const studycont = document.querySelector('#studycont'+i).value.trim();
					    
					    if (studycont === "") {
					        alert("학습 내용을 입력하세요.");
					        return; // Prevent further processing if the textarea is empty
					    }
			            
			            let obj = {
			            	homeworkno : document.querySelector('#homeworkno'+i).value
			            	, studentid: checkbox.value
			            	, studycont : document.querySelector('#studycont'+i).value
			            
			            }
			            
			            console.log(obj);
			            
			            fetchPost('/geomin/studentHomework', obj, (map) => {
			                deleteCount++; 
			                if (deleteCount === selectedCheckboxes.length) {
			                    
			                    alert(map.msg);

			                    // 작업 완료로 표시
			                    deletingInProgress = false;
			                }
			            })
			            
			           i++
			 		})
			        
			 	}else {
		 			alert("숙제 보내는 중 예외사항이 발생 하였습니다.");
			    }
			
		}    
	</script>


</head>

<body>
	<div id='container'>
		<%@include file="../header/header.jsp"%>

		<div id='section'>
			<div class='subnavi'>
				<ul>
					<li><b>학습서비스</b></li>
					<li><label style="cursor: pointer;"><a id="subnavi1">학습	그룹 가입 신청</a></label></li>
					<li><label style="cursor: pointer;"><a id="subnavi2">나의 숙제 제출</a></label></li>
				</ul>

			</div>

			<div class='content'>

				<!-- 학습그룹 신청 페이지 -->
				<div id="introduction1">
					<img src="/resources/img/game1.jpg" alt="" id='introduction1img'>
					<h1>
						<b>학습 그룹 신청<b></b>
					</h1>
					<br> <br>
					<h3>"바둑의 첫 걸음, 그룹신청!"</h3>
					<br>

					<form id='groupjoinForm' name='groupjoin'>

						<input type="text" name="groupid" id='groupid' value=""> 
						<input type="text" name="studentid" id='studentid' value="${member.memberid}"> 
						<input type="text" name="sname" id='sname' value="${member.mname}"> 
						<input type="text" name="pkgid" id='pkgid' value=""> 
						<input type="text" name="memberid" id='memberid' value="">

						<table class="table" border="1px solid"
							style="height: 50%; weight: 100%">
							<thead>
								<tr class="table-success">
									<th>그룹목록</th>
									<td><select id='groupSelect' class="form-select" aria-label="Default select example">
											<option selected>그룹 선택</option>
											<c:forEach var="groupRes" items="${groupRes }">
												<option value="${groupRes.groupid}">${groupRes.groupid}</option>
											</c:forEach>
									</select></td>
								</tr>
							</thead>

							<%-- <c:set var="groupPick" value="${groupSelect}"/> --%>
							<tbody id='groupCont'>
								<!-- 그룹목록 선택에 따른 정보 출력-->
								<tr>
									<th>학습컨텐츠</th>
									<td><div id='pkgname'></div></td>
								</tr>
								<tr>
									<th>학습내용</th>
									<td><div id='pkgcont'></div></td>
								</tr>
								<tr>
									<th>학습선생님</th>
									<td><div id='mname'></div></td>
								</tr>
								<tr>
									<th>학습기간</th>
									<td><div id='period'></div></td>
								</tr>
								<tr>
									<th>학습난이도</th>
									<td><div id='difficulty'></div></td>
								</tr>
								<tr>
									<th>가입현황</th>
									<!-- 시간될때 현재 가입가능 여부  표시 -->
									<td><div id='person'></div></td>
								</tr>
							</tbody>

						</table>
						<button type="button" class="btn btn-success" id="introductionbtn">그룹
							신청하기</button>
					</form>
				</div>





				<!-- 숙제 제출 페이지 -->
				<div id="introduction2">
					<div>
						<h1>
							<b>나의 숙제 제출</b>
						</h1>
						<br>
					</div>
					
					<div style="width: 100%; height: 50px;" class="d-grid gap-2 d-md-flex justify-content-md-end">
						<div style="width: 75%; float: left;">
							<div style="width: 15%; float: left; line-height: 30px;">학습자 : </div>
							<div style="width: 35%; float: left;">
								<input class='form-control' type='text' name='sname' id='sname' value='${sessionScope.member.mname }' readonly>
							</div>
						</div>
						<div style="width: 20%; float: left;">
							<button type="button" class="btn btn-success" onclick="homwerkList()">숙제 조회</button>
						</div>
					</div>

					<table class="table" border="1px solid"
						style="height: 50%; weight: 100%">
						<thead>
							<tr class="table-success">
								<th scope="col"><input type='checkbox' id='allCheckbox' name='allCheck' onclick='toggleCheckboxes()'></th>
								<th style="width: 17%;" scope="col">학습컨텐츠</th>
								<th style="width: 17%;" scope="col">학습선생님</th>
								<th style="width: 20%;" scope="col">숙제 내용</th>
								<th style="width: 20%;" scope="col">제출기한</th>
								<th style="width: 20%;" scope="col">학습 내용</th>
							</tr>
						</thead>

						<tbody id="homeworkList">
							<tr>
								<td colspan='6'>좀 더 자세한 정보를 얻기 위해 숙제를 조회하십시오.</td>
							</tr>
						</tbody>
					</table>
					<div class="d-grid gap-2 col-6 mx-auto">
						<button type="submit" class="btn btn-success" id="introductionbtn" onclick="workSubmit()">숙제 제출하기</button>
					</div>

				</div>

			</div>

			<div class='banner'></div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>