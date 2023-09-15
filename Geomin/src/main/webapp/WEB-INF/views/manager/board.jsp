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
	    		padding-left: 10px;
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
			
			
				#container>#section>.subnavi>ul{
    		/* text-align: left; */
    		list-style-type: none;
    		width: 150px;
			height:200px;
			text-align: center;
			
    	}
    	    #container>#section>.subnavi>ul> a{
          /*   margin-top: 25px; */
            font-size: 15px;
            width: 150px;
			height:50px;
			text-align: center;
			padding:auto;
			margin-top: 25px;
			font-family: 'GmarketSansMedium';
    	}
    	
        #container>#section>.subnavi>ul>li{
            margin-top: 15px;
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
    	#container>#section>.subnavi>ul>li:hover{
            margin-top: 15px;
            padding-top: 12px;
            font-size: 11px;
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
    #boardTitle{
	margin-top : 30px;
	font-size: 35px;
	text-align:center;
	font-family: 'GmarketSansMedium';
}	
hr {
  border : 5px solid #003A6F;
}			
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}			
			
	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/board.js"></script>
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
             	<!-- Q&A 게시판 시작 -->
             	<div id="boardList">
             	<p id='boardTitle'>문의사항을 등록해주세요</p>	
		            <hr> 
             		<form class="d-flex" role="search">
						<select id="searchField" name="searchField" class="form-select" aria-label="Default select example">
						   <option selected value="bno">게시글번호</option>
						  <option value="boardtitle">내용</option>
						  <option value="writer">글쓴이</option>
						</select>
      				</form>
       				 <input class="form-control me-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search">
        			 <button class="btn btn-outline-success" id="Search" type="submit">Search</button>
             		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">제목</th>
					      <th scope="col">글쓴이</th>
					      <th scope="col">게시물등록일</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="listTable">
					    
					  </tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi">
					
				  	</nav>
				  	<c:choose>
						    <c:when test="${empty member}">
						        <div class="boardWrite">
              					</div>
						    </c:when>
						    <c:otherwise>
						    	<div class="boardWrite">
						        	<button type='button' class='btn btn-outline-primary' id="writeButton">글쓰기</button>
              					</div>
						    </c:otherwise>
					</c:choose>
             	</div>
             	<!-- Q&A 게시판 끝 -->
             		
             	<!-- Q&A View 시작 -->
          	<div id="boardview" style="display: none;">
          	
            </div>
          </div>
           			 <div class='banner' >
						<%@include file="../header/banner.jsp" %>
					</div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

	<%@include file="../header/footer.jsp" %>	
	
</body>
</html>