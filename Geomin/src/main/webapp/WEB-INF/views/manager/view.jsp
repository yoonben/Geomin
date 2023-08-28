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
			}
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" >
window.addEventListener('load', function(){
	let Boardbno = document.querySelector('#bno').value;
	
	goView(Boardbno);
})

function goView(bno){
	content = ""; 
	content2 = "";
	
	let loginId = document.querySelector('#loginId').value
	
	let obj={
			bno : bno
		}
	
	console.log(obj);
	
	fetchPost('/geomin/boardView', obj, (map)=>{
	    if(map.result == 'success'){
	        content += "<h4 class='subject'>"+map.boardVO.boardtitle+"</h4>"
	         	+"<ul class='date'>"
	         	+"<li class='left'>"+map.boardVO.writer+"</li>"
	         	+"<li class='right'>"+map.boardVO.regdate+"</li>"
	         	+"</ul>"
	         	+"<div class='dv'>"
	         	+map.boardVO.boardcontent
	         	+"</div>"
	         	+"<button type='button' class='btn btn-outline-primary' onclick='go(1)'>목록</button>";
	        	
	         	if(map.boardVO.memberid == loginId){
	         		content += "<a class='btn btn-outline-primary' href='/geomin/edit?bno=" + map.boardVO.bno + "'>수정</a>"
	                     + "<a class='btn btn-outline-primary' onclick='boardDelete("+map.boardVO.bno+")'>삭제</a>";
	            }

	        content += "</div>";
	
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
	        <li><a href="subnavi3()">매출 관리</a></li>
	        <li><a href="subnavi3_1()">- 매출 집계</a></li>
	        <li><a href="subnavi3_2()">- 매출 조회</a></li>
	    </ul>
	</div>
             <div class='content'>
          	<input type="text" value="${board.bno}" id="bno" name="bno">
          	<input type="hidden" value="${sessionScope.member.memberid }" id="loginId" name="loginId">
             		
             	<!-- Q&A View 시작 -->
          	<div id="boardview">
            </div>
            <div class='banner'>
            
            </div>
          </div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>