<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

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
    

#introduction3 {
	width: 630px;
	text-align: center;
}

#introduction3>h3 {
	float: left;
	width: 310px;
	font-size: 1.1rem;
	line-height: 80px;
	font-weight: 900;
}

#introduction3>h5 {
	font-size: 0.9rem;
	line-height: 50px;
}

.box_title01 {
	margin-bottom: 24px;
	width: 500px;
	border-bottom: 2px solid black;
}

#searchDiv {
	width: 100%;
}

div#searchFieldDiv {
	float: left;
	width: 35%;
}

div#searchWordDiv {
	width: 50%;
	float: left;
}

#sname {
	width: 100px;
}

#age {
	width: 50px;
}

#mphone {
	width: 140px;
}


				#container>#section>.subNavi>ul{
    		/* text-align: left; */
    		list-style-type: none;
    		/* width: 150px; */
			height:200px;
			text-align: center;
			
    	}
    	    #container>#section>.subNavi>ul> a{
          /*   margin-top: 25px; */
            font-size: 15px;
            width: 150px;
			height:50px;
			text-align: center;
			padding:auto;
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
            width: 150px;
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
			width: 150px;
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

<title>Insert title here</title>

<script type="text/javascript">

window.addEventListener('load', function(){
	
	groupList();
	
	const subNavi1 = document.getElementById('#subNavi1');
	const subNavi2 = document.getElementById('#subNavi2');
	const subNavi3 = document.getElementById('#subNavi3');
	const subNavi4 = document.getElementById('#subNavi4');
	
	$('#subNavi1').click(function (){
		console.log('#subNavi1 작동 개시');
		location.href="../teacher/groupRegist";
	});
	
	$('#subNavi2').click(function (){
		console.log('#subNavi2 작동 개시');
		location.href="../teacher/teacherMain";
	});
	$('#subNavi3').click(function (){
		console.log('#subNavi3 작동 개시');
		location.href="../teacher/homeworkMain";
	});
	$('#subNavi4').click(function (){
		console.log('#subNavi4 작동 개시');
		location.href="../teacher/homeworkEvaluation";
	});
	
	//숙제전송 페이지 =========================================================================
	let homeworkGroupSelect = document.getElementById('homeworkGroupSelect');
	let studentSelect = document.getElementById('studentSelect');
	//contentList.style.display = 'none';
	//console.log(contentList.value);
	
	homeworkGroupSelect.addEventListener('change', function(){
		content = ""; 
		content2 = ""; 
		
		
		//contentList.style.display = '';
		console.log('클릭되었어요222222');
		
		console.log(homeworkGroupSelect.value);
		
		let obj = {
				groupid : homeworkGroupSelect.value
				,pageNo: 1
		    };
		    
		fetchPost('/geomin/homeworkID', obj, (map) => {
			if(map.homeworklist.length > 0){
				
				
				map.homeworklist.forEach(function(item, index) {
					document.querySelector('#pkgid').value = item.pkgid;
					
					content += "<th scope='row'><input type='checkbox' class='Checkbox' name='Checkbox' value='"+item.studentid+"'></th>"
								+"<td><input class='form-control' type='text' name='sname' id='sname"+item.studentid+"' value = '"+item.sname+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='age' id='age"+item.studentid+"' value = '"+item.age+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='mphone' id='mphone"+item.studentid+"' value = '"+item.mphone+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='memail' id='memail"+item.studentid+"' value = '"+item.memail+"' readonly></td>"
								+"</tr>";
				})
				
				content2 += "  <ul class='pagination justify-content-center'>"
				    + "   <!-- 첫 페이지 -->"
				    + "   <li>"
				    + "      <a class='page-link' onclick='go(1)'>처음</a>"
				    + "    </li>"
				    + "   <!-- 이전 페이지 -->"
				    + "    <li class='page-item " + (map.pageDto.prev ? '' : 'disabled') + "'>"
				    + "      <a class='page-link' onclick='go(" + (map.pageDto.startNo - 1) + ")'>이전</a>"
				    + "    </li>"
				    + "    <!-- 페이지목록 -->";
				for (var i = map.pageDto.startNo; i <= map.pageDto.endNo; i++) {
				    if (i === map.pageDto.cri.pageNo) {
				        content2 += "<li class='page-item active'><span class='page-link' style='color: black; background-color: white;'>" + i + "</span></li>";
				    } else {
				        content2 += "<li class='page-item'><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
				    }
				}
				content2 += "    <!-- 다음페이지 -->"
					+ "    <li class='page-item " + (map.pageDto.next ? '' : 'disabled') + "'>"
				    + "      <a class='page-link' onclick='go(" + (map.pageDto.endNo + 1) + ")'>다음</a>"
				    + "    </li>"
				    + "    <!-- 끝 페이지 -->"
				    + "    <li class='page-item '>"
				    + "      <a class='page-link' onclick='go(" + map.pageDto.realEnd + ")'>끝</a>"
				    + "    </li>"
				    + "  </ul>";
			}else {
				content += "<tr>"
			        + "  <th colspan='4'>등록된 학생이 없습니다.</th>" 
					+ "</tr>";
			}
			
			
			
			document.querySelector('#studentSelect').innerHTML = content;
			document.querySelector('#pageNavi').innerHTML = content2;
	})
	});	
	
	Search.addEventListener('click', function(e){
		content = ""; 
		content2 = ""; 
		
		let obj = {
				searchField : document.querySelector('#searchField').value
				,searchWord : document.querySelector('#searchWord').value
				,groupid : homeworkGroupSelect.value
				,pageNo: 1
		    };
			
			console.log(obj);
		
		fetchPost('/geomin/homeworkID', obj, (map) => {
			if(map.homeworklist.length > 0){
				
				map.homeworklist.forEach(function(item, index) {
					content += "<th scope='row'><input type='checkbox' class='Checkbox' name='Checkbox' value='"+item.studentid+"'></th>"
								+"<td><input class='form-control' type='text' name='sname' id='sname"+item.studentid+"' value = '"+item.sname+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='age' id='age"+item.studentid+"' value = '"+item.age+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='mphone' id='mphone"+item.studentid+"' value = '"+item.mphone+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='memail' id='memail"+item.studentid+"' value = '"+item.memail+"' readonly></td>"
								+"</tr>";
				})
				
				content2 += "  <ul class='pagination justify-content-center'>"
				    + "   <!-- 첫 페이지 -->"
				    + "   <li>"
				    + "      <a class='page-link' onclick='go(1)'>처음</a>"
				    + "    </li>"
				    + "   <!-- 이전 페이지 -->"
				    + "    <li class='page-item " + (map.pageDto.prev ? '' : 'disabled') + "'>"
				    + "      <a class='page-link' onclick='go(" + (map.pageDto.startNo - 1) + ")'>이전</a>"
				    + "    </li>"
				    + "    <!-- 페이지목록 -->";
				for (var i = map.pageDto.startNo; i <= map.pageDto.endNo; i++) {
				    if (i === map.pageDto.cri.pageNo) {
				        content2 += "<li class='page-item active'><span class='page-link' style='color: black; background-color: white;'>" + i + "</span></li>";
				    } else {
				        content2 += "<li class='page-item'><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
				    }
				}
				content2 += "    <!-- 다음페이지 -->"
					+ "    <li class='page-item " + (map.pageDto.next ? '' : 'disabled') + "'>"
				    + "      <a class='page-link' onclick='go(" + (map.pageDto.endNo + 1) + ")'>다음</a>"
				    + "    </li>"
				    + "    <!-- 끝 페이지 -->"
				    + "    <li class='page-item '>"
				    + "      <a class='page-link' onclick='go(" + map.pageDto.realEnd + ")'>끝</a>"
				    + "    </li>"
				    + "  </ul>";
			}else {
				content += "<tr>"
			        + "  <th colspan='4'>등록된 학생이 없습니다.</th>" 
					+ "</tr>";
			}
			
			
			
			document.querySelector('#studentSelect').innerHTML = content;
			document.querySelector('#pageNavi').innerHTML = content2;
		})
		})
	
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
    
function go(pageNo) {	
	content = ""; 
	content2 = "";
	let obj={
		searchField : document.querySelector('#searchField').value
		, searchWord : document.querySelector('#searchWord').value
		, groupid : document.getElementById('homeworkGroupSelect').value
		, pageNo : pageNo
	}
	
	fetchPost('/geomin/homeworkID', obj, (map) => {
		if(map.homeworklist.length > 0){
			
			map.homeworklist.forEach(function(item, index) {
				content += "<th scope='row'><input type='checkbox' class='Checkbox' name='Checkbox' value='"+item.studentid+"'></th>"
								+"<td><input class='form-control' type='text' name='sname' id='sname"+item.studentid+"' value = '"+item.sname+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='age' id='age"+item.studentid+"' value = '"+item.age+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='mphone' id='mphone"+item.studentid+"' value = '"+item.mphone+"' readonly></td>"
								+"<td><input class='form-control' type='text' name='memail' id='memail"+item.studentid+"' value = '"+item.memail+"' readonly></td>"
							+"</tr>";
			})
			
			content2 += "  <ul class='pagination justify-content-center'>"
			    + "   <!-- 첫 페이지 -->"
			    + "   <li>"
			    + "      <a class='page-link' onclick='go(1)'>처음</a>"
			    + "    </li>"
			    + "   <!-- 이전 페이지 -->"
			    + "    <li class='page-item " + (map.pageDto.prev ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.startNo - 1) + ")'>이전</a>"
			    + "    </li>"
			    + "    <!-- 페이지목록 -->";
			for (var i = map.pageDto.startNo; i <= map.pageDto.endNo; i++) {
			    if (i === map.pageDto.cri.pageNo) {
			        content2 += "<li class='page-item active'><span class='page-link' style='color: black; background-color: white;'>" + i + "</span></li>";
			    } else {
			        content2 += "<li class='page-item'><a class='page-link' onclick='go(" + i + ")'>" + i + "</a></li>";
			    }
			}
			content2 += "    <!-- 다음페이지 -->"
				+ "    <li class='page-item " + (map.pageDto.next ? '' : 'disabled') + "'>"
			    + "      <a class='page-link' onclick='go(" + (map.pageDto.endNo + 1) + ")'>다음</a>"
			    + "    </li>"
			    + "    <!-- 끝 페이지 -->"
			    + "    <li class='page-item '>"
			    + "      <a class='page-link' onclick='go(" + map.pageDto.realEnd + ")'>끝</a>"
			    + "    </li>"
			    + "  </ul>";
		}else {
			content += "<tr>"
		        + "  <th colspan='4'>등록된 학생이 없습니다.</th>" 
				+ "</tr>";
		}
		
		
		
		document.querySelector('#studentSelect').innerHTML = content;
		document.querySelector('#pageNavi').innerHTML = content2;
})
}

function groupList() {
	content = ""; 
	content2 = "";
	let obj={
		memberid : document.querySelector('#memberid').value
	}
	
	fetchPost('/geomin/homeworkGroup', obj, (map) => {
		if(map.groupList.length > 0){
			content += '<option selected>숙제 부여할 그룹 선택</option>';
			map.groupList.forEach(function(item, index) {
				content+='<option value="'+item.groupid+'">'+item.groupid+'</option>';
			})
		}
		
		document.querySelector('#homeworkGroupSelect').innerHTML = content;
	})
}

function toggleCheckboxes() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"].Checkbox');
    var allCheck = document.getElementById('allCheck');
    
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = allCheck.checked;
    }
}

