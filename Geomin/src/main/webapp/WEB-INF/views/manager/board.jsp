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
<script type="text/javascript" src="/resources/js/board.js"></script>
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
             	<!-- Q&A 게시판 시작 -->
             	<div id="boardList">
					<input type="hidden" value="${sessionScope.member.memberid }" id="loginId" name="loginId">
             		<form class="d-flex" role="search">
	             		<select id="searchField" name="searchField" class="form-select" size="3" aria-label="Size 3 select example">
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
            <div class='banner'>
            </div>
          </div>
      </div>
      </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>