<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript">
	window.addEventListener('load', function(){
		
		wirtbtn.addEventListener('click', function(e){
			e.preventDefault();
			
			let boardcontent = document.querySelector('#boardcontent').value;

		    // 사용자 입력 내용에서 엔터키를 줄바꿈 문자 \n로 치환
		    boardcontent = boardcontent.replace(/\n/g, '<br>');
			
			let obj={
					memberid : document.querySelector('#memberid').value
					, boardtitle : document.querySelector('#boardtitle').value
					, writer : document.querySelector('#writer').value
					, boardcontent : boardcontent
					, boardnotice : document.querySelector('#boardnotice').value
				}
			
			console.log(obj);
			
			fetchPost('/geomin/boardWrite', obj, (map)=>{
				if(map.result == 'success'){
					alert(map.msg);
					location.href = '/geomin/board';
				}else{
					alert(map.msg);
				}
			})
		})
		
		editbtn.addEventListener('click', function(e){
			e.preventDefault();
			let boardcontent = document.querySelector('#boardcontent').value;

		    // 사용자 입력 내용에서 엔터키를 줄바꿈 문자 \n로 치환
		    boardcontent = boardcontent.replace(/\n/g, '<br>');
			
			let obj={
					memberid : document.querySelector('#memberid').value
					, bno : document.querySelector('#bno').value
					, boardtitle : document.querySelector('#boardtitle').value
					, writer : document.querySelector('#writer').value
					, boardcontent : boardcontent
					, boardnotice : document.querySelector('#boardnotice').value
				}
			
			console.log(obj);
			
			fetchPost('/geomin/boardEdit', obj, (map)=>{
				if(map.result == 'success'){
					alert(map.msg);
					location.href = '/geomin/view?bno='+document.querySelector('#bno').value;
				}else{
					alert(map.msg);
				}
			})
		})
	})

function goBoard(){
	location.href = '/geomin/board';
}

function goView(){
	location.href = '/geomin/view?bno='+document.querySelector('#bno').value;
}
	
		function updateCheckboxValue() {
            var checkbox = document.getElementById("adminCheckbox");
            var valueField = document.getElementById("adminValue");

            if (checkbox.checked) {
            	boardnotice.value = "Y";
            } else {
            	boardnotice.value = "N";
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
		        <li><a href="/geomin/manager">학습콘텐츠 등록</a></li>
		        <li><a href="/geomin/board">Q&A</a></li>
		        <li><a href="/geomin/salesTally">매출 관리</a></li>
		        <li><a href="/geomin/salesTally">- 매출 집계</a></li>
		        <li><a href="/geomin/salesInquiry">- 매출 조회</a></li>
		    </ul>
		</div>
		<div class='content'>
			<form method="post">
				<div id="boardRiter">
						<input type="hidden" value="${member.memberid}" id="memberid" name="memberid">
						<input type="hidden" value="${board.bno }" id="bno" name="bno">
						<div><p>제목</p><input id="boardtitle" name="boardtitle" value="${board.boardtitle }" class="form-control" type="text" aria-label="default input example"></div>
	             		<div><p>글쓴이</p><input id="writer" name="writer" value="${member.mname}" class="form-control" type="text" aria-label="default input example" disabled></div>
	             		<div><p>문의 내용</p> <textarea id="boardcontent" name="boardcontent" class="form-control" id="exampleFormControlTextarea1" rows="3">${board.boardcontent }</textarea></div>
						<c:choose>
						    <c:when test="${member.adminyn eq 'Y'}">
						    	<div class="form-check">
									<label for="adminCheckbox">공지 사항</label>
    								<input type="checkbox" id="adminCheckbox" onchange="updateCheckboxValue()">
    								<input type="hidden" id="boardnotice" name="boardnotice" value="N">
								</div>
						    </c:when>
						    <c:otherwise>
						    	<input type="hidden" id="adminCheckbox" onchange="updateCheckboxValue()">
						    	<input type="hidden" id="boardnotice" name="boardnotice" value="N">
						    </c:otherwise>
					</c:choose>
					
					<c:choose>
					    <c:when test="${not empty board.bno}">
					            <button type='button' class='btn btn-outline-primary' id='editbtn'>수정 완료</button>
					            <button type='button' class='btn btn-outline-primary' onclick='goView()'>목록</button>
					            <input type="hidden" class='btn btn-outline-primary' id='wirtbtn'>
					    </c:when>
					    <c:otherwise>
					    	<button type='button' class='btn btn-outline-primary' id='wirtbtn'>등록</button>
					    	<button type='button' class='btn btn-outline-primary' onclick='goBoard()'>목록</button>
					    	<input type="reset" class='btn btn-outline-primary' value="리셋">
					    	<input type="hidden" class='btn btn-outline-primary' id='editbtn'>
					    </c:otherwise>
					</c:choose>

		         	
	         	</div>
			</form>
		</div>
       	<div class='banner'>
        </div>
	</div>
</div>
  
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>