function workSubmit() {
	
	const homeworkCont = document.querySelector('#homeworkCont').value.trim();
    
    if (homeworkCont === "") {
        alert("숙제 내용을 입력하세요.");
        return; // Prevent further processing if the textarea is empty
    }
	
	const selectedCheckboxes = document.querySelectorAll('.Checkbox:checked');
	
	 if (selectedCheckboxes.length > 0) {

	        console.log('selectedCheckboxes.length:', selectedCheckboxes.length);
	        
	        let deleteCount = 0; // 실제 삭제된 패키지 수 추적

	        selectedCheckboxes.forEach(checkbox => {
	            console.log(checkbox.value);

	            let obj = {
	            	studentid: checkbox.value
	            ,	groupid : document.querySelector('#homeworkGroupSelect').value
	            ,   pkgid : document.querySelector('#pkgid').value
	            ,   memberid : document.querySelector('#memberid').value
	            ,   day : document.querySelector('#daySelect').value
	            ,   homeworkcont : document.querySelector('#homeworkCont').value
	            
	            }
	            
	            console.log(obj);
	           
	            fetchPost('/geomin/homeworkUpdate', obj, (map) => {
	                deleteCount++; 
	                if (deleteCount === selectedCheckboxes.length) {
	                    
	                    alert(map.msg);

	                    // 작업 완료로 표시
	                    deletingInProgress = false;
	                }
	            })
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
			<div class='subNavi'>
				<ul>
					<a><b>강사마당</b></a>
					<li><a id="subNavi1">학습그룹 등록</a></li>
					<li><a id="subNavi2">그룹가입 승인</a></li>
					<li><a id="subNavi3">숙제 전송</a></li>
					<li><a id="subNavi4">숙제 평가</a></li>
				</ul>
			</div>
			<div class='content'>
				<input type="hidden" value="${sessionScope.member.memberid }"
					id="memberid" name="memberid"> <input type="hidden"
					value="" id="pkgid" name="pkgid">
				<!-- 숙제 전송 페이지-->
				<div id="introduction3">
					<div>
						<h1>
							<b>숙제 전송</b>
						</h1>
						<br>
					</div>

					<div>
						<select id='homeworkGroupSelect' class="form-select"
							aria-label="Default select example">

						</select>
					</div>
					<div id="searchDiv">
						<div id="searchFieldDiv">
							<select id="searchField" name="searchField" class="form-select"
								aria-label="Default select example">
								<option selected value="sname">이름</option>
								<option value="age">나이</option>
							</select>
						</div>
						<div id="searchWordDiv">
							<input class="form-control me-2" id="searchWord"
								name="searchWord" type="search" placeholder="Search"
								aria-label="Search">
						</div>
						<div id="searchBtnDiv">
							<button class="btn btn-outline-success" id="Search" type="submit">Search</button>
						</div>
					</div>

					<table class="table" border="1px solid"
						style="height: 50%; weight: 100%">
						<thead>
							<tr class="table-success">
								<th><input type='checkbox' id='allCheck' name='allCheck'
									onclick='toggleCheckboxes()'></th>
								<th>학습자명</th>
								<th>나이</th>
								<th>연락처</th>
								<th>이메일</th>
							</tr>
						</thead>

						<tbody id='studentSelect'>
							<tr>
								<th colspan="5">그룹을 선택 해주세요.</th>
							</tr>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi"></nav>
					<table class="table" border="1px solid"
						style="height: 50%; weight: 100%">
						<tr class="table-success">
							<th>숙제내용</th>
							<td><textarea id='homeworkCont' name='homeworkCont'
									style="width: 100%; height: 200px;"></textarea></td>
						</tr>
						<tr>
							<th>제출기한</th>


							<td><select id="daySelect">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="7">17</option>
									<option value="8">18</option>
									<option value="9">19</option>
									<option value="10">20</option>
									<option value="11">21</option>
									<option value="12">22</option>
									<option value="13">23</option>
									<option value="14">24</option>
									<option value="15">25</option>
									<option value="26">16</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
							</select> 일</td>
						</tr>
					</table>

					<div class="d-grid gap-2 col-6 mx-auto">
						<button class="btn btn-success" onclick="workSubmit()">
							숙제 전송</button>
					</div>
				</div>
			</div>
			
			<div class='banner'>
            	<%@include file="../header/banner.jsp" %>
            </div>
            
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
<%@include file="../header/footer.jsp" %>
</body>
</html>