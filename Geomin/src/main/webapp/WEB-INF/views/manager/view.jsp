<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
<meta charset="UTF-8">
<title>Q & A</title>
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
	    	.subject{
	    		    background-color: #fbfbfb;
				    font-size: 24px;
				    color: #333;
				    font-weight: 400;
				    padding: 20px;
				    border-bottom: #e0e0e1 1px solid;
	    	}
	    	
	    	.date {
			    border-bottom: #e0e0e1 1px solid;
			    padding: 5px 10px;
			    list-style: none;
			    overflow: hidden; /* 부모 컨테이너 내에서 자식 요소를 포함하도록 설정 */
			}
			
			.date>h4{
			    margin-bottom: 0;
			}
			
			.date > li {
			    float: left;
			    width: 50%; /* 좌우로 50%씩 차지하도록 설정 */
			    box-sizing: border-box; /* 패딩과 경계선을 포함한 크기로 설정 */
			    padding: 10px 0; /* 위아래 10px 패딩 */
			    font-size: 12px;
			}
			
			.date > .right {
			    float: right;
			    text-align: right;
			}
			.dv{
				padding: 20px;
				height: 250px;
			}
			.dv2{
				padding: 20px;
			}
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" >
window.addEventListener('load', function(){
	let Boardbno = document.querySelector('#bno').value;
				
	goView(Boardbno);
	
	let answerBtn = document.querySelector('#answerBtn');

})

function answerBtn() {
    let answer = document.querySelector('#bno').value;
    let userAnswer = document.querySelector('#answer').value;

    // 사용자 입력 내용에서 엔터키를 줄바꿈 문자 \n로 치환
    userAnswer = userAnswer.replace(/\n/g, '<br>');

    let obj = {
        bno: answer,
        answer: userAnswer
    };

    fetchPost('/geomin/answer', obj, (map) => {
        if (map.result == 'success') {
            alert(map.msg);
            goView(answer);
        } else {
            alert(map.msg);
        }
    });
}

function go(){
	location.href = '/geomin/board';
}
function goEdit(){
	location.href = '/geomin/edit?bno='+document.querySelector('#bno').value;
}
function goView(bno){
	content = ""; 
	content2 = "";
	
	let loginId = document.querySelector('#loginId').value;
	let adminyn = document.querySelector('#adminyn').value;
	
	let obj={
			bno : bno
		}
	
	console.log(obj);
	
	fetchPost('/geomin/boardView', obj, (map)=>{
	    if(map.result == 'success'){
	    	console.log(map.boardVO.answer);
	        content += "<h4 class='subject'>"+map.boardVO.boardtitle+"</h4>"
	         	+"<ul class='date'>"
	         	+"<li class='left'>"+map.boardVO.writer+"</li>"
	         	+"<li class='right'>"+map.boardVO.regdate+"</li>"
	         	+"</ul>"
	         	+"<div class='dv'>";
	         	if(map.boardVO.boardcontent != null){
	         		content += map.boardVO.boardcontent;
					}else{
						content += "내용이 없습니다.";
					}
	         	content += "</div>";
	         	if(map.boardVO.boardnotice == 'N'){
		         	if(map.boardVO.answer != null){
		         		content+="<div class='dv2'>"
		         					+map.boardVO.answer
		         				+"</div>";
		         	}else{
		        	content+="<div class='dv2'>"
			         			+"안녕하세요. 고객님 문제를 확인하고 있습니다.<br>"
			         			+"일반적으로 문의사항에 대한 답변은 3일 이내에 보내드리도록 하겠습니다.<br>"
			         			+"고객님의 지속적인 관심과 사랑에 감사드리며, 항상 더 나은 서비스를 제공하기 위해 노력하겠습니다."
			         		+"</div>";
		         	}
	         	}
	         	
	         	content += "<button type='button' class='btn btn-outline-primary' onclick='go()'>목록</button>";
	        	
	         	if(map.boardVO.memberid == loginId){
	         		content += "<button class='btn btn-outline-primary' onclick='goEdit()'>수정</button>"
	                     + "<button class='btn btn-outline-primary' onclick='boardDelete("+map.boardVO.bno+")'>삭제</button>";
	            }
	         	if(map.boardVO.boardnotice == 'N'){
		         	if(adminyn == 'Y'){
		      	 		content += "<div id='boardAnswer'>"
		            		+"<textarea id='answer' name='answer' class='form-control' rows='3'></textarea>"
		            		+"<button type='button' class='btn btn-outline-primary' onclick='answerBtn()'>답변등록</button>"
		            	  +"</div>";
		         	}
	         	}
	        boardview.innerHTML = content;
	    } else {
	        alert('페이지를 찾을 수 없습니다.');
	    }
})

	$(function() {
	    $('#writeButton').click(function() {
	        window.location.href = '/geomin/write';
	    });
	});
}

function boardDelete(bno) {
    let obj = {
        bno: bno
    };

    console.log(obj); // console.log를 사용하여 객체를 로깅

    fetchPost('/geomin/boardDelete', obj, (map) => {
        if (map.result == 'success') {
            alert(map.msg);
            go();
        } else {
            alert(map.msg);
        }
    });
}
</script>
</head>
<body>
<div id='container'>
	<%@include file="../header/header.jsp" %>
	<div id='section'>
    <div class='subnavi'>
	    <ul>
		   	<c:if test="${sessionScope.member.adminyn eq 'Y'}">
		        	<li><a href="/geomin/manager">학습콘텐츠 등록</a></li>
		    </c:if>
		        <li><a href="/geomin/board">Q&A</a></li>
		 	<c:if test="${sessionScope.member.adminyn eq 'Y'}">
		        <li><a href="/geomin/salesTally">매출 관리</a></li>
		        <li><a href="/geomin/salesTally">- 매출 집계</a></li>
		        <li><a href="/geomin/salesInquiry">- 매출 조회</a></li>
		 	</c:if>
		</ul>
	</div>
           <div class='content'>
          	<input type="hidden" value="${board.bno}" id="bno" name="bno">
          	<input type="hidden" value="${sessionScope.member.memberid }" id="loginId" name="loginId">
          	<input type="hidden" value="${sessionScope.member.adminyn }" id="adminyn" name="adminyn">
             		
             	<!-- Q&A View 시작 -->
          	<div id="boardview">
            </div>
  
          </div>
            <div class='banner'>
            
            </div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>