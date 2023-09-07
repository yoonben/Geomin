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
</style>

<title>Insert title here</title>

<script type="text/javascript">

window.addEventListener('load', function(){
	
	groupList();
	
	const subnavi1 = document.getElementById('#subnavi1');
	const subnavi2 = document.getElementById('#subnavi2');
	const subnavi3 = document.getElementById('#subnavi3');
	const subnavi4 = document.getElementById('#subnavi4');
	
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
		/* $('#introduction2').show();
		$('#introduction1').hide();
		$('#introduction3').hide();
		$('#introduction4').hide(); */
		location.href="../teacher/teacherMain";
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
		/* $('#introduction4').show();
		$('#introduction1').hide();
		$('#introduction2').hide();
		$('#introduction3').hide(); */
		location.href="../teacher/teacherMain";
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
		    
		fetchPost('/geomin/howorkList', obj, (map) => {
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
			<div class='subnavi'>
				<ul>
					<li><b>강사마당</b></li>
					<li><label style="cursor: pointer;"><a id="subnavi1">학습
								그룹 등록</a></label></li>
					<li><label style="cursor: pointer;"><a id="subnavi2">그룹
								가입 승인</a></label></li>
					<li><label style="cursor: pointer;"><a id="subnavi3">숙제
								전송</a></label></li>
					<li><label style="cursor: pointer;"><a id="subnavi4">숙제
								평가</a></label></li>
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
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>