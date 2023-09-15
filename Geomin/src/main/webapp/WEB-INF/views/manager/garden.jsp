<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>   
<head>
<meta charset="UTF-8">
<title>학습콘텐츠 등록</title>
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
    	
    	#container{
    	    min-height: 100%;
		    position: relative;
		    padding-bottom: 200px;
        	flex: 1;
    	}
    	#packgeList{
    	font-size: 0.8rem;
        font-weight: 600;
    	}
    	
.pkgBtn{
	height:35px; 
   	width:150px;
   	background-color: #FFFFFF;
   	border:1px solid #666666;
   	border-radius: 8px;
   	cursor: pointer;
   	font-size: 14px;
   	
}
.pkgBtn:hover{
	height:35px; 
   	width:150px;
   	background-color: #002F5A;
   	color:#FFFFFF;
   	border:1px solid #666666;
   	border-radius: 5px;
   	cursor: pointer;
   	font-size: 14px;
   	
}

#regTitle{
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
@font-face {
    font-family: 'Tenada';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}


	</style>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/packge.js"></script>
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
             	<input type="hidden" id="pkgnameCheck" value="0">
             	<input type="hidden" id="personnelCheck" value="0">
             	<input type="hidden" id="fixedpriceCheck" value="0">
             	<input type="hidden" id="discountrateCheck" value="0">
             	<input type="hidden" id="pkgcontentCheck" value="0">
             	
             	
             	<div id="packgeList" style="display: none;">
             		
             		<form class="d-flex" role="search">
						<select id="searchField" name="searchField" class="form-select" aria-label="Default select example">
						  <option selected value="pkgname">콘텐츠명</option>
						  <option value="pkgcontent">콘텐츠 내용</option>
						  <option value="difficulty">학습 난이도</option>
						</select>
      				</form>
       				 <input class="form-control me-2" id="searchWord" name="searchWord" type="search" placeholder="Search" aria-label="Search">
        			 <button class="btn btn-outline-success" id="Search" type="submit">Search</button>
             		<table class="table">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">학습콘텐츠명</th>
					      <th scope="col">학습<br>난이도</th>
					      <th scope="col">학습<br>인원</th>
					      <th scope="col">정가</th>
					      <th scope="col">할인(%)</th>
					      <th scope="col">판매가</th>
					      <th scope="col">학습콘텐츠 내용</th>
					      <th scope="col">삭제<br>처리</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider" id="listTable">
					    
					  </tbody>
					</table>
					<nav aria-label="Page navigation example" id="pageNavi">
				  	</nav>
				  	
				  	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  	<button onclick='packDelete()' class="btn btn-outline-primary">콘텐츠 삭제</button>
					  	<button onclick='packUdate()' class="btn btn-outline-primary">콘텐츠 수정</button>
		             	<button type="button" class="btn btn-outline-primary" id="InsertBtn">콘텐츠 등록</button>	
				  	</div>
				  
             	</div>
             	
             	<div id="packgeInsert">
             		<form>
	             	    
	             	<p id='regTitle'>학습콘텐츠를 등록해주세요</p>	
		            <hr> 	
             		<div><p>학습콘텐츠명<p> <input id="pkgname" name="pkgname" class="form-control" type="text" 
             									placeholder="한글,영문 대소문자, 숫자, 특수문자(괄호만) 최대 15자" aria-label="default input example"></div>
             		<div id="message"></div>
             		<div>
             			<p>학습 난이도</p>
             			<select id="difficulty" name="difficulty" class="form-select" aria-label="Default select example">
							 <option selected value="초급">초급</option>
							 <option value="중급">중급</option>
							 <option value="고급">고급</option>
						</select>
             		</div>
             		<div><p>학습 가능 인원</p><input id="personnel" name="personnel" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>정가(원)</p><input id="fixedprice" name="fixedprice" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>할인율</p><input id="discountrate" name="discountrate" class="form-control" type="text" placeholder="30 ~ 70(%)" aria-label="default input example"></div>
             		<div><p>판매가(원)</p><input id="finalprice" name="finalprice" class="form-control" type="text" aria-label="default input example"></div>
             		<div><p>판매 내용</p> <textarea id="pkgcontent" name="pkgcontent" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea></div><br>
             		<input id="packgeInsertbtn" type="submit" class="btn btn-outline-primary" value="학습콘텐츠 등록">
		            <button type="button" class="btn btn-outline-primary" id="ListBtn">학습콘텐츠 조회</button>
	             	</form>
             	</div>
            </div>
            		<div class='banner' >
						<%@include file="../header/banner.jsp" %>
					</div>
          </div>
      </div>
      <br><br><br><br>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%@include file="../header/footer.jsp" %>
</body>
</html>