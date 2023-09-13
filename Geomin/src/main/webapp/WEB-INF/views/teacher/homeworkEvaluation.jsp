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
#evaluationDiv{
	float: left;
	width: 20%;
}

div#searchFieldDiv {
	float: left;
	width: 25%;
}

div#searchWordDiv {
	width: 40%;
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
	
	let homeworkGroupSelect = document.getElementById('homeworkGroupSelect');
	
	homeworkGroupSelect.addEventListener('change', function(){
		content = ""; 
		content2 = ""; 
		
		console.log(homeworkGroupSelect.value);
		
		let obj = {
				groupid : homeworkGroupSelect.value
				,pageNo: 1
		    };
		    
		fetchPost('/geomin/homeworkEvaluation', obj, (map) => {
			if(map.homeworklist.length > 0){
				
				
				map.homeworklist.forEach(function(item, index) {
					
					content +="<tr>"
								+"<td>"+item.sname+"</td>"
								+"<td>"+item.homeworkcont+"</td>"
								+"<td>"+item.deadlinedate+"</td>";
					
					if(item.submitdate != null && item.submitdate != ''){
						content +="<td>"+item.submitdate+"</td>"
								+"<td>"+item.studycont+"</td>";
					}else{
						content +="<td></td>"
									+"<td>숙제를 제출하지 않았습니다.</td>";
					}

					
					if(item.evaluation === "우수"){
						content += "<td>"
										+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
										+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
										    +"<option value='평가'>--</option>"
										    +"<option value='우수' selected>우수</option>"
										    +"<option value='보통'>보통</option>"
										    +"<option value='미흡'>미흡</option>"
								  		+"</select>"
									+"<td>";
					}else if(item.evaluation === "보통"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통' selected>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else if(item.evaluation === "미흡"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡' selected>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else{
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}
								
					content +="</tr>";
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
			        + "  <th colspan='6'>숙제를 내준 학생이 없습니다.</th>" 
					+ "</tr>";
			}
			
			
			
			document.querySelector('#studentSelect').innerHTML = content;
			document.querySelector('#pageNavi').innerHTML = content2;
	})
	});	
	
	evaluation.addEventListener('change', function(e){
		content = ""; 
		content2 = ""; 
		
		console.log(homeworkGroupSelect.value);
		
		let obj = {
				evaluation : document.querySelector('#evaluation').value
				,searchField : document.querySelector('#searchField').value
				,searchWord : document.querySelector('#searchWord').value
				,groupid : homeworkGroupSelect.value
				,pageNo: 1
		    };
		    
		fetchPost('/geomin/homeworkEvaluation', obj, (map) => {
			if(map.homeworklist.length > 0){
				
				
				map.homeworklist.forEach(function(item, index) {
					
					content +="<tr>"
								+"<td>"+item.sname+"</td>"
								+"<td>"+item.homeworkcont+"</td>"
								+"<td>"+item.deadlinedate+"</td>";
					
					if(item.submitdate != null && item.submitdate != ''){
						content +="<td>"+item.submitdate+"</td>"
								+"<td>"+item.studycont+"</td>";
					}else{
						content +="<td></td>"
									+"<td>숙제를 제출하지 않았습니다.</td>";
					}

					
					if(item.evaluation === "우수"){
						content += "<td>"
										+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
										+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
										    +"<option value='평가'>--</option>"
										    +"<option value='우수' selected>우수</option>"
										    +"<option value='보통'>보통</option>"
										    +"<option value='미흡'>미흡</option>"
								  		+"</select>"
									+"<td>";
					}else if(item.evaluation === "보통"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통' selected>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else if(item.evaluation === "미흡"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡' selected>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else{
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}
								
					content +="</tr>";
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
			        + "  <th colspan='6'>숙제를 내준 학생이 없습니다.</th>" 
					+ "</tr>";
			}
			
			
			
			document.querySelector('#studentSelect').innerHTML = content;
			document.querySelector('#pageNavi').innerHTML = content2;
	})
	})
	Search.addEventListener('click', function(e){
		content = ""; 
		content2 = ""; 
		
		console.log(homeworkGroupSelect.value);
		
		let obj = {
				evaluation : document.querySelector('#evaluation').value
				,searchField : document.querySelector('#searchField').value
				,searchWord : document.querySelector('#searchWord').value
				,groupid : homeworkGroupSelect.value
				,pageNo: 1
		    };
		    
		fetchPost('/geomin/homeworkEvaluation', obj, (map) => {
			if(map.homeworklist.length > 0){
				
				
				map.homeworklist.forEach(function(item, index) {
					
					content +="<tr>"
								+"<td>"+item.sname+"</td>"
								+"<td>"+item.homeworkcont+"</td>"
								+"<td>"+item.deadlinedate+"</td>";
					
					if(item.submitdate != null && item.submitdate != ''){
						content +="<td>"+item.submitdate+"</td>"
								+"<td>"+item.studycont+"</td>";
					}else{
						content +="<td></td>"
									+"<td>숙제를 제출하지 않았습니다.</td>";
					}

					
					if(item.evaluation === "우수"){
						content += "<td>"
										+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
										+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
										    +"<option value='평가'>--</option>"
										    +"<option value='우수' selected>우수</option>"
										    +"<option value='보통'>보통</option>"
										    +"<option value='미흡'>미흡</option>"
								  		+"</select>"
									+"<td>";
					}else if(item.evaluation === "보통"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통' selected>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else if(item.evaluation === "미흡"){
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡' selected>미흡</option>"
					  		+"</select>"
						+"<td>";
					}else{
						content += "<td>"
							+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
							+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
							    +"<option value='평가'>--</option>"
							    +"<option value='우수'>우수</option>"
							    +"<option value='보통'>보통</option>"
							    +"<option value='미흡'>미흡</option>"
					  		+"</select>"
						+"<td>";
					}
								
					content +="</tr>";
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
			        + "  <th colspan='6'>숙제를 내준 학생이 없습니다.</th>" 
					+ "</tr>";
			}
			
			
			
			document.querySelector('#studentSelect').innerHTML = content;
			document.querySelector('#pageNavi').innerHTML = content2;
	})
	})
})

function go(pageNo) {
	content = ""; 
	content2 = ""; 
	
	console.log(homeworkGroupSelect.value);
	
	let obj = {
			evaluation : document.querySelector('#evaluation').value
			,searchField : document.querySelector('#searchField').value
			,searchWord : document.querySelector('#searchWord').value
			,groupid : homeworkGroupSelect.value
			,pageNo: pageNo
	    };
	    
	fetchPost('/geomin/homeworkEvaluation', obj, (map) => {
		if(map.homeworklist.length > 0){
			
			
			map.homeworklist.forEach(function(item, index) {
				
				content +="<tr>"
							+"<td>"+item.sname+"</td>"
							+"<td>"+item.homeworkcont+"</td>"
							+"<td>"+item.deadlinedate+"</td>";
				
				if(item.submitdate != null && item.submitdate != ''){
					content +="<td>"+item.submitdate+"</td>"
							+"<td>"+item.studycont+"</td>";
				}else{
					content +="<td></td>"
								+"<td>숙제를 제출하지 않았습니다.</td>";
				}

				
				if(item.evaluation === "우수"){
					content += "<td>"
									+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
									+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
									    +"<option value='평가'>--</option>"
									    +"<option value='우수' selected>우수</option>"
									    +"<option value='보통'>보통</option>"
									    +"<option value='미흡'>미흡</option>"
							  		+"</select>"
								+"<td>";
				}else if(item.evaluation === "보통"){
					content += "<td>"
						+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
						+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
						    +"<option value='평가'>--</option>"
						    +"<option value='우수'>우수</option>"
						    +"<option value='보통' selected>보통</option>"
						    +"<option value='미흡'>미흡</option>"
				  		+"</select>"
					+"<td>";
				}else if(item.evaluation === "미흡"){
					content += "<td>"
						+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
						+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
						    +"<option value='평가'>--</option>"
						    +"<option value='우수'>우수</option>"
						    +"<option value='보통'>보통</option>"
						    +"<option value='미흡' selected>미흡</option>"
				  		+"</select>"
					+"<td>";
				}else{
					content += "<td>"
						+"<input type='hidden' value='"+item.homeworkno+"' id='"+item.homeworkno+"' name='homeworkno'>"
						+"<select aria-label='Default select example' onchange='alert(this.value,"+item.homeworkno+")'>"
						    +"<option value='평가'>--</option>"
						    +"<option value='우수'>우수</option>"
						    +"<option value='보통'>보통</option>"
						    +"<option value='미흡'>미흡</option>"
				  		+"</select>"
					+"<td>";
				}
							
				content +="</tr>";
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
		        + "  <th colspan='6'>숙제를 내준 학생이 없습니다.</th>" 
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
			content += '<option selected>숙제 평가할 그룹 선택</option>';
			map.groupList.forEach(function(item, index) {
				content+='<option value="'+item.groupid+'">'+item.groupid+'</option>';
			})
		}
		
		document.querySelector('#homeworkGroupSelect').innerHTML = content;
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

function alert(evaluation, homeworkno) {
	content = ""; 

	let obj={
		evaluation : evaluation
		,homeworkno : homeworkno.value
	}
	
	console.log(obj);
	
	fetchPost('/geomin/HomeworkEva', obj, (map) => {
		if(map.result == 'success'){
			console.log(homeworkno+"성공")
		}else{
			alert(map.msg);
		}
		
	})
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
				<input type="hidden" value="${sessionScope.member.memberid }" id="memberid" name="memberid"> 
				<input type="hidden" value="" id="pkgid" name="pkgid">
				<!-- 숙제 전송 페이지-->
				<div id="introduction3">
					<div>
						<h1>
							<b>숙제 평가</b>
						</h1>
						<br>
					</div>

					<div>
						<select id='homeworkGroupSelect' class="form-select" aria-label="Default select example">

						</select>
					</div>
					<div id="evaluationDiv">
							<select id="evaluation" name="evaluation" class="form-select"
								aria-label="Default select example">
								<option>전체</option>
								<option value="평가">미평가</option>
								<option value="우수">우수</option> 
								<option value="보통">보통</option>
								<option value="미흡">미흡</option> 	
							</select>
						</div>
					<div id="searchDiv">
						<div id="searchFieldDiv">
							<select id="searchField" name="searchField" class="form-select"
								aria-label="Default select example">
								<option selected value="mname">이름</option>
								<option value="homeworkcont">내용</option> 	
							</select>
						</div>
						<div id="searchWordDiv">
							<input class="form-control me-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search">
						</div>
						<div id="searchBtnDiv">
							<button class="btn btn-outline-success" id="Search" type="submit">Search</button>
						</div>
					</div>

					<table class="table" border="1px solid" style="height: 50%; weight: 100%">
						<thead>
							<tr class="table-success">
								<th>이름</th>
								<th>숙제내용</th>
								<th>제출기한</th>
								<th>제출날짜</th>
								<th>학습내용</th>
								<th>평가</th>
							</tr>
						</thead>

						<tbody id='studentSelect'>
						<tr>
							<th colspan='6'>그룹을 선택 해주세요.</th>
						</tr>
						</tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi"></nav>

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